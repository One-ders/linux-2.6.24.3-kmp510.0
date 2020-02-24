00002e24 <HcdRequest>:
!1491
    2e24:	27bdffc0 	addiu	sp,sp,-64
    2e28:	3c020000 	lui	v0,0x0
			2e28: R_MIPS_HI16	local_bh_disable
    2e2c:	afbf003c 	sw	ra,60(sp)
    2e30:	afb60038 	sw	s6,56(sp)
    2e34:	afb50034 	sw	s5,52(sp)
    2e38:	afb40030 	sw	s4,48(sp)
    2e3c:	afb3002c 	sw	s3,44(sp)
    2e40:	afb20028 	sw	s2,40(sp)
    2e44:	afb10024 	sw	s1,36(sp)
    2e48:	afb00020 	sw	s0,32(sp)
    2e4c:	24420000 	addiu	v0,v0,0
			2e4c: R_MIPS_LO16	local_bh_disable
    2e50:	8c920044 	lw	s2,68(a0)
!1508
    2e54:	0040f809 	jalr	v0
    2e58:	8c910020 	lw	s1,32(a0)
    2e5c:	8f820014 	lw	v0,20(gp)
    2e60:	24420001 	addiu	v0,v0,1
    2e64:	af820014 	sw	v0,20(gp)
    2e68:	40026000 	mfc0	v0,c0_status
    2e6c:	30420001 	andi	v0,v0,0x1
1508
!    2e70:	10400075 	beqz	v0,3048 <HcdRequest+0x224>
!    2e74:	3c040000 	lui	a0,0x0
!			2e74: R_MIPS_HI16	$LC12
v    2e78:	922200fa 	lbu	v0,250(s1)
1516                 to 2ef8 if !fatalError
    2e7c:	1040001e 	beqz	v0,2ef8 <HcdRequest+0xd4>
1517
    2e80:	2410fffb 	li	s0,-5; load errno
------------> end do { } while(0)
1707
    2e84:	8f820014 	lw	v0,20(gp)
    2e88:	3c030000 	lui	v1,0x0
			2e88: R_MIPS_HI16	local_bh_enable
    2e8c:	2442ffff 	addiu	v0,v0,-1
    2e90:	24630000 	addiu	v1,v1,0
			2e90: R_MIPS_LO16	local_bh_enable
local_bh_enable
    2e94:	0060f809 	jalr	v1
decr_preempt_count
    2e98:	af820014 	sw	v0,20(gp)
    2e9c:	24020003 	li	v0,3
1710	to 2ed0 if (status == PENDING)  out
    2ea0:	1202000b 	beq	s0,v0,2ed0 <HcdRequest+0xac>
    2ea4:	02001021 	move	v0,s0
    2ea8:	8e420008 	lw	v0,8(s2)
    2eac:	30420100 	andi	v0,v0,0x100
1714:		to 2ecc if ! SDREQ_FORCE_DEFFERED
    2eb0:	10400006 	beqz	v0,2ecc <HcdRequest+0xa8>
    2eb4:	ae500040 	sw	s0,64(s2)
    2eb8:	3c020000 	lui	v0,0x0
			2eb8: R_MIPS_HI16	HW_QueueDeferredCompletion
    2ebc:	24420000 	addiu	v0,v0,0
			2ebc: R_MIPS_LO16	HW_QueueDeferredCompletion
1717:			HW_QueueDeferredCompleteion(pDevice)
    2ec0:	0040f809 	jalr	v0
    2ec4:	02202021 	move	a0,s1
    2ec8:	24100003 	li	s0,3   return pending
    2ecc:	02001021 	move	v0,s0
1725
    2ed0:	8fbf003c 	lw	ra,60(sp)
    2ed4:	8fb60038 	lw	s6,56(sp)
    2ed8:	8fb50034 	lw	s5,52(sp)
    2edc:	8fb40030 	lw	s4,48(sp)
    2ee0:	8fb3002c 	lw	s3,44(sp)
    2ee4:	8fb20028 	lw	s2,40(sp)
    2ee8:	8fb10024 	lw	s1,36(sp)
    2eec:	8fb00020 	lw	s0,32(sp)
    2ef0:	03e00008 	jr	ra
    2ef4:	27bd0040 	addiu	sp,sp,64
================================================================
 continuation on main do while.
    2ef8:	92220008 	lbu	v0,8(s1)
		to 2e84 if shutting down
