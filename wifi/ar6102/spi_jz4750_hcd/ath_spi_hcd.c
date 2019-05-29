#if 0
00001b40 l     F .text  000001e4 DumpRequest
00001d24 l     F .text  00000080 DoPioReadInternal
00001da4 l     F .text  00000080 DoPioWriteInternal
00001eb0 l     F .text  00000064 ResetWriteBufferWaterMark
00001f14 l     F .text  00000028 MaskSPIInterrupts
00001f3c l     F .text  00000020 UnmaskSPIInterrupts
00001f5c l     F .text  00000308 DoDataFrames
00002264 l     F .text  00000270 HcdTransferData
000024d4 l     F .text  00000098 EnableDisableSPIIRQHwDetect
0000256c l     F .text  0000019c DoDMAOp
000000d0 l     O .rodata        0000000e __func__.12686
000000e0 l     O .rodata        00000011 __func__.12239
00000260 l       .rodata.str1.4 00000000 $LC3
"READ"
000002f0 l       .rodata.str1.4 00000000 $LC8
"<1>DMA Request %s , Address : 0x%4.4X"
00000318 l       .rodata.str1.4 00000000 $LC9
"<1>   %d  bytes  buffer:0x%X "
00000338 l       .rodata.str1.4 00000000 $LC10
"<1>************************************************************ "
0000029c l       .rodata.str1.4 00000000 $LC6
"<1>INTERNAL WRITE data: 0x%4.4X  "
00000248 l       .rodata.str1.4 00000000 $LC1
"INTERNAL"
00000270 l       .rodata.str1.4 00000000 $LC5
"<1>PIO Request %s , %s , Address : 0x%4.4X"
00000204 l       .rodata.str1.4 00000000 $LC0
"<1>************************REQUEST DUMP*********************** "
00000254 l       .rodata.str1.4 00000000 $LC2
"EXTERNAL"
00000268 l       .rodata.str1.4 00000000 $LC4
"WRITE"
000002c0 l       .rodata.str1.4 00000000 $LC7
"<1>EXTERNAL Access : %d  bytes  buffer:0x%X "
0000037c l       .rodata.str1.4 00000000 $LC11
"Youli::%s: set starup clock [%d]"
000003a0 l       .rodata.str1.4 00000000 $LC12
"Colman: Re-enable IRQ"
000003b8 l       .rodata.str1.4 00000000 $LC13
"====>call HW_StartDMA: %s: %d"
000003d8 l       .rodata.str1.4 00000000 $LC14
"<1>ATH SPI - ERRORs detected in INTR_CAUSE : 0x%X "
00000448 l       .rodata.str1.4 00000000 $LC17
"<1>ATH SPI - RDBUF ERROR "
0000042c l       .rodata.str1.4 00000000 $LC16
"<1>ATH SPI - WRBUF ERROR "
0000040c l       .rodata.str1.4 00000000 $LC15
"<1>ATH SPI - ADDRESS ERROR "
#endif

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/version.h>
#include <linux/init.h>
#include <linux/workqueue.h>
#include <linux/delay.h>
#include <linux/kthread.h>
#include <asm/jzsoc.h>
#include <asm/processor.h>
#include <linux/dma-mapping.h>

#include "../include/ctsystem.h"
#include "../include/sdio_busdriver.h"
#include "../include/sdio_lib.h"

#include "jz4755_spi.h"
#include "ath_spi_hcd.h"

void DumpRequest(struct hcd_context *hcd_ctx) {
}

void DoPioWriteInternal(struct hcd_context *hcd_ctx, int x, int y);

void EnableDisableSPIIRQHwDetect(struct hcd_context *hcd_ctx, unsigned char  x) {
	if (hcd_ctx->b248<0) {
		if (x) {
			DoPioWriteInternal(hcd_ctx,3328,0);
			HW_EnableDisableSPIIRQ(hcd_ctx,1,0);
			DoPioWriteInternal(hcd_ctx, 3328, hcd_ctx->ub18);
			return;
		}
	}
	HW_EnableDisableSPIIRQ(hcd_ctx,x,0);
}

void EnableDisableSPIIRQHwDetect(struct hcd_context *hcd_ctx, unsigned char  x);
void HW_StartDMA(struct hcd_context *hcd_ctx);

#if 0
static SDIO_STATUS HcdTransferData(struct hcd_context *hcd_ctx, SDREQUEST *pRequest) {
	printk("hejhej");
	return 0;
}
#endif
SDIO_STATUS HcdTransferData(struct hcd_context *hcd_ctx, SDREQUEST *pRequest);

// 2cb8
void HcdDmaCompletion(struct hcd_context *hcd_ctx, SDIO_STATUS status) {
//	SDHCD	  *pHcd=&hcd_ctx->pHcd;
	SDREQUEST *req;
//=hcd_ctx->pHcd.pCurrentRequest;
	int	dodidodi=status;
// 2cd4
	req=hcd_ctx->pHcd.pCurrentRequest;
	if (!req) {
		return;
	}
// 2cdc-2ce8
	local_bh_disable();
// 2cec-2cf4
	inc_preempt_count();
// 2cf8-2d00
//	if (!(read_c0_status()&1)) {
	if (irqs_disabled()) {
// 2da0-2dd0
		printk("Colman: Re-enable IRQ\n");
		local_irq_enable();
	}
// 2d08
	if (!SDIO_SUCCESS(status)) {
	if (req->DataRemaining != 0) {
		status=HcdTransferData(hcd_ctx,req);
	}
	}
// 2d20
	if (status != SDIO_STATUS_PENDING) {
		hcd_ctx->b26=0;
		req->Status=status;
		dodidodi=1;
		EnableDisableSPIIRQHwDetect(hcd_ctx,dodidodi);
	} else {
		printk("====>call HW_StartDMA: %s: %d\n", __FUNCTION__, 377);
		HW_StartDMA(hcd_ctx);
		dodidodi=0;
	}

	local_bh_enable();
	dec_preempt_count();

	if (dodidodi) {
		SDIO_HandleHcdEvent(&hcd_ctx->pHcd,EVENT_HCD_TRANSFER_DONE);
	} 
	return;
}

