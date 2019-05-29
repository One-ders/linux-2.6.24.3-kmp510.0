
#include "../include/ctsystem.h"
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

#include "../include/sdio_busdriver.h"
#include "../include/sdio_lib.h"

#include "jz4755_spi.h"
#include "ath_spi_hcd.h"

#define DESCRIPTION "ar6k/jz4755 spi interface"
#define AUTHOR      "Colman Lai"

/***** jz4755_spi ******/

#if 0

/* rodata *
 98,10 C.249.12358
 48,12 __func__.12957
 5c,15 __func__.12951
 88,0f __func__.12936

*/

/* data *
 * 0c, fc: ar6k_spi
 */

/* func *
 * 3ec, 18:  hcd_iocomplete_wqueue_handler
 */

/* data *
 * 8,4 : op_clock
 */

/*func *
 * 00000bf0, 00000010 hcd_procirq_wqueue_handler
 * 00000bd8, 00000018 hcd_dmacomplete_wqueue_handler
 * 000009e8, 000001f0 hcd_ssicomplete_wqueue_handler
 * 000009c0, 00000028 TimerTimeout
 * 00000fe8, 00000050 hcd_spi_irq
 */

/* data *
 * 00000004, 00000004 dma_mode
 */

/*func *
 * 000007a0, 000001f4 spi_dma_irq
 * 00000770, 00000030 QueueWork
 */

/* rodata *
 * 0000002c, 0000000c __func__.12831
 */

/* bss *
 * 00000004, 00000098 dev_spi
 */

/* exit *
 * 00000000, 00000030 spi_busdriver_cleanup
 */

/* init *
 * 00000000, 00000190 spi_busdriver_init
 */

/* rodata *
 * 00000074, 00000013 __func__.12941
 * 00000038, 0000000f __func__.12979
 */

/* modinfo *
 * 00000000, 00000018 __mod_version1117
 * 00000018, 0000000c __mod_license1115
 * 00000024, 00000026 __mod_description1114
 * 0000004c, 00000012 __mod_author1113
 */

/*
 * 00000000 l     O __ksymtab      00000008 __ksymtab_stack_force_interrupt
00000000 l     O __ksymtab_strings      00000016 __kstrtab_stack_force_interrupt
00000000 l     O __kcrctab      00000004 __kcrctab_stack_force_interrupt
00000008 l     O __ksymtab      00000008 __ksymtab_stack_force_interrupt_get
00000018 l     O __ksymtab_strings      0000001a __kstrtab_stack_force_interrupt
_get
00000004 l     O __kcrctab      00000004 __kcrctab_stack_force_interrupt_get
00000010 l     O __ksymtab      00000008 __ksymtab_stack_force_interrupt_clear
00000034 l     O __ksymtab_strings      0000001c __kstrtab_stack_force_interrupt
_clear
00000008 l     O __kcrctab      00000004 __kcrctab_stack_force_interrupt_clear
00000060 l     O .modinfo       0000001f __mod_dma_mode72
00000080 l     O .modinfo       00000016 __mod_dma_modetype71
00000000 l     O __param        00000014 __param_dma_mode
000000a8 l     O .rodata        00000009 __param_str_dma_mode
00000098 l     O .modinfo       00000026 __mod_op_clock70
000000c0 l     O .modinfo       00000016 __mod_op_clocktype69
00000014 l     O __param        00000014 __param_op_clock
000000b4 l     O .rodata        00000009 __param_str_op_clock
000000d8 l     O .modinfo       00000036 __mod_debuglevel65
00000110 l     O .modinfo       00000018 __mod_debugleveltype64
00000028 l     O __param        00000014 __param_debuglevel
000000c0 l     O .rodata        0000000b __param_str_debuglevel
00000000 l       .rodata.str1.4 00000000 $LC0
"AR6k spi clk request = %d Hz, actual = %d Hz\n"
00000030 l       .rodata.str1.4 00000000 $LC1
"Enter %s, to be done"
00000048 l       .rodata.str1.4 00000000 $LC2
"Enter %s,  to be done"
00000060 l       .rodata.str1.4 00000000 $LC3
"Colman: op_clock= %d"
00000078 l       .rodata.str1.4 00000000 $LC4
"Ar6k SPI DMA TX"
00000088 l       .rodata.str1.4 00000000 $LC5
"Ar6k SPI DMA RX"
00000098 l       .rodata.str1.4 00000000 $LC6
"Ar6k SPI use TX/RX DMA channel: %d/%d"
000000c0 l       .rodata.str1.4 00000000 $LC7
"Colman: %s TC"
00000138 l       .rodata.str1.4 00000000 $LC13
"Colman: Wait for SSI RX FIF0 Timeout!"
00000188 l       .rodata.str1.4 00000000 $LC15
"Colman: %s: OutToken=%X InToken=%X"
00000160 l       .rodata.str1.4 00000000 $LC14
"AR6k only support 16-bit spi transfer"
000001ac l       .rodata.str1.4 00000000 $LC16
"AR6k buffer address misaligned"
000001cc l       .rodata.str1.4 00000000 $LC17
"=========>transfer count too large!!!"
000000d0 l       .rodata.str1.4 00000000 $LC8
"Unload athspi_jz4755_hcd"
000000ec l       .rodata.str1.4 00000000 $LC9
"DMA Mode"
00000104 l       .rodata.str1.4 00000000 $LC11
"athspi_jz4755_hcd version: %s, %s"
00000128 l       .rodata.str1.4 00000000 $LC12
"2.2.0.78-110104.Colman: Wait for SSI RX FIF0 Timeout!"
000000f8 l       .rodata.str1.4 00000000 $LC10
"PIO Mode"  */


