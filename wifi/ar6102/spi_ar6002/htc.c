//------------------------------------------------------------------------------
// <copyright file="htc.c" company="Atheros">
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
#define __FILE__ "/app1/colman2/ar6k/AR6102-2.2.0.78/AR6kSDK.build_sw.78/host/os/linux/../../htc2/htc.c"

static void HTCReportFailure(void *Context, AR6K_TARGET_FAILURE_TYPE Type);


void HTCFreeControlBuffer(HTC_TARGET *target, HTC_PACKET *pPacket, HTC_PACKET_QUEUE *pList)
{
    LOCK_HTC(target);
    HTC_PACKET_ENQUEUE(pList,pPacket);
    UNLOCK_HTC(target);
}

HTC_PACKET *HTCAllocControlBuffer(HTC_TARGET *target,  HTC_PACKET_QUEUE *pList)
{
    HTC_PACKET *pPacket;

    LOCK_HTC(target);
    pPacket = HTC_PACKET_DEQUEUE(pList);
    UNLOCK_HTC(target);

    return pPacket;
}

/* cleanup the HTC instance */
static void HTCCleanup(HTC_TARGET *target)
{
    A_INT32 i;

    DevCleanup(&target->Device);

    for (i = 0;i < NUM_CONTROL_BUFFERS;i++) {
        if (target->HTCControlBuffers[i].Buffer) {
            A_FREE(target->HTCControlBuffers[i].Buffer);
        }
    }

    if (A_IS_MUTEX_VALID(&target->HTCLock)) {
        A_MUTEX_DELETE(&target->HTCLock);
    }

    if (A_IS_MUTEX_VALID(&target->HTCRxLock)) {
        A_MUTEX_DELETE(&target->HTCRxLock);
    }

    if (A_IS_MUTEX_VALID(&target->HTCTxLock)) {
        A_MUTEX_DELETE(&target->HTCTxLock);
    }
        /* free our instance */
    A_FREE(target);
}

/* registered target arrival callback from the HIF layer */
HTC_HANDLE HTCCreate(void *hif_handle, HTC_INIT_INFO *pInfo)
{
    HTC_TARGET              *target = NULL;
    A_STATUS                 status = A_OK;
    int                      i;
    A_UINT32                 ctrl_bufsz;
    A_UINT32                 blocksizes[HTC_MAILBOX_NUM_MAX];

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("HTCCreate - Enter\n"));

    do {

            /* allocate target memory */
        if ((target = (HTC_TARGET *)A_MALLOC(sizeof(HTC_TARGET))) == NULL) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to allocate memory\n"));
            status = A_ERROR;
            break;
        }

        A_MEMZERO(target, sizeof(HTC_TARGET));
        A_MUTEX_INIT(&target->HTCLock);
        A_MUTEX_INIT(&target->HTCRxLock);
        A_MUTEX_INIT(&target->HTCTxLock);
        INIT_HTC_PACKET_QUEUE(&target->ControlBufferTXFreeList);
        INIT_HTC_PACKET_QUEUE(&target->ControlBufferRXFreeList);

            /* give device layer the hif device handle */
        target->Device.HIFDevice = hif_handle;
            /* give the device layer our context (for event processing)
             * the device layer will register it's own context with HIF
             * so we need to set this so we can fetch it in the target remove handler */
        target->Device.HTCContext = target;
            /* set device layer target failure callback */
        target->Device.TargetFailureCallback = HTCReportFailure;
            /* set device layer recv message pending callback */
        target->Device.MessagePendingCallback = HTCRecvMessagePendingHandler;
        target->EpWaitingForBuffers = ENDPOINT_MAX;

        A_MEMCPY(&target->HTCInitInfo,pInfo,sizeof(HTC_INIT_INFO));

            /* setup device layer */
        status = DevSetup(&target->Device);

        if (A_FAILED(status)) {
            break;
        }


        /* get the block sizes */
        status = HIFConfigureDevice(hif_handle, HIF_DEVICE_GET_MBOX_BLOCK_SIZE,
                                    blocksizes, sizeof(blocksizes));
        if (A_FAILED(status)) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR,("Failed to get block size info from HIF layer...\n"));
            break;
        }

        /* Set the control buffer size based on the block size */
        if (blocksizes[1] > HTC_MAX_CONTROL_MESSAGE_LENGTH) {
            ctrl_bufsz = blocksizes[1] + HTC_HDR_LENGTH;
        } else {
            ctrl_bufsz = HTC_MAX_CONTROL_MESSAGE_LENGTH + HTC_HDR_LENGTH;
        }
        for (i = 0;i < NUM_CONTROL_BUFFERS;i++) {
            target->HTCControlBuffers[i].Buffer = A_MALLOC(ctrl_bufsz);
            if (target->HTCControlBuffers[i].Buffer == NULL) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to allocate memory\n"));
                status = A_ERROR;
                break;
            }
        }

        if (A_FAILED(status)) {
            break;
        }

            /* carve up buffers/packets for control messages */
        for (i = 0; i < NUM_CONTROL_RX_BUFFERS; i++) {
            HTC_PACKET *pControlPacket;
            pControlPacket = &target->HTCControlBuffers[i].HtcPacket;
            SET_HTC_PACKET_INFO_RX_REFILL(pControlPacket,
                                          target,
                                          target->HTCControlBuffers[i].Buffer,
                                          ctrl_bufsz,
                                          ENDPOINT_0);
            HTC_FREE_CONTROL_RX(target,pControlPacket);
        }

        for (;i < NUM_CONTROL_BUFFERS;i++) {
             HTC_PACKET *pControlPacket;
             pControlPacket = &target->HTCControlBuffers[i].HtcPacket;
             INIT_HTC_PACKET_INFO(pControlPacket,
                                  target->HTCControlBuffers[i].Buffer,
                                  ctrl_bufsz);
             HTC_FREE_CONTROL_TX(target,pControlPacket);
        }

    } while (FALSE);

    if (A_FAILED(status)) {
        if (target != NULL) {
            HTCCleanup(target);
            target = NULL;
        }
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("HTCCreate - Exit\n"));

    return target;
}

