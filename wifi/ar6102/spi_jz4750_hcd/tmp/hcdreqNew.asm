00002cdc <HcdRequest>:
    2cdc:	27bdffc0 	addiu	sp,sp,-64
    2ce0:	3c020000 	lui	v0,0x0
			2ce0: R_MIPS_HI16	local_bh_disable
    2ce4:	afbf003c 	sw	ra,60(sp)
    2ce8:	afb60038 	sw	s6,56(sp)
    2cec:	afb50034 	sw	s5,52(sp)
    2cf0:	afb40030 	sw	s4,48(sp)
    2cf4:	afb3002c 	sw	s3,44(sp)
    2cf8:	afb20028 	sw	s2,40(sp)
    2cfc:	afb10024 	sw	s1,36(sp)
    2d00:	afb00020 	sw	s0,32(sp)
    2d04:	24420000 	addiu	v0,v0,0
			2d04: R_MIPS_LO16	local_bh_disable
    2d08:	8c920044 	lw	s2,68(a0)
    2d0c:	0040f809 	jalr	v0
    2d10:	8c910020 	lw	s1,32(a0)
    2d14:	8f820014 	lw	v0,20(gp)
    2d18:	24420001 	addiu	v0,v0,1
    2d1c:	af820014 	sw	v0,20(gp)
    2d20:	40036000 	mfc0	v1,c0_status
    2d24:	30630001 	andi	v1,v1,0x1
    2d28:	10600078 	beqz	v1,2f0c <HcdRequest+0x230>
    2d2c:	3c040000 	lui	a0,0x0
			2d2c: R_MIPS_HI16	$LC11
    2d30:	922200fa 	lbu	v0,250(s1)
    2d34:	14400004 	bnez	v0,2d48 <HcdRequest+0x6c>
    2d38:	2410fffb 	li	s0,-5
    2d3c:	92220008 	lbu	v0,8(s1)
    2d40:	1040001b 	beqz	v0,2db0 <HcdRequest+0xd4>
    2d44:	2410fff8 	li	s0,-8
    2d48:	8f830014 	lw	v1,20(gp)
    2d4c:	3c040000 	lui	a0,0x0
			2d4c: R_MIPS_HI16	local_bh_enable
    2d50:	2463ffff 	addiu	v1,v1,-1
    2d54:	24840000 	addiu	a0,a0,0
			2d54: R_MIPS_LO16	local_bh_enable
    2d58:	0080f809 	jalr	a0
    2d5c:	af830014 	sw	v1,20(gp)
    2d60:	8e420008 	lw	v0,8(s2)
    2d64:	30420100 	andi	v0,v0,0x100
    2d68:	10400006 	beqz	v0,2d84 <HcdRequest+0xa8>
    2d6c:	ae500040 	sw	s0,64(s2)
    2d70:	3c020000 	lui	v0,0x0
			2d70: R_MIPS_HI16	HW_QueueDeferredCompletion
    2d74:	24420000 	addiu	v0,v0,0
			2d74: R_MIPS_LO16	HW_QueueDeferredCompletion
    2d78:	0040f809 	jalr	v0
    2d7c:	02202021 	move	a0,s1
    2d80:	24100003 	li	s0,3
    2d84:	02001021 	move	v0,s0
    2d88:	8fbf003c 	lw	ra,60(sp)
    2d8c:	8fb60038 	lw	s6,56(sp)
    2d90:	8fb50034 	lw	s5,52(sp)
    2d94:	8fb40030 	lw	s4,48(sp)
    2d98:	8fb3002c 	lw	s3,44(sp)
    2d9c:	8fb20028 	lw	s2,40(sp)
    2da0:	8fb10024 	lw	s1,36(sp)
    2da4:	8fb00020 	lw	s0,32(sp)
    2da8:	03e00008 	jr	ra
    2dac:	27bd0040 	addiu	sp,sp,64
    2db0:	96430010 	lhu	v1,16(s2)
    2db4:	30620004 	andi	v0,v1,0x4
    2db8:	10400062 	beqz	v0,2f44 <HcdRequest+0x268>
    2dbc:	30620010 	andi	v0,v1,0x10
    2dc0:	8e42002c 	lw	v0,44(s2)
    2dc4:	9646001a 	lhu	a2,26(s2)
    2dc8:	ae420034 	sw	v0,52(s2)
    2dcc:	ae460030 	sw	a2,48(s2)
    2dd0:	92240018 	lbu	a0,24(s1)
    2dd4:	24020003 	li	v0,3
    2dd8:	10820101 	beq	a0,v0,31e0 <HcdRequest+0x504>
    2ddc:	96250014 	lhu	a1,20(s1)
    2de0:	24020001 	li	v0,1
    2de4:	10820100 	beq	a0,v0,31e8 <HcdRequest+0x50c>
    2de8:	34a60006 	ori	a2,a1,0x6
    2dec:	108000fe 	beqz	a0,31e8 <HcdRequest+0x50c>
    2df0:	30a6fff9 	andi	a2,a1,0xfff9
    2df4:	30620080 	andi	v0,v1,0x80
    2df8:	1440009a 	bnez	v0,3064 <HcdRequest+0x388>
    2dfc:	3c020000 	lui	v0,0x0
			2dfc: R_MIPS_HI16	.text
    2e00:	2634001c 	addiu	s4,s1,28
    2e04:	3c130000 	lui	s3,0x0
			2e04: R_MIPS_HI16	.text
    2e08:	02202021 	move	a0,s1
    2e0c:	24050200 	li	a1,512
    2e10:	26621d24 	addiu	v0,s3,7460
			2e10: R_MIPS_LO16	.text
    2e14:	0040f809 	jalr	v0
    2e18:	02803021 	move	a2,s4
    2e1c:	04400058 	bltz	v0,2f80 <HcdRequest+0x2a4>
    2e20:	00408021 	move	s0,v0
    2e24:	922500f9 	lbu	a1,249(s1)
    2e28:	30a20004 	andi	v0,a1,0x4
    2e2c:	10400100 	beqz	v0,3230 <HcdRequest+0x554>
    2e30:	00000000 	nop
    2e34:	8e23001c 	lw	v1,28(s1)
    2e38:	8e240020 	lw	a0,32(s1)
    2e3c:	0064102b 	sltu	v0,v1,a0
    2e40:	14400115 	bnez	v0,3298 <HcdRequest+0x5bc>
    2e44:	00000000 	nop
    2e48:	ae200024 	sw	zero,36(s1)
    2e4c:	8e460030 	lw	a2,48(s2)
    2e50:	0066102b 	sltu	v0,v1,a2
    2e54:	10400080 	beqz	v0,3058 <HcdRequest+0x37c>
    2e58:	00661023 	subu	v0,v1,a2
    2e5c:	30a20004 	andi	v0,a1,0x4
    2e60:	14400111 	bnez	v0,32a8 <HcdRequest+0x5cc>
    2e64:	00000000 	nop
    2e68:	00863023 	subu	a2,a0,a2
    2e6c:	00c4102b 	sltu	v0,a2,a0
    2e70:	10400107 	beqz	v0,3290 <HcdRequest+0x5b4>
    2e74:	00000000 	nop
    2e78:	10c00105 	beqz	a2,3290 <HcdRequest+0x5b4>
    2e7c:	00000000 	nop
    2e80:	3c020000 	lui	v0,0x0
			2e80: R_MIPS_HI16	.text
    2e84:	02202021 	move	a0,s1
    2e88:	24421da4 	addiu	v0,v0,7588
			2e88: R_MIPS_LO16	.text
    2e8c:	0040f809 	jalr	v0
    2e90:	24051300 	li	a1,4864
    2e94:	04400068 	bltz	v0,3038 <HcdRequest+0x35c>
    2e98:	00408021 	move	s0,v0
    2e9c:	27b50010 	addiu	s5,sp,16
    2ea0:	26761d24 	addiu	s6,s3,7460
			2ea0: R_MIPS_LO16	.text
    2ea4:	02202021 	move	a0,s1
    2ea8:	24050500 	li	a1,1280
    2eac:	02c0f809 	jalr	s6
    2eb0:	02a03021 	move	a2,s5
    2eb4:	04400060 	bltz	v0,3038 <HcdRequest+0x35c>
    2eb8:	00408021 	move	s0,v0
    2ebc:	8fa20010 	lw	v0,16(sp)
    2ec0:	24030004 	li	v1,4
    2ec4:	30530006 	andi	s3,v0,0x6
    2ec8:	12630038 	beq	s3,v1,2fac <HcdRequest+0x2d0>
    2ecc:	3c020000 	lui	v0,0x0
			2ecc: R_MIPS_HI16	HW_UsecDelay
    2ed0:	24020001 	li	v0,1
    2ed4:	a2220019 	sb	v0,25(s1)
    2ed8:	3c020000 	lui	v0,0x0
			2ed8: R_MIPS_HI16	.text
    2edc:	02202021 	move	a0,s1
    2ee0:	24421f3c 	addiu	v0,v0,7996
			2ee0: R_MIPS_LO16	.text
    2ee4:	0040f809 	jalr	v0
    2ee8:	24050400 	li	a1,1024
    2eec:	8f820014 	lw	v0,20(gp)
    2ef0:	3c030000 	lui	v1,0x0
			2ef0: R_MIPS_HI16	local_bh_enable
    2ef4:	2442ffff 	addiu	v0,v0,-1
    2ef8:	24630000 	addiu	v1,v1,0
			2ef8: R_MIPS_LO16	local_bh_enable
    2efc:	0060f809 	jalr	v1
    2f00:	af820014 	sw	v0,20(gp)
    2f04:	08000b61 	j	2d84 <HcdRequest+0xa8>
			2f04: R_MIPS_26	.text
    2f08:	24100003 	li	s0,3
    2f0c:	3c020000 	lui	v0,0x0
			2f0c: R_MIPS_HI16	printk
    2f10:	24420000 	addiu	v0,v0,0
			2f10: R_MIPS_LO16	printk
    2f14:	0040f809 	jalr	v0
    2f18:	24840000 	addiu	a0,a0,0
			2f18: R_MIPS_LO16	$LC11
    2f1c:	40016000 	mfc0	at,c0_status
    2f20:	3421001f 	ori	at,at,0x1f
    2f24:	3821001e 	xori	at,at,0x1e
    2f28:	40816000 	mtc0	at,c0_status
    2f2c:	00000040 	ssnop
    2f30:	00000040 	ssnop
    2f34:	00000040 	ssnop
    2f38:	000000c0 	sll	zero,zero,0x3
    2f3c:	08000b4d 	j	2d34 <HcdRequest+0x58>
			2f3c: R_MIPS_26	.text
    2f40:	922200fa 	lbu	v0,250(s1)
    2f44:	14400057 	bnez	v0,30a4 <HcdRequest+0x3c8>
    2f48:	24020040 	li	v0,64
    2f4c:	30620080 	andi	v0,v1,0x80
    2f50:	104000b0 	beqz	v0,3214 <HcdRequest+0x538>
    2f54:	3c020000 	lui	v0,0x0
			2f54: R_MIPS_HI16	.text
    2f58:	96450018 	lhu	a1,24(s2)
    2f5c:	3c020000 	lui	v0,0x0
			2f5c: R_MIPS_HI16	.text
    2f60:	02202021 	move	a0,s1
    2f64:	24421d24 	addiu	v0,v0,7460
			2f64: R_MIPS_LO16	.text
    2f68:	0040f809 	jalr	v0
    2f6c:	27a60010 	addiu	a2,sp,16
    2f70:	04400003 	bltz	v0,2f80 <HcdRequest+0x2a4>
    2f74:	00408021 	move	s0,v0
    2f78:	8fa20010 	lw	v0,16(sp)
    2f7c:	ae42001c 	sw	v0,28(s2)
    2f80:	8f820014 	lw	v0,20(gp)
    2f84:	3c030000 	lui	v1,0x0
			2f84: R_MIPS_HI16	local_bh_enable
    2f88:	2442ffff 	addiu	v0,v0,-1
    2f8c:	24630000 	addiu	v1,v1,0
			2f8c: R_MIPS_LO16	local_bh_enable
    2f90:	0060f809 	jalr	v1
    2f94:	af820014 	sw	v0,20(gp)
    2f98:	24020003 	li	v0,3
    2f9c:	1602ff70 	bne	s0,v0,2d60 <HcdRequest+0x84>
    2fa0:	02001021 	move	v0,s0
    2fa4:	08000b63 	j	2d8c <HcdRequest+0xb0>
			2fa4: R_MIPS_26	.text
    2fa8:	8fbf003c 	lw	ra,60(sp)
    2fac:	2405003c 	li	a1,60
    2fb0:	24420000 	addiu	v0,v0,0
			2fb0: R_MIPS_LO16	HW_UsecDelay
    2fb4:	0040f809 	jalr	v0
    2fb8:	02202021 	move	a0,s1
    2fbc:	02202021 	move	a0,s1
    2fc0:	02a03021 	move	a2,s5
    2fc4:	02c0f809 	jalr	s6
    2fc8:	24050500 	li	a1,1280
    2fcc:	0440001a 	bltz	v0,3038 <HcdRequest+0x35c>
    2fd0:	00408021 	move	s0,v0
    2fd4:	8fa20010 	lw	v0,16(sp)
    2fd8:	30420006 	andi	v0,v0,0x6
    2fdc:	1453ffbd 	bne	v0,s3,2ed4 <HcdRequest+0x1f8>
    2fe0:	24020001 	li	v0,1
    2fe4:	02803021 	move	a2,s4
    2fe8:	02202021 	move	a0,s1
    2fec:	02c0f809 	jalr	s6
    2ff0:	24050200 	li	a1,512
    2ff4:	04400010 	bltz	v0,3038 <HcdRequest+0x35c>
    2ff8:	00408021 	move	s0,v0
    2ffc:	922200f9 	lbu	v0,249(s1)
    3000:	30420004 	andi	v0,v0,0x4
    3004:	104000ca 	beqz	v0,3330 <HcdRequest+0x654>
    3008:	00000000 	nop
    300c:	8e22001c 	lw	v0,28(s1)
    3010:	8e230020 	lw	v1,32(s1)
    3014:	0043102b 	sltu	v0,v0,v1
    3018:	1440ffae 	bnez	v0,2ed4 <HcdRequest+0x1f8>
    301c:	24020001 	li	v0,1
    3020:	ae200024 	sw	zero,36(s1)
    3024:	3c020000 	lui	v0,0x0
			3024: R_MIPS_HI16	.text
    3028:	24421eb0 	addiu	v0,v0,7856
			3028: R_MIPS_LO16	.text
    302c:	0040f809 	jalr	v0
    3030:	02202021 	move	a0,s1
    3034:	00408021 	move	s0,v0
    3038:	24020003 	li	v0,3
    303c:	12020060 	beq	s0,v0,31c0 <HcdRequest+0x4e4>
    3040:	00000000 	nop
    3044:	1600ff40 	bnez	s0,2d48 <HcdRequest+0x6c>
    3048:	00000000 	nop
    304c:	8e460030 	lw	a2,48(s2)
    3050:	8e23001c 	lw	v1,28(s1)
    3054:	00661023 	subu	v0,v1,a2
    3058:	2442fffb 	addiu	v0,v0,-5
    305c:	ae22001c 	sw	v0,28(s1)
    3060:	3c020000 	lui	v0,0x0
			3060: R_MIPS_HI16	.text
    3064:	02202021 	move	a0,s1
    3068:	2442256c 	addiu	v0,v0,9580
			3068: R_MIPS_LO16	.text
    306c:	0040f809 	jalr	v0
    3070:	02402821 	move	a1,s2
    3074:	00408021 	move	s0,v0
    3078:	8f820014 	lw	v0,20(gp)
    307c:	3c030000 	lui	v1,0x0
			307c: R_MIPS_HI16	local_bh_enable
    3080:	2442ffff 	addiu	v0,v0,-1
    3084:	24630000 	addiu	v1,v1,0
			3084: R_MIPS_LO16	local_bh_enable
    3088:	0060f809 	jalr	v1
    308c:	af820014 	sw	v0,20(gp)
    3090:	24020003 	li	v0,3
    3094:	1602ff32 	bne	s0,v0,2d60 <HcdRequest+0x84>
    3098:	02001021 	move	v0,s0
    309c:	08000b63 	j	2d8c <HcdRequest+0xb0>
			309c: R_MIPS_26	.text
    30a0:	8fbf003c 	lw	ra,60(sp)
    30a4:	8e44002c 	lw	a0,44(s2)
    30a8:	9646001a 	lhu	a2,26(s2)
    30ac:	30630020 	andi	v1,v1,0x20
    30b0:	0003100a 	movz	v0,zero,v1
    30b4:	ae460030 	sw	a2,48(s2)
    30b8:	ae440034 	sw	a0,52(s2)
    30bc:	afa20018 	sw	v0,24(sp)
    30c0:	8e430030 	lw	v1,48(s2)
    30c4:	3c150000 	lui	s5,0x0
			30c4: R_MIPS_HI16	.text
    30c8:	00431025 	or	v0,v0,v1
    30cc:	00403021 	move	a2,v0
    30d0:	02202021 	move	a0,s1
    30d4:	24050600 	li	a1,1536
    30d8:	26b31da4 	addiu	s3,s5,7588
			30d8: R_MIPS_LO16	.text
    30dc:	0260f809 	jalr	s3
    30e0:	afa20018 	sw	v0,24(sp)
    30e4:	0440ffa6 	bltz	v0,2f80 <HcdRequest+0x2a4>
    30e8:	00408021 	move	s0,v0
    30ec:	96420010 	lhu	v0,16(s2)
    30f0:	30420080 	andi	v0,v0,0x80
    30f4:	10400055 	beqz	v0,324c <HcdRequest+0x570>
    30f8:	3c020000 	lui	v0,0x0
			30f8: R_MIPS_HI16	HW_InOut_Token
    30fc:	34048000 	li	a0,0x8000
    3100:	afa40018 	sw	a0,24(sp)
    3104:	96420010 	lhu	v0,16(s2)
    3108:	3403c000 	li	v1,0xc000
    310c:	30420080 	andi	v0,v0,0x80
    3110:	0082180b 	movn	v1,a0,v0
    3114:	afa30018 	sw	v1,24(sp)
    3118:	96420018 	lhu	v0,24(s2)
    311c:	02202021 	move	a0,s1
    3120:	00431025 	or	v0,v0,v1
    3124:	00403021 	move	a2,v0
    3128:	24050700 	li	a1,1792
    312c:	0260f809 	jalr	s3
    3130:	afa20018 	sw	v0,24(sp)
    3134:	0440ff92 	bltz	v0,2f80 <HcdRequest+0x2a4>
    3138:	00408021 	move	s0,v0
    313c:	3c130000 	lui	s3,0x0
			313c: R_MIPS_HI16	.text
    3140:	26741d24 	addiu	s4,s3,7460
			3140: R_MIPS_LO16	.text
    3144:	24100003 	li	s0,3
    3148:	27b30018 	addiu	s3,sp,24
    314c:	02202021 	move	a0,s1
    3150:	24050500 	li	a1,1280
    3154:	0280f809 	jalr	s4
    3158:	02603021 	move	a2,s3
    315c:	0440005b 	bltz	v0,32cc <HcdRequest+0x5f0>
    3160:	2610ffff 	addiu	s0,s0,-1
    3164:	8fa20018 	lw	v0,24(sp)
    3168:	30420001 	andi	v0,v0,0x1
    316c:	14400057 	bnez	v0,32cc <HcdRequest+0x5f0>
    3170:	00000000 	nop
    3174:	1600fff6 	bnez	s0,3150 <HcdRequest+0x474>
    3178:	02202021 	move	a0,s1
    317c:	24020001 	li	v0,1
    3180:	a2220016 	sb	v0,22(s1)
    3184:	3c020000 	lui	v0,0x0
			3184: R_MIPS_HI16	HW_StartTimer
    3188:	240507d0 	li	a1,2000
    318c:	24420000 	addiu	v0,v0,0
			318c: R_MIPS_LO16	HW_StartTimer
    3190:	0040f809 	jalr	v0
    3194:	24060001 	li	a2,1
    3198:	96430010 	lhu	v1,16(s2)
    319c:	30630080 	andi	v1,v1,0x80
    31a0:	10600043 	beqz	v1,32b0 <HcdRequest+0x5d4>
    31a4:	00000000 	nop
    31a8:	3c020000 	lui	v0,0x0
			31a8: R_MIPS_HI16	.text
    31ac:	02202021 	move	a0,s1
    31b0:	24421f3c 	addiu	v0,v0,7996
			31b0: R_MIPS_LO16	.text
    31b4:	0040f809 	jalr	v0
    31b8:	24050200 	li	a1,512
    31bc:	24100003 	li	s0,3
    31c0:	8f830014 	lw	v1,20(gp)
    31c4:	3c040000 	lui	a0,0x0
			31c4: R_MIPS_HI16	local_bh_enable
    31c8:	2463ffff 	addiu	v1,v1,-1
    31cc:	24840000 	addiu	a0,a0,0
			31cc: R_MIPS_LO16	local_bh_enable
    31d0:	0080f809 	jalr	a0
    31d4:	af830014 	sw	v1,20(gp)
    31d8:	08000b62 	j	2d88 <HcdRequest+0xac>
			31d8: R_MIPS_26	.text
    31dc:	02001021 	move	v0,s0
    31e0:	34a20004 	ori	v0,a1,0x4
    31e4:	3046fffd 	andi	a2,v0,0xfffd
    31e8:	10c5ff02 	beq	a2,a1,2df4 <HcdRequest+0x118>
    31ec:	3c020000 	lui	v0,0x0
			31ec: R_MIPS_HI16	.text
    31f0:	a6260014 	sh	a2,20(s1)
    31f4:	02202021 	move	a0,s1
    31f8:	24421da4 	addiu	v0,v0,7588
			31f8: R_MIPS_LO16	.text
    31fc:	0040f809 	jalr	v0
    3200:	24050400 	li	a1,1024
    3204:	0440ff5e 	bltz	v0,2f80 <HcdRequest+0x2a4>
    3208:	00408021 	move	s0,v0
    320c:	08000b7d 	j	2df4 <HcdRequest+0x118>
			320c: R_MIPS_26	.text
    3210:	96430010 	lhu	v1,16(s2)
    3214:	96450018 	lhu	a1,24(s2)
    3218:	8e460014 	lw	a2,20(s2)
    321c:	24421da4 	addiu	v0,v0,7588
			321c: R_MIPS_LO16	.text
    3220:	0040f809 	jalr	v0
    3224:	02202021 	move	a0,s1
    3228:	08000be0 	j	2f80 <HcdRequest+0x2a4>
			3228: R_MIPS_26	.text
    322c:	00408021 	move	s0,v0
    3230:	8e23001c 	lw	v1,28(s1)
    3234:	8e460030 	lw	a2,48(s2)
    3238:	0066102b 	sltu	v0,v1,a2
    323c:	1040ff86 	beqz	v0,3058 <HcdRequest+0x37c>
    3240:	00661023 	subu	v0,v1,a2
    3244:	08000b9a 	j	2e68 <HcdRequest+0x18c>
			3244: R_MIPS_26	.text
    3248:	8e240020 	lw	a0,32(s1)
    324c:	02202021 	move	a0,s1
    3250:	24054a00 	li	a1,18944
    3254:	24060001 	li	a2,1
    3258:	24420000 	addiu	v0,v0,0
			3258: R_MIPS_LO16	HW_InOut_Token
    325c:	0040f809 	jalr	v0
    3260:	00003821 	move	a3,zero
    3264:	0440ff46 	bltz	v0,2f80 <HcdRequest+0x2a4>
    3268:	00408021 	move	s0,v0
    326c:	3c020000 	lui	v0,0x0
			326c: R_MIPS_HI16	.text
    3270:	02202021 	move	a0,s1
    3274:	24422264 	addiu	v0,v0,8804
			3274: R_MIPS_LO16	.text
    3278:	0040f809 	jalr	v0
    327c:	02402821 	move	a1,s2
    3280:	0441ff9e 	bgez	v0,30fc <HcdRequest+0x420>
    3284:	00408021 	move	s0,v0
    3288:	08000be1 	j	2f84 <HcdRequest+0x2a8>
			3288: R_MIPS_26	.text
    328c:	8f820014 	lw	v0,20(gp)
    3290:	08000ba0 	j	2e80 <HcdRequest+0x1a4>
			3290: R_MIPS_26	.text
    3294:	24060001 	li	a2,1
    3298:	8e220024 	lw	v0,36(s1)
    329c:	2c420002 	sltiu	v0,v0,2
    32a0:	1440feea 	bnez	v0,2e4c <HcdRequest+0x170>
    32a4:	00000000 	nop
    32a8:	08000b9b 	j	2e6c <HcdRequest+0x190>
			32a8: R_MIPS_26	.text
    32ac:	24060001 	li	a2,1
    32b0:	3c020000 	lui	v0,0x0
			32b0: R_MIPS_HI16	.text
    32b4:	02202021 	move	a0,s1
    32b8:	24421f3c 	addiu	v0,v0,7996
			32b8: R_MIPS_LO16	.text
    32bc:	0040f809 	jalr	v0
    32c0:	24050100 	li	a1,256
    32c4:	08000c70 	j	31c0 <HcdRequest+0x4e4>
			32c4: R_MIPS_26	.text
    32c8:	24100003 	li	s0,3
    32cc:	96420010 	lhu	v0,16(s2)
    32d0:	30420080 	andi	v0,v0,0x80
    32d4:	14400008 	bnez	v0,32f8 <HcdRequest+0x61c>
    32d8:	3c020000 	lui	v0,0x0
			32d8: R_MIPS_HI16	HW_InOut_Token
    32dc:	26a21da4 	addiu	v0,s5,7588
			32dc: R_MIPS_LO16	.text
    32e0:	02202021 	move	a0,s1
    32e4:	24050c00 	li	a1,3072
    32e8:	0040f809 	jalr	v0
    32ec:	24060300 	li	a2,768
    32f0:	08000be0 	j	2f80 <HcdRequest+0x2a4>
			32f0: R_MIPS_26	.text
    32f4:	00408021 	move	s0,v0
    32f8:	02202021 	move	a0,s1
    32fc:	3405c800 	li	a1,0xc800
    3300:	24060001 	li	a2,1
    3304:	24420000 	addiu	v0,v0,0
			3304: R_MIPS_LO16	HW_InOut_Token
    3308:	0040f809 	jalr	v0
    330c:	00003821 	move	a3,zero
    3310:	0440fff2 	bltz	v0,32dc <HcdRequest+0x600>
    3314:	3c020000 	lui	v0,0x0
			3314: R_MIPS_HI16	.text
    3318:	02202021 	move	a0,s1
    331c:	24422264 	addiu	v0,v0,8804
			331c: R_MIPS_LO16	.text
    3320:	0040f809 	jalr	v0
    3324:	02402821 	move	a1,s2
    3328:	08000cb8 	j	32e0 <HcdRequest+0x604>
			3328: R_MIPS_26	.text
    332c:	26a21da4 	addiu	v0,s5,7588
			332c: R_MIPS_LO16	.text
    3330:	8e22001c 	lw	v0,28(s1)
    3334:	8e430030 	lw	v1,48(s2)
    3338:	0043102b 	sltu	v0,v0,v1
    333c:	1040ff39 	beqz	v0,3024 <HcdRequest+0x348>
    3340:	27a60014 	addiu	a2,sp,20
    3344:	02202021 	move	a0,s1
    3348:	24050200 	li	a1,512
    334c:	afa00014 	sw	zero,20(sp)
    3350:	02c0f809 	jalr	s6
    3354:	afa00018 	sw	zero,24(sp)
    3358:	02202021 	move	a0,s1
    335c:	24050500 	li	a1,1280
    3360:	02c0f809 	jalr	s6
    3364:	27a60018 	addiu	a2,sp,24
    3368:	08000bb5 	j	2ed4 <HcdRequest+0x1f8>
			3368: R_MIPS_26	.text
    336c:	24020001 	li	v0,1