1521:      break if pDevice->ShuttingDown
    2efc:	1440ffe1 	bnez	v0,2e84 <HcdRequest+0x60> break 1;
1523:
    2f00:	2410fff8 	li	s0,-8  ! load rc cancel
    2f04:	96430010 	lhu	v1,16(s2)
    2f08:	30620004 	andi	v0,v1,0x4
1581 if ATH_IS_TRANS_PIO (!TRANS_DMA(4))
1581: 				to 3080 if NOT DMA (PIO)
    2f0c:	1040005c 	beqz	v0,3080 <HcdRequest+0x25c>
    2f10:	30620010 	andi	v0,v1,0x10
=================================
1618:               DMA
    2f14:	8e42002c 	lw	v0,44(s2)
    2f18:	9646001a 	lhu	a2,26(s2)
    2f1c:	ae420034 	sw	v0,52(s2) pHcdContext=pDataBuffer
    2f20:	ae460030 	sw	a2,48(s2) DataRemaining=dma_bytes
1626: ====> ConfigureByteSwap 1167
    2f24:	92240018 	lbu	a0,24(s1) dmaDataWidth
    2f28:	24020003 	li	v0,3   ATH_TRANS_DS_32
1174: to 3314 if dmaDataWith==3
    2f2c:	108200f9 	beq	a0,v0,3314 <HcdRequest+0x4f0>
    2f30:	96250014 	lhu	a1,20(s1) spiConfigShadow
    2f34:	24020001 	li	v0,1   ATH_TRANS_DS_16
1179: to 3320 if dmaDataWith==1
    2f38:	108200f9 	beq	a0,v0,3320 <HcdRequest+0x4fc>
    2f3c:	00000000 	nop