void  HTCDestroy(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("+HTCDestroy ..  Destroying :0x%X \n",(A_UINT32)target));
    HTCCleanup(target);
    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("-HTCDestroy \n"));
}

/* get the low level HIF device for the caller , the caller may wish to do low level
 * HIF requests */
void *HTCGetHifDevice(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    return target->Device.HIFDevice;
}





/* wait for the target to arrive (sends HTC Ready message)
 * this operation is fully synchronous and the message is polled for */
A_STATUS HTCWaitTarget(HTC_HANDLE HTCHandle)
{
    HTC_TARGET              *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    A_STATUS                 status;
    HTC_PACKET              *pPacket = NULL;
    HTC_READY_MSG           *pRdyMsg;
    HTC_SERVICE_CONNECT_REQ  connect;
    HTC_SERVICE_CONNECT_RESP resp;

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("HTCWaitTarget - Enter (target:0x%X) \n", (A_UINT32)target));

    do {

#ifdef MBOXHW_UNIT_TEST

        status = DoMboxHWTest(&target->Device);

        if (status != A_OK) {
            break;
        }

#endif

            /* we should be getting 1 control message that the target is ready */
        status = HTCWaitforControlMessage(target, &pPacket);

        if (A_FAILED(status)) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, (" Target Not Available!!\n"));
            break;
        }

            /* we controlled the buffer creation so it has to be properly aligned */
        pRdyMsg = (HTC_READY_MSG *)pPacket->pBuffer;

        if ((pRdyMsg->MessageID != HTC_MSG_READY_ID) ||
            (pPacket->ActualLength < sizeof(HTC_READY_MSG))) {
                /* this message is not valid */
            AR_DEBUG_ASSERT(FALSE);
            status = A_EPROTO;
            break;
        }

        if (pRdyMsg->CreditCount == 0 || pRdyMsg->CreditSize == 0) {
              /* this message is not valid */
            AR_DEBUG_ASSERT(FALSE);
            status = A_EPROTO;
            break;
        }

        target->TargetCredits = pRdyMsg->CreditCount;
        target->TargetCreditSize = pRdyMsg->CreditSize;

        AR_DEBUG_PRINTF(ATH_DEBUG_TRC, (" Target Ready: credits: %d credit size: %d\n",
                target->TargetCredits, target->TargetCreditSize));

            /* setup our pseudo HTC control endpoint connection */
        A_MEMZERO(&connect,sizeof(connect));
        A_MEMZERO(&resp,sizeof(resp));
        connect.EpCallbacks.pContext = target;
        connect.EpCallbacks.EpTxComplete = HTCControlTxComplete;
        connect.EpCallbacks.EpRecv = HTCControlRecv;
        connect.EpCallbacks.EpRecvRefill = NULL;  /* not needed */
        connect.EpCallbacks.EpSendFull = NULL;    /* not nedded */
        connect.MaxSendQueueDepth = NUM_CONTROL_BUFFERS;
        connect.ServiceID = HTC_CTRL_RSVD_SVC;

            /* connect fake service */
        status = HTCConnectService((HTC_HANDLE)target,
                                   &connect,
                                   &resp);

        if (!A_FAILED(status)) {
            break;
        }

    } while (FALSE);

    if (pPacket != NULL) {
        HTC_FREE_CONTROL_RX(target,pPacket);
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("HTCWaitTarget - Exit\n"));

    return status;
}



