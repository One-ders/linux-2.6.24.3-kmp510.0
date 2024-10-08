//------------------------------------------------------------------------------
// <copyright file="htc_recv.c" company="Atheros">
//    Copyright (c) 2007-2008 Atheros Corporation.  All rights reserved.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 as
// published by the Free Software Foundation;
//
// Software distributed under the License is distributed on an "AS
// IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
// implied. See the License for the specific language governing
// rights and limitations under the License.
//
//
//------------------------------------------------------------------------------
//==============================================================================
// Author(s): ="Atheros"
//==============================================================================
#include "htc_incl/htc_internal.h"
#include "hif_internal.h"
#define __FILE__ "/app1/colman2/ar6k/AR6102-2.2.0.78/AR6kSDK.build_sw.78/host/os/linux/../../htc2/htc_recv.c"
int g_lookaheadStatus;
HIF_DEVICE *HIFgetDevice(SDDEVICE *handle);
A_STATUS HIFGetLookAhead(HIF_DEVICE *device,  HIF_PENDING_EVENTS_INFO *pEvents);
#define _AR_DEBUG_PRINTX_ARG(arg...) arg
#define A_PRINTF(args...) printk(args)
#define AR_DEBUG_PRINTF(lvl,args)\
    do { if (debughtc & (lvl)) {\
         A_PRINTF(KERN_ALERT _AR_DEBUG_PRINTX_ARG args);\
       }\
    } while (0)
#define HTCIssueRecv(t, p) \
    DevRecvPacket(&(t)->Device,  \
                  (p),          \
                  (p)->ActualLength)
#define DO_RCV_COMPLETION(t,p,e)            \
{                                           \
    if ((p)->ActualLength > 0) {            \
        AR_DEBUG_PRINTF(ATH_DEBUG_RECV, (" completing packet 0x%X (%d bytes) on ep : %d \n", \
            (A_UINT32)(p), (p)->ActualLength, (p)->Endpoint));  \
        (e)->EpCallBacks.EpRecv((e)->EpCallBacks.pContext,      \
                                (p));                           \
    } else {                                                    \
        AR_DEBUG_PRINTF(ATH_DEBUG_RECV, (" recycling empty packet \n"));  \
        HTC_RECYCLE_RX_PKT((t), (p), (e));                      \
    }                                                           \
}
#ifdef HTC_EP_STAT_PROFILING
#define HTC_RX_STAT_PROFILE(t,ep,lookAhead)            \
{                                                      \
    LOCK_HTC_RX((t));                                  \
    INC_HTC_EP_STAT((ep), RxReceived, 1);              \
    if ((lookAhead) != 0) {                            \
        INC_HTC_EP_STAT((ep), RxLookAheads, 1);        \
    }                                                  \
    UNLOCK_HTC_RX((t));                                \
}
#else
#define HTC_RX_STAT_PROFILE(t,ep,lookAhead)
#endif
static INLINE A_STATUS HTCProcessTrailer(HTC_TARGET *target,
                                         A_UINT8    *pBuffer,
                                         int         Length,
                                         A_UINT32   *pNextLookAhead,
                                         HTC_ENDPOINT_ID FromEndpoint)
{
    HTC_RECORD_HDR          *pRecord;
    A_UINT8                 *pRecordBuf;
    HTC_LOOKAHEAD_REPORT    *pLookAhead;
    A_UINT8                 *pOrigBuffer;
    int                     origLength;
    A_STATUS                status;

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("+HTCProcessTrailer (length:%d) \n", Length));
    if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
    	if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_DUMP)) {
        	AR_DEBUG_PRINTBUF(pBuffer,Length,"Recv Trailer");
	}
    }
    pOrigBuffer = pBuffer;
    origLength = Length;
    status = A_OK;
    while (Length > 0) {
        if (Length < sizeof(HTC_RECORD_HDR)) {
            status = A_EPROTO;
            break;
        }
            /* these are byte aligned structs */
        pRecord = (HTC_RECORD_HDR *)pBuffer;
        Length -= sizeof(HTC_RECORD_HDR);
        pBuffer += sizeof(HTC_RECORD_HDR);
        if (pRecord->Length > Length) {
                /* no room left in buffer for record */
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                (" invalid record length: %d (id:%d) buffer has: %d bytes left \n",
                        pRecord->Length, pRecord->RecordID, Length));
            status = A_EPROTO;
            break;
        }
            /* start of record follows the header */
        pRecordBuf = pBuffer;
        switch (pRecord->RecordID) {
            case HTC_RECORD_CREDITS:
                AR_DEBUG_ASSERT(pRecord->Length >= sizeof(HTC_CREDIT_REPORT));
                HTCProcessCreditRpt(target,
                                    (HTC_CREDIT_REPORT *)pRecordBuf,
                                    pRecord->Length / (sizeof(HTC_CREDIT_REPORT)),
                                    FromEndpoint);
                break;
            case HTC_RECORD_LOOKAHEAD:
                AR_DEBUG_ASSERT(pRecord->Length >= sizeof(HTC_LOOKAHEAD_REPORT));
                pLookAhead = (HTC_LOOKAHEAD_REPORT *)pRecordBuf;
                if ((pLookAhead->PreValid == ((~pLookAhead->PostValid) & 0xFF)) &&
                    (pNextLookAhead != NULL)) {

                    AR_DEBUG_PRINTF(ATH_DEBUG_RECV,
                                (" LookAhead Report Found (pre valid:0x%X, post valid:0x%X) \n",
                                pLookAhead->PreValid,
                                pLookAhead->PostValid));

                        /* look ahead bytes are valid, copy them over */
                    ((A_UINT8 *)pNextLookAhead)[0] = pLookAhead->LookAhead[0];
                    ((A_UINT8 *)pNextLookAhead)[1] = pLookAhead->LookAhead[1];
                    ((A_UINT8 *)pNextLookAhead)[2] = pLookAhead->LookAhead[2];
                    ((A_UINT8 *)pNextLookAhead)[3] = pLookAhead->LookAhead[3];

                    if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
                        DebugDumpBytes((A_UINT8 *)pNextLookAhead,4,"Next Look Ahead");
                    }
                } else {
			HIFGetLookAhead(HIFgetDevice(target),pNextLookAhead);
		}
                break;
            default:
                AR_DEBUG_PRINTF(ATH_DEBUG_ERR, (" unhandled record: id:%d length:%d \n",
                        pRecord->RecordID, pRecord->Length));
                break;
        }

        if (A_FAILED(status)) {
            break;
        }

            /* advance buffer past this record for next time around */
        pBuffer += pRecord->Length;
        Length -= pRecord->Length;
    }

    if (A_FAILED(status)) {
        DebugDumpBytes(pOrigBuffer,origLength,"BAD Recv Trailer");
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("-HTCProcessTrailer \n"));
    return status;

}