#endif

#define SSI_SSIGR		(SSI_BASE + 0x18)

#define REG_SSI_SSIGR		REG16(SSI_SSIGR)

static void hcd_iocomplete_wqueue_handler(struct work_struct *p);
static void hcd_procirq_wqueue_handler(struct work_struct *p);
static void hcd_dmacomplete_wqueue_handler(struct work_struct *p);
static void hcd_ssicomplete_wqueue_handler(struct work_struct *p);

static void TimerTimeout(unsigned long);

static irqreturn_t hcd_spi_irq(int irq, void *ctx);
static irqreturn_t spi_dma_irq(int irq, void *dev_id);

static int QueueWork(struct spi_dev *dev, struct work_struct *w);




/* debug print parameter */ 
int debuglevel = 3;
module_param(debuglevel, int, 0644);
MODULE_PARM_DESC(debuglevel, "debuglevel 0-7, controls debug prints");

static INT op_clock = 0x01f78a40;
module_param(op_clock, int, 0444);
MODULE_PARM_DESC(op_clock, "Operational Clock Hz");

static INT dma_mode = 1;
module_param(dma_mode, int, 0644);
MODULE_PARM_DESC(dma_mode, "0 = PIO, 1 = DMA");



#define MAX_DMA_DESCRIPTORS 64
#define JZ_DESCRIPTOR_BUFFER_SIZE (MAX_DMA_DESCRIPTORS*4)


#define JZ_MAX_BYTES_PER_DESCRIPTOR  8160 /* (8K - FIFO SIZE) */
#define JZ_DMA_COMMON_BUFFER_SIZE   JZ_MAX_BYTES_PER_DESCRIPTOR

//static unsigned int data_d8=0;
static struct spi_dev dev_spi;

unsigned int g_isforce;

//extern struct spi_data ar6k_spi;
static struct hcd_context ar6k_spi = {
  .pad0 = {0,0,0,0},
  .ub16 = 0,
  .ub17 = 0,
  .ub18 = 0,
  .ub19 = 0,
  .pad20= 0,
  .pad24= 0,
  .b26=0,
  .pad27=0,
  .pad28={0,0,0},
  .w40=0,
  .w44=0,
  .b48=0,
  .pad2=0,
  .pad3=0x1000,
  .pad4={1,0},
  .op_clock = 0x1f78a40,                     // 60,    33MHz
  .pDev = &dev_spi,                          // 64
  .pHcd.Version = 0x27,                      // 68
  .pHcd.pName = 0x1f4,                       // 80
  .pHcd.Attributes = SDHCD_ATTRIB_RAW_MODE,  // 84
  .pHcd.MaxBytesPerBlock=0x800,              // 88,    2048
  .pHcd.MaxBlocksPerTrans=0x1,               // 90
  .pHcd.MaxClockRate=0x02dc6c00,             // 96,    48MHz
  .pHcd.pContext = &ar6k_spi,                // 100
  .b248 = 2,
};


