//------------------------------------------------------------------------------
// <copyright file="bmi.c" company="Atheros">
//    Copyright (c) 2004-2008 Atheros Corporation.  All rights reserved.
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
//
// Author(s): ="Atheros"
//==============================================================================

#include "hif.h"
#include "bmi_incl/bmi.h"
#include "htc_api.h"
#include "bmi_internal.h"
#include "AR6002/hw2.0/hw/mbox_host_reg.h"
#define __FILE__ "./app1/colman2/ar6k/AR6102-2.2.0.78/AR6kSDK.build_sw.78/host/os/linux/../../bmi/src/bmi.c"
/*
Although we had envisioned BMI to run on top of HTC, this is not how the
final implementation ended up. On the Target side, BMI is a part of the BSP
and does not use the HTC protocol nor even DMA -- it is intentionally kept
very simple.
*/



static A_BOOL pendingEventsFuncCheck = FALSE;



/* APIs visible to the driver */
void
BMIInit(void)
{
    bmiDone = FALSE;
    pendingEventsFuncCheck = FALSE;
}

A_STATUS
BMIDone(HIF_DEVICE *device)
{
    A_STATUS status;
    A_UINT32 cid;

    if (bmiDone) {
        AR_DEBUG_PRINTF (ATH_DEBUG_BMI, ("BMIDone skipped\n"));
        return A_OK;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Done: Enter (device: 0x%p)\n", device));
    bmiDone = TRUE;
    cid = BMI_DONE;

    status = bmiBufferSend(device, (A_UCHAR *)&cid, sizeof(cid));
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }
    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Done: Exit\n"));

    return A_OK;
}

A_STATUS
BMIGetTargetInfo(HIF_DEVICE *device, struct bmi_target_info *targ_info)
{
    A_STATUS status;
    A_UINT32 cid;

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Get Target Info: Enter (device: 0x%p)\n", device));
    cid = BMI_GET_TARGET_INFO;

    status = bmiBufferSend(device, (A_UCHAR *)&cid, sizeof(cid));
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    status = bmiBufferReceive(device, (A_UCHAR *)&targ_info->target_ver,
                                                sizeof(targ_info->target_ver), TRUE);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read Target Version from the device\n"));
        return A_ERROR;
    }

    if (targ_info->target_ver == TARGET_VERSION_SENTINAL) {
        /* Determine how many bytes are in the Target's targ_info */
        status = bmiBufferReceive(device, (A_UCHAR *)&targ_info->target_info_byte_count,
                                            sizeof(targ_info->target_info_byte_count), TRUE);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read Target Info Byte Count from the device\n"));
            return A_ERROR;
        }

        /*
         * The Target's targ_info doesn't match the Host's targ_info.
         * We need to do some backwards compatibility work to make this OK.
         */
        ATH_ASSERT(targ_info->target_info_byte_count == sizeof(*targ_info));

        /* Read the remainder of the targ_info */
        status = bmiBufferReceive(device,
                        ((A_UCHAR *)targ_info)+sizeof(targ_info->target_info_byte_count),
                        sizeof(*targ_info)-sizeof(targ_info->target_info_byte_count), TRUE);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read Target Info (%d bytes) from the device\n",
                        					targ_info->target_info_byte_count));
            return A_ERROR;
        }
    } else {
        /*
         * Target must be an AR6001 whose firmware does not
         * support BMI_GET_TARGET_INFO.  Construct the data
         * that it would have sent.
         */
        targ_info->target_info_byte_count=sizeof(*targ_info);
        targ_info->target_type=TARGET_TYPE_AR6001;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Get Target Info: Exit (ver: 0x%x type: 0x%x)\n",
        							targ_info->target_ver, targ_info->target_type));

    return A_OK;
}