1184: to 32ac if dmaDataWith==0  (ATH_TRANS_DS_8
    2f40:	108000da 	beqz	a0,32ac <HcdRequest+0x488>
    2f44:	30a6fff9 	andi	a2,a1,0xfff9
=====================
1632:	return from ConfigSwap or fallthrough from above if notting happend
    2f48:	30620080 	andi	v0,v1,0x80 ATH_IS_TRANS_READ
1632: to 3178 if TRANS_READ and DMA
    2f4c:	1440008a 	bnez	v0,3178 <HcdRequest+0x354>
    2f50:	3c020000 	lui	v0,0x0
			2f50: R_MIPS_HI16	.text
1635:
===
    2f54:	2634001c 	addiu	s4,s1,28
    2f58:	3c130000 	lui	s3,0x0
			2f58: R_MIPS_HI16	.text
    2f5c:	02202021 	move	a0,s1
    2f60:	24050200 	li	a1,512
    2f64:	26621d24 	addiu	v0,s3,7460  DoPioReadInternal
			2f64: R_MIPS_LO16	.text
1638: DoPioReadInternal(pDev, SPC_AVA, &pDev->writebp)
    2f68:	0040f809 	jalr	v0
    2f6c:	02803021 	move	a2,s4
1640: to 2e84 if !SDIO_SUCCESS
    2f70:	0440ffc4 	bltz	v0,2e84 <HcdRequest+0x60> ! break 2
    2f74:	00408021 	move	s0,v0
1644:
    2f78:	922500f9 	lbu	a1,249(s1)  MiscFlags
    2f7c:	30a20004 	andi	v0,a1,0x4   SleepWar
1644:
    2f80:	104000e9 	beqz	v0,3328 <HcdRequest+0x504>
    2f84:	00000000 	nop
===================================================
   sleep war enabled
1650:
    2f88:	8e23001c 	lw	v1,28(s1) WriteBufferSpace
    2f8c:	8e240020 	lw	a0,32(s1) MaxWriteBufferSpace
    2f90:	0064102b 	sltu	v0,v1,a0 v0=1 if v1<a0
1650			to 32fc if writebufferspace<MaxWriteBufferspace
    2f94:	144000d9 	bnez	v0,32fc <HcdRequest+0x4d8>
    2f98:	00000000 	nop
1652:
    2f9c:	ae200024 	sw	zero,36(s1) PktsInSPIWriteBuf=0
================
	last if statement sleep_war_enabled,
    2fa0:	8e460030 	lw	a2,48(s2)  dataRemaining
		v0=1 if WriteBufferSpace<dataRemaining
    2fa4:	0066102b 	sltu	v0,v1,a2
1656:		to 316c if writebufferspace >= dataremain, programWriteBufferWM
    2fa8:	10400070 	beqz	v0,316c <HcdRequest+0x348>
    2fac:	00661023 	subu	v0,v1,a2  v0=writebufspace-dataremain
====
1344: ProgramWriteBufferWaterMark
    2fb0:	30a20004 	andi	v0,a1,0x4
1356: if sleepwar_enable to 330c
    2fb4:	144000d5 	bnez	v0,330c <HcdRequest+0x4e8>
    2fb8:	00000000 	nop
1360: wmarkl=maxwbufspace-dataremain
    2fbc:	00863023 	subu	a2,a0,a2
---> backfrom 330c, wmarkl=1
    2fc0:	00c4102b 	sltu	v0,a2,a0
1363: to 32f4 if not wmarkl < MaxWriteBufferSpace
    2fc4:	104000cb 	beqz	v0,32f4 <HcdRequest+0x4d0>
    2fc8:	00000000 	nop
1365: to 32f4 if !wmarkl
    2fcc:	10c000c9 	beqz	a2,32f4 <HcdRequest+0x4d0>
    2fd0:	00000000 	nop
    2fd4:	3c020000 	lui	v0,0x0
			2fd4: R_MIPS_HI16	.text
    2fd8:	02202021 	move	a0,s1
    2fdc:	24421da4 	addiu	v0,v0,7588
			2fdc: R_MIPS_LO16	.text
1372:	DoPioWriteInternal(pDev, WATERMARK_REG,wleve)
    2fe0:	0040f809 	jalr	v0
    2fe4:	24051300 	li	a1,4864
1377:	to 314c if !SDIO_SUCCESS
    2fe8:	04400058 	bltz	v0,314c <HcdRequest+0x328>
    2fec:	00408021 	move	s0,v0
    2ff0:	27b50010 	addiu	s5,sp,16
    2ff4:	26761d24 	addiu	s6,s3,7460
			2ff4: R_MIPS_LO16	.text
    2ff8:	02202021 	move	a0,s1
    2ffc:	24050500 	li	a1,1280
1386:	DoPioReadInternal(pDev,ATH_SPI_STATUS_REG, &refval)
    3000:	02c0f809 	jalr	s6
    3004:	02a03021 	move	a2,s5
1388:	to 314c if !SDIO_SUCCESS
    3008:	04400050 	bltz	v0,314c <HcdRequest+0x328>
    300c:	00408021 	move	s0,v0
    3010:	8fa20010 	lw	v0,16(sp)
    3014:	24030004 	li	v1,4
    3018:	30530006 	andi	s3,v0,0x6
1392: to 30c0 if ((reqValue&RTC_STATE_MASK)==STATE_SLEEP)
    301c:	12630028 	beq	s3,v1,30c0 <HcdRequest+0x29c>
    3020:	3c020000 	lui	v0,0x0
			3020: R_MIPS_HI16	HW_UsecDelay
    3024:	24020001 	li	v0,1
1471: DMAWriteWaitngForBuffer=TRUE
    3028:	a2220019 	sb	v0,25(s1)
    302c:	3c020000 	lui	v0,0x0
			302c: R_MIPS_HI16	.text
    3030:	02202021 	move	a0,s1
    3034:	24421f3c 	addiu	v0,v0,7996
			3034: R_MIPS_LO16	.text
1473: UnmaskSPIInterrupts(pdev, ATH_SPI_INTR_WRBUF_BELOW_WMARK)
    3038:	0040f809 	jalr	v0
    303c:	24050400 	li	a1,1024
    3040:	08000ba1 	j	2e84 <HcdRequest+0x60>  break 3
			3040: R_MIPS_26	.text
return PENDING
    3044:	24100003 	li	s0,3
======================================================================
	if irqs_disabled
    3048:	3c020000 	lui	v0,0x0
			3048: R_MIPS_HI16	printk
    304c:	24420000 	addiu	v0,v0,0
			304c: R_MIPS_LO16	printk
    3050:	0040f809 	jalr	v0
    3054:	24840000 	addiu	a0,a0,0
			3054: R_MIPS_LO16	$LC12
    3058:	40016000 	mfc0	at,c0_status
    305c:	3421001f 	ori	at,at,0x1f
    3060:	3821001e 	xori	at,at,0x1e
    3064:	40816000 	mtc0	at,c0_status
    3068:	00000040 	ssnop
    306c:	00000040 	ssnop
    3070:	00000040 	ssnop
    3074:	000000c0 	sll	zero,zero,0x3
    3078:	08000b9f 	j	2e7c <HcdRequest+0x58>
			3078: R_MIPS_26	.text
    307c:	922200fa 	lbu	v0,250(s1)
==
============================
1585:	to 3190 if ATH_IS_TRANS_PIO_EXTERNAL
    if (!TRANS_INT) to 3190
    3080:	14400043 	bnez	v0,3190 <HcdRequest+0x36c>
    3084:	24020040 	li	v0,64

    3088:	30620080 	andi	v0,v1,0x80
1587:   to 32d8 if NOT TRANS READ
    308c:	10400092 	beqz	v0,32d8 <HcdRequest+0x4b4>
    3090:	3c020000 	lui	v0,0x0
			3090: R_MIPS_HI16	.text
    3094:	96450018 	lhu	a1,24(s2)
    3098:	3c020000 	lui	v0,0x0
			3098: R_MIPS_HI16	.text
    309c:	02202021 	move	a0,s1
    30a0:	24421d24 	addiu	v0,v0,7460
			30a0: R_MIPS_LO16	.text
1590:		DoPioReadInternal(pDev,ioaddr,&temp)
    30a4:	0040f809 	jalr	v0
    30a8:	27a60010 	addiu	a2,sp,16
1593		if SDIO_SUCCESS
    30ac:	0440ff75 	bltz	v0,2e84 <HcdRequest+0x60>  break 4;
    30b0:	00408021 	move	s0,v0
    30b4:	8fa20010 	lw	v0,16(sp)  set_pio_internal_read_res
    30b8:	08000ba1 	j	2e84 <HcdRequest+0x60> break 5;
			30b8: R_MIPS_26	.text
1595: SET_PIO_INTERNAL_READ_RESULT
    30bc:	ae42001c 	sw	v0,28(s2)
==============
1395: ATH_SPI_STATUS_RTC_STATE_SLEEP in ProgramWmL
1395: HW_UsecDelay(pDev,60)
    30c0:	2405003c 	li	a1,60
    30c4:	24420000 	addiu	v0,v0,0
			30c4: R_MIPS_LO16	HW_UsecDelay
    30c8:	0040f809 	jalr	v0
    30cc:	02202021 	move	a0,s1
    30d0:	02202021 	move	a0,s1
    30d4:	02a03021 	move	a2,s5
1398:	DoPioReadInternal(pDev,STATUS_REG,&regVal)
    30d8:	02c0f809 	jalr	s6
    30dc:	24050500 	li	a1,1280
1400:	to 314c if !SDIO_SUCCES
    30e0:	0440001a 	bltz	v0,314c <HcdRequest+0x328>
    30e4:	00408021 	move	s0,v0
    30e8:	8fa20010 	lw	v0,16(sp)
    30ec:	30420006 	andi	v0,v0,0x6
1404:	to 3028 if ((regVal&STATE_MASK)!=STATE_SLEEP)
    30f0:	1453ffcd 	bne	v0,s3,3028 <HcdRequest+0x204>
1471.0: v0=TRUE for DMAWriteWaitingForBuf
    30f4:	24020001 	li	v0,1
    30f8:	02803021 	move	a2,s4
    30fc:	02202021 	move	a0,s1
1410:	DoPioReadInternal(pDev,AVA_REG,WriteBufferSpace)
    3100:	02c0f809 	jalr	s6
    3104:	24050200 	li	a1,512
1414: to 314c if !SDIO_SUCCESS
    3108:	04400010 	bltz	v0,314c <HcdRequest+0x328>
    310c:	00408021 	move	s0,v0
    3110:	922200f9 	lbu	v0,249(s1)
    3114:	30420004 	andi	v0,v0,0x4
1418: to 3404(else) if !SLEEP_WAR_ENABLED
    3118:	104000ba 	beqz	v0,3404 <HcdRequest+0x5e0>
    311c:	00000000 	nop
    3120:	8e22001c 	lw	v0,28(s1) WriteBufferSpace
    3124:	8e230020 	lw	v1,32(s1) MaxWriteBufferspc
    3128:	0043102b 	sltu	v0,v0,v1
1420: to 3028 if (WriteBufferSpace<MaxWriteBufferspce)
    312c:	1440ffbe 	bnez	v0,3028 <HcdRequest+0x204>
1471.0: v0=TRUE for DMAwritewaitfor buf
    3130:	24020001 	li	v0,1
1426: PktsInSPIWriteBuffer=0
    3134:	ae200024 	sw	zero,36(s1)
    3138:	3c020000 	lui	v0,0x0
			3138: R_MIPS_HI16	.text
    313c:	24421eb0 	addiu	v0,v0,7856
			313c: R_MIPS_LO16	.text
1458: ResetWriteBufferWaterMark(pDev)
    3140:	0040f809 	jalr	v0
    3144:	02202021 	move	a0,s1
    3148:	00408021 	move	s0,v0
.... if PENDING break
    314c:	24020003 	li	v0,3
    3150:	1202ff4c 	beq	s0,v0,2e84 <HcdRequest+0x60>  break 6
    3154:	00000000 	nop
.... if !SUCCESS break
    3158:	1600ff4a 	bnez	s0,2e84 <HcdRequest+0x60>  break 7
    315c:	00000000 	nop
========================
1695:
  ADJUST_WRBUF_SPACE:
    3160:	8e460030 	lw	a2,48(s2)
    3164:	8e23001c 	lw	v1,28(s1)
    3168:	00661023 	subu	v0,v1,a2
1695,
    316c:	2442fffb 	addiu	v0,v0,-5
    3170:	ae22001c 	sw	v0,28(s1)
    3174:	3c020000 	lui	v0,0x0
			3174: R_MIPS_HI16	.text
    3178:	02202021 	move	a0,s1
=====
1633, 1698:
    317c:	2442256c 	addiu	v0,v0,9580
			317c: R_MIPS_LO16	.text
         DMA and READ
1633, 1698:	status=DoDMAOp(pDevice,pReq)
    3180:	0040f809 	jalr	v0
    3184:	02402821 	move	a1,s2
1700:
    3188:	08000ba1 	j	2e84 <HcdRequest+0x60>  break 8
			3188: R_MIPS_26	.text
    318c:	00408021 	move	s0,v0
======================================================================
DoPioExternalAccess read PIO
1605:
 1042:
		a0=pReq->pDataBuffer
    3190:	8e44002c 	lw	a0,44(s2)
		a2=GET_EXT_TRANSFER_BYTES
    3194:	9646001a 	lhu	a2,26(s2)
		v1=v1&TRANS_EXT_ADDR_FIXED
    3198:	30630020 	andi	v1,v1,0x20
		regValue=FIXED or 0
    319c:	0003100a 	movz	v0,zero,v1
		preq->DataRemaining=a2
    31a0:	ae460030 	sw	a2,48(s2)
		preq->pHcdContext=a0
    31a4:	ae440034 	sw	a0,52(s2)
    31a8:	afa20018 	sw	v0,24(sp)
    31ac:	8e430030 	lw	v1,48(s2)
    31b0:	3c150000 	lui	s5,0x0
			31b0: R_MIPS_HI16	.text
1062:	regvalue |= pReq->DataRemaining;
    31b4:	00431025 	or	v0,v0,v1
    31b8:	00403021 	move	a2,v0
    31bc:	02202021 	move	a0,s1
    31c0:	24050600 	li	a1,1536
    31c4:	26b31da4 	addiu	s3,s5,7588
			31c4: R_MIPS_LO16	.text
1067:     status = DoPioWriteInternal(pDevice, ATH_SPI_HOST_CTRL_BYTE_SIZE_REG, regValue);
    31c8:	0260f809 	jalr	s3
    31cc:	afa20018 	sw	v0,24(sp)
1070:		break if not SUCCESS
    31d0:	0440ff2c 	bltz	v0,2e84 <HcdRequest+0x60> break 9
    31d4:	00408021 	move	s0,v0
    31d8:	96420010 	lhu	v0,16(s2)
    31dc:	30420080 	andi	v0,v0,0x80
1073: to 3344 ATH_IS_TRANS_WRITE (!TRANS_READ)
    31e0:	10400058 	beqz	v0,3344 <HcdRequest+0x520>
    31e4:	3c020000 	lui	v0,0x0
			31e4: R_MIPS_HI16	HW_InOut_Token
1092:	regValue=ATH_SPI_HOST_CTRL_CONFIG_ENABLE
    31e8:	34048000 	li	a0,0x8000
    31ec:	afa40018 	sw	a0,24(sp)
    31f0:	96420010 	lhu	v0,16(s2)
    31f4:	3403c000 	li	v1,0xc000
    31f8:	30420080 	andi	v0,v0,0x80
    31fc:	0082180b 	movn	v1,a0,v0
    3200:	afa30018 	sw	v1,24(sp)
    3204:	96420018 	lhu	v0,24(s2)
    3208:	02202021 	move	a0,s1
    320c:	00431025 	or	v0,v0,v1
    3210:	00403021 	move	a2,v0
    3214:	24050700 	li	a1,1792
1099:		DoPioWriteInternal(pDev, HOST_CTRL_CONF_REG, regvalue)
    3218:	0260f809 	jalr	s3
    321c:	afa20018 	sw	v0,24(sp)
1102:	break if !SDIO_SUCCESS
    3220:	0440ff18 	bltz	v0,2e84 <HcdRequest+0x60> break 10
    3224:	00408021 	move	s0,v0
    3228:	3c130000 	lui	s3,0x0
			3228: R_MIPS_HI16	.text
    322c:	26741d24 	addiu	s4,s3,7460
			322c: R_MIPS_LO16	.text
1108:	retry=EXTERN_ACCESS_DONE_RETRY_COUNT
    3230:	24100003 	li	s0,3
    3234:	27b30018 	addiu	s3,sp,24
    3238:	02202021 	move	a0,s1
    323c:	24050500 	li	a1,1280
1112:		status = DoPioReadInternal(pDevice, ATH_SPI_STATUS_REG, &regValue);
    3240:	0280f809 	jalr	s4
    3244:	02603021 	move	a2,s3
1115:	break loop if !SDIO_SUCCESS
    3248:	04400055 	bltz	v0,33a0 <HcdRequest+0x57c>
    324c:	2610ffff 	addiu	s0,s0,-1
    3250:	8fa20018 	lw	v0,24(sp)
    3254:	30420001 	andi	v0,v0,0x1
1121:	break loop if regValue&ATH_SPI_STATUS_DONE
    3258:	14400051 	bnez	v0,33a0 <HcdRequest+0x57c>
    325c:	00000000 	nop
1127:	back to wile if retry
    3260:	1600fff6 	bnez	s0,323c <HcdRequest+0x418>
    3264:	02202021 	move	a0,s1
    3268:	24020001 	li	v0,1
1132:	pDevice->ExternalIOPending = TRUE;
    326c:	a2220016 	sb	v0,22(s1)
    3270:	3c020000 	lui	v0,0x0
			3270: R_MIPS_HI16	HW_StartTimer
    3274:	240507d0 	li	a1,2000
    3278:	24420000 	addiu	v0,v0,0
			3278: R_MIPS_LO16	HW_StartTimer
    327c:	0040f809 	jalr	v0
    3280:	24060001 	li	a2,1
    3284:	96430010 	lhu	v1,16(s2)
    3288:	30630080 	andi	v1,v1,0x80
1136:	to 3388 if !TRANS_READ
    328c:	1060003e 	beqz	v1,3388 <HcdRequest+0x564>
    3290:	3c020000 	lui	v0,0x0
			3290: R_MIPS_HI16	.text
    3294:	02202021 	move	a0,s1
    3298:	24421f3c 	addiu	v0,v0,7996
			3298: R_MIPS_LO16	.text
1137:	UnmaskSPIInterrupts(pdev, CTRL_RD_DONE)
    329c:	0040f809 	jalr	v0
    32a0:	24050200 	li	a1,512
1142:
    32a4:	08000ba1 	j	2e84 <HcdRequest+0x60> break 11
			32a4: R_MIPS_26	.text
1141:	status=PENDING
    32a8:	24100003 	li	s0,3
=================================================================
  epilogue of inline ConfigureByteSwap,
1193:
		to 2f48 if swapSettings==pDevice->SpiConfigShadow
    32ac:	10c5ff26 	beq	a2,a1,2f48 <HcdRequest+0x124>
    32b0:	3c020000 	lui	v0,0x0
			32b0: R_MIPS_HI16	.text
    32b4:	a6260014 	sh	a2,20(s1) SpiConfigShadow=swapSettings
    32b8:	02202021 	move	a0,s1
    32bc:	24421da4 	addiu	v0,v0,7588 DoPioWriteInternal
			32bc: R_MIPS_LO16	.text
1199: DoPioWriteInternal(pDev,ATH_SPI..REG,swapSettings);
    32c0:	0040f809 	jalr	v0
    32c4:	24050400 	li	a1,1024
    32c8:	0440feee 	bltz	v0,2e84 <HcdRequest+0x60> break 12
    32cc:	00408021 	move	s0,v0
1199: return rc
    32d0:	08000bd2 	j	2f48 <HcdRequest+0x124>
			32d0: R_MIPS_26	.text
    32d4:	96430010 	lhu	v1,16(s2)
=========================================================================
1599: PIO_WRITE
    32d8:	96450018 	lhu	a1,24(s2)
    32dc:	8e460014 	lw	a2,20(s2)
    32e0:	24421da4 	addiu	v0,v0,7588
			32e0: R_MIPS_LO16	.text
1599: DoPioWriteInt(pDev, ioaddr, write_val);
    32e4:	0040f809 	jalr	v0
    32e8:	02202021 	move	a0,s1
    32ec:	08000ba1 	j	2e84 <HcdRequest+0x60>  break 13
			32ec: R_MIPS_26	.text
    32f0:	00408021 	move	s0,v0
=======================================
    32f4:	08000bf5 	j	2fd4 <HcdRequest+0x1b0>
			32f4: R_MIPS_26	.text
    32f8:	24060001 	li	a2,1
===========================================================
    32fc:	8e220024 	lw	v0,36(s1)
		v0=1 if PktsInSPIWriteBuffer<2
    3300:	2c420002 	sltiu	v0,v0,2
1657:			to 2fa0 if so
    3304:	1440ff26 	bnez	v0,2fa0 <HcdRequest+0x17c>
    3308:	00000000 	nop
1358: programWaterML (Sleepwar ena)
    330c:	08000bf0 	j	2fc0 <HcdRequest+0x19c>
			330c: R_MIPS_26	.text
    3310:	24060001 	li	a2,1  waterMarkLevel=1
===============================================================
============= 1175 ConfigureByteSwap, inline, ATH_TRANS_DS_32 =============
    3314:	34a20004 	ori	v0,a1,0x4  v0=a1|CONFIG_BYTE_SWAP
    3318:	08000cab 	j	32ac <HcdRequest+0x488>
			3318: R_MIPS_26	.text
    331c:	3046fffd 	andi	a2,v0,0xfffd a2=v0&~CONFIG_SWAP_16
======================================================================
============= 1180 ConfigureByteSwap, inline, ATH_TRANS_DS_16
    3320:	08000cab 	j	32ac <HcdRequest+0x488>
			3320: R_MIPS_26	.text
    3324:	34a60006 	ori	a2,a1,0x6 a1= (CONFGI_BYTE_SWAP|CONFIG_SWAP_16)
=====================================================================
1666: !SLEEP_WAR_ENABLED
    3328:	8e23001c 	lw	v1,28(s1)
    332c:	8e460030 	lw	a2,48(s2)
    3330:	0066102b 	sltu	v0,v1,a2
1666:	if WriteBufferSpace<DataRemain)
    3334:	1040ff8d 	beqz	v0,316c <HcdRequest+0x348>
          v0=writeBufferSpace-DataRemain
    3338:	00661023 	subu	v0,v1,a2
    333c:	08000bef 	j	2fbc <HcdRequest+0x198>
			333c: R_MIPS_26	.text
    3340:	8e240020 	lw	a0,32(s1)
