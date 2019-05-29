
void HcdTimerCallback(struct hcd_context *, unsigned long);
void HW_EnableDisableSPIIRQ(struct hcd_context *hcd_ctx,unsigned char spiirq_enable,unsigned char irqs_enabled);
void HcdSpiInterrupt(struct hcd_context *pHcd_ctx);
void HcdDeinitialize(struct hcd_context *);