A_STATUS
BMIReadMemory(HIF_DEVICE *device,
              A_UINT32 address,
              A_UCHAR *buffer,
              A_UINT32 length)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    A_UINT32 remaining, rxlen;
    static A_UCHAR data[BMI_DATASZ_MAX + sizeof(cid) + sizeof(address) + sizeof(length)];
    memset (&data, 0, BMI_DATASZ_MAX + sizeof(cid) + sizeof(address) + sizeof(length));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
       			("BMI Read Memory: Enter (device: 0x%p, address: 0x%x, length: %d)\n",
        			device, address, length));

    cid = BMI_READ_MEMORY;

    remaining = length;

    while (remaining)
    {
        rxlen = (remaining < BMI_DATASZ_MAX) ? remaining : BMI_DATASZ_MAX;
        offset = 0;
        A_MEMCPY(&data[offset], &cid, sizeof(cid));
        offset += sizeof(cid);
        A_MEMCPY(&data[offset], &address, sizeof(address));
        offset += sizeof(address);
        A_MEMCPY(&data[offset], &rxlen, sizeof(rxlen));
        offset += sizeof(length);

        status = bmiBufferSend(device, data, offset);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
            return A_ERROR;
        }
        status = bmiBufferReceive(device, data, rxlen, TRUE);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read from the device\n"));
            return A_ERROR;
        }
        A_MEMCPY(&buffer[length - remaining], data, rxlen);
        remaining -= rxlen; address += rxlen;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Read Memory: Exit\n"));
    return A_OK;
}

A_STATUS
BMIWriteMemory(HIF_DEVICE *device,
               A_UINT32 address,
               A_UCHAR *buffer,
               A_UINT32 length)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    A_UINT32 remaining, txlen;
    const A_UINT32 header = sizeof(cid) + sizeof(address) + sizeof(length);
    static A_UCHAR data[BMI_DATASZ_MAX + sizeof(cid) + sizeof(address) + sizeof(length)];
	memset (&data, 0, BMI_DATASZ_MAX+header);

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
         ("BMI Write Memory: Enter (device: 0x%p, address: 0x%x, length: %d)\n",
         device, address, length));

    cid = BMI_WRITE_MEMORY;

    remaining = length;
    while (remaining)
    {
        txlen = (remaining < (BMI_DATASZ_MAX - header)) ?
                                       remaining : (BMI_DATASZ_MAX - header);
        offset = 0;
        A_MEMCPY(&data[offset], &cid, sizeof(cid));
        offset += sizeof(cid);
        A_MEMCPY(&data[offset], &address, sizeof(address));
        offset += sizeof(address);
        A_MEMCPY(&data[offset], &txlen, sizeof(txlen));
        offset += sizeof(txlen);
        A_MEMCPY(&data[offset], &buffer[length - remaining], txlen);
        offset += txlen;
        status = bmiBufferSend(device, data, offset);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
            return A_ERROR;
        }
        remaining -= txlen; address += txlen;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Write Memory: Exit\n"));

    return A_OK;
}

A_STATUS
BMIExecute(HIF_DEVICE *device,
           A_UINT32 address,
           A_UINT32 *param)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(address) + sizeof(*param)];
    memset (&data, 0, sizeof(cid) + sizeof(address) + sizeof(*param));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
       ("BMI Execute: Enter (device: 0x%p, address: 0x%x, param: %d)\n",
        device, address, *param));

    cid = BMI_EXECUTE;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &address, sizeof(address));
    offset += sizeof(address);
    A_MEMCPY(&data[offset], param, sizeof(*param));
    offset += sizeof(*param);
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    status = bmiBufferReceive(device, data, sizeof(*param), FALSE);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read from the device\n"));
        return A_ERROR;
    }

    A_MEMCPY(param, data, sizeof(*param));

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Execute: Exit (param: %d)\n", *param));
    return A_OK;
}

A_STATUS
BMISetAppStart(HIF_DEVICE *device,
               A_UINT32 address)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(address)];
    memset (&data, 0, sizeof(cid) + sizeof(address));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
       ("BMI Set App Start: Enter (device: 0x%p, address: 0x%x)\n",
        device, address));

    cid = BMI_SET_APP_START;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &address, sizeof(address));
    offset += sizeof(address);
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Set App Start: Exit\n"));
    return A_OK;
}