====================================================================
1077: HW_InOutToken(dev, 0xa00|0x4000, TRANS_DS_16,0)
    3344:	02202021 	move	a0,s1
    3348:	24054a00 	li	a1,18944
    334c:	24060001 	li	a2,1
    3350:	24420000 	addiu	v0,v0,0
			3350: R_MIPS_LO16	HW_InOut_Token
    3354:	0040f809 	jalr	v0
    3358:	00003821 	move	a3,zero
1080: break if !SDIO_SUCESS
    335c:	0440fec9 	bltz	v0,2e84 <HcdRequest+0x60>  break 14
    3360:	00408021 	move	s0,v0
    3364:	3c020000 	lui	v0,0x0
			3364: R_MIPS_HI16	.text
    3368:	02202021 	move	a0,s1
    336c:	24422264 	addiu	v0,v0,8804
			336c: R_MIPS_LO16	.text
1083: HcdTransferData(pDeviceice, pReq)
    3370:	0040f809 	jalr	v0
    3374:	02402821 	move	a1,s2
1086: to 31e8 if SDIO_SUCCESS
    3378:	0441ff9b 	bgez	v0,31e8 <HcdRequest+0x3c4>
    337c:	00408021 	move	s0,v0
1087:	break
    3380:	08000ba1 	j	2e84 <HcdRequest+0x60> break 15
			3380: R_MIPS_26	.text
    3384:	00000000 	nop
