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

#define DPRINTK(a...) if (debuglevel>=3) printk(a)


void DumpRequest(struct hcd_context *hcd_ctx) {

	DPRINTK("<1>************************REQUEST DUMP***********************\n");
//1b70
	if (!(hcd_ctx->uh16&0x4)) {   // PIO mode
// 1c70
		DPRINTK("<1>PIO Request %s , %s , Address :  0x%4.4X\n",
				(!(hcd_ctx->uh16&0x10))?"INTERNAL":"EXTERNAL",
				(hcd_ctx->uh16&0x80)?"READ":"WRITE", hcd_ctx->uh24);

		if (!(hcd_ctx->uh16&0x10)) {
			if (!(hcd_ctx->uh16&0x80)) {
//1c60
				DPRINTK("<1>INTERNAL WRITE data:  0x%4.4X\n", hcd_ctx->uw20);
			}
		} else {
			DPRINTK("<1>EXTERNAL Access : %d bytes buffer:0x%X\n", hcd_ctx->uh26, hcd_ctx->w44);
		}
	} else {
//1bb0
		DPRINTK("<1>DMA Request %s , Address : 0x%4.4X\n", (hcd_ctx->uh16&0x80)?"READ":"WRITE", hcd_ctx->uh24);

//1c00
		DPRINTK("<1>   %d  bytes  buffer:0x%X\n", hcd_ctx->uh26, hcd_ctx->w44);
	}

	DPRINTK("<1>************************************************************\n");
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
		hcd_ctx->uh26=0;
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

#if 0
int get_dma_count(int dmanr);

SDIO_STATUS HW_SpiSetUpDMA(struct hcd_context *hcd_ctx) {
	struct spi_dev *spi_dev=hcd_ctx->pDev;
	unsigned short int *bufp=hcd_ctx->w40;
	unsigned int len=hcd_ctx->w44;
	unsigned int cnt=get_dma_count(len);

	spi_dev->w124=len-cnt;
	spi_dev->w120=cnt;
	spi_dev->w132=0;
	spi_dev->w128=0;

	if (hcd_ctx->ub49!=1) {
//1808
		printk("AR6k only support 16-bit spi transfer\n");
		return SDIO_STATUS_INVALID_PARAMETER;
	}
//1850

	if (((unsigned int)bufp)&1) {
//1adc
		printk("AR6k buffer address misaligned");
		return SDIO_STATUS_INVALID_PARAMETER;
	}
//185c
	if (len>4096) {
//1b2c
		panic("=========>transfer count too large!!!\n");
	}

//1864
	if (cnt==0) {
//1aac
		return SDIO_STATUS_PENDING;
	}
//186c
	if (hcd_ctx->ub48) {
		int txch,rxch;
		unsigned int physbuf;
//1878
		if (spi_dev->RxDmaChannel<0) {
//1aac
			return SDIO_STATUS_PENDING;
		}
//1880
		txch=spi_dev->TxDmaChannel;
		disable_dma(txch);
		jz_set_dma_src_width(txch,32);
		jz_set_dma_dest_width(txch,16);
		jz_set_dma_block_size(txch, 16);
		set_dma_mode(txch,1);
		set_dma_addr(txch, 0x10003034);
		set_dma_count(txch, cnt+15);

//1914
//1b24
//191c
		REG_DMAC_DCMD(txch)&=(~DMAC_DCMD_SAI);
		REG_RTC_HSPR=-1;
		dma_cache_wback_inv((int)spi_dev->pDmaCommonBuffer, len);

		rxch=spi_dev->RxDmaChannel;
		physbuf=spi_dev->DmaCommonBufferPhys;
		disable_dma(rxch);
		jz_set_dma_src_width(rxch,16);
		jz_set_dma_dest_width(rxch,32);
		jz_set_dma_block_size(rxch,16);
		set_dma_mode(rxch,0),
		set_dma_addr(rxch, physbuf);
		set_dma_count(rxch, cnt+15);
	} else {
		int txch;
		int physbuf;
//19e0
		if (spi_dev->TxDmaChannel>=0) {
//19e8
			memcpy(spi_dev->pDmaDescriptorBuffer, bufp, len);
			dma_cache_wback_inv((int)spi_dev->pDmaDescriptorBuffer, len);
			txch=spi_dev->TxDmaChannel;
			physbuf=spi_dev->DmaDescriptorPhys;
			disable_dma(txch);
			jz_set_dma_src_width(txch,32);
			jz_set_dma_dest_width(txch, 16);
			jz_set_dma_block_size(txch, 16);
			set_dma_mode(txch,1);
			set_dma_addr(txch, physbuf);
			set_dma_count(txch, cnt+15);
//1aa4
			return SDIO_STATUS_PENDING;
		}
	}
	return SDIO_STATUS_PENDING;
}
#endif