A_STATUS
BMIReadSOCRegister(HIF_DEVICE *device,
                   A_UINT32 address,
                   A_UINT32 *param)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(address)];
    memset (&data, 0, sizeof(cid) + sizeof(address));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
       ("BMI Read SOC Register: Enter (device: 0x%p, address: 0x%x)\n",
       device, address));

    cid = BMI_READ_SOC_REGISTER;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &address, sizeof(address));
    offset += sizeof(address);

    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    status = bmiBufferReceive(device, data, sizeof(*param), TRUE);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read from the device\n"));
        return A_ERROR;
    }
    A_MEMCPY(param, data, sizeof(*param));

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Read SOC Register: Exit (value: %d)\n", *param));
    return A_OK;
}

A_STATUS
BMIWriteSOCRegister(HIF_DEVICE *device,
                    A_UINT32 address,
                    A_UINT32 param)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(address) + sizeof(param)];

    memset (&data, 0, sizeof(cid) + sizeof(address) + sizeof(param));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
     ("BMI Write SOC Register: Enter (device: 0x%p, address: 0x%x, param: %d)\n",
     device, address, param));

    cid = BMI_WRITE_SOC_REGISTER;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &address, sizeof(address));
    offset += sizeof(address);
    A_MEMCPY(&data[offset], &param, sizeof(param));
    offset += sizeof(param);
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Read SOC Register: Exit\n"));
    return A_OK;
}

A_STATUS
BMIrompatchInstall(HIF_DEVICE *device,
                   A_UINT32 ROM_addr,
                   A_UINT32 RAM_addr,
                   A_UINT32 nbytes,
                   A_UINT32 do_activate,
                   A_UINT32 *rompatch_id)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(ROM_addr) + sizeof(RAM_addr) +
                                sizeof(nbytes) + sizeof(do_activate)];

	memset (&data, 0, sizeof(cid) + sizeof(ROM_addr) + sizeof(RAM_addr) +
                      sizeof(nbytes) + sizeof(do_activate));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
         ("BMI rompatch Install: Enter (device: 0x%p, ROMaddr: 0x%x, RAMaddr: 0x%x length: %d activate: %d)\n",
         device, ROM_addr, RAM_addr, nbytes, do_activate));

    cid = BMI_ROMPATCH_INSTALL;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &ROM_addr, sizeof(ROM_addr));
    offset += sizeof(ROM_addr);
    A_MEMCPY(&data[offset], &RAM_addr, sizeof(RAM_addr));
    offset += sizeof(RAM_addr);
    A_MEMCPY(&data[offset], &nbytes, sizeof(nbytes));
    offset += sizeof(nbytes);
    A_MEMCPY(&data[offset], &do_activate, sizeof(do_activate));
    offset += sizeof(do_activate);
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    status = bmiBufferReceive(device, (A_UCHAR *)rompatch_id, sizeof(*rompatch_id), TRUE);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read from the device\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI rompatch Install: (rompatch_id=%d)\n", *rompatch_id));
    return A_OK;
}

A_STATUS
BMIrompatchUninstall(HIF_DEVICE *device,
                     A_UINT32 rompatch_id)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(rompatch_id)];
    memset (&data, 0, sizeof(cid) + sizeof(rompatch_id));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
         ("BMI rompatch Uninstall: Enter (device: 0x%p, rompatch_id: %d)\n",
         								 device, rompatch_id));

    cid = BMI_ROMPATCH_UNINSTALL;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &rompatch_id, sizeof(rompatch_id));
    offset += sizeof(rompatch_id);
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI rompatch UNinstall: (rompatch_id=0x%x)\n", rompatch_id));
    return A_OK;
}

static A_STATUS
_BMIrompatchChangeActivation(HIF_DEVICE *device,
                             A_UINT32 rompatch_count,
                             A_UINT32 *rompatch_list,
                             A_UINT32 do_activate)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[BMI_DATASZ_MAX + sizeof(cid) + sizeof(rompatch_count)];
    A_UINT32 length;

	memset (&data, 0, BMI_DATASZ_MAX + sizeof(cid) + sizeof(rompatch_count));

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
         ("BMI Change rompatch Activation: Enter (device: 0x%p, count: %d)\n",
           device, rompatch_count));

    cid = do_activate ? BMI_ROMPATCH_ACTIVATE : BMI_ROMPATCH_DEACTIVATE;

    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &rompatch_count, sizeof(rompatch_count));
    offset += sizeof(rompatch_count);
    length = rompatch_count * sizeof(*rompatch_list);
    A_MEMCPY(&data[offset], rompatch_list, length);
    offset += length;
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Change rompatch Activation: Exit\n"));

    return A_OK;
}