void set_spi_clock(unsigned int *arg) {
	unsigned int cpccr=REG_CPM_CPCCR;
	unsigned int div=2;
	unsigned int pllclk;
	unsigned int divisor, hdiv;
	unsigned int v0;

	if (cpccr&CPM_CPCCR_PCS) {
		div=1;
	}

	pllclk=__cpm_get_pllout();

	pllclk=pllclk/div;
	REG_CPM_CLKGR|=CPM_CLKGR_SSI;   // Stop SSI clock
	hdiv=(pllclk/(*arg))>>1;  // *arg default 12000000
				// 378/12 = 31 -> /2 -> 15
	divisor=hdiv<<1;               // v0 = 30
	
	v0=(pllclk/divisor);         // 378/30 = 12
        
	if ((*arg)<v0) {
		hdiv+=1;
	}

	if (hdiv>16) {
		hdiv=16;
	}

	(*arg)=pllclk/(hdiv<<1);

	REG_SSI_SSIGR=0;

	__cpm_set_ssidiv(hdiv-1);

	REG_CPM_CLKGR&=~CPM_CLKGR_SSI;   // Start SSI clock

	return;
}

int get_dma_count(int dmanr) {

	int d=dmanr>>4;
	if (dmanr<33) {
		return 0;
	} else {
		return d<<4;
	}
}

#define __gpio_as_spi()                 \
do {                                            \
	REG_GPIO_PXFUNS(1) = 0x80000000;        \
	REG_GPIO_PXSELC(1) = 0x80000000;        \
	REG_GPIO_PXTRGC(1) = 0x80000000;        \
	REG_GPIO_PXPES(1)  = 0x80000000;        \
        REG_GPIO_PXFUNS(5) = 0x00001c00;        \
        REG_GPIO_PXTRGC(5) = 0x00001c00;        \
        REG_GPIO_PXSELC(5) = 0x00001c00;        \
        REG_GPIO_PXPEC(5)  = 0x00001000;        \
        REG_GPIO_PXPES(5)  = 0x00000c00;        \
} while (0)



void enable_spi_interface(void) {
	__gpio_as_spi();
}

void enable_spi_controller(void) {
	unsigned int clk=0xb71b00;
	
	REG_SSI_CR0(0)=0x46;
	REG_SSI_CR1(0)=0xc01e3;
	REG_SSI_ITR(0)=1;
	REG_SSI_ICR(0)=0;

	set_spi_clock(&clk);

	REG_SSI_CR0(0)=0x80|REG_SSI_CR0(0);
	REG_SSI_CR0(0)=0x8000|REG_SSI_CR0(0);

	return;
}

void module_power_on(void) {
	REG_GPIO_PXDATC(3) = 0x400000;
	REG_GPIO_PXFUNC(3) = 0x400000;
	REG_GPIO_PXSELC(3) = 0x400000;
	REG_GPIO_PXDIRS(3) = 0x400000;
	REG_GPIO_PXPES(3) = 0x400000;
	REG_GPIO_PXDATC(3) = 0x400000;
	return;
}

void module_power_off(void) {
	REG_GPIO_PXDATS(3) = 0x400000;
	REG_GPIO_PXPES(3)  = 0x400000;
	REG_GPIO_PXFUNC(3) = 0x400000;
	REG_GPIO_PXSELC(3) = 0x400000;
	REG_GPIO_PXDIRS(3) = 0x400000;
	REG_GPIO_PXDATS(3) = 0x400000;
	return;
}
int stack_force_interrupt_clear(void) {
	g_isforce=0;
	return 0;
}

int stack_force_interrupt_get(void) {
	return g_isforce;
}

