
#define DBG_DECLARE 4;
#include "../include/ctsystem.h"
 
#include <linux/module.h>
#include <linux/init.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)   
#include <linux/kthread.h>
#endif

#include "../include/sdio_busdriver.h"
#include "../include/sdio_lib.h"
#include "_sdio_lib.h"

#define DESCRIPTION "SDIO Kernel Library"
#define AUTHOR "Atheros Communications, Inc."

CT_DECLARE_MODULE_PARAM_INTEGER(debuglevel);
MODULE_PARM_DESC(debuglevel, "debuglevel 0-7, controls debug prints");


SDIO_STATUS SDLIB_GetMessage(PSDMESSAGE_QUEUE pQueue, PVOID pData, INT *pBufferLength)
{
    return _GetMessage(pQueue,pData,pBufferLength);
}

SDIO_STATUS SDLIB_PostMessage(PSDMESSAGE_QUEUE pQueue, PVOID pMessage, INT MessageLength)
{
    return _PostMessage(pQueue,pMessage,MessageLength);
}

void SDLIB_DeleteMessageQueue(PSDMESSAGE_QUEUE pQueue)
{
    _DeleteMessageQueue(pQueue);
}

PSDMESSAGE_QUEUE SDLIB_CreateMessageQueue(INT MaxMessages, INT MaxMessageLength)
{
    return _CreateMessageQueue(MaxMessages,MaxMessageLength);

}

/*
 * OSDeleteHelper - delete thread created with OSCreateHelper
*/
void SDLIB_OSDeleteHelper(POSKERNEL_HELPER pHelper)
{

#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
    if (pHelper->pTask != NULL) {
#else
    /* 2.4 */
    if (pHelper->pTask >= 0) {
#endif
        pHelper->ShutDown = TRUE;
        SignalSet(&pHelper->WakeSignal);
            /* wait for thread to exit */
        wait_for_completion(&pHelper->Completion);
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
        pHelper->pTask = NULL;
#else
    /* 2.4 */
        pHelper->pTask = 0;
#endif
    }
   SignalDelete(&pHelper->WakeSignal);
}

INT HelperLaunch(PVOID pContext);
/*
 * OSCreateHelper - create a worker kernel thread
*/
SDIO_STATUS SDLIB_OSCreateHelper(POSKERNEL_HELPER pHelper,
                           PHELPER_FUNCTION pFunction,
                           PVOID            pContext)
{
    SDIO_STATUS status = SDIO_STATUS_SUCCESS;

    memset(pHelper,0,sizeof(OSKERNEL_HELPER));

    do {
        pHelper->pContext = pContext;
        pHelper->pHelperFunc = pFunction;
        status = SignalInitialize(&pHelper->WakeSignal);
        if (!SDIO_SUCCESS(status)) {
            break;
        }
        init_completion(&pHelper->Completion);
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
        pHelper->pTask = kthread_create(HelperLaunch,
                                       (PVOID)pHelper,
                                       "SDIO Helper");
        if (NULL == pHelper->pTask) {
            status = SDIO_STATUS_NO_RESOURCES;
            break;
        }
        wake_up_process(pHelper->pTask);
#else
    /* 2.4 */
        pHelper->pTask = kernel_thread(HelperLaunch,
                                       (PVOID)pHelper,
                                       (CLONE_FS | CLONE_FILES | SIGCHLD));
        if (pHelper->pTask < 0) {
            DBG_PRINT(SDDBG_TRACE,
                ("SDIO BusDriver - OSCreateHelper, failed to create thread\n"));
        }
#endif

    } while (FALSE);

    if (!SDIO_SUCCESS(status)) {
        SDLIB_OSDeleteHelper(pHelper);
    }
    return status;
}

/* helper function launcher */
INT HelperLaunch(PVOID pContext)
{
    INT exit;
        /* call function */
    exit = ((POSKERNEL_HELPER)pContext)->pHelperFunc((POSKERNEL_HELPER)pContext);
    complete_and_exit(&((POSKERNEL_HELPER)pContext)->Completion, exit);
    return exit;
}

void SDLIB_PrintBuffer(PUCHAR pBuffer,INT Length,PTEXT pDescription)
{
    _SDLIB_PrintBuffer(pBuffer,Length,pDescription);
}

SDIO_STATUS SDLIB_IssueConfig(PSDDEVICE        pDevice,
                              SDCONFIG_COMMAND Command,
                              PVOID            pData,
                              INT              Length)
{
    return _SDLIB_IssueConfig(pDevice,Command,pData,Length);
}


/*
 * module init
 */
static int __init bub_init_module(void) {
    REL_PRINT(SDDBG_TRACE, ("SDIO Library load\n"));
    return 0;
}

/*
 * module cleanup
 */
static void __exit bub_cleanup_module(void) {
    REL_PRINT(SDDBG_TRACE, ("SDIO Library unload\n"));
}


MODULE_LICENSE("Proprietary");
MODULE_DESCRIPTION(DESCRIPTION);
MODULE_AUTHOR(AUTHOR);
module_init(bub_init_module);
module_exit(bub_cleanup_module);
EXPORT_SYMBOL(SDLIB_IssueConfig);
EXPORT_SYMBOL(SDLIB_PrintBuffer);
EXPORT_SYMBOL(SDLIB_OSCreateHelper);
EXPORT_SYMBOL(SDLIB_OSDeleteHelper);
EXPORT_SYMBOL(SDLIB_CreateMessageQueue);
EXPORT_SYMBOL(SDLIB_DeleteMessageQueue);
EXPORT_SYMBOL(SDLIB_PostMessage);
EXPORT_SYMBOL(SDLIB_GetMessage);
