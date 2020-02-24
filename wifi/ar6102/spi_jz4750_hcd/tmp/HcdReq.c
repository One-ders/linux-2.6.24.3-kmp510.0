/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  HcdRequest - SD request handler
  Input:  pHcd - HCD object
  Output:
  Return:
  Notes:

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

SDIO_STATUS HcdRequest(PSDHCD pHcd) {
	SDIO_STATUS status = SDIO_STATUS_SUCCESS;
	PSDHCD_DEVICE pDevice = (PSDHCD_DEVICE)pHcd->pContext;
	PSDREQUEST            pReq;

	pReq = GET_CURRENT_REQUEST(pHcd);
	DBG_ASSERT(pReq != NULL);

	/* we must take the lock to protect against the SPI IRQ processing task/thread
	 * we need to guarantee exclusive access to the SPI hw layer */
	local_bh_disable();
	inc_preempt_count();
	if (irqs_disabled()) {
		printk("Colman: Re-enable IRQ\n");
		local_irq_enable();
	}


	do {

		if (pDevice->FatalError) {
			status = SDIO_STATUS_DEVICE_ERROR;
			break;
		}

		if (pDevice->ShuttingDown) {
			DBG_PRINT(SDDBG_WARN, ("ATH SPI - HcdRequest returning canceled\n"));
			status = SDIO_STATUS_CANCELED;
			break;
		}

		DUMP_REQUEST(ATH_SPI_TRACE_REQUESTS,pReq);

		if (ATH_IS_TRANS_PIO(pReq)) {

			/* handle all PIO ops */

			if (ATH_IS_TRANS_PIO_INTERNAL(pReq)) {
				/* internal accesses are easy */
				if (ATH_IS_TRANS_READ(pReq)) {
					UINT32 temp;
					/* its a read op */
					status =  DoPioReadInternal(pDevice,
								ATH_GET_IO_ADDRESS(pReq),
								&temp);
					if (SDIO_SUCCESS(status)) {
						/* return read result */
						ATH_SET_PIO_INTERNAL_READ_RESULT(pReq, temp);
					}
				} else {
					/* its a write op */
					status = DoPioWriteInternal(pDevice,
								ATH_GET_IO_ADDRESS(pReq),
								ATH_GET_PIO_WRITE_VALUE(pReq));
				}
			} else {
				/* external reads are more complicated */
				status = DoPioExternalAccess(pDevice,pReq);
			}

			/* we're done */
			break;
		}

		/* if we get here, we are doing DMA transfers */

		DBG_PRINT(ATH_SPI_TRACE_REQUESTS, ("ATH SPI - DMA Address:0x%X, DMA Bytes:%d\n",
				ATH_GET_IO_ADDRESS(pReq),ATH_GET_DMA_TRANSFER_BYTES(pReq)));

		/* setup tracking variables */
		pReq->DataRemaining = ATH_GET_DMA_TRANSFER_BYTES(pReq);
		pReq->pHcdContext = pReq->pDataBuffer;

		DBG_DUMP_DATA_BUFFER(ATH_IS_TRANS_WRITE(pReq), pReq);

		/* check if we need to change byte swap logic
		 * TODO : normally DMADataWidth does not change, however for testing
		 * purposes we allow the width to change dynamically through a config request */
		status = ConfigureByteSwap(pDevice, pDevice->DMADataWidth);

		if (!SDIO_SUCCESS(status)) {
			break;
		}

		if (ATH_IS_TRANS_READ(pReq)) {
			status = DoDMAOp(pDevice,pReq);
		} else {
			BOOL useWriteWaterMark = FALSE;

			/* read buffer space register */
			status = DoPioReadInternal(pDevice,ATH_SPI_WRBUF_SPC_AVA_REG,&pDevice->WriteBufferSpace);

			if (!SDIO_SUCCESS(status)) {
				break;
			}

			if (IS_SLEEP_WAR_ENABLED(pDevice)) {
				/* the SPI controller has a sleep issue where many small packets within the SPI
				 * write buffer increases the chance of a corrupted packet when the core goes to
				 * sleep. To mitigate this we only allow a limited number of packets (of any size)
				 * to occupy the SPI write buffer. */

				if (pDevice->WriteBufferSpace >= pDevice->MaxWriteBufferSpace) {
					/* reset packet count because SPI buffer has completely drained */
					pDevice->PktsInSPIWriteBuffer = 0;
				}

				if ((pDevice->PktsInSPIWriteBuffer >= WAR_MAX_PKTS_IN_SPI_WRITE_BUFFER) ||
					(pDevice->WriteBufferSpace < pReq->DataRemaining)) {

					DBG_PRINT(ATH_SPI_TRACE_REQUESTS,
						("ATH SPI - Not enough write buffer Space: %d bytes, need %d -or- too many packets : %d \n",
							pDevice->WriteBufferSpace, pReq->DataRemaining, pDevice->PktsInSPIWriteBuffer));

					useWriteWaterMark = TRUE;
				}

			} else {
				if (pDevice->WriteBufferSpace < pReq->DataRemaining) {

					DBG_PRINT(ATH_SPI_TRACE_REQUESTS,
						("ATH SPI - Not enough write buffer Space: %d bytes, need %d \n",
							pDevice->WriteBufferSpace, pReq->DataRemaining));

					useWriteWaterMark = TRUE;
				}
			}

			if (useWriteWaterMark) {
				status = ProgramWriteBufferWaterMark(pDevice, pReq);

				if (SDIO_STATUS_PENDING == status) {
					/* watermark was set, waiting for an interrupt */
					break;
				} else if (SDIO_STATUS_SUCCESS == status) {
					/* fall through and start DMA */
				} else {
					/* an error occured */
					break;
				}
			}

			DBG_PRINT(ATH_SPI_TRACE_REQUESTS,
				("ATH SPI - Write Buffer Space : %d bytes , issuing %d byte transfer \n",
				pDevice->WriteBufferSpace, pReq->DataRemaining));

			DBG_ASSERT(pDevice->WriteBufferSpace >= pReq->DataRemaining);
			ADJUST_WRBUF_SPACE(pDevice,pReq->DataRemaining);

			/* fire off the write operation */
			status = DoDMAOp(pDevice,pReq);

		}

	} while (FALSE);

	dec_preempt_count();
	local_bh_enable();

	if (status != SDIO_STATUS_PENDING) {

		pReq->Status = status;

		if (IS_SDREQ_FORCE_DEFERRED_COMPLETE(pReq->Flags)) {
			DBG_PRINT(ATH_SPI_TRACE_REQUESTS, ("ATH SPI - HcdRequest deferring completion to work item \n"));
			/* the HCD must do the indication in a separate context and return status pending */
			HW_QueueDeferredCompletion(pDevice);
			return SDIO_STATUS_PENDING;
		} else {
			/* complete the request */
			DBG_PRINT(ATH_SPI_TRACE_REQUESTS, ("ATH SPI - HcdRequest Command Done, status:%d \n", status));
		}
	}

	return status;
}