/* Start HTC, enable interrupts and let the target know host has finished setup */
A_STATUS HTCStart(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    HTC_PACKET *pPacket;
    A_STATUS   status;

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("HTCStart Enter\n"));

        /* make sure interrupts are disabled at the chip level,
         * this function can be called again from a reboot of the target without shutting down HTC */
    DevDisableInterrupts(&target->Device);
        /* make sure state is cleared again */
    target->HTCStateFlags = 0;

        /* now that we are starting, push control receive buffers into the
         * HTC control endpoint */

    while (1) {
        pPacket = HTC_ALLOC_CONTROL_RX(target);
        if (NULL == pPacket) {
            break;
        }
        HTCAddReceivePkt((HTC_HANDLE)target,pPacket);
    }

    do {

        AR_DEBUG_ASSERT(target->InitCredits != NULL);
        AR_DEBUG_ASSERT(target->EpCreditDistributionListHead != NULL);
        AR_DEBUG_ASSERT(target->EpCreditDistributionListHead->pNext != NULL);

            /* call init credits callback to do the distribution ,
             * NOTE: the first entry in the distribution list is ENDPOINT_0, so
             * we pass the start of the list after this one. */
        target->InitCredits(target->pCredDistContext,
                            target->EpCreditDistributionListHead->pNext,
                            target->TargetCredits);

        if (AR_DEBUG_LVL_CHECK(ATH_DEBUG_TRC)) {
            DumpCreditDistStates(target);
        }

            /* the caller is done connecting to services, so we can indicate to the
            * target that the setup phase is complete */
        status = HTCSendSetupComplete(target);

        if (A_FAILED(status)) {
            break;
        }

            /* unmask interrupts */
        status = DevUnmaskInterrupts(&target->Device);

        if (A_FAILED(status)) {
            HTCStop(target);
        }

    } while (FALSE);

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("HTCStart Exit\n"));
    return status;
}

static void ResetEndpointStates(HTC_TARGET *target)
{
    HTC_ENDPOINT        *pEndpoint;
    int                  i;

    for (i = ENDPOINT_0; i < ENDPOINT_MAX; i++) {
        pEndpoint = &target->EndPoint[i];

        A_MEMZERO(&pEndpoint->CreditDist, sizeof(pEndpoint->CreditDist));
        pEndpoint->ServiceID = 0;
        pEndpoint->CurrentTxQueueDepth = 0;
        pEndpoint->MaxMsgLength = 0;
        pEndpoint->MaxTxQueueDepth = 0;
#ifdef HTC_EP_STAT_PROFILING
        A_MEMZERO(&pEndpoint->EndPointStats,sizeof(pEndpoint->EndPointStats));
#endif
        INIT_HTC_PACKET_QUEUE(&pEndpoint->RxBuffers);
        INIT_HTC_PACKET_QUEUE(&pEndpoint->TxQueue);
    }
        /* reset distribution list */
    target->EpCreditDistributionListHead = NULL;
}

