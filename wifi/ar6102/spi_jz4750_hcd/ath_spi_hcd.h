
#define EXTERNAL_ACCESS_DONE_RETRY_COUNT 3
#define ATH_SPI_BYTES_AVAIL_POLL_RETRY_LIMIT 100

    /* bus request flags */
#define ATH_TRANS_DS_8       0x00
#define ATH_TRANS_DS_16      0x01
#define ATH_TRANS_DS_24      0x02   /* 24 bit transfer, for HCD internal use only! */
#define ATH_TRANS_DS_32      0x03
#define ATH_TRANS_DS_MASK    0x03
#define ATH_TRANS_DMA        0x04
#define ATH_TRANS_TYPE_MASK  0x07
#define ATH_TRANS_DMA_PSEUDO 0x08
    /* register address is internal or external */
#define ATH_TRANS_INT_ADDR   0x00
#define ATH_TRANS_EXT_ADDR   0x10
    /* DMA to fixed or incrementing address */
#define ATH_TRANS_DMA_ADDR_INC     0x00
#define ATH_TRANS_DMA_ADDR_FIXED   0x20
    /* read the status after PIO read/write operation */
#define ATH_TRANS_GET_STATUS 0x40
    /* direction of operation */
#define ATH_TRANS_READ       0x80
#define ATH_TRANS_WRITE      0x00

    /* function driver IRQ sources */
#define ATH_SPI_FUNC_DRIVER_IRQ_SOURCES (ATH_SPI_INTR_CPU_INTR | \
                                         ATH_SPI_INTR_PKT_AVAIL)


    /* host driver error IRQs */
#define ATH_SPI_HCD_ERROR_IRQS (ATH_SPI_INTR_ADDRESS_ERROR | \
                                ATH_SPI_INTR_WRBUF_ERROR | \
                                ATH_SPI_INTR_RDBUF_ERROR)
    /* host driver IRQ sources */
#define ATH_SPI_HCD_IRQ_SOURCES (ATH_SPI_INTR_WRBUF_BELOW_WMARK | ATH_SPI_HCD_ERROR_IRQS)



#define HW_FROM_ISR_CONTEXT    TRUE
#define HW_FROM_NORMAL_CONTEXT FALSE

void HcdTimerCallback(PSDHCD_DEVICE pDevice, int Context);
void HW_EnableDisableSPIIRQ(PSDHCD_DEVICE hcd_ctx,unsigned char spiirq_enable,unsigned char irqs_enabled);
BOOL HcdSpiInterrupt(PSDHCD_DEVICE pDevice);
SDIO_STATUS  HcdInitialize(PSDHCD_DEVICE);
void HcdDeinitialize(PSDHCD_DEVICE);
void HW_PowerUpDown(PVOID pHWDevice, BOOL powerUp);
void HW_SetClock(PSDHCD_DEVICE pDevice, PUINT32 pClockRate);