/* process a received message (i.e. strip off header, process any trailer data)
 * note : locks must be released when this function is called */
static A_STATUS HTCProcessRecvHeader(HTC_TARGET *target, HTC_PACKET *pPacket, A_UINT32 *pNextLookAhead)
{
    A_UINT8   temp;
    A_UINT8   *pBuf;
    A_STATUS  status = A_OK;
    A_UINT16  payloadLen;
    A_UINT32  lookAhead;

    pBuf = pPacket->pBuffer;

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("+HTCProcessRecvHeader \n"));

    if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
	if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_DUMP)) {
          AR_DEBUG_PRINTBUF(pBuf,pPacket->ActualLength,"HTC Recv PKT");
	}
    }

    do {
        /* note, we cannot assume the alignment of pBuffer, so we use the safe macros to
         * retrieve 16 bit fields */
        payloadLen = A_GET_UINT16_FIELD(pBuf, HTC_FRAME_HDR, PayloadLen);

        ((A_UINT8 *)&lookAhead)[0] = pBuf[0];
        ((A_UINT8 *)&lookAhead)[1] = pBuf[1];
        ((A_UINT8 *)&lookAhead)[2] = pBuf[2];
        ((A_UINT8 *)&lookAhead)[3] = pBuf[3];

        if (lookAhead != pPacket->HTCReserved) {
            /* somehow the lookahead that gave us the full read length did not
             * reflect the actual header in the pending message */
             AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                    ("HTCProcessRecvHeader, lookahead mismatch! \n"));
             DebugDumpBytes((A_UINT8 *)&pPacket->HTCReserved,4,"Expected Message LookAhead");
//             DebugDumpBytes(pBuf,sizeof(HTC_FRAME_HDR),"Current Frame Header");
#ifdef HTC_CAPTURE_LAST_FRAME
            DebugDumpBytes((A_UINT8 *)&target->LastFrameHdr,sizeof(HTC_FRAME_HDR),"Last Frame Header");
            if (target->LastTrailerLength != 0) {
                DebugDumpBytes(target->LastTrailer,
                               target->LastTrailerLength,
                               "Last trailer");
            }
#endif
            status = A_EPROTO;
            break;
        }

            /* get flags */
        temp = A_GET_UINT8_FIELD(pBuf, HTC_FRAME_HDR, Flags);

        if (temp & HTC_FLAGS_RECV_TRAILER) {
            /* this packet has a trailer */

                /* extract the trailer length in control byte 0 */
            temp = A_GET_UINT8_FIELD(pBuf, HTC_FRAME_HDR, ControlBytes[0]);

            if ((temp < sizeof(HTC_RECORD_HDR)) || (temp > payloadLen)) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                    ("HTCProcessRecvHeader, invalid header (payloadlength should be :%d, CB[0] is:%d) \n",
                        payloadLen, temp));
                status = A_EPROTO;
                break;
            }

                /* process trailer data that follows HDR + application payload */
            status = HTCProcessTrailer(target,
                                       (pBuf + HTC_HDR_LENGTH + payloadLen - temp),
                                       temp,
                                       pNextLookAhead,
                                       pPacket->Endpoint);

            if (A_FAILED(status)) {
                break;
            }