/* stop HTC communications, i.e. stop interrupt reception, and flush all queued buffers */
void HTCStop(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("+HTCStop \n"));

    LOCK_HTC_RX(target);
        /* mark that we are shutting down .. */
    target->HTCStateFlags |= HTC_STATE_STOPPING;
    UNLOCK_HTC_RX(target);

        /* Masking interrupts is a synchronous operation, when this function returns
         * all pending HIF I/O has completed, we can safely flush the queues */
    DevMaskInterrupts(&target->Device);

        /* flush all send packets */
    HTCFlushSendPkts(target);
        /* flush all recv buffers */
    HTCFlushRecvBuffers(target);

    ResetEndpointStates(target);

    AR_DEBUG_PRINTF(ATH_DEBUG_TRC, ("-HTCStop \n"));
}

void HTCDumpCreditStates(HTC_HANDLE HTCHandle)
{
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);

    LOCK_HTC_TX(target);

    DumpCreditDistStates(target);

    UNLOCK_HTC_TX(target);
}

/* report a target failure from the device, this is a callback from the device layer
 * which uses a mechanism to report errors from the target (i.e. special interrupts) */
static void HTCReportFailure(void *Context, AR6K_TARGET_FAILURE_TYPE Type)
{
    HTC_TARGET *target = (HTC_TARGET *)Context;

    target->TargetFailure = TRUE;

    switch (Type) {

        case AR6K_TARGET_TX_ERROR:
                /* could be a credit problem */
            DumpCreditDistStates(target);
            break;
        case AR6K_TARGET_RX_ERROR:

            break;
        case AR6K_TARGET_ASSERT:
            if (target->HTCInitInfo.TargetFailure != NULL) {
                    /* let upper layer know, it needs to call HTCStop() */
                target->HTCInitInfo.TargetFailure(target->HTCInitInfo.pContext, A_ERROR);
            }
            break;
        default:
            break;

    }

}

void DebugDumpBytes(A_UCHAR *buffer, A_UINT16 length, char *pDescription)
{
    A_CHAR stream[60];
    A_UINT32 i;
    A_UINT16 offset, count;

    AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("<---------Dumping %d Bytes : %s ------>\n", length, pDescription));

    count = 0;
    offset = 0;
    for(i = 0; i < length; i++) {
        A_SPRINTF(stream + offset, "%2.2X ", buffer[i]);
        count ++;
        offset += 3;

        if(count == 16) {
            count = 0;
            offset = 0;
            AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("[H]: %s\n", stream));
            A_MEMZERO(stream, 60);
        }
    }

    if(offset != 0) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("[H]: %s\n", stream));
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_ANY, ("<------------------------------------------------->\n"));
}

A_BOOL HTCGetEndpointStatistics(HTC_HANDLE               HTCHandle,
                                HTC_ENDPOINT_ID          Endpoint,
                                HTC_ENDPOINT_STAT_ACTION Action,
                                HTC_ENDPOINT_STATS       *pStats)
{

#ifdef HTC_EP_STAT_PROFILING
    HTC_TARGET *target = GET_HTC_TARGET_FROM_HANDLE(HTCHandle);
    A_BOOL     clearStats = FALSE;
    A_BOOL     sample = FALSE;

    switch (Action) {
        case HTC_EP_STAT_SAMPLE :
            sample = TRUE;
            break;
        case HTC_EP_STAT_SAMPLE_AND_CLEAR :
            sample = TRUE;
            clearStats = TRUE;
            break;
        case HTC_EP_STAT_CLEAR :
            clearStats = TRUE;
            break;
        default:
            break;
    }

    A_ASSERT(Endpoint < ENDPOINT_MAX);

        /* lock out TX and RX while we sample and/or clear */
    LOCK_HTC_TX(target);
    LOCK_HTC_RX(target);

    if (sample) {
        A_ASSERT(pStats != NULL);
            /* return the stats to the caller */
        A_MEMCPY(pStats, &target->EndPoint[Endpoint].EndPointStats, sizeof(HTC_ENDPOINT_STATS));
    }

    if (clearStats) {
            /* reset stats */
        A_MEMZERO(&target->EndPoint[Endpoint].EndPointStats, sizeof(HTC_ENDPOINT_STATS));
    }

    UNLOCK_HTC_RX(target);
    UNLOCK_HTC_TX(target);

    return TRUE;
#else
    return FALSE;
#endif
}