void HW_SetClock(struct hcd_context *hc, unsigned int *op_clock_ptr ) {
	struct spi_dev *spi_dev=hc->pDev;
	unsigned int op_clock_in=*op_clock_ptr;
	unsigned int op_clock_out;

	set_spi_clock(op_clock_ptr);
	op_clock_out=*op_clock_ptr;
	spi_dev->op_clock_current=op_clock_out;
	printk("AR6k spi clk request = %d Hz, actual = %d Hz\n",
			op_clock_in, op_clock_out);
}

void HW_SetDebugSignal(void) {
	printk("Enter %s, to be done\n", __func__);
}

void HW_ToggleDebugSignal(void) {
	printk("Enter %s, to be done\n", __func__);
}

void HW_PowerUpDown(void) {
	printk("Enter %s,  to be done\n", __func__);
}

int stack_force_interrupt(void) {
	int rc;
	g_isforce=1;

	ar6k_spi.pHcd.IrqProcState=0;
	rc=SDIO_HandleHcdEvent(&ar6k_spi.pHcd, EVENT_HCD_SDIO_IRQ_PENDING);
	return rc;
}

static void hcd_iocomplete_wqueue_handler(struct work_struct *ioc_data) {
	struct spi_dev *sdev =
		container_of(ioc_data, struct spi_dev, iocomplete_work);
	struct hcd_context *pHcdc=sdev->pHcd_ctx;
	PSDHCD pHcd=&pHcdc->pHcd;
	SDIO_HandleHcdEvent(pHcd, EVENT_HCD_TRANSFER_DONE);
}

int init_hardware(struct spi_dev *spi_dev) {
	int rc;

	ar6k_spi.op_clock=op_clock;
	printk("Colman: op_clock= %d\n", op_clock);

	spi_dev->pHcd_ctx=&ar6k_spi;
	module_power_off();

	enable_spi_controller();
	enable_spi_interface();

	mdelay(10);

	module_power_on();
	mdelay(100);

	/* init work items */
	INIT_WORK(&(spi_dev->iocomplete_work), hcd_iocomplete_wqueue_handler);
	INIT_WORK(&(spi_dev->procirq_work), hcd_procirq_wqueue_handler);
	INIT_WORK(&(spi_dev->dmacomplete_work), hcd_dmacomplete_wqueue_handler);
	INIT_WORK(&(spi_dev->ssicomplete_work), hcd_ssicomplete_wqueue_handler);

//	setup_timer(&spi_dev->spi_timer, TimerTimeout, (unsigned long)spi_dev);
	
	init_timer(&spi_dev->spi_timer);

	spi_dev->b104|=0x80;

//	__gpio_enable_pull(146);
	spi_dev->spi_timer.function=TimerTimeout;
	spi_dev->spi_timer.data=(unsigned long)spi_dev;
	REG_GPIO_PXPEC(4) = 0x40000;



	rc=request_irq(194, hcd_spi_irq, 0, spi_dev->pHcd_ctx->pHcd.pName, spi_dev);
	if (rc<0) {
		return -1;
	}
	do {
	REG_GPIO_PXIMS(4) = 0x40000;
	REG_GPIO_PXTRGC(4) = 0x40000;
	REG_GPIO_PXFUNC(4) = 0x40000;
	REG_GPIO_PXSELS(4) = 0x40000;
	REG_GPIO_PXDIRC(4) = 0x40000;
	REG_GPIO_PXDATS(4) = 0x40000;
	REG_GPIO_PXIMC(4) = 0x40000;
	} while (0);

	disable_irq(194);

	spi_dev->b104|=8;
	spi_dev->b105=0;

	if (dma_mode!=0) {
		void *b1,*b2;
		b1=__get_free_pages(GFP_KERNEL,0);
		spi_dev->DmaDescriptorPhys=
			virt_to_phys(b1);
		spi_dev->pDmaDescriptorBuffer=b1;

		b2=__get_free_pages(GFP_KERNEL,0);
		spi_dev->DmaCommonBufferPhys=
			virt_to_phys(b2);
		spi_dev->pDmaCommonBuffer=b2;

		spi_dev->TxDmaChannel=
		   jz_request_dma(DMA_ID_SSI0_TX, "Ar6k SPI DMA TX", spi_dma_irq, 0, spi_dev);

		spi_dev->RxDmaChannel=
		   jz_request_dma(DMA_ID_SSI0_RX, "Ar6k SPI DMA RX", spi_dma_irq, 0, spi_dev);

		printk("Ar6k SPI use TX/RX DMA channel: %d/%d\n", 
			spi_dev->TxDmaChannel, spi_dev->RxDmaChannel);

		return 0;
	}
	
	spi_dev->pDmaDescriptorBuffer=0;
	spi_dev->pDmaCommonBuffer=0;
	spi_dev->TxDmaChannel=-1;
	spi_dev->RxDmaChannel=-1;
	return 0;
}