#ifdef HTC_CAPTURE_LAST_FRAME
            A_MEMCPY(target->LastTrailer, (pBuf + HTC_HDR_LENGTH + payloadLen - temp), temp);
            target->LastTrailerLength = temp;
#endif
                /* trim length by trailer bytes */
            pPacket->ActualLength -= temp;
        }
#ifdef HTC_CAPTURE_LAST_FRAME
         else {
            target->LastTrailerLength = 0;
        }
#endif

            /* if we get to this point, the packet is good */
            /* remove header and adjust length */
        pPacket->pBuffer += HTC_HDR_LENGTH;
        pPacket->ActualLength -= HTC_HDR_LENGTH;

    } while (FALSE);

    if (A_FAILED(status)) {
            /* dump the whole packet */
        DebugDumpBytes(pBuf,pPacket->ActualLength,"BAD HTC Recv PKT");
    } else {
#ifdef HTC_CAPTURE_LAST_FRAME
        A_MEMCPY(&target->LastFrameHdr,pBuf,sizeof(HTC_FRAME_HDR));
#endif
        if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_RECV)) {
            	if (pPacket->ActualLength > 0) {
	        	if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_DUMP)) {
                		AR_DEBUG_PRINTBUF(pPacket->pBuffer,pPacket->ActualLength,"HTC - Application Msg");
            		}
		}
        }
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("-HTCProcessRecvHeader \n"));
    return status;
}







/* asynchronous completion handler for recv packet fetching, when the device layer
 * completes a read request, it will call this completion handler */
void HTCRecvCompleteHandler(void *Context, HTC_PACKET *pPacket)
{
    HTC_TARGET      *target = (HTC_TARGET *)Context;
    HTC_ENDPOINT    *pEndpoint;
    A_UINT32        nextLookAhead = 0;
    A_STATUS        status;

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("+HTCRecvCompleteHandler (status:%d, ep:%d) \n",
                pPacket->Status, pPacket->Endpoint));

    AR_DEBUG_ASSERT(pPacket->Endpoint < ENDPOINT_MAX);
    pEndpoint = &target->EndPoint[pPacket->Endpoint];
    pPacket->Completion = NULL;

        /* get completion status */
    status = pPacket->Status;

    do {
        if (A_FAILED(status)) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("HTCRecvCompleteHandler: request failed (status:%d, ep:%d) \n",
                pPacket->Status, pPacket->Endpoint));
            break;
        }
            /* process the header for any trailer data */
        status = HTCProcessRecvHeader(target,pPacket,&nextLookAhead);

        if (A_FAILED(status)) {
            break;
        }
            /* was there a lookahead for the next packet? */
        if (nextLookAhead != 0) {
            A_STATUS nextStatus;
            AR_DEBUG_PRINTF(ATH_DEBUG_RECV,
                            ("HTCRecvCompleteHandler - next look ahead was non-zero : 0x%X \n",
                             nextLookAhead));
                /* we have another packet, get the next packet fetch started (pipelined) before
                 * we call into the endpoint's callback, this will start another async request */

            nextStatus = HTCRecvMessagePendingHandler(target,&nextLookAhead,NULL);
            if (A_EPROTO == nextStatus) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                            ("Next look ahead from recv header was INVALID\n"));
                DebugDumpBytes((A_UINT8 *)&nextLookAhead,
                                4,
                                "BAD lookahead from lookahead report");
            }
        } else {
             AR_DEBUG_PRINTF(ATH_DEBUG_RECV,
            ("HTCRecvCompleteHandler - rechecking for more messages...\n"));
            /* if we did not get anything on the look-ahead,
             * call device layer to asynchronously re-check for messages. If we can keep the async
             * processing going we get better performance.  If there is a pending message we will keep processing
             * messages asynchronously which should pipeline things nicely */
            DevCheckPendingRecvMsgsAsync(&target->Device);
        }

        HTC_RX_STAT_PROFILE(target,pEndpoint,nextLookAhead);
        DO_RCV_COMPLETION(target,pPacket,pEndpoint);

    } while (FALSE);

    if (A_FAILED(status)) {
         AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                         ("HTCRecvCompleteHandler , message fetch failed (status = %d) \n",
                         status));
            /* recyle this packet */
         HTC_RECYCLE_RX_PKT(target, pPacket, pEndpoint);
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("-HTCRecvCompleteHandler\n"));
}