A_STATUS
BMIrompatchActivate(HIF_DEVICE *device,
                    A_UINT32 rompatch_count,
                    A_UINT32 *rompatch_list)
{
    return _BMIrompatchChangeActivation(device, rompatch_count, rompatch_list, 1);
}

A_STATUS
BMIrompatchDeactivate(HIF_DEVICE *device,
                      A_UINT32 rompatch_count,
                      A_UINT32 *rompatch_list)
{
    return _BMIrompatchChangeActivation(device, rompatch_count, rompatch_list, 0);
}

A_STATUS
BMILZData(HIF_DEVICE *device,
          A_UCHAR *buffer,
          A_UINT32 length)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    A_UINT32 remaining, txlen;
    const A_UINT32 header = sizeof(cid) + sizeof(length);
    static A_UCHAR data[BMI_DATASZ_MAX + sizeof(cid) + sizeof(length)];

    memset (&data, 0, BMI_DATASZ_MAX+header);

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
         ("BMI Send LZ Data: Enter (device: 0x%p, length: %d)\n",
         device, length));

    cid = BMI_LZ_DATA;

    remaining = length;
    while (remaining)
    {
        txlen = (remaining < (BMI_DATASZ_MAX - header)) ?
                                       remaining : (BMI_DATASZ_MAX - header);
        offset = 0;
        A_MEMCPY(&data[offset], &cid, sizeof(cid));
        offset += sizeof(cid);
        A_MEMCPY(&data[offset], &txlen, sizeof(txlen));
        offset += sizeof(txlen);
        A_MEMCPY(&data[offset], &buffer[length - remaining], txlen);
        offset += txlen;
        status = bmiBufferSend(device, data, offset);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to write to the device\n"));
            return A_ERROR;
        }
        remaining -= txlen;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI LZ Data: Exit\n"));

    return A_OK;
}

A_STATUS
BMILZStreamStart(HIF_DEVICE *device,
                 A_UINT32 address)
{
    A_UINT32 cid;
    A_STATUS status;
    A_UINT32 offset;
    static A_UCHAR data[sizeof(cid) + sizeof(address)];

    if (bmiDone) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Command disallowed\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI,
         ("BMI LZ Stream Start: Enter (device: 0x%p, address: 0x%x)\n",
         device, address));

    cid = BMI_LZ_STREAM_START;
    offset = 0;
    A_MEMCPY(&data[offset], &cid, sizeof(cid));
    offset += sizeof(cid);
    A_MEMCPY(&data[offset], &address, sizeof(address));
    offset += sizeof(address);
    status = bmiBufferSend(device, data, offset);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to Start LZ Stream to the device\n"));
        return A_ERROR;
    }

    AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI LZ Stream Start: Exit\n"));

    return A_OK;
}

/* BMI Access routines */
A_STATUS
bmiBufferSend(HIF_DEVICE *device,
              A_UCHAR *buffer,
              A_UINT32 length)
{
    A_STATUS status;
    A_UINT32 timeout;
    A_UINT32 address;
    static A_UINT32 cmdCredits;
    A_UINT32 mboxAddress[HTC_MAILBOX_NUM_MAX];

    HIFConfigureDevice(device, HIF_DEVICE_GET_MBOX_ADDR,
                       &mboxAddress[0], sizeof(mboxAddress));

    cmdCredits = 0;
    timeout = BMI_COMMUNICATION_TIMEOUT;

    while(timeout-- && !cmdCredits) {
        /* Read the counter register to get the command credits */
        address = COUNT_DEC_ADDRESS + (HTC_MAILBOX_NUM_MAX + ENDPOINT1) * 4;
        /* hit the credit counter with a 4-byte access, the first byte read will hit the counter and cause
         * a decrement, while the remaining 3 bytes has no effect.  The rationale behind this is to
         * make all HIF accesses 4-byte aligned */
        status = HIFReadWrite(device, address, (A_UINT8 *)&cmdCredits, 4,
            HIF_RD_SYNC_BYTE_INC, NULL);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("%s, Unable to decrement the command credit count register\n",__FUNCTION__));
            return A_ERROR;
        }
        /* the counter is only 8=bits, ignore anything in the upper 3 bytes */
        cmdCredits &= 0xFF;
    }

    if (cmdCredits) {
        address = mboxAddress[ENDPOINT1];
        status = HIFReadWrite(device, address, buffer, length,
            HIF_WR_SYNC_BYTE_INC, NULL);
        if (status != A_OK) {
            AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to send the BMI data to the device\n"));
            return A_ERROR;
        }
    } else {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("BMI Communication timeout - bmiBufferSend\n"));
        return A_ERROR;
    }

    return status;
}