===================================================================
1139: UnmaskInterrupt WR DONE
    3388:	02202021 	move	a0,s1
    338c:	24421f3c 	addiu	v0,v0,7996
			338c: R_MIPS_LO16	.text
    3390:	0040f809 	jalr	v0
    3394:	24050100 	li	a1,256
1142:
    3398:	08000ba1 	j	2e84 <HcdRequest+0x60> break 16
			3398: R_MIPS_26	.text
    339c:	24100003 	li	s0,3
========================================================================
1147: in DoPioExternalAccess(PSDHCD_DEVICE pDevice, PSDREQUEST    pReq) {

    33a0:	96420010 	lhu	v0,16(s2)
    33a4:	30420080 	andi	v0,v0,0x80
1147: to 33cc if ATH_IS_TRANS_READ(pReq)
    33a8:	14400008 	bnez	v0,33cc <HcdRequest+0x5a8>
    33ac:	3c020000 	lui	v0,0x0
			33ac: R_MIPS_HI16	HW_InOut_Token
---> return from HW_InOut_Token
    33b0:	26a21da4 	addiu	v0,s5,7588
			33b0: R_MIPS_LO16	.text
---> return from HcdTransferData
    33b4:	02202021 	move	a0,s1
		a1=ATH_SPI_INTR_CAUSE_REG
    33b8:	24050c00 	li	a1,3072
1154:			DoPioWriteInternal(PSDHCD_DEVICE pDevice,
    33bc:	0040f809 	jalr	v0
    33c0:	24060300 	li	a2,768
1159: 1162
    33c4:	08000ba1 	j	2e84 <HcdRequest+0x60>  break 17
			33c4: R_MIPS_26	.text
    33c8:	00408021 	move	s0,v0
=============================================================================
1148:
 1023:
    33cc:	02202021 	move	a0,s1
	ATH_SPI_HOST_CTRL_RD_PORT_REG(0x800)
	CMD_ADDRESS_INTERNAL(0x4000)
	CMD_ADDR_READ(0x8000)
    33d0:	3405c800 	li	a1,0xc800
	TRANS_DS_16
    33d4:	24060001 	li	a2,1
    33d8:	24420000 	addiu	v0,v0,0
			33d8: R_MIPS_LO16	HW_InOut_Token
1023:
    33dc:	0040f809 	jalr	v0
    33e0:	00003821 	move	a3,zero
1026: to 33b0 if !SDIO_SUCCESS
    33e4:	0440fff2 	bltz	v0,33b0 <HcdRequest+0x58c>
    33e8:	3c020000 	lui	v0,0x0
			33e8: R_MIPS_HI16	.text
    33ec:	02202021 	move	a0,s1
    33f0:	24422264 	addiu	v0,v0,8804
			33f0: R_MIPS_LO16	.text
1029:		HcdTransferData(pDevice,pReq)
    33f4:	0040f809 	jalr	v0
    33f8:	02402821 	move	a1,s2
    33fc:	08000ced 	j	33b4 <HcdRequest+0x590>
			33fc: R_MIPS_26	.text
    3400:	26a21da4 	addiu	v0,s5,7588
			3400: R_MIPS_LO16	.text
==========================================================
1429: !SLEEP_WAR_ENABLED
    3404:	8e22001c 	lw	v0,28(s1)
    3408:	8e430030 	lw	v1,48(s2)
    340c:	0043102b 	sltu	v0,v0,v1
1430: wbspace<dataremain to 3138 if not
    3410:	1040ff49 	beqz	v0,3138 <HcdRequest+0x314>
    3414:	27a60014 	addiu	a2,sp,20
    3418:	02202021 	move	a0,s1
    341c:	24050200 	li	a1,512
    3420:	afa00014 	sw	zero,20(sp)
1437: DoPioReadInternal(pDev, WRBUF_SPC_AVA_REG,&bytesAvail))
    3424:	02c0f809 	jalr	s6
    3428:	afa00018 	sw	zero,24(sp)
    342c:	02202021 	move	a0,s1
    3430:	24050500 	li	a1,1280
1440: DoPioReadInternal(pDev, SPI_STATUS_REG,&spistatus)
    3434:	02c0f809 	jalr	s6
    3438:	27a60018 	addiu	a2,sp,24
    343c:	08000c0a 	j	3028 <HcdRequest+0x204>
			343c: R_MIPS_26	.text
1471.0 v0=TRUE for DMAWriteWaitingForBuf
    3440:	24020001 	li	v0,1
==========================