/* synchronously wait for a control message from the target,
 * This function is used at initialization time ONLY.  At init messages
 * on ENDPOINT 0 are expected. */
A_STATUS HTCWaitforControlMessage(HTC_TARGET *target, HTC_PACKET **ppControlPacket)
{
    A_STATUS        status;
    A_UINT32        lookAhead;
    HTC_PACKET      *pPacket = NULL;
    HTC_FRAME_HDR   *pHdr;

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV,("+HTCWaitforControlMessage \n"));

    do  {
        *ppControlPacket = NULL;

            /* call the polling function to see if we have a message */
        status = DevPollMboxMsgRecv(&target->Device,
                                    &lookAhead,
                                    HTC_TARGET_RESPONSE_TIMEOUT);

        if (A_FAILED(status)) {
            break;
        }

        AR_DEBUG_PRINTF(ATH_DEBUG_RECV,
                ("HTCWaitforControlMessage : lookAhead : 0x%X \n", lookAhead));

            /* check the lookahead */
        pHdr = (HTC_FRAME_HDR *)&lookAhead;

        if (pHdr->EndpointID != ENDPOINT_0) {
                /* unexpected endpoint number, should be zero */
            AR_DEBUG_ASSERT(FALSE);
            status = A_EPROTO;
            break;
        }

        if (A_FAILED(status)) {
                /* bad message */
            AR_DEBUG_ASSERT(FALSE);
            status = A_EPROTO;
            break;
        }

        pPacket = HTC_ALLOC_CONTROL_RX(target);

        if (pPacket == NULL) {
            AR_DEBUG_ASSERT(FALSE);
            status = A_NO_MEMORY;
            break;
        }

        pPacket->HTCReserved = lookAhead;
        pPacket->ActualLength = pHdr->PayloadLen + HTC_HDR_LENGTH;


        if (pPacket->ActualLength > pPacket->BufferLength) {
            AR_DEBUG_ASSERT(FALSE);
            status = A_EPROTO;
            break;
        }

            /* we want synchronous operation */
        pPacket->Completion = NULL;

            /* get the message from the device, this will block */
        status = HTCIssueRecv(target, pPacket);

        if (A_FAILED(status)) {
            break;
        }

            /* process receive header */
        status = HTCProcessRecvHeader(target,pPacket,NULL);

        pPacket->Status = status;

        if (A_FAILED(status)) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR,
                    ("HTCWaitforControlMessage, HTCProcessRecvHeader failed (status = %d) \n",
                     status));
            break;
        }

            /* give the caller this control message packet, they are responsible to free */
        *ppControlPacket = pPacket;

    } while (FALSE);

    if (A_FAILED(status)) {
        if (pPacket != NULL) {
                /* cleanup buffer on error */
            HTC_FREE_CONTROL_RX(target,pPacket);
        }
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_RECV,("-HTCWaitforControlMessage \n"));

    return status;
}

#define _AR_DEBUG_PRINTX_ARG(arg...) arg
#define A_PRINTF(args...) printk(args)