static int QueueWork(struct spi_dev *dev, struct work_struct *w) {
	int rc;
	rc=schedule_work(w);
	if (rc>0) {
		return 0;
	}
	return 3;
}

static irqreturn_t spi_dma_irq(int irq, void *dev_id) {
	struct spi_dev *spi_dev=(struct spi_dev *)dev_id;
	struct hcd_context *hcd_ctx=spi_dev->pHcd_ctx;
	int dma_chan=irq-IRQ_DMA_0;

	if (__dmac_channel_transmit_halt_detected(dma_chan)) {
		__dmac_channel_clear_transmit_halt(dma_chan);
	}

	if (__dmac_channel_address_error_detected(dma_chan)) {
		__dmac_channel_clear_address_error(dma_chan);
	}

	if (__dmac_channel_descriptor_invalid_detected(dma_chan)) {
		__dmac_channel_clear_descriptor_invalid(dma_chan);
	}

	if (__dmac_channel_count_terminated_detected(dma_chan)) {
		__dmac_channel_clear_count_terminated(dma_chan);
		printk("Colman: %s TC\n", __FUNCTION__);
	}

	if (!__dmac_channel_transmit_end_detected(dma_chan)) {
		return 1;
	}

	__dmac_disable_channel(dma_chan);
	__dmac_channel_clear_transmit_end(dma_chan);

	if (dma_chan==spi_dev->TxDmaChannel) {
		spi_dev->w128=1;
	} else if (dma_chan==spi_dev->RxDmaChannel) {
		spi_dev->w132=1;
	}

	if (!spi_dev->w128) {
		return 1;
	}

	if (!spi_dev->w132) {
		if (hcd_ctx->b48) {
			return 1;
		}
	}
	QueueWork(spi_dev, &spi_dev->ssicomplete_work);

	return 1;
}

int HW_QueueDeferredCompletion(struct hcd_context *hc) {
	struct spi_dev *spi_dev=hc->pDev;
	
	QueueWork(spi_dev,&spi_dev->iocomplete_work);
	return 0;
}

static void TimerTimeout(unsigned long arg) {
	struct spi_dev *spi_dev=(struct spi_dev *)arg;

	spi_dev->b24=0;
	if (spi_dev->b25==0) {
		HcdTimerCallback(spi_dev->pHcd_ctx, spi_dev->w28);
		return;
	}
	return;
}

static void hcd_ssicomplete_wqueue_handler(struct work_struct *p) {
	struct spi_dev *spi_dev=
		container_of(p, struct spi_dev, ssicomplete_work);
	struct hcd_context *hcd_ctx=spi_dev->pHcd_ctx;
//9fc
	if (spi_dev->w124) {
		if (hcd_ctx->b48) {
// b1c
			short int *p=(short int *)
				(spi_dev->pDmaCommonBuffer+
				spi_dev->w120);
			int cnt=0;
			while (spi_dev->w124>0) {
// b40
				while(__ssi_txfifo_full(0));
// b50
				__ssi_transmit_data(0,0xffff);
// b5c
				cnt++;
				if (REG_SSI_SR(0) & SSI_SR_RFIFONUM_MASK) {
					*p=__ssi_receive_data(0);
					cnt--;
					p++;
				}
// b74 b78 b80
				spi_dev->w124-=2;
// b7c
			}
//b84
			while(cnt>0) {
//b94-ba0
				while(!(REG_SSI_SR(0) & SSI_SR_RFIFONUM_MASK));
//ba4 bac
				*p=__ssi_receive_data(0);
//ba8
				cnt--;
				p++;
			}
//			if (!__ssi_transfer_end(0)) {
//					break;
//			}
		} else {
			unsigned char *ddbufp;
			ddbufp=spi_dev->pDmaDescriptorBuffer;
			unsigned short int *p=ddbufp+spi_dev->w120;
			while (spi_dev->w124>0) {
				while(__ssi_txfifo_full(0));

				__ssi_transmit_data(0,*p);
				p++;
				spi_dev->w124-=2;
//				if (!spi_dev->w124) {
//					break;
//				}
			}
		}
		
	}
// a58-a6c
	while(!__ssi_transfer_end(0));
// a74-a84
	while(REG_SSI_SR(0) & SSI_SR_TFIFONUM_MASK);
// a88-a8c
	__ssi_clear_underrun(0);

// a90-ad4
	while(__ssi_is_busy(0)) {
		udelay(10);
	}
// ad8-af4
	if (hcd_ctx->b48) {
		memcpy(hcd_ctx->w40, spi_dev->pDmaCommonBuffer,hcd_ctx->w44);
	}
// af8-b18
	
	spi_dev->w100=0;
	HcdDmaCompletion(spi_dev->pHcd_ctx, 0);
	return;
	
// b1c
//b1c:;
}

