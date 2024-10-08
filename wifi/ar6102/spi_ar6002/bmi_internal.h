//------------------------------------------------------------------------------
// <copyright file="bmi_internal.h" company="Atheros">
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
#ifndef BMI_INTERNAL_H
#define BMI_INTERNAL_H

#include "a_config.h"
#include "athdefs.h"
#include "a_types.h"
#include "a_osapi.h"
#include "a_debug.h"
#include "AR6002/hw2.0/hw/mbox_host_reg.h"
#include "bmi_msg.h"

#define BMI_COMMUNICATION_TIMEOUT       100000

extern unsigned int debughtc;

/* ------ Global Variable Declarations ------- */
A_BOOL bmiDone;

A_STATUS
bmiBufferSend(HIF_DEVICE *device,
              A_UCHAR *buffer,
              A_UINT32 length);

A_STATUS
bmiBufferReceive(HIF_DEVICE *device,
                 A_UCHAR *buffer,
                 A_UINT32 length,
                 A_BOOL want_timeout);

#define _AR_DBG_PRINTX_ARG(arg...) arg

#define ATH_PRINT(lvl, args)\
        { printk(KERN_ALERT _AR_DBG_PRINTX_ARG args);}

#define ATH_ASSERT(test) \
{ \
    if (!(test)) { \
        ATH_PRINT(1, (__FILE__":%d: Assertion "#test" failed!\n",__LINE__)); \
        panic(#test); \
    } \
}

#endif