#define A_DBG_PRINTF(lvl,args)\
    if (debughtc & (lvl)) {\
        A_PRINTF(KERN_ALERT _AR_DEBUG_PRINTX_ARG args);\
    }

/* callback when device layer or lookahead report parsing detects a pending message */
A_STATUS HTCRecvMessagePendingHandler(void *Context,
					A_UINT32 *LookAhead,
					A_BOOL *pAsyncProc) {
	HTC_TARGET	*target = (HTC_TARGET *)Context;
	A_STATUS	status = A_OK;
	HTC_PACKET	*pPacket = NULL;
	HTC_FRAME_HDR	*pHdr = NULL;
	HTC_ENDPOINT	*pEndpoint = NULL;
	A_BOOL		asyncProc = FALSE;

//5974,5978,5980,5988,5e40
//68(sp)=LookAhead
//72(sp)=pAsyncProc
//LC25
	A_DBG_PRINTF(ATH_DEBUG_RECV,("+HTCRecvMessagePendingHandler LookAhead:0x%X \n", *LookAhead));

//5994
	if (IS_DEV_IRQ_PROCESSING_ASYNC_ALLOWED(&target->Device)) {
		/* We use async mode to get the packets if the device layer supports it.
		 * The device layer interfaces with HIF in which HIF may have restrictions on
		 * how interrupts are processed */
 		asyncProc = TRUE;
	}

//5998
	if (pAsyncProc != NULL) {
		/* indicate to caller how we decided to process this */
//59a4
		*pAsyncProc = asyncProc;
	}

	while (TRUE) {
//59a8
		pHdr = (HTC_FRAME_HDR *)LookAhead;
//59b0

		if (pHdr->EndpointID >= ENDPOINT_MAX) {
//5fc0
//LC26
			A_DBG_PRINTF(ATH_DEBUG_ERR,("Invalid Endpoint in look-ahead: %d \n",pHdr->EndpointID));
			/* invalid endpoint */
//5fcc
			status = A_EPROTO;
//--->> 5f34
			break;
		}

//59d0
		if (pHdr->PayloadLen > HTC_MAX_PAYLOAD_LENGTH) {
//5fd8
//LC27
			A_DBG_PRINTF(ATH_DEBUG_ERR,("Payload length %d exceeds max HTC : %d !\n",
				pHdr->PayloadLen, HTC_MAX_PAYLOAD_LENGTH));
//6000
			status = A_EPROTO;
//--->> 5f34
			break;
		}

		pEndpoint = &target->EndPoint[pHdr->EndpointID];

//59e8-59ec
		if (0 == pEndpoint->ServiceID) {
//600c
//LC28
			A_DBG_PRINTF(ATH_DEBUG_ERR,("Endpoint %d is not connected !\n",pHdr->EndpointID));
//606c
			/* endpoint isn't even connected */
//5fcc,6078
			status = A_EPROTO;
//----> 5f34
			break;
		}

//59f4,59f8
		if (pEndpoint->EpCallBacks.EpRecvAlloc != NULL) {
			/* user is using a per-packet allocation callback */
//5a00-5a08
			pPacket = pEndpoint->EpCallBacks.EpRecvAlloc(pEndpoint->EpCallBacks.pContext,
					(HTC_ENDPOINT_ID) pHdr->EndpointID,
					pHdr->PayloadLen + sizeof(HTC_FRAME_HDR));

			/* lock RX, in case this allocation fails, we need to update internal state below */

//5a10
			LOCK_HTC_RX(target);

		} else {
//5d28
			/* user is using a refill handler that can refill multiple HTC buffers */
			/* lock RX to get a buffer */
			LOCK_HTC_RX(target);

			/* get a packet from the endpoint recv queue */
			pPacket = HTC_PACKET_DEQUEUE(&pEndpoint->RxBuffers);

			if (NULL == pPacket) {
				/* check for refill handler */
				if (pEndpoint->EpCallBacks.EpRecvRefill != NULL) {
					UNLOCK_HTC_RX(target);
					/* call the re-fill handler */
					pEndpoint->EpCallBacks.EpRecvRefill(
						pEndpoint->EpCallBacks.pContext,
						(HTC_ENDPOINT_ID) pHdr->EndpointID);
					LOCK_HTC_RX(target);
					/* check if we have more buffers */
					pPacket = HTC_PACKET_DEQUEUE(&pEndpoint->RxBuffers);
					/* fall through */
				}
			}
		}
//5a2c
		if (NULL == pPacket) {
//5d78
			/* this is not an error, we simply need to mark that we are waiting for buffers.*/
			target->HTCStateFlags |= HTC_STATE_WAIT_BUFFERS;
			target->EpWaitingForBuffers = (HTC_ENDPOINT_ID) pHdr->EndpointID;
//5d7c
			status = A_NO_MEMORY;
// ----> 5a3c
		}

		if (HTC_STOPPING(target)) {
			status = A_ECANCELED;
		}

//5a54
		UNLOCK_HTC_RX(target);

//5a5c
		if (A_FAILED(status)) {
//---->5f24
			/* no buffers or stopping */
			break;
		}

// 5a64
		pPacket->PktInfo.AsRx.IndicationFlags = 0;
//5a70 ----> 5a84
//5cfc
//LC3
//LC4
//LC29


































































































































































		AR_DEBUG_ASSERT(pPacket->Endpoint == pHdr->EndpointID);
		/* make sure this message can fit in the endpoint buffer */
// 5a84-5aa0
		if ((pHdr->PayloadLen + HTC_HDR_LENGTH) > pPacket->BufferLength) {
// 6020
// 60e8 LC30
			A_DBG_PRINTF(ATH_DEBUG_ERR,
					("Payload Length Error : header reports payload of: %d, endpoint buffer size: %d \n",
				pHdr->PayloadLen, pPacket->BufferLength));
// 6034,60fc
			status = A_EPROTO;
// ----> 5f34
			break;
		} // 5aa4-5aac
		pPacket->HTCReserved = *LookAhead; /* set expected look ahead */
		/* set the amount of data to fetch */ // 5ab0-5ac8
		pPacket->ActualLength = pHdr->PayloadLen + HTC_HDR_LENGTH; // 5ac4
		if (asyncProc) { // 5c9c // LC31
			printk("%s, %d, set pPacket->Completion\n", __FUNCTION__, __LINE__);
			/* we use async mode to get the packet if the device layer supports it
			 * set our callback and context */
//5cc8
			pPacket->Completion = HTCRecvCompleteHandler;
//5cd0
			pPacket->pContext = target;
//5cc8---->5ad0
		} else {
			/* fully synchronous */
//5acc
			pPacket->Completion = NULL;
		}

		/* go fetch the packet */ //5ad0 //5aec-->6038-->6040-->609c-->LC3,LC32,LC33-->6050-->
		status = HTCIssueRecv(target, pPacket); //5b60---->5f24
		if (A_FAILED(status)) {
			break;
		} //5b68
		if (asyncProc) { //5be4
			/* we did this asynchronously so we can get out of the loop, the asynch processing
			 * creates a chain of requests to continue processing pending messages in the
			 * context of callbacks  */

#if 0
//	if (A_SUCCESS(status)) {
		if (*LookAhead != 0)  { // 5df4
			if (g_lookaheadStatus!=0) {
				A_STATUS nextStatus; // 5e00 // 5fa8 // LC42
				A_DBG_PRINTF(ATH_DEBUG_RECV,
					("HTCRecvMessagePendingHandler - next look ahead was non-zero : 0x%X \n", *LookAhead)); // 5e10
				g_lookaheadStatus=1; // 5e24
				nextStatus=HTCRecvMessagePendingHandler(target, LookAhead, pAsyncProc);
// 5e30
				if (A_EPROTO == nextStatus) { // 5e74 // 6084 // LC43
					A_DBG_PRINTF(ATH_DEBUG_ERR, ("Pending Next look ahead from recv header was INVALID\n")); //5e88
					DebugDumpBytes((A_UINT8 *)LookAhead, 4, "Pending BAD lookahead from lookahead report"); // 5e9c-5ea4 ---> 5bf4
				} // 5e3c ---> 5bf4
				g_lookaheadStatus=0;
			} // ----> 5bf8
			return 0;
		}
//	} // 5bf8 // 5c00 // LC45

#endif

			break;
		}

		/* in the sync case, we process the packet, check lookaheads and then repeat */ //5b74
		*LookAhead = 0; //5b84
		status = HTCProcessRecvHeader(target,pPacket,LookAhead); //5b8c
		if (A_FAILED(status)) { //      ----> 5f20
			break;
		}

		HTC_RX_STAT_PROFILE(target,pEndpoint,*LookAhead);

		/* check lookahead to see if we can indicate next
 		 * packet hint to rec v callback */ //5b94
		if (LookAhead != 0) {
			pHdr = (HTC_FRAME_HDR *)&LookAhead;
			/* check to see if the "next" packet is from the
 			 * same endpoint of the completing packet */ //5b9c-5ba8
			if (pHdr->EndpointID == pPacket->Endpoint) { //5ce0
				/* check that there is a buffer available
 				 * to actually fetch it NOTE: no need to
 				 * lock RX here , since we are synchronously
 				 * processing RX and we are only looking at
 				 * the queue (not modifying it) */
				if (!HTC_QUEUE_EMPTY(&pEndpoint->RxBuffers)) {
					/* provide a hint that there are more RX packets to fetch */
					pPacket->PktInfo.AsRx.IndicationFlags |= HTC_RX_FLAGS_INDICATE_MORE_PKTS;
				}
			}
		} //5bac-5bcc
		DO_RCV_COMPLETION(target,pPacket,pEndpoint);
		pPacket = NULL;

		if (0 == *LookAhead) { //---> 5be4
			break;
		} //---> 59b0
		/* check whether other OS contexts have queued any
		 * WMI command/data for WLAN.
		 * This check is needed only if WLAN Tx and Rx happens
		 * in same thread context */
		A_CHECK_DRV_TX();
	} //5f24
//------------------------------------------------------------------//
	if (A_NO_MEMORY == status) { //6124 //LC40
		A_DBG_PRINTF(ATH_DEBUG_ERR,
			(" Endpoint :%d has no buffers, blocking receiver to prevent overrun.. \n",
			(pHdr != NULL) ? pHdr->EndpointID : 0xFFFF));
		/* try to stop receive at the device layer */ //613c
		DevStopRecv(&target->Device, asyncProc ? DEV_STOP_RECV_ASYNC : DEV_STOP_RECV_SYNC); //6148 -----> 5be4
		status = A_OK;
	} else if (A_FAILED(status)) { //5f3c //5f7c //LC41
		A_DBG_PRINTF(ATH_DEBUG_ERR, ("Failed to get pending message : LookAhead Value: 0x%X (status = %d) \n", *LookAhead, status)); //5f44
		if (pPacket != NULL) { //5f4c  | 6100
			/* clean up packet on error */
			HTC_RECYCLE_RX_PKT(target, pPacket, pEndpoint); //----> 5bf8, 5bf8
		} //----> 5be4
	}
#if 1
	if (A_SUCCESS(status)) {
		if (*LookAhead != 0)  { // 5df4
			if (g_lookaheadStatus!=0) {
				A_STATUS nextStatus; // 5e00 // 5fa8 // LC42
				A_DBG_PRINTF(ATH_DEBUG_RECV,
					("HTCRecvMessagePendingHandler - next look ahead was non-zero : 0x%X \n", *LookAhead)); // 5e10
				g_lookaheadStatus=1; // 5e24
				nextStatus=HTCRecvMessagePendingHandler(target, LookAhead, pAsyncProc);
// 5e30
				if (A_EPROTO == nextStatus) { // 5e74 // 6084 // LC43
					A_DBG_PRINTF(ATH_DEBUG_ERR, ("Pending Next look ahead from recv header was INVALID\n")); //5e88
					DebugDumpBytes((A_UINT8 *)LookAhead, 4, "Pending BAD lookahead from lookahead report"); // 5e9c-5ea4 ---> 5bf4
				} // 5e3c ---> 5bf4
				g_lookaheadStatus=0;
			} // ----> 5bf8
		}
	} // 5bf8 // 5c00 // LC45
#endif
	A_DBG_PRINTF(ATH_DEBUG_RECV,("-HTCRecvMessagePendingHandler \n")); // 5c1c
	return status;
}