A_STATUS
bmiBufferReceive(HIF_DEVICE *device,
                 A_UCHAR *buffer,
                 A_UINT32 length,
                 A_BOOL want_timeout)
{
    A_STATUS status;
    A_UINT32 address;
    A_UINT32 mboxAddress[HTC_MAILBOX_NUM_MAX];
    HIF_PENDING_EVENTS_INFO     hifPendingEvents;
    static HIF_PENDING_EVENTS_FUNC getPendingEventsFunc = NULL;

    if (!pendingEventsFuncCheck) {
            /* see if the HIF layer implements an alternative function to get pending events
             * do this only once! */
        HIFConfigureDevice(device,
                           HIF_DEVICE_GET_PENDING_EVENTS_FUNC,
                           &getPendingEventsFunc,
                           sizeof(getPendingEventsFunc));
        pendingEventsFuncCheck = TRUE;
    }

    HIFConfigureDevice(device, HIF_DEVICE_GET_MBOX_ADDR,
                       &mboxAddress[0], sizeof(mboxAddress));

    /*
     * During normal bootup, small reads may be required.
     * Rather than issue an HIF Read and then wait as the Target
     * adds successive bytes to the FIFO, we wait here until
     * we know that response data is available.
     *
     * This allows us to cleanly timeout on an unexpected
     * Target failure rather than risk problems at the HIF level.  In
     * particular, this avoids SDIO timeouts and possibly garbage
     * data on some host controllers.  And on an interconnect
     * such as Compact Flash (as well as some SDIO masters) which
     * does not provide any indication on data timeout, it avoids
     * a potential hang or garbage response.
     *
     * Synchronization is more difficult for reads larger than the
     * size of the MBOX FIFO (128B), because the Target is unable
     * to push the 129th byte of data until AFTER the Host posts an
     * HIF Read and removes some FIFO data.  So for large reads the
     * Host proceeds to post an HIF Read BEFORE all the data is
     * actually available to read.  Fortunately, large BMI reads do
     * not occur in practice -- they're supported for debug/development.
     *
     * So Host/Target BMI synchronization is divided into these cases:
     *  CASE 1: length < 4
     *        Should not happen
     *
     *  CASE 2: 4 <= length <= 128
     *        Wait for first 4 bytes to be in FIFO
     *        If CONSERVATIVE_BMI_READ is enabled, also wait for
     *        a BMI command credit, which indicates that the ENTIRE
     *        response is available in the the FIFO
     *
     *  CASE 3: length > 128
     *        Wait for the first 4 bytes to be in FIFO
     *
     * For most uses, a small timeout should be sufficient and we will
     * usually see a response quickly; but there may be some unusual
     * (debug) cases of BMI_EXECUTE where we want an larger timeout.
     * For now, we use an unbounded busy loop while waiting for
     * BMI_EXECUTE.
     *
     * If BMI_EXECUTE ever needs to support longer-latency execution,
     * especially in production, this code needs to be enhanced to sleep
     * and yield.  Also note that BMI_COMMUNICATION_TIMEOUT is currently
     * a function of Host processor speed.
     */
    if (length >= 4) { /* NB: Currently, always true */
        /*
         * NB: word_available is declared static for esoteric reasons
         * having to do with protection on some OSes.
         */
        static A_UINT32 word_available;
        A_UINT32 timeout;

        word_available = 0;
        timeout = BMI_COMMUNICATION_TIMEOUT;
        while((!want_timeout || timeout--) && !word_available) {

            if (getPendingEventsFunc != NULL) {
                status = getPendingEventsFunc(device,
                                              &hifPendingEvents,
                                              NULL);
                if (status != A_OK) {
                    AR_DEBUG_PRINTF(ATH_DEBUG_ERR,("BMI: Failed to get pending events \n"));
                    break;
                }

                if (hifPendingEvents.AvailableRecvBytes >= sizeof(A_UINT32)) {
                    word_available = 1;
                }
                continue;
            }

            status = HIFReadWrite(device, RX_LOOKAHEAD_VALID_ADDRESS, (A_UINT8 *)&word_available,
                sizeof(word_available), HIF_RD_SYNC_BYTE_INC, NULL);
            if (status != A_OK) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read RX_LOOKAHEAD_VALID register\n"));
                return A_ERROR;
            }
            /* We did a 4-byte read to the same register; all we really want is one bit */
            word_available &= (1 << ENDPOINT1);
        }

        if (!word_available) {
            AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Communication timeout - bmiBufferReceive FIFO empty\n"));
            return A_ERROR;
        }
    }

