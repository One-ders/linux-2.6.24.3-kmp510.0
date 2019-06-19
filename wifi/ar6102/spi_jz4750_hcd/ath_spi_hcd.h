

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


void HcdTimerCallback(struct hcd_context *, unsigned long);
void HW_EnableDisableSPIIRQ(struct hcd_context *hcd_ctx,unsigned char spiirq_enable,unsigned char irqs_enabled);
void HcdSpiInterrupt(struct hcd_context *pHcd_ctx);
SDIO_STATUS  HcdInitialize(struct hcd_context *);
void HcdDeinitialize(struct hcd_context *);