/* Makes a buffer available to the HTC module */
A_STATUS HTCAddReceivePkt(HTC_HANDLE HTCHandle, HTC_PACKET *pPacket)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    HTC_ENDPOINT *pEndpoint;
    A_BOOL       unblockRecv = FALSE;
    A_STATUS     status = A_OK;

    AR_DEBUG_PRINTF(ATH_DEBUG_SEND,
                    ("+HTCAddReceivePkt: endPointId: %d, buffer: 0x%X, length: %d\n",
                    pPacket->Endpoint, (A_UINT32)pPacket->pBuffer, pPacket->BufferLength));

    do {
        AR_DEBUG_ASSERT(pPacket->Endpoint < ENDPOINT_MAX);

        pEndpoint = &target->EndPoint[pPacket->Endpoint];

        LOCK_HTC_RX(target);

        if (HTC_STOPPING(target)) {
            pPacket->Status = A_ECANCELED;
            status = A_ECANCELED;
            UNLOCK_HTC_RX(target);
            pEndpoint->EpCallBacks.EpRecv(pEndpoint->EpCallBacks.pContext, pPacket);
            break;
        }

            /* store receive packet */
        HTC_PACKET_ENQUEUE(&pEndpoint->RxBuffers, pPacket);

            /* check if we are blocked waiting for a new buffer */
        if (target->HTCStateFlags & HTC_STATE_WAIT_BUFFERS) {
            if (target->EpWaitingForBuffers == pPacket->Endpoint) {
                AR_DEBUG_PRINTF(ATH_DEBUG_RECV,(" receiver was blocked on ep:%d, unblocking.. \n",
                    target->EpWaitingForBuffers));
                target->HTCStateFlags &= ~HTC_STATE_WAIT_BUFFERS;
                target->EpWaitingForBuffers = ENDPOINT_MAX;
                unblockRecv = TRUE;
            }
        }

        UNLOCK_HTC_RX(target);

        if (unblockRecv && !HTC_STOPPING(target)) {
                /* TODO : implement a buffer threshold count? */
            DevEnableRecv(&target->Device,DEV_ENABLE_RECV_SYNC);
        }

    } while (FALSE);

    return status;
}