#define CONSERVATIVE_BMI_READ 0
#if CONSERVATIVE_BMI_READ
    /*
     * This is an extra-conservative CREDIT check.  It guarantees
     * that ALL data is available in the FIFO before we start to
     * read from the interconnect.
     *
     * This credit check is useless when firmware chooses to
     * allow multiple outstanding BMI Command Credits, since the next
     * credit will already be present.  To restrict the Target to one
     * BMI Command Credit, see HI_OPTION_BMI_CRED_LIMIT.
     *
     * And for large reads (when HI_OPTION_BMI_CRED_LIMIT is set)
     * we cannot wait for the next credit because the Target's FIFO
     * will not hold the entire response.  So we need the Host to
     * start to empty the FIFO sooner.  (And again, large reads are
     * not used in practice; they are for debug/development only.)
     *
     * For a more conservative Host implementation (which would be
     * safer for a Compact Flash interconnect):
     *   Set CONSERVATIVE_BMI_READ (above) to 1
     *   Set HI_OPTION_BMI_CRED_LIMIT and
     *   reduce BMI_DATASZ_MAX to 32 or 64
     */
    if ((length > 4) && (length < 128)) { /* check against MBOX FIFO size */
        /*
         * NB: cmdCredits is declared static for esoteric reasons
         * having to do with protection on some OSes.
         */
        static A_UINT32 cmdCredits;
        A_UINT32 timeout;

        cmdCredits = 0;
        timeout = BMI_COMMUNICATION_TIMEOUT;
        while((!want_timeout || timeout--) && !cmdCredits) {
            /* Read the counter register to get the command credits */
            address = COUNT_ADDRESS + (HTC_MAILBOX_NUM_MAX + ENDPOINT1) * 1;
            /* read the counter using a 4-byte read.  Since the counter is NOT auto-decrementing,
             * we can read this counter multiple times using a non-incrementing address mode.
             * The rationale here is to make all HIF accesses a multiple of 4 bytes */
            status = HIFReadWrite(device, address, (A_UINT8 *)&cmdCredits, sizeof(cmdCredits),
                HIF_RD_SYNC_BYTE_FIX, NULL);
            if (status != A_OK) {
                AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read the command credit count register\n"));
                return A_ERROR;
            }
                /* we did a 4-byte read to the same count register so mask off upper bytes */
            cmdCredits &= 0xFF;
        }

        if (!cmdCredits) {
            AR_DEBUG_PRINTF(ATH_DEBUG_BMI, ("BMI Communication timeout- bmiBufferReceive no credit\n"));
            return A_ERROR;
        }
    }
#endif

    address = mboxAddress[ENDPOINT1];
    status = HIFReadWrite(device, address, buffer, length, HIF_RD_SYNC_BYTE_INC, NULL);
    if (status != A_OK) {
        AR_DEBUG_PRINTF(ATH_DEBUG_ERR, ("Unable to read the BMI data from the device\n"));
        return A_ERROR;
    }

    return A_OK;
}