static void hcd_dmacomplete_wqueue_handler(struct work_struct *p) {
	struct spi_dev *spi_dev=
		container_of(p, struct spi_dev, dmacomplete_work);
	HcdDmaCompletion(spi_dev->pHcd, spi_dev->w100);
}

static void hcd_procirq_wqueue_handler(struct work_struct *p) {
	struct spi_dev *spi_dev=
		container_of(p, struct spi_dev, procirq_work);
	HcdSpiInterrupt(spi_dev->pHcd_ctx);
}

void deinit_hardware(struct spi_dev *spi_dev) {
	if (spi_dev->TxDmaChannel>=0) {
		jz_free_dma(spi_dev->TxDmaChannel);
	}

	if (spi_dev->RxDmaChannel>=0) {
		jz_free_dma(spi_dev->RxDmaChannel);
	}

	if (spi_dev->pDmaDescriptorBuffer) {
		__free_pages(virt_to_page(spi_dev->pDmaDescriptorBuffer),0);
	}

	if (spi_dev->pDmaCommonBuffer) {
		__free_pages(virt_to_page(spi_dev->pDmaCommonBuffer,0);
	}

	if (spi_dev->b104&0x08) {
		free_irq(194,spi_dev);
	}
}

void remove_driver() {
}

void HW_StartTimer(struct hcd_context *hcd_ctx, int ms, int w28) {
}

static void HW_StopDMATransfer(struct hcd_context *hcd_ctx) {
}

void HW_EnableDisableSPIIRQ(struct hcd_context *hcd_ctx, unsigned char a1, unsigned char a2) {
}

static int hcd_spi_irq(int irq, struct spi_dev *spi_dev) {
	return 1;
}

void HW_StopTimer(struct hcd_context *hcd) {
}

void HW_StartDMA(struct hcd_context *hcd) {
}

int HW_InOut_Token(int a0, int a1, int a2, int a3) {
	return 0;
}

void HW_UsecDelay(void *a0, unsigned int usec) {
}

int HW_SpiSetUpDMA(struct hcd_context *hcd_ctx) {
	return 1;
}

/*
 * module cleanup
 */
static void __exit spi_jz4750_cleanup(void) {
	QueueWork(0,0);
}

/*
 * module init
 */
static int __init spi_jz4750_init(void) {
	QueueWork(0,0);
	return 0;
}

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION(DESCRIPTION);
MODULE_AUTHOR(AUTHOR);

module_init(spi_jz4750_init);
module_exit(spi_jz4750_cleanup);
#if 0
SDIO_STATUS HcdRequest(PSDHCD pHcd) {
}

SDIO_STATUS HcdConfig(PSDHCD pHcd, PSDCONFIG pConfig) {
	SDIO_STATUS status=SDIO_STATUS_SUCCESS;
	PSDHCD_DRIVER_CONTEXT pHct=(PSDHCD_DRIVER_CONTEXT)pHcd->pContext;
	UINT16 command;
}
#endif