void HTCUnblockRecv(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    A_BOOL      unblockRecv = FALSE;

    LOCK_HTC_RX(target);

        /* check if we are blocked waiting for a new buffer */
    if (target->HTCStateFlags & HTC_STATE_WAIT_BUFFERS) {
        AR_DEBUG_PRINTF(ATH_DEBUG_RECV,("HTCUnblockRx : receiver was blocked on ep:%d, unblocking.. \n",
            target->EpWaitingForBuffers));
        target->HTCStateFlags &= ~HTC_STATE_WAIT_BUFFERS;
        target->EpWaitingForBuffers = ENDPOINT_MAX;
        unblockRecv = TRUE;
    }

    UNLOCK_HTC_RX(target);

    if (unblockRecv && !HTC_STOPPING(target)) {
            /* re-enable */
        DevEnableRecv(&target->Device,DEV_ENABLE_RECV_ASYNC);
    }
}

static void HTCFlushEndpointRX(HTC_TARGET *target, HTC_ENDPOINT *pEndpoint)
{
    HTC_PACKET  *pPacket;

    LOCK_HTC_RX(target);

    while (1) {
        pPacket = HTC_PACKET_DEQUEUE(&pEndpoint->RxBuffers);
        if (NULL == pPacket) {
            break;
        }
        UNLOCK_HTC_RX(target);
        pPacket->Status = A_ECANCELED;
        pPacket->ActualLength = 0;
        AR_DEBUG_PRINTF(ATH_DEBUG_RECV, ("  Flushing RX packet:0x%X, length:%d, ep:%d \n",
                (A_UINT32)pPacket, pPacket->BufferLength, pPacket->Endpoint));
            /* give the packet back */
        pEndpoint->EpCallBacks.EpRecv(pEndpoint->EpCallBacks.pContext,
                                      pPacket);
        LOCK_HTC_RX(target);
    }

    UNLOCK_HTC_RX(target);


}

void HTCFlushRecvBuffers(HTC_TARGET *target)
{
    HTC_ENDPOINT    *pEndpoint;
    int             i;

    for (i = ENDPOINT_0; i < ENDPOINT_MAX; i++) {
        pEndpoint = &target->EndPoint[i];
        if (pEndpoint->ServiceID == 0) {
                /* not in use.. */
            continue;
        }
        HTCFlushEndpointRX(target,pEndpoint);
    }
}


void HTCEnableRecv(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);

    if (!HTC_STOPPING(target)) {
            /* re-enable */
        DevEnableRecv(&target->Device,DEV_ENABLE_RECV_SYNC);
    }
}

void HTCDisableRecv(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);

    if (!HTC_STOPPING(target)) {
            /* disable */
        DevStopRecv(&target->Device,DEV_ENABLE_RECV_SYNC);
    }
}
