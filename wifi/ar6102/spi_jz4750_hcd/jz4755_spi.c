
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
#define VERSION	    "2.2.0.78-110104"

/***** jz4755_spi ******/

#if 0

/* rodata *
 98,10 C.249.12358

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
 * 0000002c, 0000000c __func__.12831 ! spi_dma_irq
 * 00000038, 0000000f __func__.12979 ! HW_InOut_Token
 * 00000048, 00000012 __func__.12957 ! HW_SetDebugSignal
 * 0000005c, 00000015 __func__.12951 ! HW_ToggleDebugSignal
 * 00000074, 00000013 __func__.12941 ! HW_StopDMATransfer
 * 00000088, 0000000f __func__.12936 ! HW_PowerUpDown
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
"Colman: Wait for SSI RX FIF0 Timeout!\n"
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
"2.2.0.78-110104"
000000f8 l       .rodata.str1.4 00000000 $LC10
"PIO Mode"  */


#endif

#define SSI_SSIGR		(SSI_BASE + 0x18)

#define REG_SSI_SSIGR		REG16(SSI_SSIGR)

#if 0
static void hcd_iocomplete_wqueue_handler(struct work_struct *p);
static void hcd_procirq_wqueue_handler(struct work_struct *p);
static void hcd_dmacomplete_wqueue_handler(struct work_struct *p);
static void hcd_ssicomplete_wqueue_handler(struct work_struct *p);

static void TimerTimeout(unsigned long);

static irqreturn_t hcd_spi_irq(int irq, void *ctx);
static irqreturn_t spi_dma_irq(int irq, void *dev_id);

static int QueueWork(struct spi_dev *dev, struct work_struct *w);
#endif

SDIO_STATUS SDIO_RegisterHostController(PSDHCD pHcd);
//static const char *bub="sdiobd_spi_raw";

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
#if 0
//extern struct spi_data ar6k_spi;
static struct hcd_context ar6k_spi = {
  .pad0 = 0,
  .pad4 = 0,
  .ub8 = 0,
  .ub9 = 0,
  .ub10 = 0,
  .ub11 = 0,
  .pad12 = 0,
  .uh16 = 0,
  .uh18 = 0,
  .uw20= 0,
  .uh24= 0,
  .uh26= 0,
  .pad28={0,0,0},
  .w40=0,
  .w44=0,
  .ub48=0,
  .ub49=0,
  .pad50=0x1000,
  .pad52={1,0},
  .op_clock = 0x1f78a40,                     // 60,    33MHz
  .pDev = &dev_spi,                          // 64
  .pHcd.Version = 0x27,                      // 68
  .pHcd.pName = (char *)0x1f4,               // 80
  .pHcd.Attributes = SDHCD_ATTRIB_RAW_MODE,  // 84
  .pHcd.MaxBytesPerBlock=0x800,              // 88,    2048
  .pHcd.MaxBlocksPerTrans=0x1,               // 90
  .pHcd.MaxClockRate=0x02dc6c00,             // 96,    48MHz
  .pHcd.pContext = &ar6k_spi,                // 100
  .b248 = 2,
};
#endif

static SDHCD_DEVICE ar6k_spi = {
  .List = {0,0},		// 0-7
  .ShuttingDown = 0,		// 8
  .PollWait = 0,		// 12-15
  .CurrentDMADataMode = 0,	// 16
  .SpiIntEnableShadow = 0,	// 18
  .SpiConfigShadow    = 0,	// 20
//  .CritSection= 0,		// 24
  .ExternalIOPending=0,		// 24
//  .uh26= 0,
  .MaxWriteBufferSpace=0,       // 32
  .PktsInSPIWriteBuffer=0,	// 36
  .pCurrentBuffer=0,		// w40
  .CurrentTransferLength=0,	// w44
  .CurrentTransferDirRx=0,	// ub48
  .CurrentDmaWidth=0,		// ub49
  .MaxBytesPerDMARequest=0x1000, // ul52
//  .PowerUpDelay = 0,			//56
  .OperationalClock = 0x1f78a40,             // 60,    33MHz
  .pHWDevice = &dev_spi,                     // 64
  .Hcd.Version = 0x27,                      // 68
//  .Hcd.pName = (char *)0x1f4,               // 80
  .Hcd.pName = "sdiobd_spi_raw",               // 80
  .Hcd.Attributes = SDHCD_ATTRIB_RAW_MODE,  // 84
  .Hcd.MaxBytesPerBlock=0x800,              // 88,    2048
  .Hcd.MaxBlocksPerTrans=0x1,               // 90
  .Hcd.MaxClockRate=0x02dc6c00,             // 96,    48MHz
  .Hcd.pContext = &ar6k_spi,                // 100
  .SpiHWCapabilitiesFlags = HW_SPI_FRAME_WIDTH_16,
};

#if 0
int get_dma_count(int);
void set_spi_clock(unsigned int *arg);
#endif

static int QueueWork(struct spi_dev *dev, struct work_struct *w) {
	int rc;
	rc=schedule_work(w);
	if (rc>0) {
		return 0;
	}
	return 3;
}

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

static inline void program_dma(unsigned int dma_ch, unsigned int pbuf, int cnt) {
	disable_dma(dma_ch);
	jz_set_dma_src_width(dma_ch,32);
	jz_set_dma_dest_width(dma_ch, 16);
	jz_set_dma_block_size(dma_ch, 16);
	set_dma_mode(dma_ch,1);
	set_dma_addr(dma_ch, pbuf);
	set_dma_count(dma_ch, cnt+15);
}

SDIO_STATUS HW_SpiSetUpDMA(PSDHCD_DEVICE h_ctx) {
	struct spi_dev *spi_dev=h_ctx->pHWDevice;
	unsigned short int *bufp=(unsigned short int *)h_ctx->pCurrentBuffer;
	unsigned int len=h_ctx->CurrentTransferLength;
	unsigned int cnt=get_dma_count(len);

	spi_dev->w124=len-cnt;
	spi_dev->w120=cnt;
	spi_dev->w132=0;
	spi_dev->w128=0;

	if (h_ctx->CurrentDmaWidth!=1) {
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
	if (h_ctx->CurrentTransferDirRx) {
		int txch,rxch;
		unsigned int physbuf;
//1878
		if (spi_dev->RxDmaChannel<0) {
//1aac
			return SDIO_STATUS_PENDING;
		}
//1880

		txch=spi_dev->TxDmaChannel;
		program_dma(txch, 0x10003034, cnt);
#if 0
		txch=spi_dev->TxDmaChannel;
		disable_dma(txch);
		jz_set_dma_src_width(txch,32);
		jz_set_dma_dest_width(txch,16);
		jz_set_dma_block_size(txch, 16);
		set_dma_mode(txch,1);
		set_dma_addr(txch, 0x10003034);
		set_dma_count(txch, cnt+15);
#endif

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
//		int txch;
//		int physbuf;
//19e0
		if (spi_dev->TxDmaChannel>=0) {
//19e8
			memcpy(spi_dev->pDmaDescriptorBuffer, bufp, len);
			dma_cache_wback_inv((int)spi_dev->pDmaDescriptorBuffer, len);
//			txch=spi_dev->TxDmaChannel;
//			physbuf=spi_dev->DmaDescriptorPhys;
			program_dma(spi_dev->TxDmaChannel,spi_dev->DmaDescriptorPhys,cnt);
#if 0
			disable_dma(txch);
			jz_set_dma_src_width(txch,32);
			jz_set_dma_dest_width(txch, 16);
			jz_set_dma_block_size(txch, 16);
			set_dma_mode(txch,1);
			set_dma_addr(txch, physbuf);
			set_dma_count(txch, cnt+15);
#endif
//1aa4
			return SDIO_STATUS_PENDING;
		}
	}
	return SDIO_STATUS_PENDING;
}

int HW_QueueDeferredCompletion(PSDHCD_DEVICE hc) {
	struct spi_dev *spi_dev=hc->pHWDevice;

	QueueWork(spi_dev,&spi_dev->iocomplete_work);
	return 0;
}

void HW_EnableDisableSPIIRQ(PSDHCD_DEVICE hcd_ctx, unsigned char spiirq_enable, unsigned char irqs_enabled) {
	unsigned long int flags=0;
	struct spi_dev *spi_dev=hcd_ctx->pHWDevice;

	if (!irqs_enabled) {
		local_irq_save(flags);
		preempt_disable();
	}

	if (spiirq_enable) {
		if (!spi_dev->ub105) {
			spi_dev->ub105=1;
			enable_irq(194);
		}
	} else {
		if (spi_dev->ub105) {
			spi_dev->ub105=0;
			disable_irq(194);
		}
	}

	if (!irqs_enabled) {
		local_irq_restore(flags);
		preempt_enable();
	}
}

void HW_StartDMA(PSDHCD_DEVICE hcd_ctx) {
//1160
//	volatile int stackData;
	struct spi_dev *spi_dev=hcd_ctx->pHWDevice;
	unsigned short int *buf=(unsigned short int *)hcd_ctx->pCurrentBuffer;
	int len=hcd_ctx->CurrentTransferLength;

//11a0
	while (__ssi_is_busy(0)) {
//11b8
//11c0
		udelay(10);
//11d0
	}

//11d8
	__ssi_flush_rxfifo(0);
	__ssi_flush_txfifo(0);
	__ssi_clear_errors(0);
	__ssi_disable_tx_intr(0);
	__ssi_disable_rx_intr(0);

//1230
	REG_SSI_CR0(0);
	if (hcd_ctx->CurrentTransferDirRx) {
		volatile int stackData;
//1234
//		REG_SSI_CR0(0);
		__ssi_enable_receive(0);
//1248
		if (spi_dev->RxDmaChannel>=0) {
//1250
			if (spi_dev->w120) {
//155c
				enable_dma(spi_dev->RxDmaChannel);
				enable_dma(spi_dev->TxDmaChannel);
				return;
			}
		}
//125c
		stackData=0;
//1260
		while (len>0) {
//1278
//1280
			if (stackData<16) {
//1288
				while(REG_SSI_SR(0)&SSI_SR_TFF);
//129c
				REG_SSI_DR(0)=0xffff;
				len-=2;
				stackData++;
			}
//12b0
//12b8
			if ((REG_SSI_SR(0) & SSI_SR_RFIFONUM_MASK)) {
//12c0
				*buf=REG_SSI_DR(0);
				buf++;
				stackData--;
//12d4
			}
//12d8
		}
//12e0
		while (stackData>0) {
//1300
			int count=30000;
//1304
//1310
			do {
				count--;
//1314
//1318
				if (!count)  {
					printk("Colman: Wait for SSI RX FIF0 Timeout!\n");
				}
			} while (!(REG_SSI_SR(0) & SSI_SR_RFIFONUM_MASK));

//133c
			*buf=REG_SSI_DR(0);
			buf++;
			stackData--;

//1360
		}
//13c8
		while(!__ssi_transfer_end(0));
//13e4
		while(REG_SSI_SR(0) & SSI_SR_TFIFONUM_MASK);
//13f8
		__ssi_clear_underrun(0);
		while(__ssi_is_busy(0)) {
			udelay(10);
		}
	} else {
//		REG_SSI_CR0(0) |= SSI_CR0_DISREV;
//1364
		__ssi_disable_receive(0);
//1378
		if (spi_dev->TxDmaChannel>=0) {
//1380
			if (spi_dev->w120) {
//1530
				enable_dma(spi_dev->TxDmaChannel);
				return;
			}
		}

// 138c
		while (len>0) {
//1390
			while(__ssi_txfifo_full(0));
//13b0
			len-=2;
//13b4
			REG_SSI_DR(0)=*buf;
//13bc
			buf++;
		}
// 1480
		while(!__ssi_transfer_end(0));
// 1494
		while((REG_SSI_SR(0) & SSI_SR_TFIFONUM_MASK));

// 14a8
		__ssi_clear_underrun(0);
// 14b8
		if (__ssi_is_busy(0)) {
//14d4
			do {
//14e0
				udelay(10);
//14f0
			} while(__ssi_is_busy(0));

// 14f8
			spi_dev->w100=0;
// 1524
			QueueWork(spi_dev, &spi_dev->dmacomplete_work);
			return;
		}
	}

//1440
	spi_dev->w100=0;
	QueueWork(spi_dev, &spi_dev->dmacomplete_work);
	return;
}


void HW_PowerUpDown(PVOID pHWDevice, BOOL powerUp) {
	printk("Enter %s,  to be done\n", __FUNCTION__);
}


void HW_StopDMATransfer(PSDHCD_DEVICE hcd_ctx) {
	struct spi_dev *spi_dev=hcd_ctx->pHWDevice;

	printk("Enter %s,  to be done\n", __FUNCTION__);

	disable_dma(spi_dev->TxDmaChannel);
	disable_dma(spi_dev->RxDmaChannel);
}

void HW_ToggleDebugSignal(void) {
	printk("Enter %s, to be done\n", __FUNCTION__);
}

void HW_SetDebugSignal(void) {
	printk("Enter %s, to be done\n", __FUNCTION__);
}

SDIO_STATUS HW_InOut_Token(PSDHCD_DEVICE hcd_ctx,
		unsigned int out_token,
		unsigned char datasize,
		unsigned int *in_token) {
//		BOOL stat_check) {

	unsigned short int itok;
	if (datasize!=ATH_TRANS_DS_16) {
		printk("AR6k only support 16-bit spi transfer\n");
		return SDIO_STATUS_INVALID_PARAMETER;
	}

	while(__ssi_is_busy(0)) {
		udelay(10);
	}
	__ssi_flush_rxfifo(0);
	__ssi_flush_txfifo(0);
	__ssi_clear_errors(0);
	__ssi_disable_tx_intr(0);
	__ssi_disable_rx_intr(0);
	REG_SSI_CR0(0);
	__ssi_enable_receive(0);
	while(__ssi_txfifo_full(0));
	__ssi_transmit_data(0,out_token);
	while(!__ssi_transfer_end(0));
	while(!__ssi_get_rxfifo_count(0));
	itok=__ssi_receive_data(0);
	__ssi_clear_underrun(0);
	while(__ssi_is_busy(0)) {
		udelay(10);
	}

	if (in_token) {
		*in_token=itok;
	}

	if (debuglevel>=8) {
		printk("Colman: %s: OutToken=%X InToken=%X", __FUNCTION__, out_token, itok);
	}

	return SDIO_STATUS_SUCCESS;
}

void HW_UsecDelay(void *a0, unsigned int usec) {
	udelay(usec);
}


void HW_StartTimer(PSDHCD_DEVICE hcd_ctx, int ms, int w28) {
	struct spi_dev *spi_dev=hcd_ctx->pHWDevice;
	unsigned int jiffies_to_tout;

	if (spi_dev->ub24) {
		return;
	}

	jiffies_to_tout=msecs_to_jiffies(ms);
	spi_dev->spi_timer.expires=jiffies+jiffies_to_tout;
	spi_dev->ub24=1;
	spi_dev->w28=w28;
	spi_dev->ub25=0;
	add_timer(&spi_dev->spi_timer);
}
void HW_SetClock(PSDHCD_DEVICE hc, unsigned int *op_clock_ptr ) {
	struct spi_dev *spi_dev=hc->pHWDevice;
	unsigned int op_clock_in=*op_clock_ptr;
	unsigned int op_clock_out;

	set_spi_clock(op_clock_ptr);
	op_clock_out=*op_clock_ptr;
	spi_dev->op_clock_current=op_clock_out;
	printk("AR6k spi clk request = %d Hz, actual = %d Hz\n",
			op_clock_in, op_clock_out);
}

static void hcd_iocomplete_wqueue_handler(struct work_struct *ioc_data) {
	struct spi_dev *sdev =
		container_of(ioc_data, struct spi_dev, iocomplete_work);
	PSDHCD_DEVICE pHcdc=sdev->pHcd_ctx;
	PSDHCD pHcd=&pHcdc->Hcd;
	SDIO_HandleHcdEvent(pHcd, EVENT_HCD_TRANSFER_DONE);
}

static void hcd_procirq_wqueue_handler(struct work_struct *p) {
	struct spi_dev *spi_dev=
		container_of(p, struct spi_dev, procirq_work);
	HcdSpiInterrupt(spi_dev->pHcd_ctx);
}

static void hcd_dmacomplete_wqueue_handler(struct work_struct *p) {
	struct spi_dev *spi_dev=
		container_of(p, struct spi_dev, dmacomplete_work);
	HcdDmaCompletion(spi_dev->pHcd_ctx, spi_dev->w100);
}

static void hcd_ssicomplete_wqueue_handler(struct work_struct *p) {
	struct spi_dev *spi_dev=
		container_of(p, struct spi_dev, ssicomplete_work);
	PSDHCD_DEVICE hcd_ctx=spi_dev->pHcd_ctx;
//9fc
	if (spi_dev->w124) {
		if (hcd_ctx->CurrentTransferDirRx) {
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
			unsigned char *ddbufp=spi_dev->pDmaDescriptorBuffer;
			unsigned short int *p=(unsigned short int *)
						(ddbufp+spi_dev->w120);
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
	if (hcd_ctx->CurrentTransferDirRx) {
		memcpy(hcd_ctx->pCurrentBuffer, spi_dev->pDmaCommonBuffer,hcd_ctx->CurrentTransferLength);
	}
// af8-b18

	spi_dev->w100=0;
	HcdDmaCompletion(spi_dev->pHcd_ctx, 0);
	return;

// b1c
//b1c:;
}
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


static void TimerTimeout(unsigned long arg) {
	struct spi_dev *spi_dev=(struct spi_dev *)arg;

	spi_dev->ub24=0;
	if (spi_dev->ub25==0) {
		HcdTimerCallback(spi_dev->pHcd_ctx, spi_dev->w28);
		return;
	}
	return;
}

static irqreturn_t spi_dma_irq(int irq, void *dev_id) {
	struct spi_dev *spi_dev=(struct spi_dev *)dev_id;
	PSDHCD_DEVICE hcd_ctx=spi_dev->pHcd_ctx;
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
		if (hcd_ctx->CurrentTransferDirRx) {
			return 1;
		}
	}
	QueueWork(spi_dev, &spi_dev->ssicomplete_work);

	return 1;
}

static irqreturn_t hcd_spi_irq(int irq, void *vdev) {
	struct spi_dev *spi_dev=(struct spi_dev *)vdev;

	HW_EnableDisableSPIIRQ(spi_dev->pHcd_ctx,0,1);
	QueueWork(spi_dev, &spi_dev->procirq_work);
	return 1;
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


int stack_force_interrupt(void) {
	int rc;
	g_isforce=1;

	ar6k_spi.Hcd.IrqProcState=0;
	rc=SDIO_HandleHcdEvent(&ar6k_spi.Hcd, EVENT_HCD_SDIO_IRQ_PENDING);
	return rc;
}

int stack_force_interrupt_clear(void) {
	g_isforce=0;
	return 0;
}

int stack_force_interrupt_get(void) {
	return g_isforce;
}

void deinit_hardware(struct spi_dev *spi_dev) {

	if (spi_dev->TxDmaChannel>=0) {
		jz_free_dma(spi_dev->TxDmaChannel);
	}

	if (spi_dev->RxDmaChannel>=0) {
		jz_free_dma(spi_dev->RxDmaChannel);
	}

	if (likely(spi_dev->pDmaDescriptorBuffer!=NULL))
		__free_pages(virt_to_page(spi_dev->pDmaDescriptorBuffer),0);

	if (likely(spi_dev->pDmaCommonBuffer!=NULL))
		__free_pages(virt_to_page(spi_dev->pDmaCommonBuffer),0);

	if (spi_dev->ub104&0x08) {
		free_irq(194,spi_dev);
	}
}


int init_hardware(struct spi_dev *spi_dev) {
	int rc;

	ar6k_spi.OperationalClock=op_clock;
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

	init_timer(&spi_dev->spi_timer);

	spi_dev->ub104|=0x80;

//	__gpio_enable_pull(146);
	spi_dev->spi_timer.function=TimerTimeout;
	spi_dev->spi_timer.data=(unsigned long)spi_dev;
	REG_GPIO_PXPEC(4) = 0x40000;



	rc=request_irq(194, hcd_spi_irq, 0, spi_dev->pHcd_ctx->Hcd.pName, spi_dev);
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

	spi_dev->ub104|=8;
	spi_dev->ub105=0;

	if (dma_mode!=0) {
		void *vaddr;

		vaddr=(void *)__get_free_pages(GFP_KERNEL,0);
		spi_dev->pDmaDescriptorBuffer=vaddr;
		spi_dev->DmaDescriptorPhys=
			virt_to_phys(vaddr);

		vaddr=(void *)__get_free_pages(GFP_KERNEL,0);
		spi_dev->pDmaCommonBuffer=vaddr;
		spi_dev->DmaCommonBufferPhys=
			virt_to_phys(vaddr);

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

void remove_driver(void) {
	struct spi_dev *spi_dev=&dev_spi;

	if (spi_dev->ub104&0x20) {
		SDIO_HandleHcdEvent(&ar6k_spi.Hcd, EVENT_HCD_DETACH);
		flush_scheduled_work();
		SDIO_UnregisterHostController(&ar6k_spi.Hcd);
	}

	if (spi_dev->ub104&0x40) {
		HcdDeinitialize(&ar6k_spi);
	}

	deinit_hardware(ar6k_spi.pHWDevice);
	module_power_off();
}


/*
 * module init
 */
int __init spi_jz4750_init(void) {
	char *dmode;
	SDIO_STATUS rc;
	if (dma_mode) {
		dmode="DMA MODE";
	} else {
		dmode="PIO MODE";
	}

	printk("athspi_jz4755_hcd version: %s, %s\n", VERSION, dmode);

	SDLIST_INIT(&ar6k_spi.Hcd.SDList);

	do {
		rc=init_hardware(ar6k_spi.pHWDevice);
		if (rc<0) break;

		rc=HcdInitialize(&ar6k_spi);
		if (rc<0) break;

		dev_spi.ub104|=0x40;

		rc=SDIO_RegisterHostController(&ar6k_spi.Hcd);
		if (rc<0) break;

		dev_spi.ub104|=0x20;

		SDIO_HandleHcdEvent(&ar6k_spi.Hcd, 1);

		return SDIO_STATUS_SUCCESS;
	} while (0);

	remove_driver();

	return SDIOErrorToOSError(rc);
}

/*
 * module cleanup
 */
void __exit spi_jz4750_cleanup(void) {
	printk("Unload athspi_jz4755_hcd\n");
	remove_driver();
}


void HW_StopTimer(PSDHCD_DEVICE hcd_ctx) {
	struct spi_dev *spi_dev=hcd_ctx->pHWDevice;
	unsigned long int flags;

	local_irq_save(flags);
	preempt_disable();

	if (spi_dev->ub24) {
		spi_dev->ub25=1;
		spi_dev->ub24=0;

		local_irq_restore(flags);
		preempt_enable();

		del_timer(&spi_dev->spi_timer);

		return;
	}
	local_irq_restore(flags);
	preempt_enable();
}


module_exit(spi_jz4750_cleanup);
module_init(spi_jz4750_init);

EXPORT_SYMBOL(stack_force_interrupt);
EXPORT_SYMBOL(stack_force_interrupt_get);
EXPORT_SYMBOL(stack_force_interrupt_clear);

MODULE_AUTHOR(AUTHOR);
MODULE_DESCRIPTION(DESCRIPTION);
MODULE_LICENSE("GPL");
MODULE_VERSION(VERSION);


#if 0
SDIO_STATUS HcdRequest(PSDHCD pHcd) {
}

SDIO_STATUS HcdConfig(PSDHCD pHcd, PSDCONFIG pConfig) {
	SDIO_STATUS status=SDIO_STATUS_SUCCESS;
	PSDHCD_DRIVER_CONTEXT pHct=(PSDHCD_DRIVER_CONTEXT)pHcd->pContext;
	UINT16 command;
}
#endif
