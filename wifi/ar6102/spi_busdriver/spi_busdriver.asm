
../spi_busdriver.ko:     file format elf32-tradlittlemips

Disassembly of section .text:

00000000 <SynchCompletion>:
       0:	8c85003c 	lw	a1,60(a0)
       4:	24a60008 	addiu	a2,a1,8
       8:	3c020000 	lui	v0,0x0
			8: R_MIPS_HI16	cpu_data
       c:	8c430008 	lw	v1,8(v0)
			c: R_MIPS_LO16	cpu_data
      10:	3c040001 	lui	a0,0x1
      14:	00641824 	and	v1,v1,a0
      18:	1060000b 	beqz	v1,48 <SynchCompletion+0x48>
      1c:	00000000 	nop
      20:	c0a30008 	ll	v1,8(a1)
      24:	24620001 	addiu	v0,v1,1
      28:	e0a20008 	sc	v0,8(a1)
      2c:	10400875 	beqz	v0,2204 <_SDIO_UnregisterHostController+0x254>
      30:	00000000 	nop
      34:	24620001 	addiu	v0,v1,1
      38:	1840001a 	blez	v0,a4 <SynchCompletion+0xa4>
      3c:	00c02021 	move	a0,a2
      40:	03e00008 	jr	ra
      44:	00000000 	nop
      48:	40036000 	mfc0	v1,c0_status
      4c:	3461001f 	ori	at,v1,0x1f
      50:	3821001f 	xori	at,at,0x1f
      54:	40816000 	mtc0	at,c0_status
      58:	00000040 	ssnop
      5c:	00000040 	ssnop
      60:	00000040 	ssnop
      64:	000000c0 	sll	zero,zero,0x3
      68:	8ca20008 	lw	v0,8(a1)
      6c:	24420001 	addiu	v0,v0,1
      70:	aca20008 	sw	v0,8(a1)
      74:	40016000 	mfc0	at,c0_status
      78:	30630001 	andi	v1,v1,0x1
      7c:	3421001f 	ori	at,at,0x1f
      80:	3821001f 	xori	at,at,0x1f
      84:	00611825 	or	v1,v1,at
      88:	40836000 	mtc0	v1,c0_status
      8c:	00000040 	ssnop
      90:	00000040 	ssnop
      94:	00000040 	ssnop
      98:	000000c0 	sll	zero,zero,0x3
      9c:	0800000e 	j	38 <SynchCompletion+0x38>
			9c: R_MIPS_26	.text
      a0:	00000000 	nop
      a4:	3c190000 	lui	t9,0x0
			a4: R_MIPS_HI16	__up
      a8:	27390000 	addiu	t9,t9,0
			a8: R_MIPS_LO16	__up
      ac:	03200008 	jr	t9
      b0:	00000000 	nop

000000b4 <AllocateRequest>:
      b4:	27bdffe0 	addiu	sp,sp,-32
      b8:	afbf001c 	sw	ra,28(sp)
      bc:	afb20018 	sw	s2,24(sp)
      c0:	afb10014 	sw	s1,20(sp)
      c4:	afb00010 	sw	s0,16(sp)
      c8:	40066000 	mfc0	a2,c0_status
      cc:	34c1001f 	ori	at,a2,0x1f
      d0:	3821001f 	xori	at,at,0x1f
      d4:	40816000 	mtc0	at,c0_status
      d8:	00000040 	ssnop
      dc:	00000040 	ssnop
      e0:	00000040 	ssnop
      e4:	000000c0 	sll	zero,zero,0x3
      e8:	8f830014 	lw	v1,20(gp)
      ec:	24630001 	addiu	v1,v1,1
      f0:	af830014 	sw	v1,20(gp)
      f4:	3c120000 	lui	s2,0x0
			f4: R_MIPS_HI16	pBusContext
      f8:	8e450000 	lw	a1,0(s2)
			f8: R_MIPS_LO16	pBusContext
      fc:	90a2006e 	lbu	v0,110(a1)
     100:	30420004 	andi	v0,v0,0x4
     104:	1040000d 	beqz	v0,13c <AllocateRequest+0x88>
     108:	00008021 	move	s0,zero
     10c:	8ca30004 	lw	v1,4(a1)
     110:	10a30009 	beq	a1,v1,138 <AllocateRequest+0x84>
     114:	00608021 	move	s0,v1
     118:	8c620004 	lw	v0,4(v1)
     11c:	8c630000 	lw	v1,0(v1)
     120:	ac430000 	sw	v1,0(v0)
     124:	8e040000 	lw	a0,0(s0)
     128:	ae100000 	sw	s0,0(s0)
     12c:	ac820004 	sw	v0,4(a0)
     130:	0800004f 	j	13c <AllocateRequest+0x88>
			130: R_MIPS_26	.text
     134:	ae100004 	sw	s0,4(s0)
     138:	00008021 	move	s0,zero
     13c:	40016000 	mfc0	at,c0_status
     140:	30c60001 	andi	a2,a2,0x1
     144:	3421001f 	ori	at,at,0x1f
     148:	3821001f 	xori	at,at,0x1f
     14c:	00c13025 	or	a2,a2,at
     150:	40866000 	mtc0	a2,c0_status
     154:	00000040 	ssnop
     158:	00000040 	ssnop
     15c:	00000040 	ssnop
     160:	000000c0 	sll	zero,zero,0x3
     164:	8f830014 	lw	v1,20(gp)
     168:	2463ffff 	addiu	v1,v1,-1
     16c:	af830014 	sw	v1,20(gp)
     170:	8f830008 	lw	v1,8(gp)
     174:	30630004 	andi	v1,v1,0x4
     178:	14600056 	bnez	v1,2d4 <AllocateRequest+0x220>
     17c:	3c020000 	lui	v0,0x0
			17c: R_MIPS_HI16	preempt_schedule
     180:	12000011 	beqz	s0,1c8 <AllocateRequest+0x114>
     184:	8e420000 	lw	v0,0(s2)
			184: R_MIPS_LO16	pBusContext
     188:	02008821 	move	s1,s0
     18c:	8e30000c 	lw	s0,12(s1)
     190:	3c020000 	lui	v0,0x0
			190: R_MIPS_HI16	memset
     194:	02202021 	move	a0,s1
     198:	00002821 	move	a1,zero
     19c:	24420000 	addiu	v0,v0,0
			19c: R_MIPS_LO16	memset
     1a0:	0040f809 	jalr	v0
     1a4:	2406004c 	li	a2,76
     1a8:	ae30000c 	sw	s0,12(s1)
     1ac:	02201021 	move	v0,s1
     1b0:	8fbf001c 	lw	ra,28(sp)
     1b4:	8fb20018 	lw	s2,24(sp)
     1b8:	8fb10014 	lw	s1,20(sp)
     1bc:	8fb00010 	lw	s0,16(sp)
     1c0:	03e00008 	jr	ra
     1c4:	27bd0020 	addiu	sp,sp,32
     1c8:	9042006e 	lbu	v0,110(v0)
     1cc:	30420004 	andi	v0,v0,0x4
     1d0:	10400030 	beqz	v0,294 <AllocateRequest+0x1e0>
     1d4:	3c020000 	lui	v0,0x0
			1d4: R_MIPS_HI16	malloc_sizes
     1d8:	8c440014 	lw	a0,20(v0)
			1d8: R_MIPS_LO16	malloc_sizes
     1dc:	3c020000 	lui	v0,0x0
			1dc: R_MIPS_HI16	kmem_cache_alloc
     1e0:	24420000 	addiu	v0,v0,0
			1e0: R_MIPS_LO16	kmem_cache_alloc
     1e4:	0040f809 	jalr	v0
     1e8:	24050020 	li	a1,32
     1ec:	00408821 	move	s1,v0
     1f0:	24020004 	li	v0,4
     1f4:	1220ffed 	beqz	s1,1ac <AllocateRequest+0xf8>
     1f8:	00000000 	nop
     1fc:	ae22000c 	sw	v0,12(s1)
     200:	40056000 	mfc0	a1,c0_status
     204:	34a1001f 	ori	at,a1,0x1f
     208:	3821001f 	xori	at,at,0x1f
     20c:	40816000 	mtc0	at,c0_status
     210:	00000040 	ssnop
     214:	00000040 	ssnop
     218:	00000040 	ssnop
     21c:	000000c0 	sll	zero,zero,0x3
     220:	8f820014 	lw	v0,20(gp)
     224:	24420001 	addiu	v0,v0,1
     228:	af820014 	sw	v0,20(gp)
     22c:	8e430000 	lw	v1,0(s2)
			22c: R_MIPS_LO16	pBusContext
     230:	8c620054 	lw	v0,84(v1)
     234:	24420001 	addiu	v0,v0,1
     238:	ac620054 	sw	v0,84(v1)
     23c:	40016000 	mfc0	at,c0_status
     240:	30a50001 	andi	a1,a1,0x1
     244:	3421001f 	ori	at,at,0x1f
     248:	3821001f 	xori	at,at,0x1f
     24c:	00a12825 	or	a1,a1,at
     250:	40856000 	mtc0	a1,c0_status
     254:	00000040 	ssnop
     258:	00000040 	ssnop
     25c:	00000040 	ssnop
     260:	000000c0 	sll	zero,zero,0x3
     264:	8f830014 	lw	v1,20(gp)
     268:	2463ffff 	addiu	v1,v1,-1
     26c:	af830014 	sw	v1,20(gp)
     270:	8f830008 	lw	v1,8(gp)
     274:	30630004 	andi	v1,v1,0x4
     278:	1060ffc4 	beqz	v1,18c <AllocateRequest+0xd8>
     27c:	3c020000 	lui	v0,0x0
			27c: R_MIPS_HI16	preempt_schedule
     280:	24420000 	addiu	v0,v0,0
			280: R_MIPS_LO16	preempt_schedule
     284:	0040f809 	jalr	v0
     288:	00000000 	nop
     28c:	08000064 	j	190 <AllocateRequest+0xdc>
			28c: R_MIPS_26	.text
     290:	8e30000c 	lw	s0,12(s1)
     294:	8c440014 	lw	a0,20(v0)
			294: R_MIPS_LO16	malloc_sizes
     298:	3c020000 	lui	v0,0x0
			298: R_MIPS_HI16	kmem_cache_alloc
     29c:	24420000 	addiu	v0,v0,0
			29c: R_MIPS_LO16	kmem_cache_alloc
     2a0:	0040f809 	jalr	v0
     2a4:	240500d0 	li	a1,208
     2a8:	10400007 	beqz	v0,2c8 <AllocateRequest+0x214>
     2ac:	00408021 	move	s0,v0
     2b0:	00402021 	move	a0,v0
     2b4:	3c020000 	lui	v0,0x0
			2b4: R_MIPS_HI16	memset
     2b8:	00002821 	move	a1,zero
     2bc:	24420000 	addiu	v0,v0,0
			2bc: R_MIPS_LO16	memset
     2c0:	0040f809 	jalr	v0
     2c4:	2406004c 	li	a2,76
     2c8:	02008821 	move	s1,s0
     2cc:	0800007d 	j	1f4 <AllocateRequest+0x140>
			2cc: R_MIPS_26	.text
     2d0:	00001021 	move	v0,zero
     2d4:	24420000 	addiu	v0,v0,0
			2d4: R_MIPS_LO16	preempt_schedule
     2d8:	0040f809 	jalr	v0
     2dc:	00000000 	nop
     2e0:	08000060 	j	180 <AllocateRequest+0xcc>
			2e0: R_MIPS_26	.text
     2e4:	00000000 	nop

000002e8 <IssueAllocRequest>:
     2e8:	3c190000 	lui	t9,0x0
			2e8: R_MIPS_HI16	AllocateRequest
     2ec:	27390000 	addiu	t9,t9,0
			2ec: R_MIPS_LO16	AllocateRequest
     2f0:	03200008 	jr	t9
     2f4:	00000000 	nop

000002f8 <AllocateDevice>:
     2f8:	27bdffe0 	addiu	sp,sp,-32
     2fc:	afb20018 	sw	s2,24(sp)
     300:	afb10014 	sw	s1,20(sp)
     304:	afb00010 	sw	s0,16(sp)
     308:	afbf001c 	sw	ra,28(sp)
     30c:	3c020000 	lui	v0,0x0
			30c: R_MIPS_HI16	malloc_sizes
     310:	00809021 	move	s2,a0
     314:	8c44004c 	lw	a0,76(v0)
			314: R_MIPS_LO16	malloc_sizes
     318:	3c020000 	lui	v0,0x0
			318: R_MIPS_HI16	kmem_cache_alloc
     31c:	24420000 	addiu	v0,v0,0
			31c: R_MIPS_LO16	kmem_cache_alloc
     320:	0040f809 	jalr	v0
     324:	240500d0 	li	a1,208
     328:	3c030000 	lui	v1,0x0
			328: R_MIPS_HI16	memset
     32c:	00408021 	move	s0,v0
     330:	24710000 	addiu	s1,v1,0
			330: R_MIPS_LO16	memset
     334:	00402021 	move	a0,v0
     338:	00002821 	move	a1,zero
     33c:	10400025 	beqz	v0,3d4 <AllocateDevice+0xdc>
     340:	24060808 	li	a2,2056
     344:	0220f809 	jalr	s1
     348:	00000000 	nop
     34c:	02002021 	move	a0,s0
     350:	00002821 	move	a1,zero
     354:	0220f809 	jalr	s1
     358:	24060808 	li	a2,2056
     35c:	3c020000 	lui	v0,0x0
			35c: R_MIPS_HI16	IssueBusRequest
     360:	3c030000 	lui	v1,0x0
			360: R_MIPS_HI16	IssueBusConfig
     364:	24420000 	addiu	v0,v0,0
			364: R_MIPS_LO16	IssueBusRequest
     368:	24630000 	addiu	v1,v1,0
			368: R_MIPS_LO16	IssueBusConfig
     36c:	ae020010 	sw	v0,16(s0)
     370:	ae030014 	sw	v1,20(s0)
     374:	3c020000 	lui	v0,0x0
			374: R_MIPS_HI16	IssueAllocRequest
     378:	3c030000 	lui	v1,0x0
			378: R_MIPS_HI16	IssueFreeRequest
     37c:	26040008 	addiu	a0,s0,8
     380:	24420000 	addiu	v0,v0,0
			380: R_MIPS_LO16	IssueAllocRequest
     384:	24630000 	addiu	v1,v1,0
			384: R_MIPS_LO16	IssueFreeRequest
     388:	ae04000c 	sw	a0,12(s0)
     38c:	ae020018 	sw	v0,24(s0)
     390:	ae03001c 	sw	v1,28(s0)
     394:	ae100000 	sw	s0,0(s0)
     398:	ae100004 	sw	s0,4(s0)
     39c:	ae040008 	sw	a0,8(s0)
     3a0:	9642004a 	lhu	v0,74(s2)
     3a4:	ae120034 	sw	s2,52(s0)
     3a8:	a6020038 	sh	v0,56(s0)
     3ac:	24020027 	li	v0,39
     3b0:	a2020801 	sb	v0,2049(s0)
     3b4:	ae000030 	sw	zero,48(s0)
     3b8:	02001021 	move	v0,s0
     3bc:	8fbf001c 	lw	ra,28(sp)
     3c0:	8fb20018 	lw	s2,24(sp)
     3c4:	8fb10014 	lw	s1,20(sp)
     3c8:	8fb00010 	lw	s0,16(sp)
     3cc:	03e00008 	jr	ra
     3d0:	27bd0020 	addiu	sp,sp,32
     3d4:	080000ee 	j	3b8 <AllocateDevice+0xc0>
			3d4: R_MIPS_26	.text
     3d8:	00008021 	move	s0,zero

000003dc <AllocateSignal>:
     3dc:	27bdffe0 	addiu	sp,sp,-32
     3e0:	afbf001c 	sw	ra,28(sp)
     3e4:	afb20018 	sw	s2,24(sp)
     3e8:	afb10014 	sw	s1,20(sp)
     3ec:	afb00010 	sw	s0,16(sp)
     3f0:	40056000 	mfc0	a1,c0_status
     3f4:	34a1001f 	ori	at,a1,0x1f
     3f8:	3821001f 	xori	at,at,0x1f
     3fc:	40816000 	mtc0	at,c0_status
     400:	00000040 	ssnop
     404:	00000040 	ssnop
     408:	00000040 	ssnop
     40c:	000000c0 	sll	zero,zero,0x3
     410:	8f830014 	lw	v1,20(gp)
     414:	24630001 	addiu	v1,v1,1
     418:	af830014 	sw	v1,20(gp)
     41c:	3c120000 	lui	s2,0x0
			41c: R_MIPS_HI16	pBusContext
     420:	8e430000 	lw	v1,0(s2)
			420: R_MIPS_LO16	pBusContext
     424:	9062006e 	lbu	v0,110(v1)
     428:	30420004 	andi	v0,v0,0x4
     42c:	10400027 	beqz	v0,4cc <AllocateSignal+0xf0>
     430:	00008021 	move	s0,zero
     434:	24620008 	addiu	v0,v1,8
     438:	8c430004 	lw	v1,4(v0)
     43c:	10430022 	beq	v0,v1,4c8 <AllocateSignal+0xec>
     440:	00608021 	move	s0,v1
     444:	8c620004 	lw	v0,4(v1)
     448:	8c630000 	lw	v1,0(v1)
     44c:	ac430000 	sw	v1,0(v0)
     450:	8e040000 	lw	a0,0(s0)
     454:	ae100000 	sw	s0,0(s0)
     458:	ac820004 	sw	v0,4(a0)
     45c:	ae100004 	sw	s0,4(s0)
     460:	40016000 	mfc0	at,c0_status
     464:	30a50001 	andi	a1,a1,0x1
     468:	3421001f 	ori	at,at,0x1f
     46c:	3821001f 	xori	at,at,0x1f
     470:	00a12825 	or	a1,a1,at
     474:	40856000 	mtc0	a1,c0_status
     478:	00000040 	ssnop
     47c:	00000040 	ssnop
     480:	00000040 	ssnop
     484:	000000c0 	sll	zero,zero,0x3
     488:	8f830014 	lw	v1,20(gp)
     48c:	2463ffff 	addiu	v1,v1,-1
     490:	af830014 	sw	v1,20(gp)
     494:	8f830008 	lw	v1,8(gp)
     498:	30630004 	andi	v1,v1,0x4
     49c:	1460001c 	bnez	v1,510 <AllocateSignal+0x134>
     4a0:	3c020000 	lui	v0,0x0
			4a0: R_MIPS_HI16	preempt_schedule
     4a4:	12000020 	beqz	s0,528 <AllocateSignal+0x14c>
     4a8:	3c020000 	lui	v0,0x0
			4a8: R_MIPS_HI16	malloc_sizes
     4ac:	02001021 	move	v0,s0
     4b0:	8fbf001c 	lw	ra,28(sp)
     4b4:	8fb20018 	lw	s2,24(sp)
     4b8:	8fb10014 	lw	s1,20(sp)
     4bc:	8fb00010 	lw	s0,16(sp)
     4c0:	03e00008 	jr	ra
     4c4:	27bd0020 	addiu	sp,sp,32
     4c8:	00008021 	move	s0,zero
     4cc:	40016000 	mfc0	at,c0_status
     4d0:	30a50001 	andi	a1,a1,0x1
     4d4:	3421001f 	ori	at,at,0x1f
     4d8:	3821001f 	xori	at,at,0x1f
     4dc:	00a12825 	or	a1,a1,at
     4e0:	40856000 	mtc0	a1,c0_status
     4e4:	00000040 	ssnop
     4e8:	00000040 	ssnop
     4ec:	00000040 	ssnop
     4f0:	000000c0 	sll	zero,zero,0x3
     4f4:	8f830014 	lw	v1,20(gp)
     4f8:	2463ffff 	addiu	v1,v1,-1
     4fc:	af830014 	sw	v1,20(gp)
     500:	8f830008 	lw	v1,8(gp)
     504:	30630004 	andi	v1,v1,0x4
     508:	1060ffe6 	beqz	v1,4a4 <AllocateSignal+0xc8>
     50c:	3c020000 	lui	v0,0x0
			50c: R_MIPS_HI16	preempt_schedule
     510:	24420000 	addiu	v0,v0,0
			510: R_MIPS_LO16	preempt_schedule
     514:	0040f809 	jalr	v0
     518:	00000000 	nop
     51c:	1600ffe4 	bnez	s0,4b0 <AllocateSignal+0xd4>
     520:	02001021 	move	v0,s0
     524:	3c020000 	lui	v0,0x0
			524: R_MIPS_HI16	malloc_sizes
     528:	8c440004 	lw	a0,4(v0)
			528: R_MIPS_LO16	malloc_sizes
     52c:	3c020000 	lui	v0,0x0
			52c: R_MIPS_HI16	kmem_cache_alloc
     530:	24420000 	addiu	v0,v0,0
			530: R_MIPS_LO16	kmem_cache_alloc
     534:	0040f809 	jalr	v0
     538:	240500d0 	li	a1,208
     53c:	10400033 	beqz	v0,60c <AllocateSignal+0x230>
     540:	00408821 	move	s1,v0
     544:	00402021 	move	a0,v0
     548:	3c020000 	lui	v0,0x0
			548: R_MIPS_HI16	memset
     54c:	00002821 	move	a1,zero
     550:	24420000 	addiu	v0,v0,0
			550: R_MIPS_LO16	memset
     554:	0040f809 	jalr	v0
     558:	24060014 	li	a2,20
     55c:	3c020000 	lui	v0,0x0
			55c: R_MIPS_HI16	init_waitqueue_head
     560:	ae200008 	sw	zero,8(s1)
     564:	2624000c 	addiu	a0,s1,12
     568:	24420000 	addiu	v0,v0,0
			568: R_MIPS_LO16	init_waitqueue_head
     56c:	0040f809 	jalr	v0
     570:	02208021 	move	s0,s1
     574:	40046000 	mfc0	a0,c0_status
     578:	3481001f 	ori	at,a0,0x1f
     57c:	3821001f 	xori	at,at,0x1f
     580:	40816000 	mtc0	at,c0_status
     584:	00000040 	ssnop
     588:	00000040 	ssnop
     58c:	00000040 	ssnop
     590:	000000c0 	sll	zero,zero,0x3
     594:	8f820014 	lw	v0,20(gp)
     598:	24420001 	addiu	v0,v0,1
     59c:	af820014 	sw	v0,20(gp)
     5a0:	12200004 	beqz	s1,5b4 <AllocateSignal+0x1d8>
     5a4:	8e430000 	lw	v1,0(s2)
			5a4: R_MIPS_LO16	pBusContext
     5a8:	8c620058 	lw	v0,88(v1)
     5ac:	24420001 	addiu	v0,v0,1
     5b0:	ac620058 	sw	v0,88(v1)
     5b4:	40016000 	mfc0	at,c0_status
     5b8:	30840001 	andi	a0,a0,0x1
     5bc:	3421001f 	ori	at,at,0x1f
     5c0:	3821001f 	xori	at,at,0x1f
     5c4:	00812025 	or	a0,a0,at
     5c8:	40846000 	mtc0	a0,c0_status
     5cc:	00000040 	ssnop
     5d0:	00000040 	ssnop
     5d4:	00000040 	ssnop
     5d8:	000000c0 	sll	zero,zero,0x3
     5dc:	8f830014 	lw	v1,20(gp)
     5e0:	2463ffff 	addiu	v1,v1,-1
     5e4:	af830014 	sw	v1,20(gp)
     5e8:	8f830008 	lw	v1,8(gp)
     5ec:	30630004 	andi	v1,v1,0x4
     5f0:	1060ffae 	beqz	v1,4ac <AllocateSignal+0xd0>
     5f4:	3c020000 	lui	v0,0x0
			5f4: R_MIPS_HI16	preempt_schedule
     5f8:	24420000 	addiu	v0,v0,0
			5f8: R_MIPS_LO16	preempt_schedule
     5fc:	0040f809 	jalr	v0
     600:	00000000 	nop
     604:	0800012c 	j	4b0 <AllocateSignal+0xd4>
			604: R_MIPS_26	.text
     608:	02001021 	move	v0,s0
     60c:	0800015d 	j	574 <AllocateSignal+0x198>
			60c: R_MIPS_26	.text
     610:	00008021 	move	s0,zero

00000614 <DestroySignal>:
     614:	3c190000 	lui	t9,0x0
			614: R_MIPS_HI16	kfree
     618:	27390000 	addiu	t9,t9,0
			618: R_MIPS_LO16	kfree
     61c:	03200008 	jr	t9
     620:	00000000 	nop

00000624 <FreeSignal>:
     624:	27bdffe8 	addiu	sp,sp,-24
     628:	afb00010 	sw	s0,16(sp)
     62c:	afbf0014 	sw	ra,20(sp)
     630:	00808021 	move	s0,a0
     634:	40056000 	mfc0	a1,c0_status
     638:	34a1001f 	ori	at,a1,0x1f
     63c:	3821001f 	xori	at,at,0x1f
     640:	40816000 	mtc0	at,c0_status
     644:	00000040 	ssnop
     648:	00000040 	ssnop
     64c:	00000040 	ssnop
     650:	000000c0 	sll	zero,zero,0x3
     654:	8f820014 	lw	v0,20(gp)
     658:	24420001 	addiu	v0,v0,1
     65c:	af820014 	sw	v0,20(gp)
     660:	3c020000 	lui	v0,0x0
			660: R_MIPS_HI16	pBusContext
     664:	8c430000 	lw	v1,0(v0)
			664: R_MIPS_LO16	pBusContext
     668:	8c640058 	lw	a0,88(v1)
     66c:	8c620060 	lw	v0,96(v1)
     670:	0044102a 	slt	v0,v0,a0
     674:	14400022 	bnez	v0,700 <FreeSignal+0xdc>
     678:	2482ffff 	addiu	v0,a0,-1
     67c:	24620008 	addiu	v0,v1,8
     680:	8c430004 	lw	v1,4(v0)
     684:	ae020000 	sw	v0,0(s0)
     688:	ae030004 	sw	v1,4(s0)
     68c:	8c440004 	lw	a0,4(v0)
     690:	ac500004 	sw	s0,4(v0)
     694:	ac900000 	sw	s0,0(a0)
     698:	00008021 	move	s0,zero
     69c:	40016000 	mfc0	at,c0_status
     6a0:	30a50001 	andi	a1,a1,0x1
     6a4:	3421001f 	ori	at,at,0x1f
     6a8:	3821001f 	xori	at,at,0x1f
     6ac:	00a12825 	or	a1,a1,at
     6b0:	40856000 	mtc0	a1,c0_status
     6b4:	00000040 	ssnop
     6b8:	00000040 	ssnop
     6bc:	00000040 	ssnop
     6c0:	000000c0 	sll	zero,zero,0x3
     6c4:	8f830014 	lw	v1,20(gp)
     6c8:	2463ffff 	addiu	v1,v1,-1
     6cc:	af830014 	sw	v1,20(gp)
     6d0:	8f830008 	lw	v1,8(gp)
     6d4:	30630004 	andi	v1,v1,0x4
     6d8:	1460000f 	bnez	v1,718 <FreeSignal+0xf4>
     6dc:	3c020000 	lui	v0,0x0
			6dc: R_MIPS_HI16	preempt_schedule
     6e0:	12000009 	beqz	s0,708 <FreeSignal+0xe4>
     6e4:	3c190000 	lui	t9,0x0
			6e4: R_MIPS_HI16	.text
     6e8:	02002021 	move	a0,s0
     6ec:	8fbf0014 	lw	ra,20(sp)
     6f0:	8fb00010 	lw	s0,16(sp)
     6f4:	27390614 	addiu	t9,t9,1556
			6f4: R_MIPS_LO16	.text
     6f8:	03200008 	jr	t9
     6fc:	27bd0018 	addiu	sp,sp,24
     700:	080001a7 	j	69c <FreeSignal+0x78>
			700: R_MIPS_26	.text
     704:	ac620058 	sw	v0,88(v1)
     708:	8fbf0014 	lw	ra,20(sp)
     70c:	8fb00010 	lw	s0,16(sp)
     710:	03e00008 	jr	ra
     714:	27bd0018 	addiu	sp,sp,24
     718:	24420000 	addiu	v0,v0,0
			718: R_MIPS_LO16	preempt_schedule
     71c:	0040f809 	jalr	v0
     720:	00000000 	nop
     724:	080001b8 	j	6e0 <FreeSignal+0xbc>
			724: R_MIPS_26	.text
     728:	00000000 	nop

0000072c <IssueRequestToHCD>:
     72c:	27bdffd8 	addiu	sp,sp,-40
     730:	afb20018 	sw	s2,24(sp)
     734:	afb00010 	sw	s0,16(sp)
     738:	afbf0024 	sw	ra,36(sp)
     73c:	afb40020 	sw	s4,32(sp)
     740:	afb3001c 	sw	s3,28(sp)
     744:	afb10014 	sw	s1,20(sp)
     748:	8ca20008 	lw	v0,8(a1)
     74c:	2403feff 	li	v1,-257
     750:	00431024 	and	v0,v0,v1
     754:	00a08021 	move	s0,a1
     758:	aca20008 	sw	v0,8(a1)
     75c:	00809021 	move	s2,a0
     760:	3c140000 	lui	s4,0x0
			760: R_MIPS_HI16	cpu_data
     764:	26830000 	addiu	v1,s4,0
			764: R_MIPS_LO16	cpu_data
     768:	8c620008 	lw	v0,8(v1)
     76c:	3c040001 	lui	a0,0x1
     770:	00441024 	and	v0,v0,a0
     774:	1040009a 	beqz	v0,9e0 <IssueRequestToHCD+0x2b4>
     778:	34028000 	li	v0,0x8000
     77c:	c0a4000c 	ll	a0,12(a1)
     780:	00821825 	or	v1,a0,v0
     784:	e0a3000c 	sc	v1,12(a1)
     788:	106006a0 	beqz	v1,220c <_SDIO_UnregisterHostController+0x25c>
     78c:	00821824 	and	v1,a0,v0
     790:	8e020008 	lw	v0,8(s0)
     794:	30421000 	andi	v0,v0,0x1000
     798:	104000ac 	beqz	v0,a4c <IssueRequestToHCD+0x320>
     79c:	3c020000 	lui	v0,0x0
			79c: R_MIPS_HI16	.text
     7a0:	00009821 	move	s3,zero
     7a4:	8e020044 	lw	v0,68(s0)
     7a8:	10400039 	beqz	v0,890 <IssueRequestToHCD+0x164>
     7ac:	00000000 	nop
     7b0:	904200d8 	lbu	v0,216(v0)
     7b4:	30420001 	andi	v0,v0,0x1
     7b8:	10400035 	beqz	v0,890 <IssueRequestToHCD+0x164>
     7bc:	2402fff8 	li	v0,-8
     7c0:	2411ffde 	li	s1,-34
     7c4:	ae020040 	sw	v0,64(s0)
     7c8:	26820000 	addiu	v0,s4,0
			7c8: R_MIPS_LO16	cpu_data
     7cc:	8c430008 	lw	v1,8(v0)
     7d0:	3c040001 	lui	a0,0x1
     7d4:	00641824 	and	v1,v1,a0
     7d8:	106000e1 	beqz	v1,b60 <IssueRequestToHCD+0x434>
     7dc:	34028000 	li	v0,0x8000
     7e0:	c204000c 	ll	a0,12(s0)
     7e4:	00821825 	or	v1,a0,v0
     7e8:	00621826 	xor	v1,v1,v0
     7ec:	e203000c 	sc	v1,12(s0)
     7f0:	10600688 	beqz	v1,2214 <_SDIO_UnregisterHostController+0x264>
     7f4:	00821824 	and	v1,a0,v0
     7f8:	8e040008 	lw	a0,8(s0)
     7fc:	30821000 	andi	v0,a0,0x1000
     800:	10400015 	beqz	v0,858 <IssueRequestToHCD+0x12c>
     804:	2402feff 	li	v0,-257
     808:	8e030038 	lw	v1,56(s0)
     80c:	00821024 	and	v0,a0,v0
     810:	1060016a 	beqz	v1,dbc <IssueRequestToHCD+0x690>
     814:	ae020008 	sw	v0,8(s0)
     818:	26820000 	addiu	v0,s4,0
			818: R_MIPS_LO16	cpu_data
     81c:	8c430008 	lw	v1,8(v0)
     820:	3c040001 	lui	a0,0x1
     824:	00641824 	and	v1,v1,a0
     828:	10600114 	beqz	v1,c7c <IssueRequestToHCD+0x550>
     82c:	34028000 	li	v0,0x8000
     830:	c204000c 	ll	a0,12(s0)
     834:	00821825 	or	v1,a0,v0
     838:	00621826 	xor	v1,v1,v0
     83c:	e203000c 	sc	v1,12(s0)
     840:	10600676 	beqz	v1,221c <_SDIO_UnregisterHostController+0x26c>
     844:	00821824 	and	v1,a0,v0
     848:	8e020038 	lw	v0,56(s0)
     84c:	0040f809 	jalr	v0
     850:	02002021 	move	a0,s0
     854:	24110003 	li	s1,3
     858:	12600004 	beqz	s3,86c <IssueRequestToHCD+0x140>
     85c:	3c020000 	lui	v0,0x0
			85c: R_MIPS_HI16	FreeSignal
     860:	24420000 	addiu	v0,v0,0
			860: R_MIPS_LO16	FreeSignal
     864:	0040f809 	jalr	v0
     868:	02602021 	move	a0,s3
     86c:	02201021 	move	v0,s1
     870:	8fbf0024 	lw	ra,36(sp)
     874:	8fb40020 	lw	s4,32(sp)
     878:	8fb3001c 	lw	s3,28(sp)
     87c:	8fb20018 	lw	s2,24(sp)
     880:	8fb10014 	lw	s1,20(sp)
     884:	8fb00010 	lw	s0,16(sp)
     888:	03e00008 	jr	ra
     88c:	27bd0028 	addiu	sp,sp,40
     890:	40066000 	mfc0	a2,c0_status
     894:	34c1001f 	ori	at,a2,0x1f
     898:	3821001f 	xori	at,at,0x1f
     89c:	40816000 	mtc0	at,c0_status
     8a0:	00000040 	ssnop
     8a4:	00000040 	ssnop
     8a8:	00000040 	ssnop
     8ac:	000000c0 	sll	zero,zero,0x3
     8b0:	8f820014 	lw	v0,20(gp)
     8b4:	24420001 	addiu	v0,v0,1
     8b8:	af820014 	sw	v0,20(gp)
     8bc:	8e020008 	lw	v0,8(s0)
     8c0:	3c030400 	lui	v1,0x400
     8c4:	00431024 	and	v0,v0,v1
     8c8:	1040006a 	beqz	v0,a74 <IssueRequestToHCD+0x348>
     8cc:	26440038 	addiu	a0,s2,56
     8d0:	8c820004 	lw	v0,4(a0)
     8d4:	ae040000 	sw	a0,0(s0)
     8d8:	ae020004 	sw	v0,4(s0)
     8dc:	8c830004 	lw	v1,4(a0)
     8e0:	ac900004 	sw	s0,4(a0)
     8e4:	ac700000 	sw	s0,0(v1)
     8e8:	8c850004 	lw	a1,4(a0)
     8ec:	10850009 	beq	a0,a1,914 <IssueRequestToHCD+0x1e8>
     8f0:	00003821 	move	a3,zero
     8f4:	8ca20004 	lw	v0,4(a1)
     8f8:	8ca30000 	lw	v1,0(a1)
     8fc:	00a03821 	move	a3,a1
     900:	ac430000 	sw	v1,0(v0)
     904:	8ca40000 	lw	a0,0(a1)
     908:	aca50000 	sw	a1,0(a1)
     90c:	ac820004 	sw	v0,4(a0)
     910:	aca50004 	sw	a1,4(a1)
     914:	92420000 	lbu	v0,0(s2)
     918:	3042000f 	andi	v0,v0,0xf
     91c:	28420006 	slti	v0,v0,6
     920:	1440000a 	bnez	v0,94c <IssueRequestToHCD+0x220>
     924:	ae470044 	sw	a3,68(s2)
     928:	8e4200a8 	lw	v0,168(s2)
     92c:	3c030000 	lui	v1,0x0
			92c: R_MIPS_HI16	pBusContext
     930:	24420001 	addiu	v0,v0,1
     934:	ae4200a8 	sw	v0,168(s2)
     938:	8c640000 	lw	a0,0(v1)
			938: R_MIPS_LO16	pBusContext
     93c:	8c8500a4 	lw	a1,164(a0)
     940:	00a2102a 	slt	v0,a1,v0
     944:	144000bf 	bnez	v0,c44 <IssueRequestToHCD+0x518>
     948:	00000000 	nop
     94c:	40016000 	mfc0	at,c0_status
     950:	30c60001 	andi	a2,a2,0x1
     954:	3421001f 	ori	at,at,0x1f
     958:	3821001f 	xori	at,at,0x1f
     95c:	00c13025 	or	a2,a2,at
     960:	40866000 	mtc0	a2,c0_status
     964:	00000040 	ssnop
     968:	00000040 	ssnop
     96c:	00000040 	ssnop
     970:	000000c0 	sll	zero,zero,0x3
     974:	8f830014 	lw	v1,20(gp)
     978:	2463ffff 	addiu	v1,v1,-1
     97c:	af830014 	sw	v1,20(gp)
     980:	8f830008 	lw	v1,8(gp)
     984:	30630004 	andi	v1,v1,0x4
     988:	14600134 	bnez	v1,e5c <IssueRequestToHCD+0x730>
     98c:	3c020000 	lui	v0,0x0
			98c: R_MIPS_HI16	preempt_schedule
     990:	8e460044 	lw	a2,68(s2)
     994:	3c020008 	lui	v0,0x8
     998:	8cc50008 	lw	a1,8(a2)
     99c:	00a21024 	and	v0,a1,v0
     9a0:	10400089 	beqz	v0,bc8 <IssueRequestToHCD+0x49c>
     9a4:	3c020000 	lui	v0,0x0
			9a4: R_MIPS_HI16	pBusContext
     9a8:	00008821 	move	s1,zero
     9ac:	24020003 	li	v0,3
     9b0:	1222004d 	beq	s1,v0,ae8 <IssueRequestToHCD+0x3bc>
     9b4:	00000000 	nop
     9b8:	126000ca 	beqz	s3,ce4 <IssueRequestToHCD+0x5b8>
     9bc:	00000000 	nop
     9c0:	ae000038 	sw	zero,56(s0)
     9c4:	3c020000 	lui	v0,0x0
			9c4: R_MIPS_HI16	_SDIO_HandleHcdEvent
     9c8:	02402021 	move	a0,s2
     9cc:	24420000 	addiu	v0,v0,0
			9cc: R_MIPS_LO16	_SDIO_HandleHcdEvent
     9d0:	0040f809 	jalr	v0
     9d4:	24050004 	li	a1,4
     9d8:	08000216 	j	858 <IssueRequestToHCD+0x12c>
			9d8: R_MIPS_26	.text
     9dc:	00000000 	nop
     9e0:	40026000 	mfc0	v0,c0_status
     9e4:	3441001f 	ori	at,v0,0x1f
     9e8:	3821001f 	xori	at,at,0x1f
     9ec:	40816000 	mtc0	at,c0_status
     9f0:	00000040 	ssnop
     9f4:	00000040 	ssnop
     9f8:	00000040 	ssnop
     9fc:	000000c0 	sll	zero,zero,0x3
     a00:	8ca4000c 	lw	a0,12(a1)
     a04:	8ca3000c 	lw	v1,12(a1)
     a08:	34638000 	ori	v1,v1,0x8000
     a0c:	aca3000c 	sw	v1,12(a1)
     a10:	40016000 	mfc0	at,c0_status
     a14:	30420001 	andi	v0,v0,0x1
     a18:	3421001f 	ori	at,at,0x1f
     a1c:	3821001f 	xori	at,at,0x1f
     a20:	00411025 	or	v0,v0,at
     a24:	40826000 	mtc0	v0,c0_status
     a28:	00000040 	ssnop
     a2c:	00000040 	ssnop
     a30:	00000040 	ssnop
     a34:	000000c0 	sll	zero,zero,0x3
     a38:	8e020008 	lw	v0,8(s0)
     a3c:	30421000 	andi	v0,v0,0x1000
     a40:	1440ff58 	bnez	v0,7a4 <IssueRequestToHCD+0x78>
     a44:	00009821 	move	s3,zero
     a48:	3c020000 	lui	v0,0x0
			a48: R_MIPS_HI16	.text
     a4c:	24420000 	addiu	v0,v0,0
			a4c: R_MIPS_LO16	.text
     a50:	ae020038 	sw	v0,56(s0)
     a54:	3c020000 	lui	v0,0x0
			a54: R_MIPS_HI16	AllocateSignal
     a58:	24420000 	addiu	v0,v0,0
			a58: R_MIPS_LO16	AllocateSignal
     a5c:	0040f809 	jalr	v0
     a60:	00000000 	nop
     a64:	104000b8 	beqz	v0,d48 <IssueRequestToHCD+0x61c>
     a68:	00409821 	move	s3,v0
     a6c:	080001e9 	j	7a4 <IssueRequestToHCD+0x78>
			a6c: R_MIPS_26	.text
     a70:	ae02003c 	sw	v0,60(s0)
     a74:	8e420038 	lw	v0,56(s2)
     a78:	ae020000 	sw	v0,0(s0)
     a7c:	8e430038 	lw	v1,56(s2)
     a80:	ae040004 	sw	a0,4(s0)
     a84:	ac700004 	sw	s0,4(v1)
     a88:	92420040 	lbu	v0,64(s2)
     a8c:	1040006a 	beqz	v0,c38 <IssueRequestToHCD+0x50c>
     a90:	ae500038 	sw	s0,56(s2)
     a94:	40016000 	mfc0	at,c0_status
     a98:	30c60001 	andi	a2,a2,0x1
     a9c:	3421001f 	ori	at,at,0x1f
     aa0:	3821001f 	xori	at,at,0x1f
     aa4:	00c13025 	or	a2,a2,at
     aa8:	40866000 	mtc0	a2,c0_status
     aac:	00000040 	ssnop
     ab0:	00000040 	ssnop
     ab4:	00000040 	ssnop
     ab8:	000000c0 	sll	zero,zero,0x3
     abc:	8f830014 	lw	v1,20(gp)
     ac0:	2463ffff 	addiu	v1,v1,-1
     ac4:	af830014 	sw	v1,20(gp)
     ac8:	8f830008 	lw	v1,8(gp)
     acc:	30630004 	andi	v1,v1,0x4
     ad0:	146000e7 	bnez	v1,e70 <IssueRequestToHCD+0x744>
     ad4:	3c020000 	lui	v0,0x0
			ad4: R_MIPS_HI16	preempt_schedule
     ad8:	24110003 	li	s1,3
     adc:	24020003 	li	v0,3
     ae0:	1622ffb5 	bne	s1,v0,9b8 <IssueRequestToHCD+0x28c>
     ae4:	00000000 	nop
     ae8:	1260ff60 	beqz	s3,86c <IssueRequestToHCD+0x140>
     aec:	26650008 	addiu	a1,s3,8
     af0:	26820000 	addiu	v0,s4,0
			af0: R_MIPS_LO16	cpu_data
     af4:	8c430008 	lw	v1,8(v0)
     af8:	3c040001 	lui	a0,0x1
     afc:	00641824 	and	v1,v1,a0
     b00:	1060007a 	beqz	v1,cec <IssueRequestToHCD+0x5c0>
     b04:	00000000 	nop
     b08:	c2630008 	ll	v1,8(s3)
     b0c:	2462ffff 	addiu	v0,v1,-1
     b10:	e2620008 	sc	v0,8(s3)
     b14:	104005c3 	beqz	v0,2224 <_SDIO_UnregisterHostController+0x274>
     b18:	00000000 	nop
     b1c:	2462ffff 	addiu	v0,v1,-1
     b20:	044000d8 	bltz	v0,e84 <IssueRequestToHCD+0x758>
     b24:	3c020000 	lui	v0,0x0
			b24: R_MIPS_HI16	__down
     b28:	3c020000 	lui	v0,0x0
			b28: R_MIPS_HI16	FreeSignal
     b2c:	24420000 	addiu	v0,v0,0
			b2c: R_MIPS_LO16	FreeSignal
     b30:	0040f809 	jalr	v0
     b34:	02602021 	move	a0,s3
     b38:	8e110040 	lw	s1,64(s0)
     b3c:	8fbf0024 	lw	ra,36(sp)
     b40:	02201021 	move	v0,s1
     b44:	8fb40020 	lw	s4,32(sp)
     b48:	8fb3001c 	lw	s3,28(sp)
     b4c:	8fb20018 	lw	s2,24(sp)
     b50:	8fb10014 	lw	s1,20(sp)
     b54:	8fb00010 	lw	s0,16(sp)
     b58:	03e00008 	jr	ra
     b5c:	27bd0028 	addiu	sp,sp,40
     b60:	40046000 	mfc0	a0,c0_status
     b64:	3481001f 	ori	at,a0,0x1f
     b68:	3821001f 	xori	at,at,0x1f
     b6c:	40816000 	mtc0	at,c0_status
     b70:	00000040 	ssnop
     b74:	00000040 	ssnop
     b78:	00000040 	ssnop
     b7c:	000000c0 	sll	zero,zero,0x3
     b80:	8e02000c 	lw	v0,12(s0)
     b84:	8e03000c 	lw	v1,12(s0)
     b88:	3c02ffff 	lui	v0,0xffff
     b8c:	34427fff 	ori	v0,v0,0x7fff
     b90:	00621824 	and	v1,v1,v0
     b94:	ae03000c 	sw	v1,12(s0)
     b98:	40016000 	mfc0	at,c0_status
     b9c:	30840001 	andi	a0,a0,0x1
     ba0:	3421001f 	ori	at,at,0x1f
     ba4:	3821001f 	xori	at,at,0x1f
     ba8:	00812025 	or	a0,a0,at
     bac:	40846000 	mtc0	a0,c0_status
     bb0:	00000040 	ssnop
     bb4:	00000040 	ssnop
     bb8:	00000040 	ssnop
     bbc:	000000c0 	sll	zero,zero,0x3
     bc0:	080001fe 	j	7f8 <IssueRequestToHCD+0xcc>
			bc0: R_MIPS_26	.text
     bc4:	00000000 	nop
     bc8:	8c440000 	lw	a0,0(v0)
			bc8: R_MIPS_LO16	pBusContext
     bcc:	908300a0 	lbu	v1,160(a0)
     bd0:	30630001 	andi	v1,v1,0x1
     bd4:	1460001f 	bnez	v1,c54 <IssueRequestToHCD+0x528>
     bd8:	34a20100 	ori	v0,a1,0x100
     bdc:	92420000 	lbu	v0,0(s2)
     be0:	3042000f 	andi	v0,v0,0xf
     be4:	28420006 	slti	v0,v0,6
     be8:	1040001b 	beqz	v0,c58 <IssueRequestToHCD+0x52c>
     bec:	00000000 	nop
     bf0:	26820000 	addiu	v0,s4,0
			bf0: R_MIPS_LO16	cpu_data
     bf4:	8c430008 	lw	v1,8(v0)
     bf8:	3c040001 	lui	a0,0x1
     bfc:	00641824 	and	v1,v1,a0
     c00:	10600055 	beqz	v1,d58 <IssueRequestToHCD+0x62c>
     c04:	24020001 	li	v0,1
     c08:	c2430090 	ll	v1,144(s2)
     c0c:	00622025 	or	a0,v1,v0
     c10:	e2440090 	sc	a0,144(s2)
     c14:	10800585 	beqz	a0,222c <_SDIO_UnregisterHostController+0x27c>
     c18:	00622024 	and	a0,v1,v0
     c1c:	1080000e 	beqz	a0,c58 <IssueRequestToHCD+0x52c>
     c20:	00000000 	nop
     c24:	8e430044 	lw	v1,68(s2)
     c28:	8c620008 	lw	v0,8(v1)
     c2c:	34420100 	ori	v0,v0,0x100
     c30:	08000316 	j	c58 <IssueRequestToHCD+0x52c>
			c30: R_MIPS_26	.text
     c34:	ac620008 	sw	v0,8(v1)
     c38:	24020001 	li	v0,1
     c3c:	0800023a 	j	8e8 <IssueRequestToHCD+0x1bc>
			c3c: R_MIPS_26	.text
     c40:	a2420040 	sb	v0,64(s2)
     c44:	8ce20008 	lw	v0,8(a3)
     c48:	34420100 	ori	v0,v0,0x100
     c4c:	08000253 	j	94c <IssueRequestToHCD+0x220>
			c4c: R_MIPS_26	.text
     c50:	ace20008 	sw	v0,8(a3)
     c54:	acc20008 	sw	v0,8(a2)
     c58:	8e420024 	lw	v0,36(s2)
     c5c:	0040f809 	jalr	v0
     c60:	02402021 	move	a0,s2
     c64:	00408821 	move	s1,v0
     c68:	2402ffde 	li	v0,-34
     c6c:	1622ff50 	bne	s1,v0,9b0 <IssueRequestToHCD+0x284>
     c70:	24020003 	li	v0,3
     c74:	080001f2 	j	7c8 <IssueRequestToHCD+0x9c>
			c74: R_MIPS_26	.text
     c78:	00000000 	nop
     c7c:	40046000 	mfc0	a0,c0_status
     c80:	3481001f 	ori	at,a0,0x1f
     c84:	3821001f 	xori	at,at,0x1f
     c88:	40816000 	mtc0	at,c0_status
     c8c:	00000040 	ssnop
     c90:	00000040 	ssnop
     c94:	00000040 	ssnop
     c98:	000000c0 	sll	zero,zero,0x3
     c9c:	8e02000c 	lw	v0,12(s0)
     ca0:	8e03000c 	lw	v1,12(s0)
     ca4:	3c02ffff 	lui	v0,0xffff
     ca8:	34427fff 	ori	v0,v0,0x7fff
     cac:	00621824 	and	v1,v1,v0
     cb0:	ae03000c 	sw	v1,12(s0)
     cb4:	40016000 	mfc0	at,c0_status
     cb8:	30840001 	andi	a0,a0,0x1
     cbc:	3421001f 	ori	at,at,0x1f
     cc0:	3821001f 	xori	at,at,0x1f
     cc4:	00812025 	or	a0,a0,at
     cc8:	40846000 	mtc0	a0,c0_status
     ccc:	00000040 	ssnop
     cd0:	00000040 	ssnop
     cd4:	00000040 	ssnop
     cd8:	000000c0 	sll	zero,zero,0x3
     cdc:	08000212 	j	848 <IssueRequestToHCD+0x11c>
			cdc: R_MIPS_26	.text
     ce0:	00000000 	nop
     ce4:	08000271 	j	9c4 <IssueRequestToHCD+0x298>
			ce4: R_MIPS_26	.text
     ce8:	24110003 	li	s1,3
     cec:	40036000 	mfc0	v1,c0_status
     cf0:	3461001f 	ori	at,v1,0x1f
     cf4:	3821001f 	xori	at,at,0x1f
     cf8:	40816000 	mtc0	at,c0_status
     cfc:	00000040 	ssnop
     d00:	00000040 	ssnop
     d04:	00000040 	ssnop
     d08:	000000c0 	sll	zero,zero,0x3
     d0c:	8e620008 	lw	v0,8(s3)
     d10:	2442ffff 	addiu	v0,v0,-1
     d14:	ae620008 	sw	v0,8(s3)
     d18:	40016000 	mfc0	at,c0_status
     d1c:	30630001 	andi	v1,v1,0x1
     d20:	3421001f 	ori	at,at,0x1f
     d24:	3821001f 	xori	at,at,0x1f
     d28:	00611825 	or	v1,v1,at
     d2c:	40836000 	mtc0	v1,c0_status
     d30:	00000040 	ssnop
     d34:	00000040 	ssnop
     d38:	00000040 	ssnop
     d3c:	000000c0 	sll	zero,zero,0x3
     d40:	080002c8 	j	b20 <IssueRequestToHCD+0x3f4>
			d40: R_MIPS_26	.text
     d44:	00000000 	nop
     d48:	2402fff9 	li	v0,-7
     d4c:	2411fff9 	li	s1,-7
     d50:	080001f2 	j	7c8 <IssueRequestToHCD+0x9c>
			d50: R_MIPS_26	.text
     d54:	ae020040 	sw	v0,64(s0)
     d58:	40026000 	mfc0	v0,c0_status
     d5c:	3441001f 	ori	at,v0,0x1f
     d60:	3821001f 	xori	at,at,0x1f
     d64:	40816000 	mtc0	at,c0_status
     d68:	00000040 	ssnop
     d6c:	00000040 	ssnop
     d70:	00000040 	ssnop
     d74:	000000c0 	sll	zero,zero,0x3
     d78:	8e440090 	lw	a0,144(s2)
     d7c:	8e430090 	lw	v1,144(s2)
     d80:	30840001 	andi	a0,a0,0x1
     d84:	34630001 	ori	v1,v1,0x1
     d88:	ae430090 	sw	v1,144(s2)
     d8c:	40016000 	mfc0	at,c0_status
     d90:	30420001 	andi	v0,v0,0x1
     d94:	3421001f 	ori	at,at,0x1f
     d98:	3821001f 	xori	at,at,0x1f
     d9c:	00411025 	or	v0,v0,at
     da0:	40826000 	mtc0	v0,c0_status
     da4:	00000040 	ssnop
     da8:	00000040 	ssnop
     dac:	00000040 	ssnop
     db0:	000000c0 	sll	zero,zero,0x3
     db4:	08000307 	j	c1c <IssueRequestToHCD+0x4f0>
			db4: R_MIPS_26	.text
     db8:	00000000 	nop
     dbc:	26820000 	addiu	v0,s4,0
			dbc: R_MIPS_LO16	cpu_data
     dc0:	8c430008 	lw	v1,8(v0)
     dc4:	3c040001 	lui	a0,0x1
     dc8:	00641824 	and	v1,v1,a0
     dcc:	10600009 	beqz	v1,df4 <IssueRequestToHCD+0x6c8>
     dd0:	34028000 	li	v0,0x8000
     dd4:	c204000c 	ll	a0,12(s0)
     dd8:	00821825 	or	v1,a0,v0
     ddc:	00621826 	xor	v1,v1,v0
     de0:	e203000c 	sc	v1,12(s0)
     de4:	10600513 	beqz	v1,2234 <_SDIO_UnregisterHostController+0x284>
     de8:	00821824 	and	v1,a0,v0
     dec:	08000216 	j	858 <IssueRequestToHCD+0x12c>
			dec: R_MIPS_26	.text
     df0:	24110003 	li	s1,3
     df4:	40046000 	mfc0	a0,c0_status
     df8:	3481001f 	ori	at,a0,0x1f
     dfc:	3821001f 	xori	at,at,0x1f
     e00:	40816000 	mtc0	at,c0_status
     e04:	00000040 	ssnop
     e08:	00000040 	ssnop
     e0c:	00000040 	ssnop
     e10:	000000c0 	sll	zero,zero,0x3
     e14:	8e02000c 	lw	v0,12(s0)
     e18:	8e03000c 	lw	v1,12(s0)
     e1c:	3c02ffff 	lui	v0,0xffff
     e20:	34427fff 	ori	v0,v0,0x7fff
     e24:	00621824 	and	v1,v1,v0
     e28:	ae03000c 	sw	v1,12(s0)
     e2c:	40016000 	mfc0	at,c0_status
     e30:	30840001 	andi	a0,a0,0x1
     e34:	3421001f 	ori	at,at,0x1f
     e38:	3821001f 	xori	at,at,0x1f
     e3c:	00812025 	or	a0,a0,at
     e40:	40846000 	mtc0	a0,c0_status
     e44:	00000040 	ssnop
     e48:	00000040 	ssnop
     e4c:	00000040 	ssnop
     e50:	000000c0 	sll	zero,zero,0x3
     e54:	0800037b 	j	dec <IssueRequestToHCD+0x6c0>
			e54: R_MIPS_26	.text
     e58:	00000000 	nop
     e5c:	24420000 	addiu	v0,v0,0
			e5c: R_MIPS_LO16	preempt_schedule
     e60:	0040f809 	jalr	v0
     e64:	00000000 	nop
     e68:	08000265 	j	994 <IssueRequestToHCD+0x268>
			e68: R_MIPS_26	.text
     e6c:	8e460044 	lw	a2,68(s2)
     e70:	24420000 	addiu	v0,v0,0
			e70: R_MIPS_LO16	preempt_schedule
     e74:	0040f809 	jalr	v0
     e78:	24110003 	li	s1,3
     e7c:	0800026c 	j	9b0 <IssueRequestToHCD+0x284>
			e7c: R_MIPS_26	.text
     e80:	24020003 	li	v0,3
     e84:	24420000 	addiu	v0,v0,0
			e84: R_MIPS_LO16	__down
     e88:	0040f809 	jalr	v0
     e8c:	00a02021 	move	a0,a1
     e90:	080002cb 	j	b2c <IssueRequestToHCD+0x400>
			e90: R_MIPS_26	.text
     e94:	3c020000 	lui	v0,0x0
			e94: R_MIPS_HI16	FreeSignal

00000e98 <IssueBusRequest>:
     e98:	8c820030 	lw	v0,48(a0)
     e9c:	3c190000 	lui	t9,0x0
			e9c: R_MIPS_HI16	IssueRequestToHCD
     ea0:	aca20044 	sw	v0,68(a1)
     ea4:	27390000 	addiu	t9,t9,0
			ea4: R_MIPS_LO16	IssueRequestToHCD
     ea8:	03200008 	jr	t9
     eac:	8c840034 	lw	a0,52(a0)

00000eb0 <FreeRequest>:
     eb0:	27bdffe8 	addiu	sp,sp,-24
     eb4:	afb00010 	sw	s0,16(sp)
     eb8:	afbf0014 	sw	ra,20(sp)
     ebc:	00808021 	move	s0,a0
     ec0:	40056000 	mfc0	a1,c0_status
     ec4:	34a1001f 	ori	at,a1,0x1f
     ec8:	3821001f 	xori	at,at,0x1f
     ecc:	40816000 	mtc0	at,c0_status
     ed0:	00000040 	ssnop
     ed4:	00000040 	ssnop
     ed8:	00000040 	ssnop
     edc:	000000c0 	sll	zero,zero,0x3
     ee0:	8f820014 	lw	v0,20(gp)
     ee4:	24420001 	addiu	v0,v0,1
     ee8:	af820014 	sw	v0,20(gp)
     eec:	3c020000 	lui	v0,0x0
			eec: R_MIPS_HI16	pBusContext
     ef0:	8c440000 	lw	a0,0(v0)
			ef0: R_MIPS_LO16	pBusContext
     ef4:	8c830054 	lw	v1,84(a0)
     ef8:	8c82005c 	lw	v0,92(a0)
     efc:	0043102a 	slt	v0,v0,v1
     f00:	10400005 	beqz	v0,f18 <FreeRequest+0x68>
     f04:	00000000 	nop
     f08:	8e02000c 	lw	v0,12(s0)
     f0c:	30420004 	andi	v0,v0,0x4
     f10:	14400028 	bnez	v0,fb4 <FreeRequest+0x104>
     f14:	2462ffff 	addiu	v0,v1,-1
     f18:	8c820004 	lw	v0,4(a0)
     f1c:	ae040000 	sw	a0,0(s0)
     f20:	ae020004 	sw	v0,4(s0)
     f24:	8c830004 	lw	v1,4(a0)
     f28:	ac900004 	sw	s0,4(a0)
     f2c:	ac700000 	sw	s0,0(v1)
     f30:	00008021 	move	s0,zero
     f34:	40016000 	mfc0	at,c0_status
     f38:	30a50001 	andi	a1,a1,0x1
     f3c:	3421001f 	ori	at,at,0x1f
     f40:	3821001f 	xori	at,at,0x1f
     f44:	00a12825 	or	a1,a1,at
     f48:	40856000 	mtc0	a1,c0_status
     f4c:	00000040 	ssnop
     f50:	00000040 	ssnop
     f54:	00000040 	ssnop
     f58:	000000c0 	sll	zero,zero,0x3
     f5c:	8f830014 	lw	v1,20(gp)
     f60:	2463ffff 	addiu	v1,v1,-1
     f64:	af830014 	sw	v1,20(gp)
     f68:	8f830008 	lw	v1,8(gp)
     f6c:	30630004 	andi	v1,v1,0x4
     f70:	14600012 	bnez	v1,fbc <FreeRequest+0x10c>
     f74:	3c020000 	lui	v0,0x0
			f74: R_MIPS_HI16	preempt_schedule
     f78:	12000005 	beqz	s0,f90 <FreeRequest+0xe0>
     f7c:	8fbf0014 	lw	ra,20(sp)
     f80:	8e02000c 	lw	v0,12(s0)
     f84:	30420004 	andi	v0,v0,0x4
     f88:	14400004 	bnez	v0,f9c <FreeRequest+0xec>
     f8c:	3c190000 	lui	t9,0x0
			f8c: R_MIPS_HI16	kfree
     f90:	8fb00010 	lw	s0,16(sp)
     f94:	03e00008 	jr	ra
     f98:	27bd0018 	addiu	sp,sp,24
     f9c:	02002021 	move	a0,s0
     fa0:	8fbf0014 	lw	ra,20(sp)
     fa4:	8fb00010 	lw	s0,16(sp)
     fa8:	27390000 	addiu	t9,t9,0
			fa8: R_MIPS_LO16	kfree
     fac:	03200008 	jr	t9
     fb0:	27bd0018 	addiu	sp,sp,24
     fb4:	080003cd 	j	f34 <FreeRequest+0x84>
			fb4: R_MIPS_26	.text
     fb8:	ac820054 	sw	v0,84(a0)
     fbc:	24420000 	addiu	v0,v0,0
			fbc: R_MIPS_LO16	preempt_schedule
     fc0:	0040f809 	jalr	v0
     fc4:	00000000 	nop
     fc8:	080003de 	j	f78 <FreeRequest+0xc8>
			fc8: R_MIPS_26	.text
     fcc:	00000000 	nop

00000fd0 <SendSyncedHcdBusConfig>:
     fd0:	27bdffd8 	addiu	sp,sp,-40
     fd4:	3c020000 	lui	v0,0x0
			fd4: R_MIPS_HI16	AllocateSignal
     fd8:	afb3001c 	sw	s3,28(sp)
     fdc:	afb20018 	sw	s2,24(sp)
     fe0:	afb00010 	sw	s0,16(sp)
     fe4:	afbf0020 	sw	ra,32(sp)
     fe8:	afb10014 	sw	s1,20(sp)
     fec:	24420000 	addiu	v0,v0,0
			fec: R_MIPS_LO16	AllocateSignal
     ff0:	00809821 	move	s3,a0
     ff4:	0040f809 	jalr	v0
     ff8:	00a08021 	move	s0,a1
     ffc:	1040003a 	beqz	v0,10e8 <SendSyncedHcdBusConfig+0x118>
    1000:	00409021 	move	s2,v0
    1004:	3c020000 	lui	v0,0x0
			1004: R_MIPS_HI16	AllocateRequest
    1008:	24420000 	addiu	v0,v0,0
			1008: R_MIPS_LO16	AllocateRequest
    100c:	0040f809 	jalr	v0
    1010:	00000000 	nop
    1014:	10400034 	beqz	v0,10e8 <SendSyncedHcdBusConfig+0x118>
    1018:	00408821 	move	s1,v0
    101c:	3c020000 	lui	v0,0x0
			101c: R_MIPS_HI16	.text
    1020:	24421808 	addiu	v0,v0,6152
			1020: R_MIPS_LO16	.text
    1024:	ae220038 	sw	v0,56(s1)
    1028:	ae30003c 	sw	s0,60(s1)
    102c:	ae320034 	sw	s2,52(s1)
    1030:	8e630034 	lw	v1,52(s3)
    1034:	3c02000c 	lui	v0,0xc
    1038:	34421000 	ori	v0,v0,0x1000
    103c:	ae220008 	sw	v0,8(s1)
    1040:	ae23002c 	sw	v1,44(s1)
    1044:	ae200040 	sw	zero,64(s1)
    1048:	8e640034 	lw	a0,52(s3)
    104c:	3c020000 	lui	v0,0x0
			104c: R_MIPS_HI16	IssueRequestToHCD
    1050:	24420000 	addiu	v0,v0,0
			1050: R_MIPS_LO16	IssueRequestToHCD
    1054:	0040f809 	jalr	v0
    1058:	02202821 	move	a1,s1
    105c:	04400011 	bltz	v0,10a4 <SendSyncedHcdBusConfig+0xd4>
    1060:	00408021 	move	s0,v0
    1064:	26450008 	addiu	a1,s2,8
    1068:	3c020000 	lui	v0,0x0
			1068: R_MIPS_HI16	cpu_data
    106c:	8c430008 	lw	v1,8(v0)
			106c: R_MIPS_LO16	cpu_data
    1070:	3c040001 	lui	a0,0x1
    1074:	00641824 	and	v1,v1,a0
    1078:	1060001d 	beqz	v1,10f0 <SendSyncedHcdBusConfig+0x120>
    107c:	00000000 	nop
    1080:	c2430008 	ll	v1,8(s2)
    1084:	2462ffff 	addiu	v0,v1,-1
    1088:	e2420008 	sc	v0,8(s2)
    108c:	1040046b 	beqz	v0,223c <_SDIO_UnregisterHostController+0x28c>
    1090:	00000000 	nop
    1094:	2462ffff 	addiu	v0,v1,-1
    1098:	0440002c 	bltz	v0,114c <SendSyncedHcdBusConfig+0x17c>
    109c:	3c020000 	lui	v0,0x0
			109c: R_MIPS_HI16	__down
    10a0:	8e300040 	lw	s0,64(s1)
    10a4:	3c020000 	lui	v0,0x0
			10a4: R_MIPS_HI16	FreeRequest
    10a8:	24420000 	addiu	v0,v0,0
			10a8: R_MIPS_LO16	FreeRequest
    10ac:	0040f809 	jalr	v0
    10b0:	02202021 	move	a0,s1
    10b4:	12400004 	beqz	s2,10c8 <SendSyncedHcdBusConfig+0xf8>
    10b8:	3c020000 	lui	v0,0x0
			10b8: R_MIPS_HI16	FreeSignal
    10bc:	24420000 	addiu	v0,v0,0
			10bc: R_MIPS_LO16	FreeSignal
    10c0:	0040f809 	jalr	v0
    10c4:	02402021 	move	a0,s2
    10c8:	02001021 	move	v0,s0
    10cc:	8fbf0020 	lw	ra,32(sp)
    10d0:	8fb3001c 	lw	s3,28(sp)
    10d4:	8fb20018 	lw	s2,24(sp)
    10d8:	8fb10014 	lw	s1,20(sp)
    10dc:	8fb00010 	lw	s0,16(sp)
    10e0:	03e00008 	jr	ra
    10e4:	27bd0028 	addiu	sp,sp,40
    10e8:	0800042d 	j	10b4 <SendSyncedHcdBusConfig+0xe4>
			10e8: R_MIPS_26	.text
    10ec:	2410fff9 	li	s0,-7
    10f0:	40036000 	mfc0	v1,c0_status
    10f4:	3461001f 	ori	at,v1,0x1f
    10f8:	3821001f 	xori	at,at,0x1f
    10fc:	40816000 	mtc0	at,c0_status
    1100:	00000040 	ssnop
    1104:	00000040 	ssnop
    1108:	00000040 	ssnop
    110c:	000000c0 	sll	zero,zero,0x3
    1110:	8e420008 	lw	v0,8(s2)
    1114:	2442ffff 	addiu	v0,v0,-1
    1118:	ae420008 	sw	v0,8(s2)
    111c:	40016000 	mfc0	at,c0_status
    1120:	30630001 	andi	v1,v1,0x1
    1124:	3421001f 	ori	at,at,0x1f
    1128:	3821001f 	xori	at,at,0x1f
    112c:	00611825 	or	v1,v1,at
    1130:	40836000 	mtc0	v1,c0_status
    1134:	00000040 	ssnop
    1138:	00000040 	ssnop
    113c:	00000040 	ssnop
    1140:	000000c0 	sll	zero,zero,0x3
    1144:	08000426 	j	1098 <SendSyncedHcdBusConfig+0xc8>
			1144: R_MIPS_26	.text
    1148:	00000000 	nop
    114c:	24420000 	addiu	v0,v0,0
			114c: R_MIPS_LO16	__down
    1150:	0040f809 	jalr	v0
    1154:	00a02021 	move	a0,a1
    1158:	08000429 	j	10a4 <SendSyncedHcdBusConfig+0xd4>
			1158: R_MIPS_26	.text
    115c:	8e300040 	lw	s0,64(s1)

00001160 <IssueBusConfig>:
    1160:	94a30000 	lhu	v1,0(a1)
    1164:	00031400 	sll	v0,v1,0x10
    1168:	00021403 	sra	v0,v0,0x10
    116c:	04400011 	bltz	v0,11b4 <IssueBusConfig+0x54>
    1170:	8ca60008 	lw	a2,8(a1)
    1174:	30624000 	andi	v0,v1,0x4000
    1178:	1440000e 	bnez	v0,11b4 <IssueBusConfig+0x54>
    117c:	00000000 	nop
    1180:	24020016 	li	v0,22
    1184:	10620010 	beq	v1,v0,11c8 <IssueBusConfig+0x68>
    1188:	24020017 	li	v0,23
    118c:	1062001a 	beq	v1,v0,11f8 <IssueBusConfig+0x98>
    1190:	24020015 	li	v0,21
    1194:	10620010 	beq	v1,v0,11d8 <IssueBusConfig+0x78>
    1198:	30622000 	andi	v0,v1,0x2000
    119c:	10400008 	beqz	v0,11c0 <IssueBusConfig+0x60>
    11a0:	00000000 	nop
    11a4:	3c190000 	lui	t9,0x0
			11a4: R_MIPS_HI16	SendSyncedHcdBusConfig
    11a8:	27390000 	addiu	t9,t9,0
			11a8: R_MIPS_LO16	SendSyncedHcdBusConfig
    11ac:	03200008 	jr	t9
    11b0:	00000000 	nop
    11b4:	8ca20004 	lw	v0,4(a1)
    11b8:	1440000b 	bnez	v0,11e8 <IssueBusConfig+0x88>
    11bc:	00000000 	nop
    11c0:	03e00008 	jr	ra
    11c4:	2402fffe 	li	v0,-2
    11c8:	3c190000 	lui	t9,0x0
			11c8: R_MIPS_HI16	SDMaskUnmaskFunctionIRQ
    11cc:	27390000 	addiu	t9,t9,0
			11cc: R_MIPS_LO16	SDMaskUnmaskFunctionIRQ
    11d0:	03200008 	jr	t9
    11d4:	24050001 	li	a1,1
    11d8:	3c190000 	lui	t9,0x0
			11d8: R_MIPS_HI16	SDMaskUnmaskFunctionIRQ
    11dc:	27390000 	addiu	t9,t9,0
			11dc: R_MIPS_LO16	SDMaskUnmaskFunctionIRQ
    11e0:	03200008 	jr	t9
    11e4:	00002821 	move	a1,zero
    11e8:	14c0ffe5 	bnez	a2,1180 <IssueBusConfig+0x20>
    11ec:	00000000 	nop
    11f0:	08000470 	j	11c0 <IssueBusConfig+0x60>
			11f0: R_MIPS_26	.text
    11f4:	00000000 	nop
    11f8:	3c190000 	lui	t9,0x0
			11f8: R_MIPS_HI16	SDFunctionAckInterrupt
    11fc:	27390000 	addiu	t9,t9,0
			11fc: R_MIPS_LO16	SDFunctionAckInterrupt
    1200:	03200008 	jr	t9
    1204:	00000000 	nop

00001208 <IssueFreeRequest>:
    1208:	3c190000 	lui	t9,0x0
			1208: R_MIPS_HI16	FreeRequest
    120c:	27390000 	addiu	t9,t9,0
			120c: R_MIPS_LO16	FreeRequest
    1210:	03200008 	jr	t9
    1214:	00a02021 	move	a0,a1

00001218 <FreeDevice>:
    1218:	3c190000 	lui	t9,0x0
			1218: R_MIPS_HI16	kfree
    121c:	27390000 	addiu	t9,t9,0
			121c: R_MIPS_LO16	kfree
    1220:	03200008 	jr	t9
    1224:	00000000 	nop

00001228 <DeleteDevices>:
    1228:	27bdffd8 	addiu	sp,sp,-40
    122c:	afb10014 	sw	s1,20(sp)
    1230:	3c110000 	lui	s1,0x0
			1230: R_MIPS_HI16	pBusContext
    1234:	8e250000 	lw	a1,0(s1)
			1234: R_MIPS_LO16	pBusContext
    1238:	afb20018 	sw	s2,24(sp)
    123c:	afbf0024 	sw	ra,36(sp)
    1240:	afb40020 	sw	s4,32(sp)
    1244:	afb3001c 	sw	s3,28(sp)
    1248:	afb00010 	sw	s0,16(sp)
    124c:	00809021 	move	s2,a0
    1250:	24a6002c 	addiu	a2,a1,44
    1254:	3c140000 	lui	s4,0x0
			1254: R_MIPS_HI16	cpu_data
    1258:	26820000 	addiu	v0,s4,0
			1258: R_MIPS_LO16	cpu_data
    125c:	8c430008 	lw	v1,8(v0)
    1260:	3c040001 	lui	a0,0x1
    1264:	00641824 	and	v1,v1,a0
    1268:	10600053 	beqz	v1,13b8 <DeleteDevices+0x190>
    126c:	00000000 	nop
    1270:	c0a3002c 	ll	v1,44(a1)
    1274:	2462ffff 	addiu	v0,v1,-1
    1278:	e0a2002c 	sc	v0,44(a1)
    127c:	104003f1 	beqz	v0,2244 <_SDIO_UnregisterHostController+0x294>
    1280:	00000000 	nop
    1284:	2462ffff 	addiu	v0,v1,-1
    1288:	04400067 	bltz	v0,1428 <DeleteDevices+0x200>
    128c:	3c020000 	lui	v0,0x0
			128c: R_MIPS_HI16	__down_interruptible
    1290:	8e220000 	lw	v0,0(s1)
			1290: R_MIPS_LO16	pBusContext
    1294:	3c030000 	lui	v1,0x0
			1294: R_MIPS_HI16	FreeDevice
    1298:	8c500028 	lw	s0,40(v0)
    129c:	24730000 	addiu	s3,v1,0
			129c: R_MIPS_LO16	FreeDevice
    12a0:	8e250000 	lw	a1,0(s1)
			12a0: R_MIPS_LO16	pBusContext
    12a4:	02003021 	move	a2,s0
    12a8:	24a20024 	addiu	v0,a1,36
    12ac:	12020013 	beq	s0,v0,12fc <DeleteDevices+0xd4>
    12b0:	02002021 	move	a0,s0
    12b4:	12400004 	beqz	s2,12c8 <DeleteDevices+0xa0>
    12b8:	8e100004 	lw	s0,4(s0)
    12bc:	8cc20034 	lw	v0,52(a2)
    12c0:	1642fff8 	bne	s2,v0,12a4 <DeleteDevices+0x7c>
    12c4:	8e250000 	lw	a1,0(s1)
			12c4: R_MIPS_LO16	pBusContext
    12c8:	8cc20004 	lw	v0,4(a2)
    12cc:	8cc30000 	lw	v1,0(a2)
    12d0:	ac430000 	sw	v1,0(v0)
    12d4:	8cc50000 	lw	a1,0(a2)
    12d8:	acc60000 	sw	a2,0(a2)
    12dc:	aca20004 	sw	v0,4(a1)
    12e0:	0260f809 	jalr	s3
    12e4:	acc60004 	sw	a2,4(a2)
    12e8:	8e250000 	lw	a1,0(s1)
			12e8: R_MIPS_LO16	pBusContext
    12ec:	02003021 	move	a2,s0
    12f0:	24a20024 	addiu	v0,a1,36
    12f4:	1602ffef 	bne	s0,v0,12b4 <DeleteDevices+0x8c>
    12f8:	02002021 	move	a0,s0
    12fc:	24a6002c 	addiu	a2,a1,44
    1300:	26820000 	addiu	v0,s4,0
			1300: R_MIPS_LO16	cpu_data
    1304:	8c430008 	lw	v1,8(v0)
    1308:	3c040001 	lui	a0,0x1
    130c:	00641824 	and	v1,v1,a0
    1310:	10600012 	beqz	v1,135c <DeleteDevices+0x134>
    1314:	00000000 	nop
    1318:	c0a3002c 	ll	v1,44(a1)
    131c:	24620001 	addiu	v0,v1,1
    1320:	e0a2002c 	sc	v0,44(a1)
    1324:	104003c9 	beqz	v0,224c <_SDIO_UnregisterHostController+0x29c>
    1328:	00000000 	nop
    132c:	24620001 	addiu	v0,v1,1
    1330:	18400038 	blez	v0,1414 <DeleteDevices+0x1ec>
    1334:	3c020000 	lui	v0,0x0
			1334: R_MIPS_HI16	__up
    1338:	00001021 	move	v0,zero
    133c:	8fbf0024 	lw	ra,36(sp)
    1340:	8fb40020 	lw	s4,32(sp)
    1344:	8fb3001c 	lw	s3,28(sp)
    1348:	8fb20018 	lw	s2,24(sp)
    134c:	8fb10014 	lw	s1,20(sp)
    1350:	8fb00010 	lw	s0,16(sp)
    1354:	03e00008 	jr	ra
    1358:	27bd0028 	addiu	sp,sp,40
    135c:	40036000 	mfc0	v1,c0_status
    1360:	3461001f 	ori	at,v1,0x1f
    1364:	3821001f 	xori	at,at,0x1f
    1368:	40816000 	mtc0	at,c0_status
    136c:	00000040 	ssnop
    1370:	00000040 	ssnop
    1374:	00000040 	ssnop
    1378:	000000c0 	sll	zero,zero,0x3
    137c:	8ca2002c 	lw	v0,44(a1)
    1380:	24420001 	addiu	v0,v0,1
    1384:	aca2002c 	sw	v0,44(a1)
    1388:	40016000 	mfc0	at,c0_status
    138c:	30630001 	andi	v1,v1,0x1
    1390:	3421001f 	ori	at,at,0x1f
    1394:	3821001f 	xori	at,at,0x1f
    1398:	00611825 	or	v1,v1,at
    139c:	40836000 	mtc0	v1,c0_status
    13a0:	00000040 	ssnop
    13a4:	00000040 	ssnop
    13a8:	00000040 	ssnop
    13ac:	000000c0 	sll	zero,zero,0x3
    13b0:	080004cc 	j	1330 <DeleteDevices+0x108>
			13b0: R_MIPS_26	.text
    13b4:	00000000 	nop
    13b8:	40036000 	mfc0	v1,c0_status
    13bc:	3461001f 	ori	at,v1,0x1f
    13c0:	3821001f 	xori	at,at,0x1f
    13c4:	40816000 	mtc0	at,c0_status
    13c8:	00000040 	ssnop
    13cc:	00000040 	ssnop
    13d0:	00000040 	ssnop
    13d4:	000000c0 	sll	zero,zero,0x3
    13d8:	8ca2002c 	lw	v0,44(a1)
    13dc:	2442ffff 	addiu	v0,v0,-1
    13e0:	aca2002c 	sw	v0,44(a1)
    13e4:	40016000 	mfc0	at,c0_status
    13e8:	30630001 	andi	v1,v1,0x1
    13ec:	3421001f 	ori	at,at,0x1f
    13f0:	3821001f 	xori	at,at,0x1f
    13f4:	00611825 	or	v1,v1,at
    13f8:	40836000 	mtc0	v1,c0_status
    13fc:	00000040 	ssnop
    1400:	00000040 	ssnop
    1404:	00000040 	ssnop
    1408:	000000c0 	sll	zero,zero,0x3
    140c:	080004a2 	j	1288 <DeleteDevices+0x60>
			140c: R_MIPS_26	.text
    1410:	00000000 	nop
    1414:	24420000 	addiu	v0,v0,0
			1414: R_MIPS_LO16	__up
    1418:	0040f809 	jalr	v0
    141c:	00c02021 	move	a0,a2
    1420:	080004cf 	j	133c <DeleteDevices+0x114>
			1420: R_MIPS_26	.text
    1424:	00001021 	move	v0,zero
    1428:	24420000 	addiu	v0,v0,0
			1428: R_MIPS_LO16	__down_interruptible
    142c:	0040f809 	jalr	v0
    1430:	00c02021 	move	a0,a2
    1434:	1040ff96 	beqz	v0,1290 <DeleteDevices+0x68>
    1438:	2402fffa 	li	v0,-6
    143c:	080004d0 	j	1340 <DeleteDevices+0x118>
			143c: R_MIPS_26	.text
    1440:	8fbf0024 	lw	ra,36(sp)

00001444 <AddDeviceToList>:
    1444:	27bdffe0 	addiu	sp,sp,-32
    1448:	afb10014 	sw	s1,20(sp)
    144c:	3c110000 	lui	s1,0x0
			144c: R_MIPS_HI16	pBusContext
    1450:	8e250000 	lw	a1,0(s1)
			1450: R_MIPS_LO16	pBusContext
    1454:	afb00010 	sw	s0,16(sp)
    1458:	afbf001c 	sw	ra,28(sp)
    145c:	afb20018 	sw	s2,24(sp)
    1460:	00808021 	move	s0,a0
    1464:	24a6002c 	addiu	a2,a1,44
    1468:	3c120000 	lui	s2,0x0
			1468: R_MIPS_HI16	cpu_data
    146c:	26420000 	addiu	v0,s2,0
			146c: R_MIPS_LO16	cpu_data
    1470:	8c430008 	lw	v1,8(v0)
    1474:	3c040001 	lui	a0,0x1
    1478:	00641824 	and	v1,v1,a0
    147c:	10600028 	beqz	v1,1520 <AddDeviceToList+0xdc>
    1480:	00000000 	nop
    1484:	c0a3002c 	ll	v1,44(a1)
    1488:	2462ffff 	addiu	v0,v1,-1
    148c:	e0a2002c 	sc	v0,44(a1)
    1490:	10400370 	beqz	v0,2254 <_SDIO_UnregisterHostController+0x2a4>
    1494:	00000000 	nop
    1498:	2462ffff 	addiu	v0,v1,-1
    149c:	04400053 	bltz	v0,15ec <AddDeviceToList+0x1a8>
    14a0:	3c020000 	lui	v0,0x0
			14a0: R_MIPS_HI16	__down_interruptible
    14a4:	8e220000 	lw	v0,0(s1)
			14a4: R_MIPS_LO16	pBusContext
    14a8:	24420024 	addiu	v0,v0,36
    14ac:	8c430004 	lw	v1,4(v0)
    14b0:	ae020000 	sw	v0,0(s0)
    14b4:	ae030004 	sw	v1,4(s0)
    14b8:	8c440004 	lw	a0,4(v0)
    14bc:	ac500004 	sw	s0,4(v0)
    14c0:	ac900000 	sw	s0,0(a0)
    14c4:	8e250000 	lw	a1,0(s1)
			14c4: R_MIPS_LO16	pBusContext
    14c8:	24a6002c 	addiu	a2,a1,44
    14cc:	26430000 	addiu	v1,s2,0
			14cc: R_MIPS_LO16	cpu_data
    14d0:	8c620008 	lw	v0,8(v1)
    14d4:	3c040001 	lui	a0,0x1
    14d8:	00441024 	and	v0,v0,a0
    14dc:	10400027 	beqz	v0,157c <AddDeviceToList+0x138>
    14e0:	00000000 	nop
    14e4:	c0a3002c 	ll	v1,44(a1)
    14e8:	24620001 	addiu	v0,v1,1
    14ec:	e0a2002c 	sc	v0,44(a1)
    14f0:	1040035a 	beqz	v0,225c <_SDIO_UnregisterHostController+0x2ac>
    14f4:	00000000 	nop
    14f8:	24620001 	addiu	v0,v1,1
    14fc:	18400036 	blez	v0,15d8 <AddDeviceToList+0x194>
    1500:	3c020000 	lui	v0,0x0
			1500: R_MIPS_HI16	__up
    1504:	24020001 	li	v0,1
    1508:	8fbf001c 	lw	ra,28(sp)
    150c:	8fb20018 	lw	s2,24(sp)
    1510:	8fb10014 	lw	s1,20(sp)
    1514:	8fb00010 	lw	s0,16(sp)
    1518:	03e00008 	jr	ra
    151c:	27bd0020 	addiu	sp,sp,32
    1520:	40036000 	mfc0	v1,c0_status
    1524:	3461001f 	ori	at,v1,0x1f
    1528:	3821001f 	xori	at,at,0x1f
    152c:	40816000 	mtc0	at,c0_status
    1530:	00000040 	ssnop
    1534:	00000040 	ssnop
    1538:	00000040 	ssnop
    153c:	000000c0 	sll	zero,zero,0x3
    1540:	8ca2002c 	lw	v0,44(a1)
    1544:	2442ffff 	addiu	v0,v0,-1
    1548:	aca2002c 	sw	v0,44(a1)
    154c:	40016000 	mfc0	at,c0_status
    1550:	30630001 	andi	v1,v1,0x1
    1554:	3421001f 	ori	at,at,0x1f
    1558:	3821001f 	xori	at,at,0x1f
    155c:	00611825 	or	v1,v1,at
    1560:	40836000 	mtc0	v1,c0_status
    1564:	00000040 	ssnop
    1568:	00000040 	ssnop
    156c:	00000040 	ssnop
    1570:	000000c0 	sll	zero,zero,0x3
    1574:	08000527 	j	149c <AddDeviceToList+0x58>
			1574: R_MIPS_26	.text
    1578:	00000000 	nop
    157c:	40036000 	mfc0	v1,c0_status
    1580:	3461001f 	ori	at,v1,0x1f
    1584:	3821001f 	xori	at,at,0x1f
    1588:	40816000 	mtc0	at,c0_status
    158c:	00000040 	ssnop
    1590:	00000040 	ssnop
    1594:	00000040 	ssnop
    1598:	000000c0 	sll	zero,zero,0x3
    159c:	8ca2002c 	lw	v0,44(a1)
    15a0:	24420001 	addiu	v0,v0,1
    15a4:	aca2002c 	sw	v0,44(a1)
    15a8:	40016000 	mfc0	at,c0_status
    15ac:	30630001 	andi	v1,v1,0x1
    15b0:	3421001f 	ori	at,at,0x1f
    15b4:	3821001f 	xori	at,at,0x1f
    15b8:	00611825 	or	v1,v1,at
    15bc:	40836000 	mtc0	v1,c0_status
    15c0:	00000040 	ssnop
    15c4:	00000040 	ssnop
    15c8:	00000040 	ssnop
    15cc:	000000c0 	sll	zero,zero,0x3
    15d0:	0800053f 	j	14fc <AddDeviceToList+0xb8>
			15d0: R_MIPS_26	.text
    15d4:	00000000 	nop
    15d8:	24420000 	addiu	v0,v0,0
			15d8: R_MIPS_LO16	__up
    15dc:	0040f809 	jalr	v0
    15e0:	00c02021 	move	a0,a2
    15e4:	08000542 	j	1508 <AddDeviceToList+0xc4>
			15e4: R_MIPS_26	.text
    15e8:	24020001 	li	v0,1
    15ec:	24420000 	addiu	v0,v0,0
			15ec: R_MIPS_LO16	__down_interruptible
    15f0:	0040f809 	jalr	v0
    15f4:	00c02021 	move	a0,a2
    15f8:	1040ffaa 	beqz	v0,14a4 <AddDeviceToList+0x60>
    15fc:	00001021 	move	v0,zero
    1600:	08000543 	j	150c <AddDeviceToList+0xc8>
			1600: R_MIPS_26	.text
    1604:	8fbf001c 	lw	ra,28(sp)

00001608 <CleanupHcd>:
    1608:	27bdffe8 	addiu	sp,sp,-24
    160c:	3c020000 	lui	v0,0x0
			160c: R_MIPS_HI16	SDLIB_OSDeleteHelper
    1610:	afb00010 	sw	s0,16(sp)
    1614:	afbf0014 	sw	ra,20(sp)
    1618:	00808021 	move	s0,a0
    161c:	24420000 	addiu	v0,v0,0
			161c: R_MIPS_LO16	SDLIB_OSDeleteHelper
    1620:	0040f809 	jalr	v0
    1624:	24840058 	addiu	a0,a0,88
    1628:	8e030080 	lw	v1,128(s0)
    162c:	ae000044 	sw	zero,68(s0)
    1630:	10600006 	beqz	v1,164c <CleanupHcd+0x44>
    1634:	00602021 	move	a0,v1
    1638:	3c020000 	lui	v0,0x0
			1638: R_MIPS_HI16	FreeDevice
    163c:	24420000 	addiu	v0,v0,0
			163c: R_MIPS_LO16	FreeDevice
    1640:	0040f809 	jalr	v0
    1644:	00000000 	nop
    1648:	ae000080 	sw	zero,128(s0)
    164c:	8fbf0014 	lw	ra,20(sp)
    1650:	8fb00010 	lw	s0,16(sp)
    1654:	03e00008 	jr	ra
    1658:	27bd0018 	addiu	sp,sp,24

0000165c <_SDIO_BusDriverCleanup>:
    165c:	27bdffe0 	addiu	sp,sp,-32
    1660:	afb00010 	sw	s0,16(sp)
    1664:	3c100000 	lui	s0,0x0
			1664: R_MIPS_HI16	pBusContext
    1668:	8e040000 	lw	a0,0(s0)
			1668: R_MIPS_LO16	pBusContext
    166c:	afbf001c 	sw	ra,28(sp)
    1670:	afb20018 	sw	s2,24(sp)
    1674:	afb10014 	sw	s1,20(sp)
    1678:	9082006e 	lbu	v0,110(a0)
    167c:	30420002 	andi	v0,v0,0x2
    1680:	1440005a 	bnez	v0,17ec <_SDIO_BusDriverCleanup+0x190>
    1684:	3c020000 	lui	v0,0x0
			1684: R_MIPS_HI16	SDLIB_OSDeleteHelper
    1688:	8c840098 	lw	a0,152(a0)
    168c:	10800006 	beqz	a0,16a8 <_SDIO_BusDriverCleanup+0x4c>
    1690:	3c020000 	lui	v0,0x0
			1690: R_MIPS_HI16	SDLIB_DeleteMessageQueue
    1694:	24420000 	addiu	v0,v0,0
			1694: R_MIPS_LO16	SDLIB_DeleteMessageQueue
    1698:	0040f809 	jalr	v0
    169c:	00000000 	nop
    16a0:	8e030000 	lw	v1,0(s0)
			16a0: R_MIPS_LO16	pBusContext
    16a4:	ac600098 	sw	zero,152(v1)
    16a8:	3c020000 	lui	v0,0x0
			16a8: R_MIPS_HI16	RemoveAllFunctions
    16ac:	24420000 	addiu	v0,v0,0
			16ac: R_MIPS_LO16	RemoveAllFunctions
    16b0:	0040f809 	jalr	v0
    16b4:	00000000 	nop
    16b8:	3c020000 	lui	v0,0x0
			16b8: R_MIPS_HI16	DeleteDevices
    16bc:	24420000 	addiu	v0,v0,0
			16bc: R_MIPS_LO16	DeleteDevices
    16c0:	0040f809 	jalr	v0
    16c4:	00002021 	move	a0,zero
    16c8:	8e030000 	lw	v1,0(s0)
			16c8: R_MIPS_LO16	pBusContext
    16cc:	8c660004 	lw	a2,4(v1)
    16d0:	1066004b 	beq	v1,a2,1800 <_SDIO_BusDriverCleanup+0x1a4>
    16d4:	00000000 	nop
    16d8:	080005c2 	j	1708 <_SDIO_BusDriverCleanup+0xac>
			16d8: R_MIPS_26	.text
    16dc:	3c120000 	lui	s2,0x0
			16dc: R_MIPS_HI16	kfree
    16e0:	00e0f809 	jalr	a3
    16e4:	00000000 	nop
    16e8:	8e020000 	lw	v0,0(s0)
			16e8: R_MIPS_LO16	pBusContext
    16ec:	8c430054 	lw	v1,84(v0)
    16f0:	2463ffff 	addiu	v1,v1,-1
    16f4:	ac430054 	sw	v1,84(v0)
    16f8:	8e040000 	lw	a0,0(s0)
			16f8: R_MIPS_LO16	pBusContext
    16fc:	8c860004 	lw	a2,4(a0)
    1700:	10860019 	beq	a0,a2,1768 <_SDIO_BusDriverCleanup+0x10c>
    1704:	8e020000 	lw	v0,0(s0)
			1704: R_MIPS_LO16	pBusContext
    1708:	8cc50004 	lw	a1,4(a2)
    170c:	8cc20000 	lw	v0,0(a2)
    1710:	00c02021 	move	a0,a2
    1714:	aca20000 	sw	v0,0(a1)
    1718:	8cc30000 	lw	v1,0(a2)
    171c:	26470000 	addiu	a3,s2,0
			171c: R_MIPS_LO16	kfree
    1720:	ac650004 	sw	a1,4(v1)
    1724:	8cc2000c 	lw	v0,12(a2)
    1728:	acc60004 	sw	a2,4(a2)
    172c:	30420004 	andi	v0,v0,0x4
    1730:	1440ffeb 	bnez	v0,16e0 <_SDIO_BusDriverCleanup+0x84>
    1734:	acc60000 	sw	a2,0(a2)
    1738:	26420000 	addiu	v0,s2,0
			1738: R_MIPS_LO16	kfree
    173c:	0040f809 	jalr	v0
    1740:	00c02021 	move	a0,a2
    1744:	8e020000 	lw	v0,0(s0)
			1744: R_MIPS_LO16	pBusContext
    1748:	8c430054 	lw	v1,84(v0)
    174c:	2463ffff 	addiu	v1,v1,-1
    1750:	ac430054 	sw	v1,84(v0)
    1754:	8e040000 	lw	a0,0(s0)
			1754: R_MIPS_LO16	pBusContext
    1758:	8c860004 	lw	a2,4(a0)
    175c:	1486ffea 	bne	a0,a2,1708 <_SDIO_BusDriverCleanup+0xac>
    1760:	00000000 	nop
    1764:	8e020000 	lw	v0,0(s0)
			1764: R_MIPS_LO16	pBusContext
    1768:	24420008 	addiu	v0,v0,8
    176c:	8c460004 	lw	a2,4(v0)
    1770:	10c20014 	beq	a2,v0,17c4 <_SDIO_BusDriverCleanup+0x168>
    1774:	3c020000 	lui	v0,0x0
			1774: R_MIPS_HI16	.text
    1778:	24510614 	addiu	s1,v0,1556
			1778: R_MIPS_LO16	.text
    177c:	8cc50004 	lw	a1,4(a2)
    1780:	8cc20000 	lw	v0,0(a2)
    1784:	00c02021 	move	a0,a2
    1788:	aca20000 	sw	v0,0(a1)
    178c:	8cc30000 	lw	v1,0(a2)
    1790:	acc60000 	sw	a2,0(a2)
    1794:	ac650004 	sw	a1,4(v1)
    1798:	0220f809 	jalr	s1
    179c:	acc60004 	sw	a2,4(a2)
    17a0:	8e040000 	lw	a0,0(s0)
			17a0: R_MIPS_LO16	pBusContext
    17a4:	8c820058 	lw	v0,88(a0)
    17a8:	2442ffff 	addiu	v0,v0,-1
    17ac:	ac820058 	sw	v0,88(a0)
    17b0:	8e030000 	lw	v1,0(s0)
			17b0: R_MIPS_LO16	pBusContext
    17b4:	24630008 	addiu	v1,v1,8
    17b8:	8c660004 	lw	a2,4(v1)
    17bc:	1466ffef 	bne	v1,a2,177c <_SDIO_BusDriverCleanup+0x120>
    17c0:	00000000 	nop
    17c4:	26420000 	addiu	v0,s2,0
			17c4: R_MIPS_LO16	kfree
    17c8:	0040f809 	jalr	v0
    17cc:	8e040000 	lw	a0,0(s0)
			17cc: R_MIPS_LO16	pBusContext
    17d0:	ae000000 	sw	zero,0(s0)
			17d0: R_MIPS_LO16	pBusContext
    17d4:	8fbf001c 	lw	ra,28(sp)
    17d8:	8fb20018 	lw	s2,24(sp)
    17dc:	8fb10014 	lw	s1,20(sp)
    17e0:	8fb00010 	lw	s0,16(sp)
    17e4:	03e00008 	jr	ra
    17e8:	27bd0020 	addiu	sp,sp,32
    17ec:	24420000 	addiu	v0,v0,0
			17ec: R_MIPS_LO16	SDLIB_OSDeleteHelper
    17f0:	0040f809 	jalr	v0
    17f4:	24840070 	addiu	a0,a0,112
    17f8:	080005a2 	j	1688 <_SDIO_BusDriverCleanup+0x2c>
			17f8: R_MIPS_26	.text
    17fc:	8e040000 	lw	a0,0(s0)
			17fc: R_MIPS_LO16	pBusContext
    1800:	080005d9 	j	1764 <_SDIO_BusDriverCleanup+0x108>
			1800: R_MIPS_26	.text
    1804:	3c120000 	lui	s2,0x0
			1804: R_MIPS_HI16	kfree

00001808 <HcdConfigComplete>:
    1808:	27bdffe8 	addiu	sp,sp,-24
    180c:	afb00010 	sw	s0,16(sp)
    1810:	afbf0014 	sw	ra,20(sp)
    1814:	00808021 	move	s0,a0
    1818:	8c84002c 	lw	a0,44(a0)
    181c:	8c820028 	lw	v0,40(a0)
    1820:	0040f809 	jalr	v0
    1824:	8e05003c 	lw	a1,60(s0)
    1828:	8e050034 	lw	a1,52(s0)
    182c:	ae020040 	sw	v0,64(s0)
    1830:	24a60008 	addiu	a2,a1,8
    1834:	3c030000 	lui	v1,0x0
			1834: R_MIPS_HI16	cpu_data
    1838:	8c620008 	lw	v0,8(v1)
			1838: R_MIPS_LO16	cpu_data
    183c:	3c040001 	lui	a0,0x1
    1840:	00441024 	and	v0,v0,a0
    1844:	1040000d 	beqz	v0,187c <HcdConfigComplete+0x74>
    1848:	00000000 	nop
    184c:	c0a30008 	ll	v1,8(a1)
    1850:	24620001 	addiu	v0,v1,1
    1854:	e0a20008 	sc	v0,8(a1)
    1858:	10400282 	beqz	v0,2264 <_SDIO_UnregisterHostController+0x2b4>
    185c:	00000000 	nop
    1860:	24620001 	addiu	v0,v1,1
    1864:	1840001c 	blez	v0,18d8 <HcdConfigComplete+0xd0>
    1868:	00c02021 	move	a0,a2
    186c:	8fbf0014 	lw	ra,20(sp)
    1870:	8fb00010 	lw	s0,16(sp)
    1874:	03e00008 	jr	ra
    1878:	27bd0018 	addiu	sp,sp,24
    187c:	40036000 	mfc0	v1,c0_status
    1880:	3461001f 	ori	at,v1,0x1f
    1884:	3821001f 	xori	at,at,0x1f
    1888:	40816000 	mtc0	at,c0_status
    188c:	00000040 	ssnop
    1890:	00000040 	ssnop
    1894:	00000040 	ssnop
    1898:	000000c0 	sll	zero,zero,0x3
    189c:	8ca20008 	lw	v0,8(a1)
    18a0:	24420001 	addiu	v0,v0,1
    18a4:	aca20008 	sw	v0,8(a1)
    18a8:	40016000 	mfc0	at,c0_status
    18ac:	30630001 	andi	v1,v1,0x1
    18b0:	3421001f 	ori	at,at,0x1f
    18b4:	3821001f 	xori	at,at,0x1f
    18b8:	00611825 	or	v1,v1,at
    18bc:	40836000 	mtc0	v1,c0_status
    18c0:	00000040 	ssnop
    18c4:	00000040 	ssnop
    18c8:	00000040 	ssnop
    18cc:	000000c0 	sll	zero,zero,0x3
    18d0:	08000619 	j	1864 <HcdConfigComplete+0x5c>
			18d0: R_MIPS_26	.text
    18d4:	00000000 	nop
    18d8:	3c190000 	lui	t9,0x0
			18d8: R_MIPS_HI16	__up
    18dc:	8fbf0014 	lw	ra,20(sp)
    18e0:	8fb00010 	lw	s0,16(sp)
    18e4:	27390000 	addiu	t9,t9,0
			18e4: R_MIPS_LO16	__up
    18e8:	03200008 	jr	t9
    18ec:	27bd0018 	addiu	sp,sp,24

000018f0 <_SDIO_BusDriverInitialize>:
    18f0:	27bdffd8 	addiu	sp,sp,-40
    18f4:	afb10014 	sw	s1,20(sp)
    18f8:	afbf0020 	sw	ra,32(sp)
    18fc:	afb3001c 	sw	s3,28(sp)
    1900:	afb20018 	sw	s2,24(sp)
    1904:	afb00010 	sw	s0,16(sp)
    1908:	3c020000 	lui	v0,0x0
			1908: R_MIPS_HI16	malloc_sizes
    190c:	8c440024 	lw	a0,36(v0)
			190c: R_MIPS_LO16	malloc_sizes
    1910:	3c020000 	lui	v0,0x0
			1910: R_MIPS_HI16	kmem_cache_alloc
    1914:	24420000 	addiu	v0,v0,0
			1914: R_MIPS_LO16	kmem_cache_alloc
    1918:	0040f809 	jalr	v0
    191c:	240500d0 	li	a1,208
    1920:	104000ae 	beqz	v0,1bdc <_SDIO_BusDriverInitialize+0x2ec>
    1924:	00408821 	move	s1,v0
    1928:	3c100000 	lui	s0,0x0
			1928: R_MIPS_HI16	memset
    192c:	3c120000 	lui	s2,0x0
			192c: R_MIPS_HI16	pBusContext
    1930:	26100000 	addiu	s0,s0,0
			1930: R_MIPS_LO16	memset
    1934:	00402021 	move	a0,v0
    1938:	00002821 	move	a1,zero
    193c:	0200f809 	jalr	s0
    1940:	240600a8 	li	a2,168
    1944:	02202021 	move	a0,s1
    1948:	00002821 	move	a1,zero
    194c:	240600a8 	li	a2,168
    1950:	0200f809 	jalr	s0
    1954:	ae510000 	sw	s1,0(s2)
			1954: R_MIPS_LO16	pBusContext
    1958:	8e430000 	lw	v1,0(s2)
			1958: R_MIPS_LO16	pBusContext
    195c:	ac630000 	sw	v1,0(v1)
    1960:	8e420000 	lw	v0,0(s2)
			1960: R_MIPS_LO16	pBusContext
    1964:	ac420004 	sw	v0,4(v0)
    1968:	8e430000 	lw	v1,0(s2)
			1968: R_MIPS_LO16	pBusContext
    196c:	24620010 	addiu	v0,v1,16
    1970:	ac620010 	sw	v0,16(v1)
    1974:	8e440000 	lw	a0,0(s2)
			1974: R_MIPS_LO16	pBusContext
    1978:	24820010 	addiu	v0,a0,16
    197c:	ac820014 	sw	v0,20(a0)
    1980:	8e430000 	lw	v1,0(s2)
			1980: R_MIPS_LO16	pBusContext
    1984:	24620024 	addiu	v0,v1,36
    1988:	ac620024 	sw	v0,36(v1)
    198c:	8e440000 	lw	a0,0(s2)
			198c: R_MIPS_LO16	pBusContext
    1990:	24820024 	addiu	v0,a0,36
    1994:	ac820028 	sw	v0,40(a0)
    1998:	8e430000 	lw	v1,0(s2)
			1998: R_MIPS_LO16	pBusContext
    199c:	24620038 	addiu	v0,v1,56
    19a0:	ac620038 	sw	v0,56(v1)
    19a4:	8e440000 	lw	a0,0(s2)
			19a4: R_MIPS_LO16	pBusContext
    19a8:	24820038 	addiu	v0,a0,56
    19ac:	ac82003c 	sw	v0,60(a0)
    19b0:	8e430000 	lw	v1,0(s2)
			19b0: R_MIPS_LO16	pBusContext
    19b4:	24620008 	addiu	v0,v1,8
    19b8:	ac620008 	sw	v0,8(v1)
    19bc:	8e440000 	lw	a0,0(s2)
			19bc: R_MIPS_LO16	pBusContext
    19c0:	24820008 	addiu	v0,a0,8
    19c4:	ac82000c 	sw	v0,12(a0)
    19c8:	8e430000 	lw	v1,0(s2)
			19c8: R_MIPS_LO16	pBusContext
    19cc:	24020040 	li	v0,64
    19d0:	ac600064 	sw	zero,100(v1)
    19d4:	8e440000 	lw	a0,0(s2)
			19d4: R_MIPS_LO16	pBusContext
    19d8:	ac82004c 	sw	v0,76(a0)
    19dc:	8e450000 	lw	a1,0(s2)
			19dc: R_MIPS_LO16	pBusContext
    19e0:	24020010 	li	v0,16
    19e4:	aca20050 	sw	v0,80(a1)
    19e8:	8e430000 	lw	v1,0(s2)
			19e8: R_MIPS_LO16	pBusContext
    19ec:	24020005 	li	v0,5
    19f0:	ac6000a0 	sw	zero,160(v1)
    19f4:	8e440000 	lw	a0,0(s2)
			19f4: R_MIPS_LO16	pBusContext
    19f8:	ac8200a4 	sw	v0,164(a0)
    19fc:	3c020000 	lui	v0,0x0
			19fc: R_MIPS_HI16	_SDIO_BusGetDefaultSettings
    1a00:	24420000 	addiu	v0,v0,0
			1a00: R_MIPS_LO16	_SDIO_BusGetDefaultSettings
    1a04:	0040f809 	jalr	v0
    1a08:	8e440000 	lw	a0,0(s2)
			1a08: R_MIPS_LO16	pBusContext
    1a0c:	04400067 	bltz	v0,1bac <_SDIO_BusDriverInitialize+0x2bc>
    1a10:	00408021 	move	s0,v0
    1a14:	8e430000 	lw	v1,0(s2)
			1a14: R_MIPS_LO16	pBusContext
    1a18:	24110001 	li	s1,1
    1a1c:	8c62004c 	lw	v0,76(v1)
    1a20:	3c100000 	lui	s0,0x0
			1a20: R_MIPS_HI16	init_waitqueue_head
    1a24:	00021040 	sll	v0,v0,0x1
    1a28:	ac62005c 	sw	v0,92(v1)
    1a2c:	8e440000 	lw	a0,0(s2)
			1a2c: R_MIPS_LO16	pBusContext
    1a30:	26100000 	addiu	s0,s0,0
			1a30: R_MIPS_LO16	init_waitqueue_head
    1a34:	8c820050 	lw	v0,80(a0)
    1a38:	00021040 	sll	v0,v0,0x1
    1a3c:	ac820060 	sw	v0,96(a0)
    1a40:	8e430000 	lw	v1,0(s2)
			1a40: R_MIPS_LO16	pBusContext
    1a44:	2464001c 	addiu	a0,v1,28
    1a48:	ac710018 	sw	s1,24(v1)
    1a4c:	0200f809 	jalr	s0
    1a50:	00000000 	nop
    1a54:	8e420000 	lw	v0,0(s2)
			1a54: R_MIPS_LO16	pBusContext
    1a58:	24440030 	addiu	a0,v0,48
    1a5c:	ac51002c 	sw	s1,44(v0)
    1a60:	0200f809 	jalr	s0
    1a64:	00000000 	nop
    1a68:	8e440000 	lw	a0,0(s2)
			1a68: R_MIPS_LO16	pBusContext
    1a6c:	ac910040 	sw	s1,64(a0)
    1a70:	0200f809 	jalr	s0
    1a74:	24840044 	addiu	a0,a0,68
    1a78:	8e420000 	lw	v0,0(s2)
			1a78: R_MIPS_LO16	pBusContext
    1a7c:	8c43004c 	lw	v1,76(v0)
    1a80:	18600011 	blez	v1,1ac8 <_SDIO_BusDriverInitialize+0x1d8>
    1a84:	3c020000 	lui	v0,0x0
			1a84: R_MIPS_HI16	AllocateRequest
    1a88:	3c030000 	lui	v1,0x0
			1a88: R_MIPS_HI16	FreeRequest
    1a8c:	24530000 	addiu	s3,v0,0
			1a8c: R_MIPS_LO16	AllocateRequest
    1a90:	24710000 	addiu	s1,v1,0
			1a90: R_MIPS_LO16	FreeRequest
    1a94:	080006ae 	j	1ab8 <_SDIO_BusDriverInitialize+0x1c8>
			1a94: R_MIPS_26	.text
    1a98:	00008021 	move	s0,zero
    1a9c:	0220f809 	jalr	s1
    1aa0:	00000000 	nop
    1aa4:	8e430000 	lw	v1,0(s2)
			1aa4: R_MIPS_LO16	pBusContext
    1aa8:	8c62004c 	lw	v0,76(v1)
    1aac:	0202102a 	slt	v0,s0,v0
    1ab0:	10400006 	beqz	v0,1acc <_SDIO_BusDriverInitialize+0x1dc>
    1ab4:	8e420000 	lw	v0,0(s2)
			1ab4: R_MIPS_LO16	pBusContext
    1ab8:	0260f809 	jalr	s3
    1abc:	26100001 	addiu	s0,s0,1
    1ac0:	1440fff6 	bnez	v0,1a9c <_SDIO_BusDriverInitialize+0x1ac>
    1ac4:	00402021 	move	a0,v0
    1ac8:	8e420000 	lw	v0,0(s2)
			1ac8: R_MIPS_LO16	pBusContext
    1acc:	8c430050 	lw	v1,80(v0)
    1ad0:	18600011 	blez	v1,1b18 <_SDIO_BusDriverInitialize+0x228>
    1ad4:	3c020000 	lui	v0,0x0
			1ad4: R_MIPS_HI16	AllocateSignal
    1ad8:	3c030000 	lui	v1,0x0
			1ad8: R_MIPS_HI16	FreeSignal
    1adc:	24530000 	addiu	s3,v0,0
			1adc: R_MIPS_LO16	AllocateSignal
    1ae0:	24710000 	addiu	s1,v1,0
			1ae0: R_MIPS_LO16	FreeSignal
    1ae4:	080006c2 	j	1b08 <_SDIO_BusDriverInitialize+0x218>
			1ae4: R_MIPS_26	.text
    1ae8:	00008021 	move	s0,zero
    1aec:	0220f809 	jalr	s1
    1af0:	00000000 	nop
    1af4:	8e430000 	lw	v1,0(s2)
			1af4: R_MIPS_LO16	pBusContext
    1af8:	8c620050 	lw	v0,80(v1)
    1afc:	0202102a 	slt	v0,s0,v0
    1b00:	10400007 	beqz	v0,1b20 <_SDIO_BusDriverInitialize+0x230>
    1b04:	24040002 	li	a0,2
    1b08:	0260f809 	jalr	s3
    1b0c:	26100001 	addiu	s0,s0,1
    1b10:	1440fff6 	bnez	v0,1aec <_SDIO_BusDriverInitialize+0x1fc>
    1b14:	00402021 	move	a0,v0
    1b18:	8e430000 	lw	v1,0(s2)
			1b18: R_MIPS_LO16	pBusContext
    1b1c:	24040002 	li	a0,2
    1b20:	9062006e 	lbu	v0,110(v1)
    1b24:	24050008 	li	a1,8
    1b28:	34420004 	ori	v0,v0,0x4
    1b2c:	a062006e 	sb	v0,110(v1)
    1b30:	3c020000 	lui	v0,0x0
			1b30: R_MIPS_HI16	SDLIB_CreateMessageQueue
    1b34:	24420000 	addiu	v0,v0,0
			1b34: R_MIPS_LO16	SDLIB_CreateMessageQueue
    1b38:	0040f809 	jalr	v0
    1b3c:	8e500000 	lw	s0,0(s2)
			1b3c: R_MIPS_LO16	pBusContext
    1b40:	ae020098 	sw	v0,152(s0)
    1b44:	8e440000 	lw	a0,0(s2)
			1b44: R_MIPS_LO16	pBusContext
    1b48:	8c820098 	lw	v0,152(a0)
    1b4c:	10400016 	beqz	v0,1ba8 <_SDIO_BusDriverInitialize+0x2b8>
    1b50:	3c050000 	lui	a1,0x0
			1b50: R_MIPS_HI16	CardDetectHelperFunction
    1b54:	3c020000 	lui	v0,0x0
			1b54: R_MIPS_HI16	SDLIB_OSCreateHelper
    1b58:	24840070 	addiu	a0,a0,112
    1b5c:	24a50000 	addiu	a1,a1,0
			1b5c: R_MIPS_LO16	CardDetectHelperFunction
    1b60:	24420000 	addiu	v0,v0,0
			1b60: R_MIPS_LO16	SDLIB_OSCreateHelper
    1b64:	0040f809 	jalr	v0
    1b68:	00003021 	move	a2,zero
    1b6c:	0440000f 	bltz	v0,1bac <_SDIO_BusDriverInitialize+0x2bc>
    1b70:	00408021 	move	s0,v0
    1b74:	3c020000 	lui	v0,0x0
			1b74: R_MIPS_HI16	pBusContext
    1b78:	8c440000 	lw	a0,0(v0)
			1b78: R_MIPS_LO16	pBusContext
    1b7c:	02001021 	move	v0,s0
    1b80:	9083006e 	lbu	v1,110(a0)
    1b84:	34630002 	ori	v1,v1,0x2
    1b88:	a083006e 	sb	v1,110(a0)
    1b8c:	8fbf0020 	lw	ra,32(sp)
    1b90:	8fb3001c 	lw	s3,28(sp)
    1b94:	8fb20018 	lw	s2,24(sp)
    1b98:	8fb10014 	lw	s1,20(sp)
    1b9c:	8fb00010 	lw	s0,16(sp)
    1ba0:	03e00008 	jr	ra
    1ba4:	27bd0028 	addiu	sp,sp,40
    1ba8:	2410fff9 	li	s0,-7
    1bac:	3c020000 	lui	v0,0x0
			1bac: R_MIPS_HI16	_SDIO_BusDriverCleanup
    1bb0:	24420000 	addiu	v0,v0,0
			1bb0: R_MIPS_LO16	_SDIO_BusDriverCleanup
    1bb4:	0040f809 	jalr	v0
    1bb8:	00000000 	nop
    1bbc:	02001021 	move	v0,s0
    1bc0:	8fbf0020 	lw	ra,32(sp)
    1bc4:	8fb3001c 	lw	s3,28(sp)
    1bc8:	8fb20018 	lw	s2,24(sp)
    1bcc:	8fb10014 	lw	s1,20(sp)
    1bd0:	8fb00010 	lw	s0,16(sp)
    1bd4:	03e00008 	jr	ra
    1bd8:	27bd0028 	addiu	sp,sp,40
    1bdc:	3c020000 	lui	v0,0x0
			1bdc: R_MIPS_HI16	pBusContext
    1be0:	2410fff9 	li	s0,-7
    1be4:	080006eb 	j	1bac <_SDIO_BusDriverInitialize+0x2bc>
			1be4: R_MIPS_26	.text
    1be8:	ac400000 	sw	zero,0(v0)
			1be8: R_MIPS_LO16	pBusContext

00001bec <_SDIO_RegisterHostController>:
    1bec:	27bdffd8 	addiu	sp,sp,-40
    1bf0:	afb10014 	sw	s1,20(sp)
    1bf4:	afbf0024 	sw	ra,36(sp)
    1bf8:	afb40020 	sw	s4,32(sp)
    1bfc:	afb3001c 	sw	s3,28(sp)
    1c00:	afb20018 	sw	s2,24(sp)
    1c04:	afb00010 	sw	s0,16(sp)
    1c08:	90820000 	lbu	v0,0(a0)
    1c0c:	24030002 	li	v1,2
    1c10:	00021102 	srl	v0,v0,0x4
    1c14:	1043000b 	beq	v0,v1,1c44 <_SDIO_RegisterHostController+0x58>
    1c18:	00808821 	move	s1,a0
    1c1c:	2410fffe 	li	s0,-2
    1c20:	02001021 	move	v0,s0
    1c24:	8fbf0024 	lw	ra,36(sp)
    1c28:	8fb40020 	lw	s4,32(sp)
    1c2c:	8fb3001c 	lw	s3,28(sp)
    1c30:	8fb20018 	lw	s2,24(sp)
    1c34:	8fb10014 	lw	s1,20(sp)
    1c38:	8fb00010 	lw	s0,16(sp)
    1c3c:	03e00008 	jr	ra
    1c40:	27bd0028 	addiu	sp,sp,40
    1c44:	3c020000 	lui	v0,0x0
			1c44: R_MIPS_HI16	memset
    1c48:	24940058 	addiu	s4,a0,88
    1c4c:	24530000 	addiu	s3,v0,0
			1c4c: R_MIPS_LO16	memset
    1c50:	02802021 	move	a0,s4
    1c54:	00002821 	move	a1,zero
    1c58:	0260f809 	jalr	s3
    1c5c:	24060028 	li	a2,40
    1c60:	26320038 	addiu	s2,s1,56
    1c64:	2624002c 	addiu	a0,s1,44
    1c68:	00002821 	move	a1,zero
    1c6c:	0260f809 	jalr	s3
    1c70:	2406000c 	li	a2,12
    1c74:	00002821 	move	a1,zero
    1c78:	00003021 	move	a2,zero
    1c7c:	0260f809 	jalr	s3
    1c80:	02402021 	move	a0,s2
    1c84:	26300094 	addiu	s0,s1,148
    1c88:	02402021 	move	a0,s2
    1c8c:	00002821 	move	a1,zero
    1c90:	0260f809 	jalr	s3
    1c94:	2406000c 	li	a2,12
    1c98:	02002021 	move	a0,s0
    1c9c:	00002821 	move	a1,zero
    1ca0:	0260f809 	jalr	s3
    1ca4:	2406000c 	li	a2,12
    1ca8:	3c020000 	lui	v0,0x0
			1ca8: R_MIPS_HI16	AllocateDevice
    1cac:	ae200080 	sw	zero,128(s1)
    1cb0:	ae2000a8 	sw	zero,168(s1)
    1cb4:	24420000 	addiu	v0,v0,0
			1cb4: R_MIPS_LO16	AllocateDevice
    1cb8:	0040f809 	jalr	v0
    1cbc:	02202021 	move	a0,s1
    1cc0:	1040006c 	beqz	v0,1e74 <_SDIO_RegisterHostController+0x288>
    1cc4:	ae220080 	sw	v0,128(s1)
    1cc8:	00002821 	move	a1,zero
    1ccc:	24060010 	li	a2,16
    1cd0:	0260f809 	jalr	s3
    1cd4:	26240048 	addiu	a0,s1,72
    1cd8:	8e240080 	lw	a0,128(s1)
    1cdc:	24020020 	li	v0,32
    1ce0:	24030001 	li	v1,1
    1ce4:	a2200084 	sb	zero,132(s1)
    1ce8:	a2200085 	sb	zero,133(s1)
    1cec:	a2200086 	sb	zero,134(s1)
    1cf0:	ae200044 	sw	zero,68(s1)
    1cf4:	ae200088 	sw	zero,136(s1)
    1cf8:	a4820038 	sh	v0,56(a0)
    1cfc:	3c020000 	lui	v0,0x0
			1cfc: R_MIPS_HI16	init_waitqueue_head
    1d00:	ae23002c 	sw	v1,44(s1)
    1d04:	24420000 	addiu	v0,v0,0
			1d04: R_MIPS_LO16	init_waitqueue_head
    1d08:	0040f809 	jalr	v0
    1d0c:	26240030 	addiu	a0,s1,48
    1d10:	3c050000 	lui	a1,0x0
			1d10: R_MIPS_HI16	SDIOIrqHelperFunction
    1d14:	3c020000 	lui	v0,0x0
			1d14: R_MIPS_HI16	SDLIB_OSCreateHelper
    1d18:	a2400008 	sb	zero,8(s2)
    1d1c:	ae520004 	sw	s2,4(s2)
    1d20:	a2000008 	sb	zero,8(s0)
    1d24:	ae300094 	sw	s0,148(s1)
    1d28:	ae100004 	sw	s0,4(s0)
    1d2c:	ae320038 	sw	s2,56(s1)
    1d30:	02802021 	move	a0,s4
    1d34:	24a50000 	addiu	a1,a1,0
			1d34: R_MIPS_LO16	SDIOIrqHelperFunction
    1d38:	24420000 	addiu	v0,v0,0
			1d38: R_MIPS_LO16	SDLIB_OSCreateHelper
    1d3c:	0040f809 	jalr	v0
    1d40:	02203021 	move	a2,s1
    1d44:	0440004c 	bltz	v0,1e78 <_SDIO_RegisterHostController+0x28c>
    1d48:	00408021 	move	s0,v0
    1d4c:	3c100000 	lui	s0,0x0
			1d4c: R_MIPS_HI16	pBusContext
    1d50:	8e050000 	lw	a1,0(s0)
			1d50: R_MIPS_LO16	pBusContext
    1d54:	24a60018 	addiu	a2,a1,24
    1d58:	3c120000 	lui	s2,0x0
			1d58: R_MIPS_HI16	cpu_data
    1d5c:	26420000 	addiu	v0,s2,0
			1d5c: R_MIPS_LO16	cpu_data
    1d60:	8c430008 	lw	v1,8(v0)
    1d64:	3c040001 	lui	a0,0x1
    1d68:	00641824 	and	v1,v1,a0
    1d6c:	10600069 	beqz	v1,1f14 <_SDIO_RegisterHostController+0x328>
    1d70:	00000000 	nop
    1d74:	c0a30018 	ll	v1,24(a1)
    1d78:	2462ffff 	addiu	v0,v1,-1
    1d7c:	e0a20018 	sc	v0,24(a1)
    1d80:	1040013a 	beqz	v0,226c <_SDIO_UnregisterHostController+0x2bc>
    1d84:	00000000 	nop
    1d88:	2462ffff 	addiu	v0,v1,-1
    1d8c:	0440007d 	bltz	v0,1f84 <_SDIO_RegisterHostController+0x398>
    1d90:	3c020000 	lui	v0,0x0
			1d90: R_MIPS_HI16	__down_interruptible
    1d94:	8e080000 	lw	t0,0(s0)
			1d94: R_MIPS_LO16	pBusContext
    1d98:	00002021 	move	a0,zero
    1d9c:	9105009c 	lbu	a1,156(t0)
    1da0:	24070001 	li	a3,1
    1da4:	0800076d 	j	1db4 <_SDIO_RegisterHostController+0x1c8>
			1da4: R_MIPS_26	.text
    1da8:	24060020 	li	a2,32
    1dac:	1086003f 	beq	a0,a2,1eac <_SDIO_RegisterHostController+0x2c0>
    1db0:	00000000 	nop
    1db4:	00871804 	sllv	v1,a3,a0
    1db8:	00a31024 	and	v0,a1,v1
    1dbc:	1440fffb 	bnez	v0,1dac <_SDIO_RegisterHostController+0x1c0>
    1dc0:	24840001 	addiu	a0,a0,1
    1dc4:	2484ffff 	addiu	a0,a0,-1
    1dc8:	04800039 	bltz	a0,1eb0 <_SDIO_RegisterHostController+0x2c4>
    1dcc:	3c068000 	lui	a2,0x8000
    1dd0:	00603021 	move	a2,v1
    1dd4:	308300ff 	andi	v1,a0,0xff
    1dd8:	8d02009c 	lw	v0,156(t0)
    1ddc:	26250004 	addiu	a1,s1,4
    1de0:	00461025 	or	v0,v0,a2
    1de4:	ad02009c 	sw	v0,156(t0)
    1de8:	a2230018 	sb	v1,24(s1)
    1dec:	8e020000 	lw	v0,0(s0)
			1dec: R_MIPS_LO16	pBusContext
    1df0:	24420010 	addiu	v0,v0,16
    1df4:	8c430004 	lw	v1,4(v0)
    1df8:	ae220004 	sw	v0,4(s1)
    1dfc:	aca30004 	sw	v1,4(a1)
    1e00:	8c440004 	lw	a0,4(v0)
    1e04:	ac450004 	sw	a1,4(v0)
    1e08:	ac850000 	sw	a1,0(a0)
    1e0c:	8e050000 	lw	a1,0(s0)
			1e0c: R_MIPS_LO16	pBusContext
    1e10:	24a60018 	addiu	a2,a1,24
    1e14:	26430000 	addiu	v1,s2,0
			1e14: R_MIPS_LO16	cpu_data
    1e18:	8c620008 	lw	v0,8(v1)
    1e1c:	3c040001 	lui	a0,0x1
    1e20:	00441024 	and	v0,v0,a0
    1e24:	10400024 	beqz	v0,1eb8 <_SDIO_RegisterHostController+0x2cc>
    1e28:	00000000 	nop
    1e2c:	c0a30018 	ll	v1,24(a1)
    1e30:	24620001 	addiu	v0,v1,1
    1e34:	e0a20018 	sc	v0,24(a1)
    1e38:	1040010e 	beqz	v0,2274 <_SDIO_UnregisterHostController+0x2c4>
    1e3c:	00000000 	nop
    1e40:	24620001 	addiu	v0,v1,1
    1e44:	1840004a 	blez	v0,1f70 <_SDIO_RegisterHostController+0x384>
    1e48:	3c020000 	lui	v0,0x0
			1e48: R_MIPS_HI16	__up
    1e4c:	00008021 	move	s0,zero
    1e50:	02001021 	move	v0,s0
    1e54:	8fbf0024 	lw	ra,36(sp)
    1e58:	8fb40020 	lw	s4,32(sp)
    1e5c:	8fb3001c 	lw	s3,28(sp)
    1e60:	8fb20018 	lw	s2,24(sp)
    1e64:	8fb10014 	lw	s1,20(sp)
    1e68:	8fb00010 	lw	s0,16(sp)
    1e6c:	03e00008 	jr	ra
    1e70:	27bd0028 	addiu	sp,sp,40
    1e74:	2410fff9 	li	s0,-7
    1e78:	3c020000 	lui	v0,0x0
			1e78: R_MIPS_HI16	.text
    1e7c:	24421608 	addiu	v0,v0,5640
			1e7c: R_MIPS_LO16	.text
    1e80:	0040f809 	jalr	v0
    1e84:	02202021 	move	a0,s1
    1e88:	02001021 	move	v0,s0
    1e8c:	8fbf0024 	lw	ra,36(sp)
    1e90:	8fb40020 	lw	s4,32(sp)
    1e94:	8fb3001c 	lw	s3,28(sp)
    1e98:	8fb20018 	lw	s2,24(sp)
    1e9c:	8fb10014 	lw	s1,20(sp)
    1ea0:	8fb00010 	lw	s0,16(sp)
    1ea4:	03e00008 	jr	ra
    1ea8:	27bd0028 	addiu	sp,sp,40
    1eac:	3c068000 	lui	a2,0x8000
    1eb0:	08000776 	j	1dd8 <_SDIO_RegisterHostController+0x1ec>
			1eb0: R_MIPS_26	.text
    1eb4:	2403001f 	li	v1,31
    1eb8:	40036000 	mfc0	v1,c0_status
    1ebc:	3461001f 	ori	at,v1,0x1f
    1ec0:	3821001f 	xori	at,at,0x1f
    1ec4:	40816000 	mtc0	at,c0_status
    1ec8:	00000040 	ssnop
    1ecc:	00000040 	ssnop
    1ed0:	00000040 	ssnop
    1ed4:	000000c0 	sll	zero,zero,0x3
    1ed8:	8ca20018 	lw	v0,24(a1)
    1edc:	24420001 	addiu	v0,v0,1
    1ee0:	aca20018 	sw	v0,24(a1)
    1ee4:	40016000 	mfc0	at,c0_status
    1ee8:	30630001 	andi	v1,v1,0x1
    1eec:	3421001f 	ori	at,at,0x1f
    1ef0:	3821001f 	xori	at,at,0x1f
    1ef4:	00611825 	or	v1,v1,at
    1ef8:	40836000 	mtc0	v1,c0_status
    1efc:	00000040 	ssnop
    1f00:	00000040 	ssnop
    1f04:	00000040 	ssnop
    1f08:	000000c0 	sll	zero,zero,0x3
    1f0c:	08000791 	j	1e44 <_SDIO_RegisterHostController+0x258>
			1f0c: R_MIPS_26	.text
    1f10:	00000000 	nop
    1f14:	40036000 	mfc0	v1,c0_status
    1f18:	3461001f 	ori	at,v1,0x1f
    1f1c:	3821001f 	xori	at,at,0x1f
    1f20:	40816000 	mtc0	at,c0_status
    1f24:	00000040 	ssnop
    1f28:	00000040 	ssnop
    1f2c:	00000040 	ssnop
    1f30:	000000c0 	sll	zero,zero,0x3
    1f34:	8ca20018 	lw	v0,24(a1)
    1f38:	2442ffff 	addiu	v0,v0,-1
    1f3c:	aca20018 	sw	v0,24(a1)
    1f40:	40016000 	mfc0	at,c0_status
    1f44:	30630001 	andi	v1,v1,0x1
    1f48:	3421001f 	ori	at,at,0x1f
    1f4c:	3821001f 	xori	at,at,0x1f
    1f50:	00611825 	or	v1,v1,at
    1f54:	40836000 	mtc0	v1,c0_status
    1f58:	00000040 	ssnop
    1f5c:	00000040 	ssnop
    1f60:	00000040 	ssnop
    1f64:	000000c0 	sll	zero,zero,0x3
    1f68:	08000763 	j	1d8c <_SDIO_RegisterHostController+0x1a0>
			1f68: R_MIPS_26	.text
    1f6c:	00000000 	nop
    1f70:	24420000 	addiu	v0,v0,0
			1f70: R_MIPS_LO16	__up
    1f74:	0040f809 	jalr	v0
    1f78:	00c02021 	move	a0,a2
    1f7c:	08000794 	j	1e50 <_SDIO_RegisterHostController+0x264>
			1f7c: R_MIPS_26	.text
    1f80:	00008021 	move	s0,zero
    1f84:	24420000 	addiu	v0,v0,0
			1f84: R_MIPS_LO16	__down_interruptible
    1f88:	0040f809 	jalr	v0
    1f8c:	00c02021 	move	a0,a2
    1f90:	1040ff81 	beqz	v0,1d98 <_SDIO_RegisterHostController+0x1ac>
    1f94:	8e080000 	lw	t0,0(s0)
			1f94: R_MIPS_LO16	pBusContext
    1f98:	3c020000 	lui	v0,0x0
			1f98: R_MIPS_HI16	.text
    1f9c:	24421608 	addiu	v0,v0,5640
			1f9c: R_MIPS_LO16	.text
    1fa0:	0040f809 	jalr	v0
    1fa4:	02202021 	move	a0,s1
    1fa8:	08000708 	j	1c20 <_SDIO_RegisterHostController+0x34>
			1fa8: R_MIPS_26	.text
    1fac:	2410fffa 	li	s0,-6

00001fb0 <_SDIO_UnregisterHostController>:
    1fb0:	27bdffd0 	addiu	sp,sp,-48
    1fb4:	3c020000 	lui	v0,0x0
			1fb4: R_MIPS_HI16	RemoveHcdFunctions
    1fb8:	afbf0028 	sw	ra,40(sp)
    1fbc:	afb50024 	sw	s5,36(sp)
    1fc0:	afb40020 	sw	s4,32(sp)
    1fc4:	afb3001c 	sw	s3,28(sp)
    1fc8:	afb20018 	sw	s2,24(sp)
    1fcc:	afb10014 	sw	s1,20(sp)
    1fd0:	afb00010 	sw	s0,16(sp)
    1fd4:	24420000 	addiu	v0,v0,0
			1fd4: R_MIPS_LO16	RemoveHcdFunctions
    1fd8:	0040f809 	jalr	v0
    1fdc:	00809821 	move	s3,a0
    1fe0:	3c020000 	lui	v0,0x0
			1fe0: R_MIPS_HI16	DeleteDevices
    1fe4:	24420000 	addiu	v0,v0,0
			1fe4: R_MIPS_LO16	DeleteDevices
    1fe8:	0040f809 	jalr	v0
    1fec:	02602021 	move	a0,s3
    1ff0:	3c030000 	lui	v1,0x0
			1ff0: R_MIPS_HI16	cpu_data
    1ff4:	24740000 	addiu	s4,v1,0
			1ff4: R_MIPS_LO16	cpu_data
    1ff8:	3c100000 	lui	s0,0x0
			1ff8: R_MIPS_HI16	pBusContext
    1ffc:	3c150001 	lui	s5,0x1
    2000:	26720004 	addiu	s2,s3,4
    2004:	08000809 	j	2024 <_SDIO_UnregisterHostController+0x74>
			2004: R_MIPS_26	.text
    2008:	24110001 	li	s1,1
    200c:	8f820000 	lw	v0,0(gp)
    2010:	ac510000 	sw	s1,0(v0)
    2014:	3c020000 	lui	v0,0x0
			2014: R_MIPS_HI16	schedule_timeout
    2018:	24420000 	addiu	v0,v0,0
			2018: R_MIPS_LO16	schedule_timeout
    201c:	0040f809 	jalr	v0
    2020:	24040019 	li	a0,25
    2024:	8e050000 	lw	a1,0(s0)
			2024: R_MIPS_LO16	pBusContext
    2028:	8ca20098 	lw	v0,152(a1)
    202c:	8c430000 	lw	v1,0(v0)
    2030:	1462fff6 	bne	v1,v0,200c <_SDIO_UnregisterHostController+0x5c>
    2034:	00000000 	nop
    2038:	8c620004 	lw	v0,4(v1)
    203c:	1462fff3 	bne	v1,v0,200c <_SDIO_UnregisterHostController+0x5c>
    2040:	24a40018 	addiu	a0,a1,24
    2044:	8e820008 	lw	v0,8(s4)
    2048:	00551024 	and	v0,v0,s5
    204c:	10400033 	beqz	v0,211c <_SDIO_UnregisterHostController+0x16c>
    2050:	00000000 	nop
    2054:	c0a30018 	ll	v1,24(a1)
    2058:	2462ffff 	addiu	v0,v1,-1
    205c:	e0a20018 	sc	v0,24(a1)
    2060:	10400086 	beqz	v0,227c <_SDIO_UnregisterHostController+0x2cc>
    2064:	00000000 	nop
    2068:	2462ffff 	addiu	v0,v1,-1
    206c:	04400059 	bltz	v0,21d4 <_SDIO_UnregisterHostController+0x224>
    2070:	3c020000 	lui	v0,0x0
			2070: R_MIPS_HI16	__down_interruptible
    2074:	8e050000 	lw	a1,0(s0)
			2074: R_MIPS_LO16	pBusContext
    2078:	92620018 	lbu	v0,24(s3)
    207c:	8ca3009c 	lw	v1,156(a1)
    2080:	00511004 	sllv	v0,s1,v0
    2084:	00021027 	nor	v0,zero,v0
    2088:	00621824 	and	v1,v1,v0
    208c:	aca3009c 	sw	v1,156(a1)
    2090:	8e440004 	lw	a0,4(s2)
    2094:	8e620004 	lw	v0,4(s3)
    2098:	ac820000 	sw	v0,0(a0)
    209c:	8e630004 	lw	v1,4(s3)
    20a0:	ae720004 	sw	s2,4(s3)
    20a4:	ac640004 	sw	a0,4(v1)
    20a8:	ae520004 	sw	s2,4(s2)
    20ac:	8e050000 	lw	a1,0(s0)
			20ac: R_MIPS_LO16	pBusContext
    20b0:	24a40018 	addiu	a0,a1,24
    20b4:	8e820008 	lw	v0,8(s4)
    20b8:	00551024 	and	v0,v0,s5
    20bc:	1040002e 	beqz	v0,2178 <_SDIO_UnregisterHostController+0x1c8>
    20c0:	00000000 	nop
    20c4:	c0a30018 	ll	v1,24(a1)
    20c8:	24620001 	addiu	v0,v1,1
    20cc:	e0a20018 	sc	v0,24(a1)
    20d0:	1040006c 	beqz	v0,2284 <_SDIO_UnregisterHostController+0x2d4>
    20d4:	00000000 	nop
    20d8:	24620001 	addiu	v0,v1,1
    20dc:	18400044 	blez	v0,21f0 <_SDIO_UnregisterHostController+0x240>
    20e0:	3c020000 	lui	v0,0x0
			20e0: R_MIPS_HI16	__up
    20e4:	3c020000 	lui	v0,0x0
			20e4: R_MIPS_HI16	.text
    20e8:	24421608 	addiu	v0,v0,5640
			20e8: R_MIPS_LO16	.text
    20ec:	0040f809 	jalr	v0
    20f0:	02602021 	move	a0,s3
    20f4:	00001021 	move	v0,zero
    20f8:	8fbf0028 	lw	ra,40(sp)
    20fc:	8fb50024 	lw	s5,36(sp)
    2100:	8fb40020 	lw	s4,32(sp)
    2104:	8fb3001c 	lw	s3,28(sp)
    2108:	8fb20018 	lw	s2,24(sp)
    210c:	8fb10014 	lw	s1,20(sp)
    2110:	8fb00010 	lw	s0,16(sp)
    2114:	03e00008 	jr	ra
    2118:	27bd0030 	addiu	sp,sp,48
    211c:	40036000 	mfc0	v1,c0_status
    2120:	3461001f 	ori	at,v1,0x1f
    2124:	3821001f 	xori	at,at,0x1f
    2128:	40816000 	mtc0	at,c0_status
    212c:	00000040 	ssnop
    2130:	00000040 	ssnop
    2134:	00000040 	ssnop
    2138:	000000c0 	sll	zero,zero,0x3
    213c:	8ca20018 	lw	v0,24(a1)
    2140:	2442ffff 	addiu	v0,v0,-1
    2144:	aca20018 	sw	v0,24(a1)
    2148:	40016000 	mfc0	at,c0_status
    214c:	30630001 	andi	v1,v1,0x1
    2150:	3421001f 	ori	at,at,0x1f
    2154:	3821001f 	xori	at,at,0x1f
    2158:	00611825 	or	v1,v1,at
    215c:	40836000 	mtc0	v1,c0_status
    2160:	00000040 	ssnop
    2164:	00000040 	ssnop
    2168:	00000040 	ssnop
    216c:	000000c0 	sll	zero,zero,0x3
    2170:	0800081b 	j	206c <_SDIO_UnregisterHostController+0xbc>
			2170: R_MIPS_26	.text
    2174:	00000000 	nop
    2178:	40036000 	mfc0	v1,c0_status
    217c:	3461001f 	ori	at,v1,0x1f
    2180:	3821001f 	xori	at,at,0x1f
    2184:	40816000 	mtc0	at,c0_status
    2188:	00000040 	ssnop
    218c:	00000040 	ssnop
    2190:	00000040 	ssnop
    2194:	000000c0 	sll	zero,zero,0x3
    2198:	8ca20018 	lw	v0,24(a1)
    219c:	24420001 	addiu	v0,v0,1
    21a0:	aca20018 	sw	v0,24(a1)
    21a4:	40016000 	mfc0	at,c0_status
    21a8:	30630001 	andi	v1,v1,0x1
    21ac:	3421001f 	ori	at,at,0x1f
    21b0:	3821001f 	xori	at,at,0x1f
    21b4:	00611825 	or	v1,v1,at
    21b8:	40836000 	mtc0	v1,c0_status
    21bc:	00000040 	ssnop
    21c0:	00000040 	ssnop
    21c4:	00000040 	ssnop
    21c8:	000000c0 	sll	zero,zero,0x3
    21cc:	08000837 	j	20dc <_SDIO_UnregisterHostController+0x12c>
			21cc: R_MIPS_26	.text
    21d0:	00000000 	nop
    21d4:	24420000 	addiu	v0,v0,0
			21d4: R_MIPS_LO16	__down_interruptible
    21d8:	0040f809 	jalr	v0
    21dc:	00000000 	nop
    21e0:	1040ffa5 	beqz	v0,2078 <_SDIO_UnregisterHostController+0xc8>
    21e4:	8e050000 	lw	a1,0(s0)
			21e4: R_MIPS_LO16	pBusContext
    21e8:	0800083e 	j	20f8 <_SDIO_UnregisterHostController+0x148>
			21e8: R_MIPS_26	.text
    21ec:	2402fffa 	li	v0,-6
    21f0:	24420000 	addiu	v0,v0,0
			21f0: R_MIPS_LO16	__up
    21f4:	0040f809 	jalr	v0
    21f8:	00000000 	nop
    21fc:	0800083a 	j	20e8 <_SDIO_UnregisterHostController+0x138>
			21fc: R_MIPS_26	.text
    2200:	3c020000 	lui	v0,0x0
			2200: R_MIPS_HI16	.text
    2204:	1000f786 	b	20 <SynchCompletion+0x20>
    2208:	00000000 	nop
    220c:	1000f95b 	b	77c <IssueRequestToHCD+0x50>
    2210:	00000000 	nop
    2214:	1000f972 	b	7e0 <IssueRequestToHCD+0xb4>
    2218:	00000000 	nop
    221c:	1000f984 	b	830 <IssueRequestToHCD+0x104>
    2220:	00000000 	nop
    2224:	1000fa38 	b	b08 <IssueRequestToHCD+0x3dc>
    2228:	00000000 	nop
    222c:	1000fa76 	b	c08 <IssueRequestToHCD+0x4dc>
    2230:	00000000 	nop
    2234:	1000fae7 	b	dd4 <IssueRequestToHCD+0x6a8>
    2238:	00000000 	nop
    223c:	1000fb90 	b	1080 <SendSyncedHcdBusConfig+0xb0>
    2240:	00000000 	nop
    2244:	1000fc0a 	b	1270 <DeleteDevices+0x48>
    2248:	00000000 	nop
    224c:	1000fc32 	b	1318 <DeleteDevices+0xf0>
    2250:	00000000 	nop
    2254:	1000fc8b 	b	1484 <AddDeviceToList+0x40>
    2258:	00000000 	nop
    225c:	1000fca1 	b	14e4 <AddDeviceToList+0xa0>
    2260:	00000000 	nop
    2264:	1000fd79 	b	184c <HcdConfigComplete+0x44>
    2268:	00000000 	nop
    226c:	1000fec1 	b	1d74 <_SDIO_RegisterHostController+0x188>
    2270:	00000000 	nop
    2274:	1000feed 	b	1e2c <_SDIO_RegisterHostController+0x240>
    2278:	00000000 	nop
    227c:	1000ff75 	b	2054 <_SDIO_UnregisterHostController+0xa4>
    2280:	00000000 	nop
    2284:	1000ff8f 	b	20c4 <_SDIO_UnregisterHostController+0x114>
    2288:	00000000 	nop
    228c:	00000000 	nop

00002290 <FilterPnpInfo>:
    2290:	03e00008 	jr	ra
    2294:	24020001 	li	v0,1

00002298 <IsPotentialIdMatch>:
    2298:	94a30000 	lhu	v1,0(a1)
    229c:	1060000a 	beqz	v1,22c8 <IsPotentialIdMatch+0x30>
    22a0:	24a50004 	addiu	a1,a1,4
    22a4:	94820000 	lhu	v0,0(a0)
    22a8:	30420008 	andi	v0,v0,0x8
    22ac:	10400003 	beqz	v0,22bc <IsPotentialIdMatch+0x24>
    22b0:	30630008 	andi	v1,v1,0x8
    22b4:	14600006 	bnez	v1,22d0 <IsPotentialIdMatch+0x38>
    22b8:	00000000 	nop
    22bc:	94a30000 	lhu	v1,0(a1)
    22c0:	1460fffa 	bnez	v1,22ac <IsPotentialIdMatch+0x14>
    22c4:	24a50004 	addiu	a1,a1,4
    22c8:	03e00008 	jr	ra
    22cc:	00001021 	move	v0,zero
    22d0:	03e00008 	jr	ra
    22d4:	24020001 	li	v0,1

000022d8 <NotifyDeviceRemove>:
    22d8:	27bdffd0 	addiu	sp,sp,-48
    22dc:	afb10024 	sw	s1,36(sp)
    22e0:	afb00020 	sw	s0,32(sp)
    22e4:	afbf002c 	sw	ra,44(sp)
    22e8:	afb20028 	sw	s2,40(sp)
    22ec:	8c820030 	lw	v0,48(a0)
    22f0:	27b00010 	addiu	s0,sp,16
    22f4:	00808821 	move	s1,a0
    22f8:	afb00010 	sw	s0,16(sp)
    22fc:	afb00014 	sw	s0,20(sp)
    2300:	10400139 	beqz	v0,27e8 <NotifyDeviceRemove+0x510>
    2304:	a3a00018 	sb	zero,24(sp)
    2308:	8c420020 	lw	v0,32(v0)
    230c:	10400137 	beqz	v0,27ec <NotifyDeviceRemove+0x514>
    2310:	00003021 	move	a2,zero
    2314:	40076000 	mfc0	a3,c0_status
    2318:	34e1001f 	ori	at,a3,0x1f
    231c:	3821001f 	xori	at,at,0x1f
    2320:	40816000 	mtc0	at,c0_status
    2324:	00000040 	ssnop
    2328:	00000040 	ssnop
    232c:	00000040 	ssnop
    2330:	000000c0 	sll	zero,zero,0x3
    2334:	8f820014 	lw	v0,20(gp)
    2338:	24420001 	addiu	v0,v0,1
    233c:	af820014 	sw	v0,20(gp)
    2340:	8c830030 	lw	v1,48(a0)
    2344:	2408fff8 	li	t0,-8
    2348:	906200d8 	lbu	v0,216(v1)
    234c:	34420001 	ori	v0,v0,0x1
    2350:	a06200d8 	sb	v0,216(v1)
    2354:	8c840034 	lw	a0,52(a0)
    2358:	8c86003c 	lw	a2,60(a0)
    235c:	24820038 	addiu	v0,a0,56
    2360:	10c20016 	beq	a2,v0,23bc <NotifyDeviceRemove+0xe4>
    2364:	00c02821 	move	a1,a2
    2368:	8e230030 	lw	v1,48(s1)
    236c:	8ca20044 	lw	v0,68(a1)
    2370:	1443fffa 	bne	v0,v1,235c <NotifyDeviceRemove+0x84>
    2374:	8cc60004 	lw	a2,4(a2)
    2378:	8ca40004 	lw	a0,4(a1)
    237c:	8ca20000 	lw	v0,0(a1)
    2380:	aca80040 	sw	t0,64(a1)
    2384:	ac820000 	sw	v0,0(a0)
    2388:	8ca30000 	lw	v1,0(a1)
    238c:	aca50000 	sw	a1,0(a1)
    2390:	8fa20010 	lw	v0,16(sp)
    2394:	ac640004 	sw	a0,4(v1)
    2398:	aca20000 	sw	v0,0(a1)
    239c:	8fa20010 	lw	v0,16(sp)
    23a0:	acb00004 	sw	s0,4(a1)
    23a4:	ac450004 	sw	a1,4(v0)
    23a8:	8e240034 	lw	a0,52(s1)
    23ac:	afa50010 	sw	a1,16(sp)
    23b0:	24820038 	addiu	v0,a0,56
    23b4:	14c2ffec 	bne	a2,v0,2368 <NotifyDeviceRemove+0x90>
    23b8:	00c02821 	move	a1,a2
    23bc:	40016000 	mfc0	at,c0_status
    23c0:	30e70001 	andi	a3,a3,0x1
    23c4:	3421001f 	ori	at,at,0x1f
    23c8:	3821001f 	xori	at,at,0x1f
    23cc:	00e13825 	or	a3,a3,at
    23d0:	40876000 	mtc0	a3,c0_status
    23d4:	00000040 	ssnop
    23d8:	00000040 	ssnop
    23dc:	00000040 	ssnop
    23e0:	000000c0 	sll	zero,zero,0x3
    23e4:	8f830014 	lw	v1,20(gp)
    23e8:	2463ffff 	addiu	v1,v1,-1
    23ec:	af830014 	sw	v1,20(gp)
    23f0:	8f830008 	lw	v1,8(gp)
    23f4:	30630004 	andi	v1,v1,0x4
    23f8:	1460014c 	bnez	v1,292c <NotifyDeviceRemove+0x654>
    23fc:	3c020000 	lui	v0,0x0
			23fc: R_MIPS_HI16	preempt_schedule
    2400:	3c120000 	lui	s2,0x0
			2400: R_MIPS_HI16	cpu_data
    2404:	8fa50014 	lw	a1,20(sp)
    2408:	12050020 	beq	s0,a1,248c <NotifyDeviceRemove+0x1b4>
    240c:	00000000 	nop
    2410:	8ca40004 	lw	a0,4(a1)
    2414:	8ca20000 	lw	v0,0(a1)
    2418:	ac820000 	sw	v0,0(a0)
    241c:	8ca30000 	lw	v1,0(a1)
    2420:	aca50000 	sw	a1,0(a1)
    2424:	ac640004 	sw	a0,4(v1)
    2428:	8ca20008 	lw	v0,8(a1)
    242c:	2403feff 	li	v1,-257
    2430:	8ca40038 	lw	a0,56(a1)
    2434:	00431024 	and	v0,v0,v1
    2438:	aca20008 	sw	v0,8(a1)
    243c:	10800094 	beqz	a0,2690 <NotifyDeviceRemove+0x3b8>
    2440:	aca50004 	sw	a1,4(a1)
    2444:	26420000 	addiu	v0,s2,0
			2444: R_MIPS_LO16	cpu_data
    2448:	8c430008 	lw	v1,8(v0)
    244c:	3c040001 	lui	a0,0x1
    2450:	00641824 	and	v1,v1,a0
    2454:	10600074 	beqz	v1,2628 <NotifyDeviceRemove+0x350>
    2458:	34028000 	li	v0,0x8000
    245c:	c0a4000c 	ll	a0,12(a1)
    2460:	00821825 	or	v1,a0,v0
    2464:	00621826 	xor	v1,v1,v0
    2468:	e0a3000c 	sc	v1,12(a1)
    246c:	1060055a 	beqz	v1,39d8 <ProbeForFunction+0x594>
    2470:	00821824 	and	v1,a0,v0
    2474:	8ca20038 	lw	v0,56(a1)
    2478:	0040f809 	jalr	v0
    247c:	00a02021 	move	a0,a1
    2480:	8fa50014 	lw	a1,20(sp)
    2484:	1605ffe2 	bne	s0,a1,2410 <NotifyDeviceRemove+0x138>
    2488:	00000000 	nop
    248c:	40056000 	mfc0	a1,c0_status
    2490:	34a1001f 	ori	at,a1,0x1f
    2494:	3821001f 	xori	at,at,0x1f
    2498:	40816000 	mtc0	at,c0_status
    249c:	00000040 	ssnop
    24a0:	00000040 	ssnop
    24a4:	00000040 	ssnop
    24a8:	000000c0 	sll	zero,zero,0x3
    24ac:	8f830014 	lw	v1,20(gp)
    24b0:	24630001 	addiu	v1,v1,1
    24b4:	af830014 	sw	v1,20(gp)
    24b8:	8e220034 	lw	v0,52(s1)
    24bc:	8c440044 	lw	a0,68(v0)
    24c0:	10800005 	beqz	a0,24d8 <NotifyDeviceRemove+0x200>
    24c4:	00000000 	nop
    24c8:	8c830044 	lw	v1,68(a0)
    24cc:	8e220030 	lw	v0,48(s1)
    24d0:	106200cd 	beq	v1,v0,2808 <NotifyDeviceRemove+0x530>
    24d4:	00000000 	nop
    24d8:	40016000 	mfc0	at,c0_status
    24dc:	30a50001 	andi	a1,a1,0x1
    24e0:	3421001f 	ori	at,at,0x1f
    24e4:	3821001f 	xori	at,at,0x1f
    24e8:	00a12825 	or	a1,a1,at
    24ec:	40856000 	mtc0	a1,c0_status
    24f0:	00000040 	ssnop
    24f4:	00000040 	ssnop
    24f8:	00000040 	ssnop
    24fc:	000000c0 	sll	zero,zero,0x3
    2500:	8f830014 	lw	v1,20(gp)
    2504:	2463ffff 	addiu	v1,v1,-1
    2508:	af830014 	sw	v1,20(gp)
    250c:	8f830008 	lw	v1,8(gp)
    2510:	30630004 	andi	v1,v1,0x4
    2514:	1460010f 	bnez	v1,2954 <NotifyDeviceRemove+0x67c>
    2518:	3c020000 	lui	v0,0x0
			2518: R_MIPS_HI16	preempt_schedule
    251c:	3c100000 	lui	s0,0x0
			251c: R_MIPS_HI16	pBusContext
    2520:	8e050000 	lw	a1,0(s0)
			2520: R_MIPS_LO16	pBusContext
    2524:	24a6002c 	addiu	a2,a1,44
    2528:	26420000 	addiu	v0,s2,0
			2528: R_MIPS_LO16	cpu_data
    252c:	8c430008 	lw	v1,8(v0)
    2530:	3c040001 	lui	a0,0x1
    2534:	00641824 	and	v1,v1,a0
    2538:	1060007d 	beqz	v1,2730 <NotifyDeviceRemove+0x458>
    253c:	00000000 	nop
    2540:	c0a3002c 	ll	v1,44(a1)
    2544:	2462ffff 	addiu	v0,v1,-1
    2548:	e0a2002c 	sc	v0,44(a1)
    254c:	10400524 	beqz	v0,39e0 <ProbeForFunction+0x59c>
    2550:	00000000 	nop
    2554:	2462ffff 	addiu	v0,v1,-1
    2558:	044000ed 	bltz	v0,2910 <NotifyDeviceRemove+0x638>
    255c:	3c020000 	lui	v0,0x0
			255c: R_MIPS_HI16	__down_interruptible
    2560:	8e240030 	lw	a0,48(s1)
    2564:	8c820020 	lw	v0,32(a0)
    2568:	0040f809 	jalr	v0
    256c:	02202821 	move	a1,s1
    2570:	8e230030 	lw	v1,48(s1)
    2574:	8c620014 	lw	v0,20(v1)
    2578:	2442ffff 	addiu	v0,v0,-1
    257c:	ac620014 	sw	v0,20(v1)
    2580:	ae200020 	sw	zero,32(s1)
    2584:	8e050000 	lw	a1,0(s0)
			2584: R_MIPS_LO16	pBusContext
    2588:	24a6002c 	addiu	a2,a1,44
    258c:	26430000 	addiu	v1,s2,0
			258c: R_MIPS_LO16	cpu_data
    2590:	8c620008 	lw	v0,8(v1)
    2594:	3c040001 	lui	a0,0x1
    2598:	00441024 	and	v0,v0,a0
    259c:	1040007b 	beqz	v0,278c <NotifyDeviceRemove+0x4b4>
    25a0:	00000000 	nop
    25a4:	c0a3002c 	ll	v1,44(a1)
    25a8:	24620001 	addiu	v0,v1,1
    25ac:	e0a2002c 	sc	v0,44(a1)
    25b0:	1040050d 	beqz	v0,39e8 <ProbeForFunction+0x5a4>
    25b4:	00000000 	nop
    25b8:	24620001 	addiu	v0,v1,1
    25bc:	184000e0 	blez	v0,2940 <NotifyDeviceRemove+0x668>
    25c0:	3c020000 	lui	v0,0x0
			25c0: R_MIPS_HI16	__up
    25c4:	3c020000 	lui	v0,0x0
			25c4: R_MIPS_HI16	OS_RemoveDevice
    25c8:	24420000 	addiu	v0,v0,0
			25c8: R_MIPS_LO16	OS_RemoveDevice
    25cc:	0040f809 	jalr	v0
    25d0:	02202021 	move	a0,s1
    25d4:	26230008 	addiu	v1,s1,8
    25d8:	8c650004 	lw	a1,4(v1)
    25dc:	8e220008 	lw	v0,8(s1)
    25e0:	00003021 	move	a2,zero
    25e4:	aca20000 	sw	v0,0(a1)
    25e8:	8e240008 	lw	a0,8(s1)
    25ec:	ae230008 	sw	v1,8(s1)
    25f0:	ac850004 	sw	a1,4(a0)
    25f4:	ac630004 	sw	v1,4(v1)
    25f8:	8e240030 	lw	a0,48(s1)
    25fc:	908200d8 	lbu	v0,216(a0)
    2600:	304200fe 	andi	v0,v0,0xfe
    2604:	a08200d8 	sb	v0,216(a0)
    2608:	ae200030 	sw	zero,48(s1)
    260c:	8fbf002c 	lw	ra,44(sp)
    2610:	8fb20028 	lw	s2,40(sp)
    2614:	8fb10024 	lw	s1,36(sp)
    2618:	8fb00020 	lw	s0,32(sp)
    261c:	00c01021 	move	v0,a2
    2620:	03e00008 	jr	ra
    2624:	27bd0030 	addiu	sp,sp,48
    2628:	40046000 	mfc0	a0,c0_status
    262c:	3481001f 	ori	at,a0,0x1f
    2630:	3821001f 	xori	at,at,0x1f
    2634:	40816000 	mtc0	at,c0_status
    2638:	00000040 	ssnop
    263c:	00000040 	ssnop
    2640:	00000040 	ssnop
    2644:	000000c0 	sll	zero,zero,0x3
    2648:	8ca2000c 	lw	v0,12(a1)
    264c:	8ca3000c 	lw	v1,12(a1)
    2650:	3c02ffff 	lui	v0,0xffff
    2654:	34427fff 	ori	v0,v0,0x7fff
    2658:	00621824 	and	v1,v1,v0
    265c:	aca3000c 	sw	v1,12(a1)
    2660:	40016000 	mfc0	at,c0_status
    2664:	30840001 	andi	a0,a0,0x1
    2668:	3421001f 	ori	at,at,0x1f
    266c:	3821001f 	xori	at,at,0x1f
    2670:	00812025 	or	a0,a0,at
    2674:	40846000 	mtc0	a0,c0_status
    2678:	00000040 	ssnop
    267c:	00000040 	ssnop
    2680:	00000040 	ssnop
    2684:	000000c0 	sll	zero,zero,0x3
    2688:	0800091d 	j	2474 <NotifyDeviceRemove+0x19c>
			2688: R_MIPS_26	.text
    268c:	00000000 	nop
    2690:	26420000 	addiu	v0,s2,0
			2690: R_MIPS_LO16	cpu_data
    2694:	8c430008 	lw	v1,8(v0)
    2698:	3c040001 	lui	a0,0x1
    269c:	00641824 	and	v1,v1,a0
    26a0:	10600009 	beqz	v1,26c8 <NotifyDeviceRemove+0x3f0>
    26a4:	34028000 	li	v0,0x8000
    26a8:	c0a4000c 	ll	a0,12(a1)
    26ac:	00821825 	or	v1,a0,v0
    26b0:	00621826 	xor	v1,v1,v0
    26b4:	e0a3000c 	sc	v1,12(a1)
    26b8:	106004cd 	beqz	v1,39f0 <ProbeForFunction+0x5ac>
    26bc:	00821824 	and	v1,a0,v0
    26c0:	08000902 	j	2408 <NotifyDeviceRemove+0x130>
			26c0: R_MIPS_26	.text
    26c4:	8fa50014 	lw	a1,20(sp)
    26c8:	40046000 	mfc0	a0,c0_status
    26cc:	3481001f 	ori	at,a0,0x1f
    26d0:	3821001f 	xori	at,at,0x1f
    26d4:	40816000 	mtc0	at,c0_status
    26d8:	00000040 	ssnop
    26dc:	00000040 	ssnop
    26e0:	00000040 	ssnop
    26e4:	000000c0 	sll	zero,zero,0x3
    26e8:	8ca2000c 	lw	v0,12(a1)
    26ec:	8ca3000c 	lw	v1,12(a1)
    26f0:	3c02ffff 	lui	v0,0xffff
    26f4:	34427fff 	ori	v0,v0,0x7fff
    26f8:	00621824 	and	v1,v1,v0
    26fc:	aca3000c 	sw	v1,12(a1)
    2700:	40016000 	mfc0	at,c0_status
    2704:	30840001 	andi	a0,a0,0x1
    2708:	3421001f 	ori	at,at,0x1f
    270c:	3821001f 	xori	at,at,0x1f
    2710:	00812025 	or	a0,a0,at
    2714:	40846000 	mtc0	a0,c0_status
    2718:	00000040 	ssnop
    271c:	00000040 	ssnop
    2720:	00000040 	ssnop
    2724:	000000c0 	sll	zero,zero,0x3
    2728:	08000902 	j	2408 <NotifyDeviceRemove+0x130>
			2728: R_MIPS_26	.text
    272c:	8fa50014 	lw	a1,20(sp)
    2730:	40036000 	mfc0	v1,c0_status
    2734:	3461001f 	ori	at,v1,0x1f
    2738:	3821001f 	xori	at,at,0x1f
    273c:	40816000 	mtc0	at,c0_status
    2740:	00000040 	ssnop
    2744:	00000040 	ssnop
    2748:	00000040 	ssnop
    274c:	000000c0 	sll	zero,zero,0x3
    2750:	8ca2002c 	lw	v0,44(a1)
    2754:	2442ffff 	addiu	v0,v0,-1
    2758:	aca2002c 	sw	v0,44(a1)
    275c:	40016000 	mfc0	at,c0_status
    2760:	30630001 	andi	v1,v1,0x1
    2764:	3421001f 	ori	at,at,0x1f
    2768:	3821001f 	xori	at,at,0x1f
    276c:	00611825 	or	v1,v1,at
    2770:	40836000 	mtc0	v1,c0_status
    2774:	00000040 	ssnop
    2778:	00000040 	ssnop
    277c:	00000040 	ssnop
    2780:	000000c0 	sll	zero,zero,0x3
    2784:	08000956 	j	2558 <NotifyDeviceRemove+0x280>
			2784: R_MIPS_26	.text
    2788:	00000000 	nop
    278c:	40036000 	mfc0	v1,c0_status
    2790:	3461001f 	ori	at,v1,0x1f
    2794:	3821001f 	xori	at,at,0x1f
    2798:	40816000 	mtc0	at,c0_status
    279c:	00000040 	ssnop
    27a0:	00000040 	ssnop
    27a4:	00000040 	ssnop
    27a8:	000000c0 	sll	zero,zero,0x3
    27ac:	8ca2002c 	lw	v0,44(a1)
    27b0:	24420001 	addiu	v0,v0,1
    27b4:	aca2002c 	sw	v0,44(a1)
    27b8:	40016000 	mfc0	at,c0_status
    27bc:	30630001 	andi	v1,v1,0x1
    27c0:	3421001f 	ori	at,at,0x1f
    27c4:	3821001f 	xori	at,at,0x1f
    27c8:	00611825 	or	v1,v1,at
    27cc:	40836000 	mtc0	v1,c0_status
    27d0:	00000040 	ssnop
    27d4:	00000040 	ssnop
    27d8:	00000040 	ssnop
    27dc:	000000c0 	sll	zero,zero,0x3
    27e0:	0800096f 	j	25bc <NotifyDeviceRemove+0x2e4>
			27e0: R_MIPS_26	.text
    27e4:	00000000 	nop
    27e8:	00003021 	move	a2,zero
    27ec:	8fbf002c 	lw	ra,44(sp)
    27f0:	8fb20028 	lw	s2,40(sp)
    27f4:	8fb10024 	lw	s1,36(sp)
    27f8:	8fb00020 	lw	s0,32(sp)
    27fc:	00c01021 	move	v0,a2
    2800:	03e00008 	jr	ra
    2804:	27bd0030 	addiu	sp,sp,48
    2808:	1060ff33 	beqz	v1,24d8 <NotifyDeviceRemove+0x200>
    280c:	00000000 	nop
    2810:	8c820008 	lw	v0,8(a0)
    2814:	34420020 	ori	v0,v0,0x20
    2818:	ac820008 	sw	v0,8(a0)
    281c:	40016000 	mfc0	at,c0_status
    2820:	30a50001 	andi	a1,a1,0x1
    2824:	3421001f 	ori	at,at,0x1f
    2828:	3821001f 	xori	at,at,0x1f
    282c:	00a12825 	or	a1,a1,at
    2830:	40856000 	mtc0	a1,c0_status
    2834:	00000040 	ssnop
    2838:	00000040 	ssnop
    283c:	00000040 	ssnop
    2840:	000000c0 	sll	zero,zero,0x3
    2844:	8f830014 	lw	v1,20(gp)
    2848:	2463ffff 	addiu	v1,v1,-1
    284c:	af830014 	sw	v1,20(gp)
    2850:	8f830008 	lw	v1,8(gp)
    2854:	30630004 	andi	v1,v1,0x4
    2858:	14600043 	bnez	v1,2968 <NotifyDeviceRemove+0x690>
    285c:	3c020000 	lui	v0,0x0
			285c: R_MIPS_HI16	preempt_schedule
    2860:	8e250030 	lw	a1,48(s1)
    2864:	24a600cc 	addiu	a2,a1,204
    2868:	26420000 	addiu	v0,s2,0
			2868: R_MIPS_LO16	cpu_data
    286c:	8c430008 	lw	v1,8(v0)
    2870:	3c040001 	lui	a0,0x1
    2874:	00641824 	and	v1,v1,a0
    2878:	1060000e 	beqz	v1,28b4 <NotifyDeviceRemove+0x5dc>
    287c:	00000000 	nop
    2880:	c0a300cc 	ll	v1,204(a1)
    2884:	2462ffff 	addiu	v0,v1,-1
    2888:	e0a200cc 	sc	v0,204(a1)
    288c:	1040045a 	beqz	v0,39f8 <ProbeForFunction+0x5b4>
    2890:	00000000 	nop
    2894:	2462ffff 	addiu	v0,v1,-1
    2898:	0441ff20 	bgez	v0,251c <NotifyDeviceRemove+0x244>
    289c:	3c020000 	lui	v0,0x0
			289c: R_MIPS_HI16	__down
    28a0:	24420000 	addiu	v0,v0,0
			28a0: R_MIPS_LO16	__down
    28a4:	0040f809 	jalr	v0
    28a8:	00c02021 	move	a0,a2
    28ac:	08000948 	j	2520 <NotifyDeviceRemove+0x248>
			28ac: R_MIPS_26	.text
    28b0:	3c100000 	lui	s0,0x0
			28b0: R_MIPS_HI16	pBusContext
    28b4:	40036000 	mfc0	v1,c0_status
    28b8:	3461001f 	ori	at,v1,0x1f
    28bc:	3821001f 	xori	at,at,0x1f
    28c0:	40816000 	mtc0	at,c0_status
    28c4:	00000040 	ssnop
    28c8:	00000040 	ssnop
    28cc:	00000040 	ssnop
    28d0:	000000c0 	sll	zero,zero,0x3
    28d4:	8ca200cc 	lw	v0,204(a1)
    28d8:	2442ffff 	addiu	v0,v0,-1
    28dc:	aca200cc 	sw	v0,204(a1)
    28e0:	40016000 	mfc0	at,c0_status
    28e4:	30630001 	andi	v1,v1,0x1
    28e8:	3421001f 	ori	at,at,0x1f
    28ec:	3821001f 	xori	at,at,0x1f
    28f0:	00611825 	or	v1,v1,at
    28f4:	40836000 	mtc0	v1,c0_status
    28f8:	00000040 	ssnop
    28fc:	00000040 	ssnop
    2900:	00000040 	ssnop
    2904:	000000c0 	sll	zero,zero,0x3
    2908:	08000a26 	j	2898 <NotifyDeviceRemove+0x5c0>
			2908: R_MIPS_26	.text
    290c:	00000000 	nop
    2910:	24420000 	addiu	v0,v0,0
			2910: R_MIPS_LO16	__down_interruptible
    2914:	0040f809 	jalr	v0
    2918:	00c02021 	move	a0,a2
    291c:	1040ff10 	beqz	v0,2560 <NotifyDeviceRemove+0x288>
    2920:	2406fffa 	li	a2,-6
    2924:	08000984 	j	2610 <NotifyDeviceRemove+0x338>
			2924: R_MIPS_26	.text
    2928:	8fbf002c 	lw	ra,44(sp)
    292c:	24420000 	addiu	v0,v0,0
			292c: R_MIPS_LO16	preempt_schedule
    2930:	0040f809 	jalr	v0
    2934:	3c120000 	lui	s2,0x0
			2934: R_MIPS_HI16	cpu_data
    2938:	08000902 	j	2408 <NotifyDeviceRemove+0x130>
			2938: R_MIPS_26	.text
    293c:	8fa50014 	lw	a1,20(sp)
    2940:	24420000 	addiu	v0,v0,0
			2940: R_MIPS_LO16	__up
    2944:	0040f809 	jalr	v0
    2948:	00c02021 	move	a0,a2
    294c:	08000972 	j	25c8 <NotifyDeviceRemove+0x2f0>
			294c: R_MIPS_26	.text
    2950:	3c020000 	lui	v0,0x0
			2950: R_MIPS_HI16	OS_RemoveDevice
    2954:	24420000 	addiu	v0,v0,0
			2954: R_MIPS_LO16	preempt_schedule
    2958:	0040f809 	jalr	v0
    295c:	3c100000 	lui	s0,0x0
			295c: R_MIPS_HI16	pBusContext
    2960:	08000949 	j	2524 <NotifyDeviceRemove+0x24c>
			2960: R_MIPS_26	.text
    2964:	8e050000 	lw	a1,0(s0)
			2964: R_MIPS_LO16	pBusContext
    2968:	24420000 	addiu	v0,v0,0
			2968: R_MIPS_LO16	preempt_schedule
    296c:	0040f809 	jalr	v0
    2970:	00000000 	nop
    2974:	08000a19 	j	2864 <NotifyDeviceRemove+0x58c>
			2974: R_MIPS_26	.text
    2978:	8e250030 	lw	a1,48(s1)

0000297c <RemoveHcdFunctions>:
    297c:	27bdffd0 	addiu	sp,sp,-48
    2980:	afb50024 	sw	s5,36(sp)
    2984:	3c150000 	lui	s5,0x0
			2984: R_MIPS_HI16	pBusContext
    2988:	8ea50000 	lw	a1,0(s5)
			2988: R_MIPS_LO16	pBusContext
    298c:	afb3001c 	sw	s3,28(sp)
    2990:	afbf002c 	sw	ra,44(sp)
    2994:	afb60028 	sw	s6,40(sp)
    2998:	afb40020 	sw	s4,32(sp)
    299c:	afb20018 	sw	s2,24(sp)
    29a0:	afb10014 	sw	s1,20(sp)
    29a4:	afb00010 	sw	s0,16(sp)
    29a8:	00809821 	move	s3,a0
    29ac:	24a60040 	addiu	a2,a1,64
    29b0:	3c160000 	lui	s6,0x0
			29b0: R_MIPS_HI16	cpu_data
    29b4:	26c20000 	addiu	v0,s6,0
			29b4: R_MIPS_LO16	cpu_data
    29b8:	8c430008 	lw	v1,8(v0)
    29bc:	3c040001 	lui	a0,0x1
    29c0:	00641824 	and	v1,v1,a0
    29c4:	1060003e 	beqz	v1,2ac0 <RemoveHcdFunctions+0x144>
    29c8:	00000000 	nop
    29cc:	c0a30040 	ll	v1,64(a1)
    29d0:	2462ffff 	addiu	v0,v1,-1
    29d4:	e0a20040 	sc	v0,64(a1)
    29d8:	10400409 	beqz	v0,3a00 <ProbeForFunction+0x5bc>
    29dc:	00000000 	nop
    29e0:	2462ffff 	addiu	v0,v1,-1
    29e4:	04400064 	bltz	v0,2b78 <RemoveHcdFunctions+0x1fc>
    29e8:	3c020000 	lui	v0,0x0
			29e8: R_MIPS_HI16	__down
    29ec:	92620056 	lbu	v0,86(s3)
    29f0:	34420001 	ori	v0,v0,0x1
    29f4:	a2620056 	sb	v0,86(s3)
    29f8:	8ea50000 	lw	a1,0(s5)
			29f8: R_MIPS_LO16	pBusContext
    29fc:	8cb2003c 	lw	s2,60(a1)
    2a00:	24a20038 	addiu	v0,a1,56
    2a04:	12420010 	beq	s2,v0,2a48 <RemoveHcdFunctions+0xcc>
    2a08:	3c020000 	lui	v0,0x0
			2a08: R_MIPS_HI16	NotifyDeviceRemove
    2a0c:	24540000 	addiu	s4,v0,0
			2a0c: R_MIPS_LO16	NotifyDeviceRemove
    2a10:	8e5000c4 	lw	s0,196(s2)
    2a14:	08000a8a 	j	2a28 <RemoveHcdFunctions+0xac>
			2a14: R_MIPS_26	.text
    2a18:	265100c0 	addiu	s1,s2,192
    2a1c:	8c420034 	lw	v0,52(v0)
    2a20:	12620023 	beq	s3,v0,2ab0 <RemoveHcdFunctions+0x134>
    2a24:	8e100004 	lw	s0,4(s0)
    2a28:	2602fff8 	addiu	v0,s0,-8
    2a2c:	1611fffb 	bne	s0,s1,2a1c <RemoveHcdFunctions+0xa0>
    2a30:	00402021 	move	a0,v0
    2a34:	8ea50000 	lw	a1,0(s5)
			2a34: R_MIPS_LO16	pBusContext
    2a38:	8e520004 	lw	s2,4(s2)
    2a3c:	24a20038 	addiu	v0,a1,56
    2a40:	1452fff3 	bne	v0,s2,2a10 <RemoveHcdFunctions+0x94>
    2a44:	00000000 	nop
    2a48:	24a60040 	addiu	a2,a1,64
    2a4c:	26c20000 	addiu	v0,s6,0
			2a4c: R_MIPS_LO16	cpu_data
    2a50:	8c430008 	lw	v1,8(v0)
    2a54:	3c040001 	lui	a0,0x1
    2a58:	00641824 	and	v1,v1,a0
    2a5c:	1060002f 	beqz	v1,2b1c <RemoveHcdFunctions+0x1a0>
    2a60:	00000000 	nop
    2a64:	c0a30040 	ll	v1,64(a1)
    2a68:	24620001 	addiu	v0,v1,1
    2a6c:	e0a20040 	sc	v0,64(a1)
    2a70:	104003e5 	beqz	v0,3a08 <ProbeForFunction+0x5c4>
    2a74:	00000000 	nop
    2a78:	24620001 	addiu	v0,v1,1
    2a7c:	18400043 	blez	v0,2b8c <RemoveHcdFunctions+0x210>
    2a80:	3c020000 	lui	v0,0x0
			2a80: R_MIPS_HI16	__up
    2a84:	8fbf002c 	lw	ra,44(sp)
    2a88:	8fb60028 	lw	s6,40(sp)
    2a8c:	8fb50024 	lw	s5,36(sp)
    2a90:	8fb40020 	lw	s4,32(sp)
    2a94:	8fb3001c 	lw	s3,28(sp)
    2a98:	8fb20018 	lw	s2,24(sp)
    2a9c:	8fb10014 	lw	s1,20(sp)
    2aa0:	8fb00010 	lw	s0,16(sp)
    2aa4:	00001021 	move	v0,zero
    2aa8:	03e00008 	jr	ra
    2aac:	27bd0030 	addiu	sp,sp,48
    2ab0:	0280f809 	jalr	s4
    2ab4:	00000000 	nop
    2ab8:	08000a8b 	j	2a2c <RemoveHcdFunctions+0xb0>
			2ab8: R_MIPS_26	.text
    2abc:	2602fff8 	addiu	v0,s0,-8
    2ac0:	40036000 	mfc0	v1,c0_status
    2ac4:	3461001f 	ori	at,v1,0x1f
    2ac8:	3821001f 	xori	at,at,0x1f
    2acc:	40816000 	mtc0	at,c0_status
    2ad0:	00000040 	ssnop
    2ad4:	00000040 	ssnop
    2ad8:	00000040 	ssnop
    2adc:	000000c0 	sll	zero,zero,0x3
    2ae0:	8ca20040 	lw	v0,64(a1)
    2ae4:	2442ffff 	addiu	v0,v0,-1
    2ae8:	aca20040 	sw	v0,64(a1)
    2aec:	40016000 	mfc0	at,c0_status
    2af0:	30630001 	andi	v1,v1,0x1
    2af4:	3421001f 	ori	at,at,0x1f
    2af8:	3821001f 	xori	at,at,0x1f
    2afc:	00611825 	or	v1,v1,at
    2b00:	40836000 	mtc0	v1,c0_status
    2b04:	00000040 	ssnop
    2b08:	00000040 	ssnop
    2b0c:	00000040 	ssnop
    2b10:	000000c0 	sll	zero,zero,0x3
    2b14:	08000a79 	j	29e4 <RemoveHcdFunctions+0x68>
			2b14: R_MIPS_26	.text
    2b18:	00000000 	nop
    2b1c:	40036000 	mfc0	v1,c0_status
    2b20:	3461001f 	ori	at,v1,0x1f
    2b24:	3821001f 	xori	at,at,0x1f
    2b28:	40816000 	mtc0	at,c0_status
    2b2c:	00000040 	ssnop
    2b30:	00000040 	ssnop
    2b34:	00000040 	ssnop
    2b38:	000000c0 	sll	zero,zero,0x3
    2b3c:	8ca20040 	lw	v0,64(a1)
    2b40:	24420001 	addiu	v0,v0,1
    2b44:	aca20040 	sw	v0,64(a1)
    2b48:	40016000 	mfc0	at,c0_status
    2b4c:	30630001 	andi	v1,v1,0x1
    2b50:	3421001f 	ori	at,at,0x1f
    2b54:	3821001f 	xori	at,at,0x1f
    2b58:	00611825 	or	v1,v1,at
    2b5c:	40836000 	mtc0	v1,c0_status
    2b60:	00000040 	ssnop
    2b64:	00000040 	ssnop
    2b68:	00000040 	ssnop
    2b6c:	000000c0 	sll	zero,zero,0x3
    2b70:	08000a9f 	j	2a7c <RemoveHcdFunctions+0x100>
			2b70: R_MIPS_26	.text
    2b74:	00000000 	nop
    2b78:	24420000 	addiu	v0,v0,0
			2b78: R_MIPS_LO16	__down
    2b7c:	0040f809 	jalr	v0
    2b80:	00c02021 	move	a0,a2
    2b84:	08000a7c 	j	29f0 <RemoveHcdFunctions+0x74>
			2b84: R_MIPS_26	.text
    2b88:	92620056 	lbu	v0,86(s3)
    2b8c:	24420000 	addiu	v0,v0,0
			2b8c: R_MIPS_LO16	__up
    2b90:	0040f809 	jalr	v0
    2b94:	00c02021 	move	a0,a2
    2b98:	08000aa2 	j	2a88 <RemoveHcdFunctions+0x10c>
			2b98: R_MIPS_26	.text
    2b9c:	8fbf002c 	lw	ra,44(sp)

00002ba0 <RemoveAllFunctions>:
    2ba0:	27bdffd8 	addiu	sp,sp,-40
    2ba4:	afb20018 	sw	s2,24(sp)
    2ba8:	3c120000 	lui	s2,0x0
			2ba8: R_MIPS_HI16	pBusContext
    2bac:	8e450000 	lw	a1,0(s2)
			2bac: R_MIPS_LO16	pBusContext
    2bb0:	afbf0020 	sw	ra,32(sp)
    2bb4:	afb3001c 	sw	s3,28(sp)
    2bb8:	afb10014 	sw	s1,20(sp)
    2bbc:	afb00010 	sw	s0,16(sp)
    2bc0:	24a60018 	addiu	a2,a1,24
    2bc4:	3c130000 	lui	s3,0x0
			2bc4: R_MIPS_HI16	cpu_data
    2bc8:	26620000 	addiu	v0,s3,0
			2bc8: R_MIPS_LO16	cpu_data
    2bcc:	8c430008 	lw	v1,8(v0)
    2bd0:	3c040001 	lui	a0,0x1
    2bd4:	00641824 	and	v1,v1,a0
    2bd8:	1060002d 	beqz	v1,2c90 <RemoveAllFunctions+0xf0>
    2bdc:	00000000 	nop
    2be0:	c0a30018 	ll	v1,24(a1)
    2be4:	2462ffff 	addiu	v0,v1,-1
    2be8:	e0a20018 	sc	v0,24(a1)
    2bec:	10400388 	beqz	v0,3a10 <ProbeForFunction+0x5cc>
    2bf0:	00000000 	nop
    2bf4:	2462ffff 	addiu	v0,v1,-1
    2bf8:	04400053 	bltz	v0,2d48 <RemoveAllFunctions+0x1a8>
    2bfc:	3c020000 	lui	v0,0x0
			2bfc: R_MIPS_HI16	__down
    2c00:	8e450000 	lw	a1,0(s2)
			2c00: R_MIPS_LO16	pBusContext
    2c04:	8cb00014 	lw	s0,20(a1)
    2c08:	24a20010 	addiu	v0,a1,16
    2c0c:	12020009 	beq	s0,v0,2c34 <RemoveAllFunctions+0x94>
    2c10:	3c020000 	lui	v0,0x0
			2c10: R_MIPS_HI16	RemoveHcdFunctions
    2c14:	24510000 	addiu	s1,v0,0
			2c14: R_MIPS_LO16	RemoveHcdFunctions
    2c18:	0220f809 	jalr	s1
    2c1c:	2604fffc 	addiu	a0,s0,-4
    2c20:	8e450000 	lw	a1,0(s2)
			2c20: R_MIPS_LO16	pBusContext
    2c24:	8e100004 	lw	s0,4(s0)
    2c28:	24a20010 	addiu	v0,a1,16
    2c2c:	1450fffa 	bne	v0,s0,2c18 <RemoveAllFunctions+0x78>
    2c30:	00000000 	nop
    2c34:	24a60018 	addiu	a2,a1,24
    2c38:	26620000 	addiu	v0,s3,0
			2c38: R_MIPS_LO16	cpu_data
    2c3c:	8c430008 	lw	v1,8(v0)
    2c40:	3c040001 	lui	a0,0x1
    2c44:	00641824 	and	v1,v1,a0
    2c48:	10600028 	beqz	v1,2cec <RemoveAllFunctions+0x14c>
    2c4c:	00000000 	nop
    2c50:	c0a30018 	ll	v1,24(a1)
    2c54:	24620001 	addiu	v0,v1,1
    2c58:	e0a20018 	sc	v0,24(a1)
    2c5c:	1040036e 	beqz	v0,3a18 <ProbeForFunction+0x5d4>
    2c60:	00000000 	nop
    2c64:	24620001 	addiu	v0,v1,1
    2c68:	1840003c 	blez	v0,2d5c <RemoveAllFunctions+0x1bc>
    2c6c:	3c020000 	lui	v0,0x0
			2c6c: R_MIPS_HI16	__up
    2c70:	8fbf0020 	lw	ra,32(sp)
    2c74:	8fb3001c 	lw	s3,28(sp)
    2c78:	8fb20018 	lw	s2,24(sp)
    2c7c:	8fb10014 	lw	s1,20(sp)
    2c80:	8fb00010 	lw	s0,16(sp)
    2c84:	00001021 	move	v0,zero
    2c88:	03e00008 	jr	ra
    2c8c:	27bd0028 	addiu	sp,sp,40
    2c90:	40036000 	mfc0	v1,c0_status
    2c94:	3461001f 	ori	at,v1,0x1f
    2c98:	3821001f 	xori	at,at,0x1f
    2c9c:	40816000 	mtc0	at,c0_status
    2ca0:	00000040 	ssnop
    2ca4:	00000040 	ssnop
    2ca8:	00000040 	ssnop
    2cac:	000000c0 	sll	zero,zero,0x3
    2cb0:	8ca20018 	lw	v0,24(a1)
    2cb4:	2442ffff 	addiu	v0,v0,-1
    2cb8:	aca20018 	sw	v0,24(a1)
    2cbc:	40016000 	mfc0	at,c0_status
    2cc0:	30630001 	andi	v1,v1,0x1
    2cc4:	3421001f 	ori	at,at,0x1f
    2cc8:	3821001f 	xori	at,at,0x1f
    2ccc:	00611825 	or	v1,v1,at
    2cd0:	40836000 	mtc0	v1,c0_status
    2cd4:	00000040 	ssnop
    2cd8:	00000040 	ssnop
    2cdc:	00000040 	ssnop
    2ce0:	000000c0 	sll	zero,zero,0x3
    2ce4:	08000afe 	j	2bf8 <RemoveAllFunctions+0x58>
			2ce4: R_MIPS_26	.text
    2ce8:	00000000 	nop
    2cec:	40036000 	mfc0	v1,c0_status
    2cf0:	3461001f 	ori	at,v1,0x1f
    2cf4:	3821001f 	xori	at,at,0x1f
    2cf8:	40816000 	mtc0	at,c0_status
    2cfc:	00000040 	ssnop
    2d00:	00000040 	ssnop
    2d04:	00000040 	ssnop
    2d08:	000000c0 	sll	zero,zero,0x3
    2d0c:	8ca20018 	lw	v0,24(a1)
    2d10:	24420001 	addiu	v0,v0,1
    2d14:	aca20018 	sw	v0,24(a1)
    2d18:	40016000 	mfc0	at,c0_status
    2d1c:	30630001 	andi	v1,v1,0x1
    2d20:	3421001f 	ori	at,at,0x1f
    2d24:	3821001f 	xori	at,at,0x1f
    2d28:	00611825 	or	v1,v1,at
    2d2c:	40836000 	mtc0	v1,c0_status
    2d30:	00000040 	ssnop
    2d34:	00000040 	ssnop
    2d38:	00000040 	ssnop
    2d3c:	000000c0 	sll	zero,zero,0x3
    2d40:	08000b1a 	j	2c68 <RemoveAllFunctions+0xc8>
			2d40: R_MIPS_26	.text
    2d44:	00000000 	nop
    2d48:	24420000 	addiu	v0,v0,0
			2d48: R_MIPS_LO16	__down
    2d4c:	0040f809 	jalr	v0
    2d50:	00c02021 	move	a0,a2
    2d54:	08000b01 	j	2c04 <RemoveAllFunctions+0x64>
			2d54: R_MIPS_26	.text
    2d58:	8e450000 	lw	a1,0(s2)
			2d58: R_MIPS_LO16	pBusContext
    2d5c:	24420000 	addiu	v0,v0,0
			2d5c: R_MIPS_LO16	__up
    2d60:	0040f809 	jalr	v0
    2d64:	00c02021 	move	a0,a2
    2d68:	08000b1d 	j	2c74 <RemoveAllFunctions+0xd4>
			2d68: R_MIPS_26	.text
    2d6c:	8fbf0020 	lw	ra,32(sp)

00002d70 <_SDIO_RegisterFunction>:
    2d70:	27bdffc8 	addiu	sp,sp,-56
    2d74:	afb00010 	sw	s0,16(sp)
    2d78:	afbf0034 	sw	ra,52(sp)
    2d7c:	afbe0030 	sw	s8,48(sp)
    2d80:	afb7002c 	sw	s7,44(sp)
    2d84:	afb60028 	sw	s6,40(sp)
    2d88:	afb50024 	sw	s5,36(sp)
    2d8c:	afb40020 	sw	s4,32(sp)
    2d90:	afb3001c 	sw	s3,28(sp)
    2d94:	afb20018 	sw	s2,24(sp)
    2d98:	afb10014 	sw	s1,20(sp)
    2d9c:	3c030000 	lui	v1,0x0
			2d9c: R_MIPS_HI16	g_Version
    2da0:	00808021 	move	s0,a0
    2da4:	90620000 	lbu	v0,0(v1)
			2da4: R_MIPS_LO16	g_Version
    2da8:	90840000 	lbu	a0,0(a0)
    2dac:	00021102 	srl	v0,v0,0x4
    2db0:	00042102 	srl	a0,a0,0x4
    2db4:	1082000e 	beq	a0,v0,2df0 <_SDIO_RegisterFunction+0x80>
    2db8:	00000000 	nop
    2dbc:	2402fffe 	li	v0,-2
    2dc0:	8fbf0034 	lw	ra,52(sp)
    2dc4:	8fbe0030 	lw	s8,48(sp)
    2dc8:	8fb7002c 	lw	s7,44(sp)
    2dcc:	8fb60028 	lw	s6,40(sp)
    2dd0:	8fb50024 	lw	s5,36(sp)
    2dd4:	8fb40020 	lw	s4,32(sp)
    2dd8:	8fb3001c 	lw	s3,28(sp)
    2ddc:	8fb20018 	lw	s2,24(sp)
    2de0:	8fb10014 	lw	s1,20(sp)
    2de4:	8fb00010 	lw	s0,16(sp)
    2de8:	03e00008 	jr	ra
    2dec:	27bd0038 	addiu	sp,sp,56
    2df0:	8e02001c 	lw	v0,28(s0)
    2df4:	1040fff2 	beqz	v0,2dc0 <_SDIO_RegisterFunction+0x50>
    2df8:	2402fffe 	li	v0,-2
    2dfc:	8e020018 	lw	v0,24(s0)
    2e00:	1040ffee 	beqz	v0,2dbc <_SDIO_RegisterFunction+0x4c>
    2e04:	3c120000 	lui	s2,0x0
			2e04: R_MIPS_HI16	pBusContext
    2e08:	8e450000 	lw	a1,0(s2)
			2e08: R_MIPS_LO16	pBusContext
    2e0c:	24a60040 	addiu	a2,a1,64
    2e10:	3c030000 	lui	v1,0x0
			2e10: R_MIPS_HI16	cpu_data
    2e14:	24620000 	addiu	v0,v1,0
			2e14: R_MIPS_LO16	cpu_data
    2e18:	8c430008 	lw	v1,8(v0)
    2e1c:	3c040001 	lui	a0,0x1
    2e20:	00641824 	and	v1,v1,a0
    2e24:	106000b2 	beqz	v1,30f0 <_SDIO_RegisterFunction+0x380>
    2e28:	00000000 	nop
    2e2c:	c0a30040 	ll	v1,64(a1)
    2e30:	2462ffff 	addiu	v0,v1,-1
    2e34:	e0a20040 	sc	v0,64(a1)
    2e38:	104002f9 	beqz	v0,3a20 <ProbeForFunction+0x5dc>
    2e3c:	00000000 	nop
    2e40:	2462ffff 	addiu	v0,v1,-1
    2e44:	044000f4 	bltz	v0,3218 <_SDIO_RegisterFunction+0x4a8>
    2e48:	3c020000 	lui	v0,0x0
			2e48: R_MIPS_HI16	__down_interruptible
    2e4c:	3c020000 	lui	v0,0x0
			2e4c: R_MIPS_HI16	init_waitqueue_head
    2e50:	261300c4 	addiu	s3,s0,196
    2e54:	260400d0 	addiu	a0,s0,208
    2e58:	ae0000cc 	sw	zero,204(s0)
    2e5c:	24420000 	addiu	v0,v0,0
			2e5c: R_MIPS_LO16	init_waitqueue_head
    2e60:	0040f809 	jalr	v0
    2e64:	00000000 	nop
    2e68:	ae1300c8 	sw	s3,200(s0)
    2e6c:	ae1300c4 	sw	s3,196(s0)
    2e70:	8e420000 	lw	v0,0(s2)
			2e70: R_MIPS_LO16	pBusContext
    2e74:	26030004 	addiu	v1,s0,4
    2e78:	24420038 	addiu	v0,v0,56
    2e7c:	8c440004 	lw	a0,4(v0)
    2e80:	ae020004 	sw	v0,4(s0)
    2e84:	ac640004 	sw	a0,4(v1)
    2e88:	8c450004 	lw	a1,4(v0)
    2e8c:	ac430004 	sw	v1,4(v0)
    2e90:	aca30000 	sw	v1,0(a1)
    2e94:	8e450000 	lw	a1,0(s2)
			2e94: R_MIPS_LO16	pBusContext
    2e98:	24a60040 	addiu	a2,a1,64
    2e9c:	3c020000 	lui	v0,0x0
			2e9c: R_MIPS_HI16	cpu_data
    2ea0:	24430000 	addiu	v1,v0,0
			2ea0: R_MIPS_LO16	cpu_data
    2ea4:	8c620008 	lw	v0,8(v1)
    2ea8:	3c040001 	lui	a0,0x1
    2eac:	00441024 	and	v0,v0,a0
    2eb0:	10400078 	beqz	v0,3094 <_SDIO_RegisterFunction+0x324>
    2eb4:	00000000 	nop
    2eb8:	c0a30040 	ll	v1,64(a1)
    2ebc:	24620001 	addiu	v0,v1,1
    2ec0:	e0a20040 	sc	v0,64(a1)
    2ec4:	104002d8 	beqz	v0,3a28 <ProbeForFunction+0x5e4>
    2ec8:	00000000 	nop
    2ecc:	24620001 	addiu	v0,v1,1
    2ed0:	184000cc 	blez	v0,3204 <_SDIO_RegisterFunction+0x494>
    2ed4:	3c020000 	lui	v0,0x0
			2ed4: R_MIPS_HI16	__up
    2ed8:	8e020014 	lw	v0,20(s0)
    2edc:	8e030010 	lw	v1,16(s0)
    2ee0:	0043102b 	sltu	v0,v0,v1
    2ee4:	10400047 	beqz	v0,3004 <_SDIO_RegisterFunction+0x294>
    2ee8:	8e450000 	lw	a1,0(s2)
			2ee8: R_MIPS_LO16	pBusContext
    2eec:	24a6002c 	addiu	a2,a1,44
    2ef0:	3c030000 	lui	v1,0x0
			2ef0: R_MIPS_HI16	cpu_data
    2ef4:	24620000 	addiu	v0,v1,0
			2ef4: R_MIPS_LO16	cpu_data
    2ef8:	8c430008 	lw	v1,8(v0)
    2efc:	3c040001 	lui	a0,0x1
    2f00:	00641824 	and	v1,v1,a0
    2f04:	10600091 	beqz	v1,314c <_SDIO_RegisterFunction+0x3dc>
    2f08:	00000000 	nop
    2f0c:	c0a3002c 	ll	v1,44(a1)
    2f10:	2462ffff 	addiu	v0,v1,-1
    2f14:	e0a2002c 	sc	v0,44(a1)
    2f18:	104002c5 	beqz	v0,3a30 <ProbeForFunction+0x5ec>
    2f1c:	00000000 	nop
    2f20:	2462ffff 	addiu	v0,v1,-1
    2f24:	04400032 	bltz	v0,2ff0 <_SDIO_RegisterFunction+0x280>
    2f28:	3c020000 	lui	v0,0x0
			2f28: R_MIPS_HI16	__down_interruptible
    2f2c:	8e420000 	lw	v0,0(s2)
			2f2c: R_MIPS_LO16	pBusContext
    2f30:	8c510028 	lw	s1,40(v0)
    2f34:	24420024 	addiu	v0,v0,36
    2f38:	1222003f 	beq	s1,v0,3038 <_SDIO_RegisterFunction+0x2c8>
    2f3c:	3c020000 	lui	v0,0x0
			2f3c: R_MIPS_HI16	IsPotentialIdMatch
    2f40:	3c030000 	lui	v1,0x0
			2f40: R_MIPS_HI16	FilterPnpInfo
    2f44:	24540000 	addiu	s4,v0,0
			2f44: R_MIPS_LO16	IsPotentialIdMatch
    2f48:	3c020000 	lui	v0,0x0
			2f48: R_MIPS_HI16	OS_InitializeDevice
    2f4c:	24750000 	addiu	s5,v1,0
			2f4c: R_MIPS_LO16	FilterPnpInfo
    2f50:	24560000 	addiu	s6,v0,0
			2f50: R_MIPS_LO16	OS_InitializeDevice
    2f54:	3c030000 	lui	v1,0x0
			2f54: R_MIPS_HI16	OS_AddDevice
    2f58:	3c020000 	lui	v0,0x0
			2f58: R_MIPS_HI16	OS_RemoveDevice
    2f5c:	24770000 	addiu	s7,v1,0
			2f5c: R_MIPS_LO16	OS_AddDevice
    2f60:	08000bdf 	j	2f7c <_SDIO_RegisterFunction+0x20c>
			2f60: R_MIPS_26	.text
    2f64:	245e0000 	addiu	s8,v0,0
			2f64: R_MIPS_LO16	OS_RemoveDevice
    2f68:	8e420000 	lw	v0,0(s2)
			2f68: R_MIPS_LO16	pBusContext
    2f6c:	8e310004 	lw	s1,4(s1)
    2f70:	24420024 	addiu	v0,v0,36
    2f74:	10510031 	beq	v0,s1,303c <_SDIO_RegisterFunction+0x2cc>
    2f78:	8e450000 	lw	a1,0(s2)
			2f78: R_MIPS_LO16	pBusContext
    2f7c:	8e220030 	lw	v0,48(s1)
    2f80:	1440fff9 	bnez	v0,2f68 <_SDIO_RegisterFunction+0x1f8>
    2f84:	26240038 	addiu	a0,s1,56
    2f88:	0280f809 	jalr	s4
    2f8c:	8e050018 	lw	a1,24(s0)
    2f90:	1040fff5 	beqz	v0,2f68 <_SDIO_RegisterFunction+0x1f8>
    2f94:	02202021 	move	a0,s1
    2f98:	02a0f809 	jalr	s5
    2f9c:	00000000 	nop
    2fa0:	02202021 	move	a0,s1
    2fa4:	10400024 	beqz	v0,3038 <_SDIO_RegisterFunction+0x2c8>
    2fa8:	02002821 	move	a1,s0
    2fac:	02c0f809 	jalr	s6
    2fb0:	00000000 	nop
    2fb4:	02202021 	move	a0,s1
    2fb8:	02e0f809 	jalr	s7
    2fbc:	02002821 	move	a1,s0
    2fc0:	02202821 	move	a1,s1
    2fc4:	0440001c 	bltz	v0,3038 <_SDIO_RegisterFunction+0x2c8>
    2fc8:	02002021 	move	a0,s0
    2fcc:	8e02001c 	lw	v0,28(s0)
    2fd0:	0040f809 	jalr	v0
    2fd4:	00000000 	nop
    2fd8:	1440000c 	bnez	v0,300c <_SDIO_RegisterFunction+0x29c>
    2fdc:	02202021 	move	a0,s1
    2fe0:	03c0f809 	jalr	s8
    2fe4:	00000000 	nop
    2fe8:	08000bdb 	j	2f6c <_SDIO_RegisterFunction+0x1fc>
			2fe8: R_MIPS_26	.text
    2fec:	8e420000 	lw	v0,0(s2)
			2fec: R_MIPS_LO16	pBusContext
    2ff0:	24420000 	addiu	v0,v0,0
			2ff0: R_MIPS_LO16	__down_interruptible
    2ff4:	0040f809 	jalr	v0
    2ff8:	00c02021 	move	a0,a2
    2ffc:	1040ffcb 	beqz	v0,2f2c <_SDIO_RegisterFunction+0x1bc>
    3000:	00000000 	nop
    3004:	08000b70 	j	2dc0 <_SDIO_RegisterFunction+0x50>
			3004: R_MIPS_26	.text
    3008:	00001021 	move	v0,zero
    300c:	ae300030 	sw	s0,48(s1)
    3010:	8e620004 	lw	v0,4(s3)
    3014:	26230008 	addiu	v1,s1,8
    3018:	ac620004 	sw	v0,4(v1)
    301c:	8e640004 	lw	a0,4(s3)
    3020:	ae330008 	sw	s3,8(s1)
    3024:	ae630004 	sw	v1,4(s3)
    3028:	ac830000 	sw	v1,0(a0)
    302c:	8e020014 	lw	v0,20(s0)
    3030:	24420001 	addiu	v0,v0,1
    3034:	ae020014 	sw	v0,20(s0)
    3038:	8e450000 	lw	a1,0(s2)
			3038: R_MIPS_LO16	pBusContext
    303c:	24a6002c 	addiu	a2,a1,44
    3040:	3c030000 	lui	v1,0x0
			3040: R_MIPS_HI16	cpu_data
    3044:	24620000 	addiu	v0,v1,0
			3044: R_MIPS_LO16	cpu_data
    3048:	8c430008 	lw	v1,8(v0)
    304c:	3c040001 	lui	a0,0x1
    3050:	00641824 	and	v1,v1,a0
    3054:	10600054 	beqz	v1,31a8 <_SDIO_RegisterFunction+0x438>
    3058:	00000000 	nop
    305c:	c0a3002c 	ll	v1,44(a1)
    3060:	24620001 	addiu	v0,v1,1
    3064:	e0a2002c 	sc	v0,44(a1)
    3068:	10400273 	beqz	v0,3a38 <ProbeForFunction+0x5f4>
    306c:	00000000 	nop
    3070:	24620001 	addiu	v0,v1,1
    3074:	1c40ffe3 	bgtz	v0,3004 <_SDIO_RegisterFunction+0x294>
    3078:	00000000 	nop
    307c:	3c020000 	lui	v0,0x0
			307c: R_MIPS_HI16	__up
    3080:	24420000 	addiu	v0,v0,0
			3080: R_MIPS_LO16	__up
    3084:	0040f809 	jalr	v0
    3088:	00c02021 	move	a0,a2
    308c:	08000b70 	j	2dc0 <_SDIO_RegisterFunction+0x50>
			308c: R_MIPS_26	.text
    3090:	00001021 	move	v0,zero
    3094:	40036000 	mfc0	v1,c0_status
    3098:	3461001f 	ori	at,v1,0x1f
    309c:	3821001f 	xori	at,at,0x1f
    30a0:	40816000 	mtc0	at,c0_status
    30a4:	00000040 	ssnop
    30a8:	00000040 	ssnop
    30ac:	00000040 	ssnop
    30b0:	000000c0 	sll	zero,zero,0x3
    30b4:	8ca20040 	lw	v0,64(a1)
    30b8:	24420001 	addiu	v0,v0,1
    30bc:	aca20040 	sw	v0,64(a1)
    30c0:	40016000 	mfc0	at,c0_status
    30c4:	30630001 	andi	v1,v1,0x1
    30c8:	3421001f 	ori	at,at,0x1f
    30cc:	3821001f 	xori	at,at,0x1f
    30d0:	00611825 	or	v1,v1,at
    30d4:	40836000 	mtc0	v1,c0_status
    30d8:	00000040 	ssnop
    30dc:	00000040 	ssnop
    30e0:	00000040 	ssnop
    30e4:	000000c0 	sll	zero,zero,0x3
    30e8:	08000bb4 	j	2ed0 <_SDIO_RegisterFunction+0x160>
			30e8: R_MIPS_26	.text
    30ec:	00000000 	nop
    30f0:	40036000 	mfc0	v1,c0_status
    30f4:	3461001f 	ori	at,v1,0x1f
    30f8:	3821001f 	xori	at,at,0x1f
    30fc:	40816000 	mtc0	at,c0_status
    3100:	00000040 	ssnop
    3104:	00000040 	ssnop
    3108:	00000040 	ssnop
    310c:	000000c0 	sll	zero,zero,0x3
    3110:	8ca20040 	lw	v0,64(a1)
    3114:	2442ffff 	addiu	v0,v0,-1
    3118:	aca20040 	sw	v0,64(a1)
    311c:	40016000 	mfc0	at,c0_status
    3120:	30630001 	andi	v1,v1,0x1
    3124:	3421001f 	ori	at,at,0x1f
    3128:	3821001f 	xori	at,at,0x1f
    312c:	00611825 	or	v1,v1,at
    3130:	40836000 	mtc0	v1,c0_status
    3134:	00000040 	ssnop
    3138:	00000040 	ssnop
    313c:	00000040 	ssnop
    3140:	000000c0 	sll	zero,zero,0x3
    3144:	08000b91 	j	2e44 <_SDIO_RegisterFunction+0xd4>
			3144: R_MIPS_26	.text
    3148:	00000000 	nop
    314c:	40036000 	mfc0	v1,c0_status
    3150:	3461001f 	ori	at,v1,0x1f
    3154:	3821001f 	xori	at,at,0x1f
    3158:	40816000 	mtc0	at,c0_status
    315c:	00000040 	ssnop
    3160:	00000040 	ssnop
    3164:	00000040 	ssnop
    3168:	000000c0 	sll	zero,zero,0x3
    316c:	8ca2002c 	lw	v0,44(a1)
    3170:	2442ffff 	addiu	v0,v0,-1
    3174:	aca2002c 	sw	v0,44(a1)
    3178:	40016000 	mfc0	at,c0_status
    317c:	30630001 	andi	v1,v1,0x1
    3180:	3421001f 	ori	at,at,0x1f
    3184:	3821001f 	xori	at,at,0x1f
    3188:	00611825 	or	v1,v1,at
    318c:	40836000 	mtc0	v1,c0_status
    3190:	00000040 	ssnop
    3194:	00000040 	ssnop
    3198:	00000040 	ssnop
    319c:	000000c0 	sll	zero,zero,0x3
    31a0:	08000bc9 	j	2f24 <_SDIO_RegisterFunction+0x1b4>
			31a0: R_MIPS_26	.text
    31a4:	00000000 	nop
    31a8:	40036000 	mfc0	v1,c0_status
    31ac:	3461001f 	ori	at,v1,0x1f
    31b0:	3821001f 	xori	at,at,0x1f
    31b4:	40816000 	mtc0	at,c0_status
    31b8:	00000040 	ssnop
    31bc:	00000040 	ssnop
    31c0:	00000040 	ssnop
    31c4:	000000c0 	sll	zero,zero,0x3
    31c8:	8ca2002c 	lw	v0,44(a1)
    31cc:	24420001 	addiu	v0,v0,1
    31d0:	aca2002c 	sw	v0,44(a1)
    31d4:	40016000 	mfc0	at,c0_status
    31d8:	30630001 	andi	v1,v1,0x1
    31dc:	3421001f 	ori	at,at,0x1f
    31e0:	3821001f 	xori	at,at,0x1f
    31e4:	00611825 	or	v1,v1,at
    31e8:	40836000 	mtc0	v1,c0_status
    31ec:	00000040 	ssnop
    31f0:	00000040 	ssnop
    31f4:	00000040 	ssnop
    31f8:	000000c0 	sll	zero,zero,0x3
    31fc:	08000c1d 	j	3074 <_SDIO_RegisterFunction+0x304>
			31fc: R_MIPS_26	.text
    3200:	00000000 	nop
    3204:	24420000 	addiu	v0,v0,0
			3204: R_MIPS_LO16	__up
    3208:	0040f809 	jalr	v0
    320c:	00c02021 	move	a0,a2
    3210:	08000bb7 	j	2edc <_SDIO_RegisterFunction+0x16c>
			3210: R_MIPS_26	.text
    3214:	8e020014 	lw	v0,20(s0)
    3218:	24420000 	addiu	v0,v0,0
			3218: R_MIPS_LO16	__down_interruptible
    321c:	0040f809 	jalr	v0
    3220:	00c02021 	move	a0,a2
    3224:	1040ff09 	beqz	v0,2e4c <_SDIO_RegisterFunction+0xdc>
    3228:	2402fffa 	li	v0,-6
    322c:	08000b71 	j	2dc4 <_SDIO_RegisterFunction+0x54>
			322c: R_MIPS_26	.text
    3230:	8fbf0034 	lw	ra,52(sp)

00003234 <_SDIO_UnregisterFunction>:
    3234:	27bdffd8 	addiu	sp,sp,-40
    3238:	afb40020 	sw	s4,32(sp)
    323c:	3c140000 	lui	s4,0x0
			323c: R_MIPS_HI16	pBusContext
    3240:	8e850000 	lw	a1,0(s4)
			3240: R_MIPS_LO16	pBusContext
    3244:	afb20018 	sw	s2,24(sp)
    3248:	afbf0024 	sw	ra,36(sp)
    324c:	afb3001c 	sw	s3,28(sp)
    3250:	afb10014 	sw	s1,20(sp)
    3254:	afb00010 	sw	s0,16(sp)
    3258:	00809021 	move	s2,a0
    325c:	24a60040 	addiu	a2,a1,64
    3260:	3c130000 	lui	s3,0x0
			3260: R_MIPS_HI16	cpu_data
    3264:	26620000 	addiu	v0,s3,0
			3264: R_MIPS_LO16	cpu_data
    3268:	8c430008 	lw	v1,8(v0)
    326c:	3c040001 	lui	a0,0x1
    3270:	00641824 	and	v1,v1,a0
    3274:	10600050 	beqz	v1,33b8 <_SDIO_UnregisterFunction+0x184>
    3278:	00000000 	nop
    327c:	c0a30040 	ll	v1,64(a1)
    3280:	2462ffff 	addiu	v0,v1,-1
    3284:	e0a20040 	sc	v0,64(a1)
    3288:	104001ed 	beqz	v0,3a40 <ProbeForFunction+0x5fc>
    328c:	00000000 	nop
    3290:	2462ffff 	addiu	v0,v1,-1
    3294:	04400064 	bltz	v0,3428 <_SDIO_UnregisterFunction+0x1f4>
    3298:	3c020000 	lui	v0,0x0
			3298: R_MIPS_HI16	__down_interruptible
    329c:	26420004 	addiu	v0,s2,4
    32a0:	8c450004 	lw	a1,4(v0)
    32a4:	8e430004 	lw	v1,4(s2)
    32a8:	265100c4 	addiu	s1,s2,196
    32ac:	aca30000 	sw	v1,0(a1)
    32b0:	8e440004 	lw	a0,4(s2)
    32b4:	ae420004 	sw	v0,4(s2)
    32b8:	ac850004 	sw	a1,4(a0)
    32bc:	ac420004 	sw	v0,4(v0)
    32c0:	08000cb5 	j	32d4 <_SDIO_UnregisterFunction+0xa0>
			32c0: R_MIPS_26	.text
    32c4:	8e5000c8 	lw	s0,200(s2)
    32c8:	8c420030 	lw	v0,48(v0)
    32cc:	1242001d 	beq	s2,v0,3344 <_SDIO_UnregisterFunction+0x110>
    32d0:	8e100004 	lw	s0,4(s0)
    32d4:	2602fff8 	addiu	v0,s0,-8
    32d8:	1611fffb 	bne	s0,s1,32c8 <_SDIO_UnregisterFunction+0x94>
    32dc:	00402021 	move	a0,v0
    32e0:	8e850000 	lw	a1,0(s4)
			32e0: R_MIPS_LO16	pBusContext
    32e4:	24a60040 	addiu	a2,a1,64
    32e8:	26620000 	addiu	v0,s3,0
			32e8: R_MIPS_LO16	cpu_data
    32ec:	8c430008 	lw	v1,8(v0)
    32f0:	3c040001 	lui	a0,0x1
    32f4:	00641824 	and	v1,v1,a0
    32f8:	10600018 	beqz	v1,335c <_SDIO_UnregisterFunction+0x128>
    32fc:	00000000 	nop
    3300:	c0a30040 	ll	v1,64(a1)
    3304:	24620001 	addiu	v0,v1,1
    3308:	e0a20040 	sc	v0,64(a1)
    330c:	104001ce 	beqz	v0,3a48 <ProbeForFunction+0x604>
    3310:	00000000 	nop
    3314:	24620001 	addiu	v0,v1,1
    3318:	1840003e 	blez	v0,3414 <_SDIO_UnregisterFunction+0x1e0>
    331c:	3c020000 	lui	v0,0x0
			331c: R_MIPS_HI16	__up
    3320:	00001021 	move	v0,zero
    3324:	8fbf0024 	lw	ra,36(sp)
    3328:	8fb40020 	lw	s4,32(sp)
    332c:	8fb3001c 	lw	s3,28(sp)
    3330:	8fb20018 	lw	s2,24(sp)
    3334:	8fb10014 	lw	s1,20(sp)
    3338:	8fb00010 	lw	s0,16(sp)
    333c:	03e00008 	jr	ra
    3340:	27bd0028 	addiu	sp,sp,40
    3344:	3c020000 	lui	v0,0x0
			3344: R_MIPS_HI16	NotifyDeviceRemove
    3348:	24420000 	addiu	v0,v0,0
			3348: R_MIPS_LO16	NotifyDeviceRemove
    334c:	0040f809 	jalr	v0
    3350:	00000000 	nop
    3354:	08000cb6 	j	32d8 <_SDIO_UnregisterFunction+0xa4>
			3354: R_MIPS_26	.text
    3358:	2602fff8 	addiu	v0,s0,-8
    335c:	40036000 	mfc0	v1,c0_status
    3360:	3461001f 	ori	at,v1,0x1f
    3364:	3821001f 	xori	at,at,0x1f
    3368:	40816000 	mtc0	at,c0_status
    336c:	00000040 	ssnop
    3370:	00000040 	ssnop
    3374:	00000040 	ssnop
    3378:	000000c0 	sll	zero,zero,0x3
    337c:	8ca20040 	lw	v0,64(a1)
    3380:	24420001 	addiu	v0,v0,1
    3384:	aca20040 	sw	v0,64(a1)
    3388:	40016000 	mfc0	at,c0_status
    338c:	30630001 	andi	v1,v1,0x1
    3390:	3421001f 	ori	at,at,0x1f
    3394:	3821001f 	xori	at,at,0x1f
    3398:	00611825 	or	v1,v1,at
    339c:	40836000 	mtc0	v1,c0_status
    33a0:	00000040 	ssnop
    33a4:	00000040 	ssnop
    33a8:	00000040 	ssnop
    33ac:	000000c0 	sll	zero,zero,0x3
    33b0:	08000cc6 	j	3318 <_SDIO_UnregisterFunction+0xe4>
			33b0: R_MIPS_26	.text
    33b4:	00000000 	nop
    33b8:	40036000 	mfc0	v1,c0_status
    33bc:	3461001f 	ori	at,v1,0x1f
    33c0:	3821001f 	xori	at,at,0x1f
    33c4:	40816000 	mtc0	at,c0_status
    33c8:	00000040 	ssnop
    33cc:	00000040 	ssnop
    33d0:	00000040 	ssnop
    33d4:	000000c0 	sll	zero,zero,0x3
    33d8:	8ca20040 	lw	v0,64(a1)
    33dc:	2442ffff 	addiu	v0,v0,-1
    33e0:	aca20040 	sw	v0,64(a1)
    33e4:	40016000 	mfc0	at,c0_status
    33e8:	30630001 	andi	v1,v1,0x1
    33ec:	3421001f 	ori	at,at,0x1f
    33f0:	3821001f 	xori	at,at,0x1f
    33f4:	00611825 	or	v1,v1,at
    33f8:	40836000 	mtc0	v1,c0_status
    33fc:	00000040 	ssnop
    3400:	00000040 	ssnop
    3404:	00000040 	ssnop
    3408:	000000c0 	sll	zero,zero,0x3
    340c:	08000ca5 	j	3294 <_SDIO_UnregisterFunction+0x60>
			340c: R_MIPS_26	.text
    3410:	00000000 	nop
    3414:	24420000 	addiu	v0,v0,0
			3414: R_MIPS_LO16	__up
    3418:	0040f809 	jalr	v0
    341c:	00c02021 	move	a0,a2
    3420:	08000cc9 	j	3324 <_SDIO_UnregisterFunction+0xf0>
			3420: R_MIPS_26	.text
    3424:	00001021 	move	v0,zero
    3428:	24420000 	addiu	v0,v0,0
			3428: R_MIPS_LO16	__down_interruptible
    342c:	0040f809 	jalr	v0
    3430:	00c02021 	move	a0,a2
    3434:	1040ff99 	beqz	v0,329c <_SDIO_UnregisterFunction+0x68>
    3438:	2402fffa 	li	v0,-6
    343c:	08000cca 	j	3328 <_SDIO_UnregisterFunction+0xf4>
			343c: R_MIPS_26	.text
    3440:	8fbf0024 	lw	ra,36(sp)

00003444 <ProbeForFunction>:
    3444:	27bdffc8 	addiu	sp,sp,-56
    3448:	3c020000 	lui	v0,0x0
			3448: R_MIPS_HI16	FilterPnpInfo
    344c:	afb20018 	sw	s2,24(sp)
    3450:	afbf0034 	sw	ra,52(sp)
    3454:	afbe0030 	sw	s8,48(sp)
    3458:	afb7002c 	sw	s7,44(sp)
    345c:	afb60028 	sw	s6,40(sp)
    3460:	afb50024 	sw	s5,36(sp)
    3464:	afb40020 	sw	s4,32(sp)
    3468:	afb3001c 	sw	s3,28(sp)
    346c:	afb10014 	sw	s1,20(sp)
    3470:	afb00010 	sw	s0,16(sp)
    3474:	24420000 	addiu	v0,v0,0
			3474: R_MIPS_LO16	FilterPnpInfo
    3478:	0040f809 	jalr	v0
    347c:	00809021 	move	s2,a0
    3480:	10400044 	beqz	v0,3594 <ProbeForFunction+0x150>
    3484:	3c130000 	lui	s3,0x0
			3484: R_MIPS_HI16	pBusContext
    3488:	8e650000 	lw	a1,0(s3)
			3488: R_MIPS_LO16	pBusContext
    348c:	24a60040 	addiu	a2,a1,64
    3490:	3c140000 	lui	s4,0x0
			3490: R_MIPS_HI16	cpu_data
    3494:	26820000 	addiu	v0,s4,0
			3494: R_MIPS_LO16	cpu_data
    3498:	8c430008 	lw	v1,8(v0)
    349c:	3c040001 	lui	a0,0x1
    34a0:	00641824 	and	v1,v1,a0
    34a4:	10600048 	beqz	v1,35c8 <ProbeForFunction+0x184>
    34a8:	00000000 	nop
    34ac:	c0a30040 	ll	v1,64(a1)
    34b0:	2462ffff 	addiu	v0,v1,-1
    34b4:	e0a20040 	sc	v0,64(a1)
    34b8:	10400165 	beqz	v0,3a50 <ProbeForFunction+0x60c>
    34bc:	00000000 	nop
    34c0:	2462ffff 	addiu	v0,v1,-1
    34c4:	04400102 	bltz	v0,38d0 <ProbeForFunction+0x48c>
    34c8:	3c020000 	lui	v0,0x0
			34c8: R_MIPS_HI16	__down_interruptible
    34cc:	8e650000 	lw	a1,0(s3)
			34cc: R_MIPS_LO16	pBusContext
    34d0:	24a6002c 	addiu	a2,a1,44
    34d4:	26820000 	addiu	v0,s4,0
			34d4: R_MIPS_LO16	cpu_data
    34d8:	8c430008 	lw	v1,8(v0)
    34dc:	3c040001 	lui	a0,0x1
    34e0:	00641824 	and	v1,v1,a0
    34e4:	10600066 	beqz	v1,3680 <ProbeForFunction+0x23c>
    34e8:	00000000 	nop
    34ec:	c0a3002c 	ll	v1,44(a1)
    34f0:	2462ffff 	addiu	v0,v1,-1
    34f4:	e0a2002c 	sc	v0,44(a1)
    34f8:	10400157 	beqz	v0,3a58 <ProbeForFunction+0x614>
    34fc:	00000000 	nop
    3500:	2462ffff 	addiu	v0,v1,-1
    3504:	044000f9 	bltz	v0,38ec <ProbeForFunction+0x4a8>
    3508:	3c020000 	lui	v0,0x0
			3508: R_MIPS_HI16	__down_interruptible
    350c:	8e420030 	lw	v0,48(s2)
    3510:	10400089 	beqz	v0,3738 <ProbeForFunction+0x2f4>
    3514:	8e650000 	lw	a1,0(s3)
			3514: R_MIPS_LO16	pBusContext
    3518:	24a6002c 	addiu	a2,a1,44
    351c:	26820000 	addiu	v0,s4,0
			351c: R_MIPS_LO16	cpu_data
    3520:	8c430008 	lw	v1,8(v0)
    3524:	3c040001 	lui	a0,0x1
    3528:	00641824 	and	v1,v1,a0
    352c:	1060006b 	beqz	v1,36dc <ProbeForFunction+0x298>
    3530:	00000000 	nop
    3534:	c0a3002c 	ll	v1,44(a1)
    3538:	24620001 	addiu	v0,v1,1
    353c:	e0a2002c 	sc	v0,44(a1)
    3540:	10400147 	beqz	v0,3a60 <ProbeForFunction+0x61c>
    3544:	00000000 	nop
    3548:	24620001 	addiu	v0,v1,1
    354c:	18400101 	blez	v0,3954 <ProbeForFunction+0x510>
    3550:	3c020000 	lui	v0,0x0
			3550: R_MIPS_HI16	__up
    3554:	8e650000 	lw	a1,0(s3)
			3554: R_MIPS_LO16	pBusContext
    3558:	24a60040 	addiu	a2,a1,64
    355c:	26820000 	addiu	v0,s4,0
			355c: R_MIPS_LO16	cpu_data
    3560:	8c430008 	lw	v1,8(v0)
    3564:	3c040001 	lui	a0,0x1
    3568:	00641824 	and	v1,v1,a0
    356c:	1060002d 	beqz	v1,3624 <ProbeForFunction+0x1e0>
    3570:	00000000 	nop
    3574:	c0a30040 	ll	v1,64(a1)
    3578:	24620001 	addiu	v0,v1,1
    357c:	e0a20040 	sc	v0,64(a1)
    3580:	10400139 	beqz	v0,3a68 <ProbeForFunction+0x624>
    3584:	00000000 	nop
    3588:	24620001 	addiu	v0,v1,1
    358c:	184000be 	blez	v0,3888 <ProbeForFunction+0x444>
    3590:	3c020000 	lui	v0,0x0
			3590: R_MIPS_HI16	__up
    3594:	00001021 	move	v0,zero
    3598:	8fbf0034 	lw	ra,52(sp)
    359c:	8fbe0030 	lw	s8,48(sp)
    35a0:	8fb7002c 	lw	s7,44(sp)
    35a4:	8fb60028 	lw	s6,40(sp)
    35a8:	8fb50024 	lw	s5,36(sp)
    35ac:	8fb40020 	lw	s4,32(sp)
    35b0:	8fb3001c 	lw	s3,28(sp)
    35b4:	8fb20018 	lw	s2,24(sp)
    35b8:	8fb10014 	lw	s1,20(sp)
    35bc:	8fb00010 	lw	s0,16(sp)
    35c0:	03e00008 	jr	ra
    35c4:	27bd0038 	addiu	sp,sp,56
    35c8:	40036000 	mfc0	v1,c0_status
    35cc:	3461001f 	ori	at,v1,0x1f
    35d0:	3821001f 	xori	at,at,0x1f
    35d4:	40816000 	mtc0	at,c0_status
    35d8:	00000040 	ssnop
    35dc:	00000040 	ssnop
    35e0:	00000040 	ssnop
    35e4:	000000c0 	sll	zero,zero,0x3
    35e8:	8ca20040 	lw	v0,64(a1)
    35ec:	2442ffff 	addiu	v0,v0,-1
    35f0:	aca20040 	sw	v0,64(a1)
    35f4:	40016000 	mfc0	at,c0_status
    35f8:	30630001 	andi	v1,v1,0x1
    35fc:	3421001f 	ori	at,at,0x1f
    3600:	3821001f 	xori	at,at,0x1f
    3604:	00611825 	or	v1,v1,at
    3608:	40836000 	mtc0	v1,c0_status
    360c:	00000040 	ssnop
    3610:	00000040 	ssnop
    3614:	00000040 	ssnop
    3618:	000000c0 	sll	zero,zero,0x3
    361c:	08000d31 	j	34c4 <ProbeForFunction+0x80>
			361c: R_MIPS_26	.text
    3620:	00000000 	nop
    3624:	40036000 	mfc0	v1,c0_status
    3628:	3461001f 	ori	at,v1,0x1f
    362c:	3821001f 	xori	at,at,0x1f
    3630:	40816000 	mtc0	at,c0_status
    3634:	00000040 	ssnop
    3638:	00000040 	ssnop
    363c:	00000040 	ssnop
    3640:	000000c0 	sll	zero,zero,0x3
    3644:	8ca20040 	lw	v0,64(a1)
    3648:	24420001 	addiu	v0,v0,1
    364c:	aca20040 	sw	v0,64(a1)
    3650:	40016000 	mfc0	at,c0_status
    3654:	30630001 	andi	v1,v1,0x1
    3658:	3421001f 	ori	at,at,0x1f
    365c:	3821001f 	xori	at,at,0x1f
    3660:	00611825 	or	v1,v1,at
    3664:	40836000 	mtc0	v1,c0_status
    3668:	00000040 	ssnop
    366c:	00000040 	ssnop
    3670:	00000040 	ssnop
    3674:	000000c0 	sll	zero,zero,0x3
    3678:	08000d63 	j	358c <ProbeForFunction+0x148>
			3678: R_MIPS_26	.text
    367c:	00000000 	nop
    3680:	40036000 	mfc0	v1,c0_status
    3684:	3461001f 	ori	at,v1,0x1f
    3688:	3821001f 	xori	at,at,0x1f
    368c:	40816000 	mtc0	at,c0_status
    3690:	00000040 	ssnop
    3694:	00000040 	ssnop
    3698:	00000040 	ssnop
    369c:	000000c0 	sll	zero,zero,0x3
    36a0:	8ca2002c 	lw	v0,44(a1)
    36a4:	2442ffff 	addiu	v0,v0,-1
    36a8:	aca2002c 	sw	v0,44(a1)
    36ac:	40016000 	mfc0	at,c0_status
    36b0:	30630001 	andi	v1,v1,0x1
    36b4:	3421001f 	ori	at,at,0x1f
    36b8:	3821001f 	xori	at,at,0x1f
    36bc:	00611825 	or	v1,v1,at
    36c0:	40836000 	mtc0	v1,c0_status
    36c4:	00000040 	ssnop
    36c8:	00000040 	ssnop
    36cc:	00000040 	ssnop
    36d0:	000000c0 	sll	zero,zero,0x3
    36d4:	08000d41 	j	3504 <ProbeForFunction+0xc0>
			36d4: R_MIPS_26	.text
    36d8:	00000000 	nop
    36dc:	40036000 	mfc0	v1,c0_status
    36e0:	3461001f 	ori	at,v1,0x1f
    36e4:	3821001f 	xori	at,at,0x1f
    36e8:	40816000 	mtc0	at,c0_status
    36ec:	00000040 	ssnop
    36f0:	00000040 	ssnop
    36f4:	00000040 	ssnop
    36f8:	000000c0 	sll	zero,zero,0x3
    36fc:	8ca2002c 	lw	v0,44(a1)
    3700:	24420001 	addiu	v0,v0,1
    3704:	aca2002c 	sw	v0,44(a1)
    3708:	40016000 	mfc0	at,c0_status
    370c:	30630001 	andi	v1,v1,0x1
    3710:	3421001f 	ori	at,at,0x1f
    3714:	3821001f 	xori	at,at,0x1f
    3718:	00611825 	or	v1,v1,at
    371c:	40836000 	mtc0	v1,c0_status
    3720:	00000040 	ssnop
    3724:	00000040 	ssnop
    3728:	00000040 	ssnop
    372c:	000000c0 	sll	zero,zero,0x3
    3730:	08000d53 	j	354c <ProbeForFunction+0x108>
			3730: R_MIPS_26	.text
    3734:	00000000 	nop
    3738:	24a6002c 	addiu	a2,a1,44
    373c:	26820000 	addiu	v0,s4,0
			373c: R_MIPS_LO16	cpu_data
    3740:	8c430008 	lw	v1,8(v0)
    3744:	3c040001 	lui	a0,0x1
    3748:	00641824 	and	v1,v1,a0
    374c:	10600037 	beqz	v1,382c <ProbeForFunction+0x3e8>
    3750:	00000000 	nop
    3754:	c0a3002c 	ll	v1,44(a1)
    3758:	24620001 	addiu	v0,v1,1
    375c:	e0a2002c 	sc	v0,44(a1)
    3760:	104000c3 	beqz	v0,3a70 <ProbeForFunction+0x62c>
    3764:	00000000 	nop
    3768:	24620001 	addiu	v0,v1,1
    376c:	1840007e 	blez	v0,3968 <ProbeForFunction+0x524>
    3770:	3c020000 	lui	v0,0x0
			3770: R_MIPS_HI16	__up
    3774:	8e620000 	lw	v0,0(s3)
			3774: R_MIPS_LO16	pBusContext
    3778:	8c51003c 	lw	s1,60(v0)
    377c:	24420038 	addiu	v0,v0,56
    3780:	1222ff74 	beq	s1,v0,3554 <ProbeForFunction+0x110>
    3784:	3c020000 	lui	v0,0x0
			3784: R_MIPS_HI16	IsPotentialIdMatch
    3788:	3c030000 	lui	v1,0x0
			3788: R_MIPS_HI16	OS_InitializeDevice
    378c:	24550000 	addiu	s5,v0,0
			378c: R_MIPS_LO16	IsPotentialIdMatch
    3790:	24770000 	addiu	s7,v1,0
			3790: R_MIPS_LO16	OS_InitializeDevice
    3794:	3c020000 	lui	v0,0x0
			3794: R_MIPS_HI16	OS_AddDevice
    3798:	3c030000 	lui	v1,0x0
			3798: R_MIPS_HI16	OS_RemoveDevice
    379c:	24560000 	addiu	s6,v0,0
			379c: R_MIPS_LO16	OS_AddDevice
    37a0:	08000def 	j	37bc <ProbeForFunction+0x378>
			37a0: R_MIPS_26	.text
    37a4:	247e0000 	addiu	s8,v1,0
			37a4: R_MIPS_LO16	OS_RemoveDevice
    37a8:	8e620000 	lw	v0,0(s3)
			37a8: R_MIPS_LO16	pBusContext
    37ac:	8e310004 	lw	s1,4(s1)
    37b0:	24420038 	addiu	v0,v0,56
    37b4:	1051ff68 	beq	v0,s1,3558 <ProbeForFunction+0x114>
    37b8:	8e650000 	lw	a1,0(s3)
			37b8: R_MIPS_LO16	pBusContext
    37bc:	2630fffc 	addiu	s0,s1,-4
    37c0:	8e020014 	lw	v0,20(s0)
    37c4:	8e030010 	lw	v1,16(s0)
    37c8:	0043102b 	sltu	v0,v0,v1
    37cc:	1040fff6 	beqz	v0,37a8 <ProbeForFunction+0x364>
    37d0:	26440038 	addiu	a0,s2,56
    37d4:	02a0f809 	jalr	s5
    37d8:	8e050018 	lw	a1,24(s0)
    37dc:	02402021 	move	a0,s2
    37e0:	1040fff1 	beqz	v0,37a8 <ProbeForFunction+0x364>
    37e4:	02002821 	move	a1,s0
    37e8:	02e0f809 	jalr	s7
    37ec:	00000000 	nop
    37f0:	02402021 	move	a0,s2
    37f4:	02c0f809 	jalr	s6
    37f8:	02002821 	move	a1,s0
    37fc:	02002021 	move	a0,s0
    3800:	0440ff54 	bltz	v0,3554 <ProbeForFunction+0x110>
    3804:	02402821 	move	a1,s2
    3808:	8e02001c 	lw	v0,28(s0)
    380c:	0040f809 	jalr	v0
    3810:	00000000 	nop
    3814:	14400021 	bnez	v0,389c <ProbeForFunction+0x458>
    3818:	02402021 	move	a0,s2
    381c:	03c0f809 	jalr	s8
    3820:	00000000 	nop
    3824:	08000deb 	j	37ac <ProbeForFunction+0x368>
			3824: R_MIPS_26	.text
    3828:	8e620000 	lw	v0,0(s3)
			3828: R_MIPS_LO16	pBusContext
    382c:	40036000 	mfc0	v1,c0_status
    3830:	3461001f 	ori	at,v1,0x1f
    3834:	3821001f 	xori	at,at,0x1f
    3838:	40816000 	mtc0	at,c0_status
    383c:	00000040 	ssnop
    3840:	00000040 	ssnop
    3844:	00000040 	ssnop
    3848:	000000c0 	sll	zero,zero,0x3
    384c:	8ca2002c 	lw	v0,44(a1)
    3850:	24420001 	addiu	v0,v0,1
    3854:	aca2002c 	sw	v0,44(a1)
    3858:	40016000 	mfc0	at,c0_status
    385c:	30630001 	andi	v1,v1,0x1
    3860:	3421001f 	ori	at,at,0x1f
    3864:	3821001f 	xori	at,at,0x1f
    3868:	00611825 	or	v1,v1,at
    386c:	40836000 	mtc0	v1,c0_status
    3870:	00000040 	ssnop
    3874:	00000040 	ssnop
    3878:	00000040 	ssnop
    387c:	000000c0 	sll	zero,zero,0x3
    3880:	08000ddb 	j	376c <ProbeForFunction+0x328>
			3880: R_MIPS_26	.text
    3884:	00000000 	nop
    3888:	24420000 	addiu	v0,v0,0
			3888: R_MIPS_LO16	__up
    388c:	0040f809 	jalr	v0
    3890:	00c02021 	move	a0,a2
    3894:	08000d66 	j	3598 <ProbeForFunction+0x154>
			3894: R_MIPS_26	.text
    3898:	00001021 	move	v0,zero
    389c:	ae500030 	sw	s0,48(s2)
    38a0:	262200c0 	addiu	v0,s1,192
    38a4:	8c440004 	lw	a0,4(v0)
    38a8:	26430008 	addiu	v1,s2,8
    38ac:	ac640004 	sw	a0,4(v1)
    38b0:	8c450004 	lw	a1,4(v0)
    38b4:	ae420008 	sw	v0,8(s2)
    38b8:	ac430004 	sw	v1,4(v0)
    38bc:	aca30000 	sw	v1,0(a1)
    38c0:	8e020014 	lw	v0,20(s0)
    38c4:	24420001 	addiu	v0,v0,1
    38c8:	08000d55 	j	3554 <ProbeForFunction+0x110>
			38c8: R_MIPS_26	.text
    38cc:	ae020014 	sw	v0,20(s0)
    38d0:	24420000 	addiu	v0,v0,0
			38d0: R_MIPS_LO16	__down_interruptible
    38d4:	0040f809 	jalr	v0
    38d8:	00c02021 	move	a0,a2
    38dc:	1040fefc 	beqz	v0,34d0 <ProbeForFunction+0x8c>
    38e0:	8e650000 	lw	a1,0(s3)
			38e0: R_MIPS_LO16	pBusContext
    38e4:	08000d66 	j	3598 <ProbeForFunction+0x154>
			38e4: R_MIPS_26	.text
    38e8:	2402fffa 	li	v0,-6
    38ec:	24420000 	addiu	v0,v0,0
			38ec: R_MIPS_LO16	__down_interruptible
    38f0:	0040f809 	jalr	v0
    38f4:	00c02021 	move	a0,a2
    38f8:	1040ff04 	beqz	v0,350c <ProbeForFunction+0xc8>
    38fc:	8e650000 	lw	a1,0(s3)
			38fc: R_MIPS_LO16	pBusContext
    3900:	24a60040 	addiu	a2,a1,64
    3904:	26820000 	addiu	v0,s4,0
			3904: R_MIPS_LO16	cpu_data
    3908:	8c430008 	lw	v1,8(v0)
    390c:	3c040001 	lui	a0,0x1
    3910:	00641824 	and	v1,v1,a0
    3914:	10600019 	beqz	v1,397c <ProbeForFunction+0x538>
    3918:	00000000 	nop
    391c:	c0a30040 	ll	v1,64(a1)
    3920:	24620001 	addiu	v0,v1,1
    3924:	e0a20040 	sc	v0,64(a1)
    3928:	10400053 	beqz	v0,3a78 <ProbeForFunction+0x634>
    392c:	00000000 	nop
    3930:	24620001 	addiu	v0,v1,1
    3934:	1c40ffeb 	bgtz	v0,38e4 <ProbeForFunction+0x4a0>
    3938:	00000000 	nop
    393c:	3c020000 	lui	v0,0x0
			393c: R_MIPS_HI16	__up
    3940:	24420000 	addiu	v0,v0,0
			3940: R_MIPS_LO16	__up
    3944:	0040f809 	jalr	v0
    3948:	00c02021 	move	a0,a2
    394c:	08000d66 	j	3598 <ProbeForFunction+0x154>
			394c: R_MIPS_26	.text
    3950:	2402fffa 	li	v0,-6
    3954:	24420000 	addiu	v0,v0,0
			3954: R_MIPS_LO16	__up
    3958:	0040f809 	jalr	v0
    395c:	00c02021 	move	a0,a2
    3960:	08000d56 	j	3558 <ProbeForFunction+0x114>
			3960: R_MIPS_26	.text
    3964:	8e650000 	lw	a1,0(s3)
			3964: R_MIPS_LO16	pBusContext
    3968:	24420000 	addiu	v0,v0,0
			3968: R_MIPS_LO16	__up
    396c:	0040f809 	jalr	v0
    3970:	00c02021 	move	a0,a2
    3974:	08000dde 	j	3778 <ProbeForFunction+0x334>
			3974: R_MIPS_26	.text
    3978:	8e620000 	lw	v0,0(s3)
			3978: R_MIPS_LO16	pBusContext
    397c:	40036000 	mfc0	v1,c0_status
    3980:	3461001f 	ori	at,v1,0x1f
    3984:	3821001f 	xori	at,at,0x1f
    3988:	40816000 	mtc0	at,c0_status
    398c:	00000040 	ssnop
    3990:	00000040 	ssnop
    3994:	00000040 	ssnop
    3998:	000000c0 	sll	zero,zero,0x3
    399c:	8cc20000 	lw	v0,0(a2)
    39a0:	24420001 	addiu	v0,v0,1
    39a4:	acc20000 	sw	v0,0(a2)
    39a8:	40016000 	mfc0	at,c0_status
    39ac:	30630001 	andi	v1,v1,0x1
    39b0:	3421001f 	ori	at,at,0x1f
    39b4:	3821001f 	xori	at,at,0x1f
    39b8:	00611825 	or	v1,v1,at
    39bc:	40836000 	mtc0	v1,c0_status
    39c0:	00000040 	ssnop
    39c4:	00000040 	ssnop
    39c8:	00000040 	ssnop
    39cc:	000000c0 	sll	zero,zero,0x3
    39d0:	08000e4d 	j	3934 <ProbeForFunction+0x4f0>
			39d0: R_MIPS_26	.text
    39d4:	00000000 	nop
    39d8:	1000faa0 	b	245c <NotifyDeviceRemove+0x184>
    39dc:	00000000 	nop
    39e0:	1000fad7 	b	2540 <NotifyDeviceRemove+0x268>
    39e4:	00000000 	nop
    39e8:	1000faee 	b	25a4 <NotifyDeviceRemove+0x2cc>
    39ec:	00000000 	nop
    39f0:	1000fb2d 	b	26a8 <NotifyDeviceRemove+0x3d0>
    39f4:	00000000 	nop
    39f8:	1000fba1 	b	2880 <NotifyDeviceRemove+0x5a8>
    39fc:	00000000 	nop
    3a00:	1000fbf2 	b	29cc <RemoveHcdFunctions+0x50>
    3a04:	00000000 	nop
    3a08:	1000fc16 	b	2a64 <RemoveHcdFunctions+0xe8>
    3a0c:	00000000 	nop
    3a10:	1000fc73 	b	2be0 <RemoveAllFunctions+0x40>
    3a14:	00000000 	nop
    3a18:	1000fc8d 	b	2c50 <RemoveAllFunctions+0xb0>
    3a1c:	00000000 	nop
    3a20:	1000fd02 	b	2e2c <_SDIO_RegisterFunction+0xbc>
    3a24:	00000000 	nop
    3a28:	1000fd23 	b	2eb8 <_SDIO_RegisterFunction+0x148>
    3a2c:	00000000 	nop
    3a30:	1000fd36 	b	2f0c <_SDIO_RegisterFunction+0x19c>
    3a34:	00000000 	nop
    3a38:	1000fd88 	b	305c <_SDIO_RegisterFunction+0x2ec>
    3a3c:	00000000 	nop
    3a40:	1000fe0e 	b	327c <_SDIO_UnregisterFunction+0x48>
    3a44:	00000000 	nop
    3a48:	1000fe2d 	b	3300 <_SDIO_UnregisterFunction+0xcc>
    3a4c:	00000000 	nop
    3a50:	1000fe96 	b	34ac <ProbeForFunction+0x68>
    3a54:	00000000 	nop
    3a58:	1000fea4 	b	34ec <ProbeForFunction+0xa8>
    3a5c:	00000000 	nop
    3a60:	1000feb4 	b	3534 <ProbeForFunction+0xf0>
    3a64:	00000000 	nop
    3a68:	1000fec2 	b	3574 <ProbeForFunction+0x130>
    3a6c:	00000000 	nop
    3a70:	1000ff38 	b	3754 <ProbeForFunction+0x310>
    3a74:	00000000 	nop
    3a78:	1000ffa8 	b	391c <ProbeForFunction+0x4d8>
    3a7c:	00000000 	nop

00003a80 <HcdAckComplete>:
    3a80:	27bdffd8 	addiu	sp,sp,-40
    3a84:	afbf0024 	sw	ra,36(sp)
    3a88:	afb00020 	sw	s0,32(sp)
    3a8c:	24022003 	li	v0,8195
    3a90:	00808021 	move	s0,a0
    3a94:	8c84003c 	lw	a0,60(a0)
    3a98:	a7a20010 	sh	v0,16(sp)
    3a9c:	afa00014 	sw	zero,20(sp)
    3aa0:	afa00018 	sw	zero,24(sp)
    3aa4:	8c820028 	lw	v0,40(a0)
    3aa8:	0040f809 	jalr	v0
    3aac:	27a50010 	addiu	a1,sp,16
    3ab0:	3c020000 	lui	v0,0x0
			3ab0: R_MIPS_HI16	FreeRequest
    3ab4:	24420000 	addiu	v0,v0,0
			3ab4: R_MIPS_LO16	FreeRequest
    3ab8:	0040f809 	jalr	v0
    3abc:	02002021 	move	a0,s0
    3ac0:	8fbf0024 	lw	ra,36(sp)
    3ac4:	8fb00020 	lw	s0,32(sp)
    3ac8:	03e00008 	jr	ra
    3acc:	27bd0028 	addiu	sp,sp,40

00003ad0 <RawHcdIrqControl>:
    3ad0:	27bdffc8 	addiu	sp,sp,-56
    3ad4:	afb3002c 	sw	s3,44(sp)
    3ad8:	3c020000 	lui	v0,0x0
			3ad8: R_MIPS_HI16	memset
    3adc:	27b30010 	addiu	s3,sp,16
    3ae0:	afb20028 	sw	s2,40(sp)
    3ae4:	afb00020 	sw	s0,32(sp)
    3ae8:	afbf0030 	sw	ra,48(sp)
    3aec:	afb10024 	sw	s1,36(sp)
    3af0:	00809021 	move	s2,a0
    3af4:	30b000ff 	andi	s0,a1,0xff
    3af8:	02602021 	move	a0,s3
    3afc:	00002821 	move	a1,zero
    3b00:	24420000 	addiu	v0,v0,0
			3b00: R_MIPS_LO16	memset
    3b04:	0040f809 	jalr	v0
    3b08:	24060001 	li	a2,1
    3b0c:	40116000 	mfc0	s1,c0_status
    3b10:	3621001f 	ori	at,s1,0x1f
    3b14:	3821001f 	xori	at,at,0x1f
    3b18:	40816000 	mtc0	at,c0_status
    3b1c:	00000040 	ssnop
    3b20:	00000040 	ssnop
    3b24:	00000040 	ssnop
    3b28:	000000c0 	sll	zero,zero,0x3
    3b2c:	8f820014 	lw	v0,20(gp)
    3b30:	24420001 	addiu	v0,v0,1
    3b34:	af820014 	sw	v0,20(gp)
    3b38:	12000023 	beqz	s0,3bc8 <RawHcdIrqControl+0xf8>
    3b3c:	24020001 	li	v0,1
    3b40:	a3a20010 	sb	v0,16(sp)
    3b44:	24036002 	li	v1,24578
    3b48:	8e420028 	lw	v0,40(s2)
    3b4c:	a7a30014 	sh	v1,20(sp)
    3b50:	24030001 	li	v1,1
    3b54:	afb30018 	sw	s3,24(sp)
    3b58:	afa3001c 	sw	v1,28(sp)
    3b5c:	02402021 	move	a0,s2
    3b60:	0040f809 	jalr	v0
    3b64:	27a50014 	addiu	a1,sp,20
    3b68:	40016000 	mfc0	at,c0_status
    3b6c:	32310001 	andi	s1,s1,0x1
    3b70:	3421001f 	ori	at,at,0x1f
    3b74:	3821001f 	xori	at,at,0x1f
    3b78:	02218825 	or	s1,s1,at
    3b7c:	40916000 	mtc0	s1,c0_status
    3b80:	00000040 	ssnop
    3b84:	00000040 	ssnop
    3b88:	00000040 	ssnop
    3b8c:	000000c0 	sll	zero,zero,0x3
    3b90:	8f830014 	lw	v1,20(gp)
    3b94:	2463ffff 	addiu	v1,v1,-1
    3b98:	af830014 	sw	v1,20(gp)
    3b9c:	8f830008 	lw	v1,8(gp)
    3ba0:	30630004 	andi	v1,v1,0x4
    3ba4:	1460000a 	bnez	v1,3bd0 <RawHcdIrqControl+0x100>
    3ba8:	3c020000 	lui	v0,0x0
			3ba8: R_MIPS_HI16	preempt_schedule
    3bac:	8fbf0030 	lw	ra,48(sp)
    3bb0:	8fb3002c 	lw	s3,44(sp)
    3bb4:	8fb20028 	lw	s2,40(sp)
    3bb8:	8fb10024 	lw	s1,36(sp)
    3bbc:	8fb00020 	lw	s0,32(sp)
    3bc0:	03e00008 	jr	ra
    3bc4:	27bd0038 	addiu	sp,sp,56
    3bc8:	08000ed1 	j	3b44 <RawHcdIrqControl+0x74>
			3bc8: R_MIPS_26	.text
    3bcc:	a3a00010 	sb	zero,16(sp)
    3bd0:	24420000 	addiu	v0,v0,0
			3bd0: R_MIPS_LO16	preempt_schedule
    3bd4:	0040f809 	jalr	v0
    3bd8:	00000000 	nop
    3bdc:	08000eec 	j	3bb0 <RawHcdIrqControl+0xe0>
			3bdc: R_MIPS_26	.text
    3be0:	8fbf0030 	lw	ra,48(sp)

00003be4 <RawHcdDisableIrqPseudoComplete>:
    3be4:	27bdffe8 	addiu	sp,sp,-24
    3be8:	afbf0014 	sw	ra,20(sp)
    3bec:	afb00010 	sw	s0,16(sp)
    3bf0:	3c020000 	lui	v0,0x0
			3bf0: R_MIPS_HI16	.text
    3bf4:	00808021 	move	s0,a0
    3bf8:	8c84003c 	lw	a0,60(a0)
    3bfc:	24423ad0 	addiu	v0,v0,15056
			3bfc: R_MIPS_LO16	.text
    3c00:	0040f809 	jalr	v0
    3c04:	00002821 	move	a1,zero
    3c08:	3c190000 	lui	t9,0x0
			3c08: R_MIPS_HI16	FreeRequest
    3c0c:	02002021 	move	a0,s0
    3c10:	8fbf0014 	lw	ra,20(sp)
    3c14:	8fb00010 	lw	s0,16(sp)
    3c18:	27390000 	addiu	t9,t9,0
			3c18: R_MIPS_LO16	FreeRequest
    3c1c:	03200008 	jr	t9
    3c20:	27bd0018 	addiu	sp,sp,24

00003c24 <RawHcdEnableIrqPseudoComplete>:
    3c24:	27bdffe8 	addiu	sp,sp,-24
    3c28:	afb00010 	sw	s0,16(sp)
    3c2c:	afbf0014 	sw	ra,20(sp)
    3c30:	8c820040 	lw	v0,64(a0)
    3c34:	00808021 	move	s0,a0
    3c38:	04400005 	bltz	v0,3c50 <RawHcdEnableIrqPseudoComplete+0x2c>
    3c3c:	24050001 	li	a1,1
    3c40:	3c020000 	lui	v0,0x0
			3c40: R_MIPS_HI16	.text
    3c44:	24423ad0 	addiu	v0,v0,15056
			3c44: R_MIPS_LO16	.text
    3c48:	0040f809 	jalr	v0
    3c4c:	8c84003c 	lw	a0,60(a0)
    3c50:	3c190000 	lui	t9,0x0
			3c50: R_MIPS_HI16	FreeRequest
    3c54:	02002021 	move	a0,s0
    3c58:	8fbf0014 	lw	ra,20(sp)
    3c5c:	8fb00010 	lw	s0,16(sp)
    3c60:	27390000 	addiu	t9,t9,0
			3c60: R_MIPS_LO16	FreeRequest
    3c64:	03200008 	jr	t9
    3c68:	27bd0018 	addiu	sp,sp,24

00003c6c <SDMaskUnmaskFunctionIRQ>:
    3c6c:	27bdffd8 	addiu	sp,sp,-40
    3c70:	3c020000 	lui	v0,0x0
			3c70: R_MIPS_HI16	AllocateRequest
    3c74:	afb3001c 	sw	s3,28(sp)
    3c78:	afb20018 	sw	s2,24(sp)
    3c7c:	afb00010 	sw	s0,16(sp)
    3c80:	afbf0020 	sw	ra,32(sp)
    3c84:	afb10014 	sw	s1,20(sp)
    3c88:	24420000 	addiu	v0,v0,0
			3c88: R_MIPS_LO16	AllocateRequest
    3c8c:	00809821 	move	s3,a0
    3c90:	0040f809 	jalr	v0
    3c94:	30b200ff 	andi	s2,a1,0xff
    3c98:	1040004b 	beqz	v0,3dc8 <SDMaskUnmaskFunctionIRQ+0x15c>
    3c9c:	00408021 	move	s0,v0
    3ca0:	40116000 	mfc0	s1,c0_status
    3ca4:	3621001f 	ori	at,s1,0x1f
    3ca8:	3821001f 	xori	at,at,0x1f
    3cac:	40816000 	mtc0	at,c0_status
    3cb0:	00000040 	ssnop
    3cb4:	00000040 	ssnop
    3cb8:	00000040 	ssnop
    3cbc:	000000c0 	sll	zero,zero,0x3
    3cc0:	8f820014 	lw	v0,20(gp)
    3cc4:	24420001 	addiu	v0,v0,1
    3cc8:	16400030 	bnez	s2,3d8c <SDMaskUnmaskFunctionIRQ+0x120>
    3ccc:	af820014 	sw	v0,20(gp)
    3cd0:	8e620034 	lw	v0,52(s3)
    3cd4:	90430086 	lbu	v1,134(v0)
    3cd8:	14600036 	bnez	v1,3db4 <SDMaskUnmaskFunctionIRQ+0x148>
    3cdc:	3c020000 	lui	v0,0x0
			3cdc: R_MIPS_HI16	FreeRequest
    3ce0:	3c020000 	lui	v0,0x0
			3ce0: R_MIPS_HI16	.text
    3ce4:	24423c24 	addiu	v0,v0,15396
			3ce4: R_MIPS_LO16	.text
    3ce8:	ae020038 	sw	v0,56(s0)
    3cec:	8e630034 	lw	v1,52(s3)
    3cf0:	24020002 	li	v0,2
    3cf4:	a0620086 	sb	v0,134(v1)
    3cf8:	8e630034 	lw	v1,52(s3)
    3cfc:	3c02000c 	lui	v0,0xc
    3d00:	34421000 	ori	v0,v0,0x1000
    3d04:	ae03003c 	sw	v1,60(s0)
    3d08:	ae020008 	sw	v0,8(s0)
    3d0c:	ae000040 	sw	zero,64(s0)
    3d10:	40016000 	mfc0	at,c0_status
    3d14:	32310001 	andi	s1,s1,0x1
    3d18:	3421001f 	ori	at,at,0x1f
    3d1c:	3821001f 	xori	at,at,0x1f
    3d20:	02218825 	or	s1,s1,at
    3d24:	40916000 	mtc0	s1,c0_status
    3d28:	00000040 	ssnop
    3d2c:	00000040 	ssnop
    3d30:	00000040 	ssnop
    3d34:	000000c0 	sll	zero,zero,0x3
    3d38:	8f830014 	lw	v1,20(gp)
    3d3c:	2463ffff 	addiu	v1,v1,-1
    3d40:	af830014 	sw	v1,20(gp)
    3d44:	8f830008 	lw	v1,8(gp)
    3d48:	30630004 	andi	v1,v1,0x4
    3d4c:	14600026 	bnez	v1,3de8 <SDMaskUnmaskFunctionIRQ+0x17c>
    3d50:	3c020000 	lui	v0,0x0
			3d50: R_MIPS_HI16	preempt_schedule
    3d54:	12000005 	beqz	s0,3d6c <SDMaskUnmaskFunctionIRQ+0x100>
    3d58:	3c020000 	lui	v0,0x0
			3d58: R_MIPS_HI16	IssueRequestToHCD
    3d5c:	8e640034 	lw	a0,52(s3)
    3d60:	24420000 	addiu	v0,v0,0
			3d60: R_MIPS_LO16	IssueRequestToHCD
    3d64:	0040f809 	jalr	v0
    3d68:	02002821 	move	a1,s0
    3d6c:	8fbf0020 	lw	ra,32(sp)
    3d70:	8fb3001c 	lw	s3,28(sp)
    3d74:	8fb20018 	lw	s2,24(sp)
    3d78:	8fb10014 	lw	s1,20(sp)
    3d7c:	8fb00010 	lw	s0,16(sp)
    3d80:	00001021 	move	v0,zero
    3d84:	03e00008 	jr	ra
    3d88:	27bd0028 	addiu	sp,sp,40
    3d8c:	8e620034 	lw	v0,52(s3)
    3d90:	90430086 	lbu	v1,134(v0)
    3d94:	10600007 	beqz	v1,3db4 <SDMaskUnmaskFunctionIRQ+0x148>
    3d98:	3c020000 	lui	v0,0x0
			3d98: R_MIPS_HI16	FreeRequest
    3d9c:	3c020000 	lui	v0,0x0
			3d9c: R_MIPS_HI16	.text
    3da0:	24423be4 	addiu	v0,v0,15332
			3da0: R_MIPS_LO16	.text
    3da4:	ae020038 	sw	v0,56(s0)
    3da8:	8e630034 	lw	v1,52(s3)
    3dac:	08000f3e 	j	3cf8 <SDMaskUnmaskFunctionIRQ+0x8c>
			3dac: R_MIPS_26	.text
    3db0:	a0600086 	sb	zero,134(v1)
    3db4:	24420000 	addiu	v0,v0,0
			3db4: R_MIPS_LO16	FreeRequest
    3db8:	0040f809 	jalr	v0
    3dbc:	02002021 	move	a0,s0
    3dc0:	08000f44 	j	3d10 <SDMaskUnmaskFunctionIRQ+0xa4>
			3dc0: R_MIPS_26	.text
    3dc4:	00008021 	move	s0,zero
    3dc8:	8fbf0020 	lw	ra,32(sp)
    3dcc:	8fb3001c 	lw	s3,28(sp)
    3dd0:	8fb20018 	lw	s2,24(sp)
    3dd4:	8fb10014 	lw	s1,20(sp)
    3dd8:	8fb00010 	lw	s0,16(sp)
    3ddc:	2402fff9 	li	v0,-7
    3de0:	03e00008 	jr	ra
    3de4:	27bd0028 	addiu	sp,sp,40
    3de8:	24420000 	addiu	v0,v0,0
			3de8: R_MIPS_LO16	preempt_schedule
    3dec:	0040f809 	jalr	v0
    3df0:	00000000 	nop
    3df4:	08000f55 	j	3d54 <SDMaskUnmaskFunctionIRQ+0xe8>
			3df4: R_MIPS_26	.text
    3df8:	00000000 	nop

00003dfc <SDFunctionAckInterrupt>:
    3dfc:	27bdffe0 	addiu	sp,sp,-32
    3e00:	3c020000 	lui	v0,0x0
			3e00: R_MIPS_HI16	AllocateRequest
    3e04:	afb10014 	sw	s1,20(sp)
    3e08:	afb00010 	sw	s0,16(sp)
    3e0c:	afbf001c 	sw	ra,28(sp)
    3e10:	afb20018 	sw	s2,24(sp)
    3e14:	24420000 	addiu	v0,v0,0
			3e14: R_MIPS_LO16	AllocateRequest
    3e18:	0040f809 	jalr	v0
    3e1c:	00808821 	move	s1,a0
    3e20:	10400055 	beqz	v0,3f78 <SDFunctionAckInterrupt+0x17c>
    3e24:	00408021 	move	s0,v0
    3e28:	40066000 	mfc0	a2,c0_status
    3e2c:	34c1001f 	ori	at,a2,0x1f
    3e30:	3821001f 	xori	at,at,0x1f
    3e34:	40816000 	mtc0	at,c0_status
    3e38:	00000040 	ssnop
    3e3c:	00000040 	ssnop
    3e40:	00000040 	ssnop
    3e44:	000000c0 	sll	zero,zero,0x3
    3e48:	8f820014 	lw	v0,20(gp)
    3e4c:	24420001 	addiu	v0,v0,1
    3e50:	af820014 	sw	v0,20(gp)
    3e54:	9223003a 	lbu	v1,58(s1)
    3e58:	8e250034 	lw	a1,52(s1)
    3e5c:	24020001 	li	v0,1
    3e60:	00621004 	sllv	v0,v0,v1
    3e64:	90a40085 	lbu	a0,133(a1)
    3e68:	304200ff 	andi	v0,v0,0xff
    3e6c:	00441824 	and	v1,v0,a0
    3e70:	1460002a 	bnez	v1,3f1c <SDFunctionAckInterrupt+0x120>
    3e74:	00009021 	move	s2,zero
    3e78:	40016000 	mfc0	at,c0_status
    3e7c:	30c60001 	andi	a2,a2,0x1
    3e80:	3421001f 	ori	at,at,0x1f
    3e84:	3821001f 	xori	at,at,0x1f
    3e88:	00c13025 	or	a2,a2,at
    3e8c:	40866000 	mtc0	a2,c0_status
    3e90:	00000040 	ssnop
    3e94:	00000040 	ssnop
    3e98:	00000040 	ssnop
    3e9c:	000000c0 	sll	zero,zero,0x3
    3ea0:	8f830014 	lw	v1,20(gp)
    3ea4:	2463ffff 	addiu	v1,v1,-1
    3ea8:	af830014 	sw	v1,20(gp)
    3eac:	8f830008 	lw	v1,8(gp)
    3eb0:	30630004 	andi	v1,v1,0x4
    3eb4:	14600037 	bnez	v1,3f94 <SDFunctionAckInterrupt+0x198>
    3eb8:	3c020000 	lui	v0,0x0
			3eb8: R_MIPS_HI16	preempt_schedule
    3ebc:	1240000d 	beqz	s2,3ef4 <SDFunctionAckInterrupt+0xf8>
    3ec0:	3c020000 	lui	v0,0x0
			3ec0: R_MIPS_HI16	FreeRequest
    3ec4:	8e240034 	lw	a0,52(s1)
    3ec8:	3c020000 	lui	v0,0x0
			3ec8: R_MIPS_HI16	IssueRequestToHCD
    3ecc:	24420000 	addiu	v0,v0,0
			3ecc: R_MIPS_LO16	IssueRequestToHCD
    3ed0:	0040f809 	jalr	v0
    3ed4:	02002821 	move	a1,s0
    3ed8:	8fbf001c 	lw	ra,28(sp)
    3edc:	8fb20018 	lw	s2,24(sp)
    3ee0:	8fb10014 	lw	s1,20(sp)
    3ee4:	8fb00010 	lw	s0,16(sp)
    3ee8:	00001021 	move	v0,zero
    3eec:	03e00008 	jr	ra
    3ef0:	27bd0020 	addiu	sp,sp,32
    3ef4:	24420000 	addiu	v0,v0,0
			3ef4: R_MIPS_LO16	FreeRequest
    3ef8:	0040f809 	jalr	v0
    3efc:	02002021 	move	a0,s0
    3f00:	8fbf001c 	lw	ra,28(sp)
    3f04:	8fb20018 	lw	s2,24(sp)
    3f08:	8fb10014 	lw	s1,20(sp)
    3f0c:	8fb00010 	lw	s0,16(sp)
    3f10:	00001021 	move	v0,zero
    3f14:	03e00008 	jr	ra
    3f18:	27bd0020 	addiu	sp,sp,32
    3f1c:	00021027 	nor	v0,zero,v0
    3f20:	00821024 	and	v0,a0,v0
    3f24:	a0a20085 	sb	v0,133(a1)
    3f28:	8e230034 	lw	v1,52(s1)
    3f2c:	90620085 	lbu	v0,133(v1)
    3f30:	1440ffd1 	bnez	v0,3e78 <SDFunctionAckInterrupt+0x7c>
    3f34:	00000000 	nop
    3f38:	ac600088 	sw	zero,136(v1)
    3f3c:	8e220034 	lw	v0,52(s1)
    3f40:	90430086 	lbu	v1,134(v0)
    3f44:	1060ffcc 	beqz	v1,3e78 <SDFunctionAckInterrupt+0x7c>
    3f48:	00000000 	nop
    3f4c:	3c020000 	lui	v0,0x0
			3f4c: R_MIPS_HI16	.text
    3f50:	24423a80 	addiu	v0,v0,14976
			3f50: R_MIPS_LO16	.text
    3f54:	ae020038 	sw	v0,56(s0)
    3f58:	ae000040 	sw	zero,64(s0)
    3f5c:	8e230034 	lw	v1,52(s1)
    3f60:	3c02000c 	lui	v0,0xc
    3f64:	34421000 	ori	v0,v0,0x1000
    3f68:	24120001 	li	s2,1
    3f6c:	ae03003c 	sw	v1,60(s0)
    3f70:	08000f9e 	j	3e78 <SDFunctionAckInterrupt+0x7c>
			3f70: R_MIPS_26	.text
    3f74:	ae020008 	sw	v0,8(s0)
    3f78:	8fbf001c 	lw	ra,28(sp)
    3f7c:	8fb20018 	lw	s2,24(sp)
    3f80:	8fb10014 	lw	s1,20(sp)
    3f84:	8fb00010 	lw	s0,16(sp)
    3f88:	2402fff9 	li	v0,-7
    3f8c:	03e00008 	jr	ra
    3f90:	27bd0020 	addiu	sp,sp,32
    3f94:	24420000 	addiu	v0,v0,0
			3f94: R_MIPS_LO16	preempt_schedule
    3f98:	0040f809 	jalr	v0
    3f9c:	00000000 	nop
    3fa0:	1240ffd4 	beqz	s2,3ef4 <SDFunctionAckInterrupt+0xf8>
    3fa4:	3c020000 	lui	v0,0x0
			3fa4: R_MIPS_HI16	FreeRequest
    3fa8:	08000fb2 	j	3ec8 <SDFunctionAckInterrupt+0xcc>
			3fa8: R_MIPS_26	.text
    3fac:	8e240034 	lw	a0,52(s1)

00003fb0 <SDIOIrqHelperFunction>:
    3fb0:	27bdffa8 	addiu	sp,sp,-88
    3fb4:	afbe0050 	sw	s8,80(sp)
    3fb8:	afb7004c 	sw	s7,76(sp)
    3fbc:	afb60048 	sw	s6,72(sp)
    3fc0:	afb50044 	sw	s5,68(sp)
    3fc4:	afb20038 	sw	s2,56(sp)
    3fc8:	afbf0054 	sw	ra,84(sp)
    3fcc:	afb40040 	sw	s4,64(sp)
    3fd0:	afb3003c 	sw	s3,60(sp)
    3fd4:	afb10034 	sw	s1,52(sp)
    3fd8:	afb00030 	sw	s0,48(sp)
    3fdc:	3c020000 	lui	v0,0x0
			3fdc: R_MIPS_HI16	cpu_data
    3fe0:	3c030000 	lui	v1,0x0
			3fe0: R_MIPS_HI16	__down
    3fe4:	8c910020 	lw	s1,32(a0)
    3fe8:	00809021 	move	s2,a0
    3fec:	24560000 	addiu	s6,v0,0
			3fec: R_MIPS_LO16	cpu_data
    3ff0:	24770000 	addiu	s7,v1,0
			3ff0: R_MIPS_LO16	__down
    3ff4:	249e0008 	addiu	s8,a0,8
    3ff8:	3c150001 	lui	s5,0x1
    3ffc:	8ec20008 	lw	v0,8(s6)
    4000:	00551024 	and	v0,v0,s5
    4004:	1040005d 	beqz	v0,417c <SDIOIrqHelperFunction+0x1cc>
    4008:	00000000 	nop
    400c:	c2430008 	ll	v1,8(s2)
    4010:	2462ffff 	addiu	v0,v1,-1
    4014:	e2420008 	sc	v0,8(s2)
    4018:	1040065c 	beqz	v0,598c <CardDetectHelperFunction+0x250>
    401c:	00000000 	nop
    4020:	2462ffff 	addiu	v0,v1,-1
    4024:	0440006c 	bltz	v0,41d8 <SDIOIrqHelperFunction+0x228>
    4028:	00000000 	nop
    402c:	92420004 	lbu	v0,4(s2)
    4030:	1440006f 	bnez	v0,41f0 <SDIOIrqHelperFunction+0x240>
    4034:	8fbf0054 	lw	ra,84(sp)
    4038:	3c100000 	lui	s0,0x0
			4038: R_MIPS_HI16	pBusContext
    403c:	8e050000 	lw	a1,0(s0)
			403c: R_MIPS_LO16	pBusContext
    4040:	24a4002c 	addiu	a0,a1,44
    4044:	8ec20008 	lw	v0,8(s6)
    4048:	00551024 	and	v0,v0,s5
    404c:	10400092 	beqz	v0,4298 <SDIOIrqHelperFunction+0x2e8>
    4050:	00000000 	nop
    4054:	c0a3002c 	ll	v1,44(a1)
    4058:	2462ffff 	addiu	v0,v1,-1
    405c:	e0a2002c 	sc	v0,44(a1)
    4060:	1040064c 	beqz	v0,5994 <CardDetectHelperFunction+0x258>
    4064:	00000000 	nop
    4068:	2462ffff 	addiu	v0,v1,-1
    406c:	044000a2 	bltz	v0,42f8 <SDIOIrqHelperFunction+0x348>
    4070:	3c020000 	lui	v0,0x0
			4070: R_MIPS_HI16	__down_interruptible
    4074:	8e020000 	lw	v0,0(s0)
			4074: R_MIPS_LO16	pBusContext
    4078:	8c450028 	lw	a1,40(v0)
    407c:	24420024 	addiu	v0,v0,36
    4080:	104500a6 	beq	v0,a1,431c <SDIOIrqHelperFunction+0x36c>
    4084:	00000000 	nop
    4088:	0000a021 	move	s4,zero
    408c:	24070001 	li	a3,1
    4090:	0800102b 	j	40ac <SDIOIrqHelperFunction+0xfc>
			4090: R_MIPS_26	.text
    4094:	27a60010 	addiu	a2,sp,16
    4098:	8e020000 	lw	v0,0(s0)
			4098: R_MIPS_LO16	pBusContext
    409c:	8ca50004 	lw	a1,4(a1)
    40a0:	24420024 	addiu	v0,v0,36
    40a4:	10450017 	beq	v0,a1,4104 <SDIOIrqHelperFunction+0x154>
    40a8:	00000000 	nop
    40ac:	8ca20034 	lw	v0,52(a1)
    40b0:	1622fffa 	bne	s1,v0,409c <SDIOIrqHelperFunction+0xec>
    40b4:	8e020000 	lw	v0,0(s0)
			40b4: R_MIPS_LO16	pBusContext
    40b8:	90a2003a 	lbu	v0,58(a1)
    40bc:	92240084 	lbu	a0,132(s1)
    40c0:	00471004 	sllv	v0,a3,v0
    40c4:	304200ff 	andi	v0,v0,0xff
    40c8:	00021827 	nor	v1,zero,v0
    40cc:	00441024 	and	v0,v0,a0
    40d0:	1040fff1 	beqz	v0,4098 <SDIOIrqHelperFunction+0xe8>
    40d4:	00831824 	and	v1,a0,v1
    40d8:	a2230084 	sb	v1,132(s1)
    40dc:	8ca20020 	lw	v0,32(a1)
    40e0:	1040ffee 	beqz	v0,409c <SDIOIrqHelperFunction+0xec>
    40e4:	8e020000 	lw	v0,0(s0)
			40e4: R_MIPS_LO16	pBusContext
    40e8:	acc50000 	sw	a1,0(a2)
    40ec:	8e020000 	lw	v0,0(s0)
			40ec: R_MIPS_LO16	pBusContext
    40f0:	8ca50004 	lw	a1,4(a1)
    40f4:	24420024 	addiu	v0,v0,36
    40f8:	26940001 	addiu	s4,s4,1
    40fc:	1445ffeb 	bne	v0,a1,40ac <SDIOIrqHelperFunction+0xfc>
    4100:	24c60004 	addiu	a2,a2,4
    4104:	a2200084 	sb	zero,132(s1)
    4108:	8e050000 	lw	a1,0(s0)
			4108: R_MIPS_LO16	pBusContext
    410c:	24a4002c 	addiu	a0,a1,44
    4110:	8ec20008 	lw	v0,8(s6)
    4114:	00551024 	and	v0,v0,s5
    4118:	10400041 	beqz	v0,4220 <SDIOIrqHelperFunction+0x270>
    411c:	00000000 	nop
    4120:	c0a3002c 	ll	v1,44(a1)
    4124:	24620001 	addiu	v0,v1,1
    4128:	e0a2002c 	sc	v0,44(a1)
    412c:	1040061b 	beqz	v0,599c <CardDetectHelperFunction+0x260>
    4130:	00000000 	nop
    4134:	24620001 	addiu	v0,v1,1
    4138:	18400050 	blez	v0,427c <SDIOIrqHelperFunction+0x2cc>
    413c:	3c020000 	lui	v0,0x0
			413c: R_MIPS_HI16	__up
    4140:	1280ffae 	beqz	s4,3ffc <SDIOIrqHelperFunction+0x4c>
    4144:	00009821 	move	s3,zero
    4148:	27b00010 	addiu	s0,sp,16
    414c:	8e020000 	lw	v0,0(s0)
    4150:	26730001 	addiu	s3,s3,1
    4154:	8c440028 	lw	a0,40(v0)
    4158:	8c430020 	lw	v1,32(v0)
    415c:	0060f809 	jalr	v1
    4160:	26100004 	addiu	s0,s0,4
    4164:	1693fff9 	bne	s4,s3,414c <SDIOIrqHelperFunction+0x19c>
    4168:	00000000 	nop
    416c:	8ec20008 	lw	v0,8(s6)
    4170:	00551024 	and	v0,v0,s5
    4174:	1440ffa5 	bnez	v0,400c <SDIOIrqHelperFunction+0x5c>
    4178:	00000000 	nop
    417c:	40036000 	mfc0	v1,c0_status
    4180:	3461001f 	ori	at,v1,0x1f
    4184:	3821001f 	xori	at,at,0x1f
    4188:	40816000 	mtc0	at,c0_status
    418c:	00000040 	ssnop
    4190:	00000040 	ssnop
    4194:	00000040 	ssnop
    4198:	000000c0 	sll	zero,zero,0x3
    419c:	8e420008 	lw	v0,8(s2)
    41a0:	2442ffff 	addiu	v0,v0,-1
    41a4:	ae420008 	sw	v0,8(s2)
    41a8:	40016000 	mfc0	at,c0_status
    41ac:	30630001 	andi	v1,v1,0x1
    41b0:	3421001f 	ori	at,at,0x1f
    41b4:	3821001f 	xori	at,at,0x1f
    41b8:	00611825 	or	v1,v1,at
    41bc:	40836000 	mtc0	v1,c0_status
    41c0:	00000040 	ssnop
    41c4:	00000040 	ssnop
    41c8:	00000040 	ssnop
    41cc:	000000c0 	sll	zero,zero,0x3
    41d0:	0441ff96 	bgez	v0,402c <SDIOIrqHelperFunction+0x7c>
    41d4:	00000000 	nop
    41d8:	02e0f809 	jalr	s7
    41dc:	03c02021 	move	a0,s8
    41e0:	92420004 	lbu	v0,4(s2)
    41e4:	1040ff95 	beqz	v0,403c <SDIOIrqHelperFunction+0x8c>
    41e8:	3c100000 	lui	s0,0x0
			41e8: R_MIPS_HI16	pBusContext
    41ec:	8fbf0054 	lw	ra,84(sp)
    41f0:	8fbe0050 	lw	s8,80(sp)
    41f4:	8fb7004c 	lw	s7,76(sp)
    41f8:	8fb60048 	lw	s6,72(sp)
    41fc:	8fb50044 	lw	s5,68(sp)
    4200:	8fb40040 	lw	s4,64(sp)
    4204:	8fb3003c 	lw	s3,60(sp)
    4208:	8fb20038 	lw	s2,56(sp)
    420c:	8fb10034 	lw	s1,52(sp)
    4210:	8fb00030 	lw	s0,48(sp)
    4214:	00001021 	move	v0,zero
    4218:	03e00008 	jr	ra
    421c:	27bd0058 	addiu	sp,sp,88
    4220:	40036000 	mfc0	v1,c0_status
    4224:	3461001f 	ori	at,v1,0x1f
    4228:	3821001f 	xori	at,at,0x1f
    422c:	40816000 	mtc0	at,c0_status
    4230:	00000040 	ssnop
    4234:	00000040 	ssnop
    4238:	00000040 	ssnop
    423c:	000000c0 	sll	zero,zero,0x3
    4240:	8ca2002c 	lw	v0,44(a1)
    4244:	24420001 	addiu	v0,v0,1
    4248:	aca2002c 	sw	v0,44(a1)
    424c:	40016000 	mfc0	at,c0_status
    4250:	30630001 	andi	v1,v1,0x1
    4254:	3421001f 	ori	at,at,0x1f
    4258:	3821001f 	xori	at,at,0x1f
    425c:	00611825 	or	v1,v1,at
    4260:	40836000 	mtc0	v1,c0_status
    4264:	00000040 	ssnop
    4268:	00000040 	ssnop
    426c:	00000040 	ssnop
    4270:	000000c0 	sll	zero,zero,0x3
    4274:	1c40ffb2 	bgtz	v0,4140 <SDIOIrqHelperFunction+0x190>
    4278:	3c020000 	lui	v0,0x0
			4278: R_MIPS_HI16	__up
    427c:	24420000 	addiu	v0,v0,0
			427c: R_MIPS_LO16	__up
    4280:	0040f809 	jalr	v0
    4284:	00000000 	nop
    4288:	1280ff5c 	beqz	s4,3ffc <SDIOIrqHelperFunction+0x4c>
    428c:	00009821 	move	s3,zero
    4290:	08001053 	j	414c <SDIOIrqHelperFunction+0x19c>
			4290: R_MIPS_26	.text
    4294:	27b00010 	addiu	s0,sp,16
    4298:	40036000 	mfc0	v1,c0_status
    429c:	3461001f 	ori	at,v1,0x1f
    42a0:	3821001f 	xori	at,at,0x1f
    42a4:	40816000 	mtc0	at,c0_status
    42a8:	00000040 	ssnop
    42ac:	00000040 	ssnop
    42b0:	00000040 	ssnop
    42b4:	000000c0 	sll	zero,zero,0x3
    42b8:	8ca2002c 	lw	v0,44(a1)
    42bc:	2442ffff 	addiu	v0,v0,-1
    42c0:	aca2002c 	sw	v0,44(a1)
    42c4:	40016000 	mfc0	at,c0_status
    42c8:	30630001 	andi	v1,v1,0x1
    42cc:	3421001f 	ori	at,at,0x1f
    42d0:	3821001f 	xori	at,at,0x1f
    42d4:	00611825 	or	v1,v1,at
    42d8:	40836000 	mtc0	v1,c0_status
    42dc:	00000040 	ssnop
    42e0:	00000040 	ssnop
    42e4:	00000040 	ssnop
    42e8:	000000c0 	sll	zero,zero,0x3
    42ec:	0441ff62 	bgez	v0,4078 <SDIOIrqHelperFunction+0xc8>
    42f0:	8e020000 	lw	v0,0(s0)
			42f0: R_MIPS_LO16	pBusContext
    42f4:	3c020000 	lui	v0,0x0
			42f4: R_MIPS_HI16	__down_interruptible
    42f8:	24420000 	addiu	v0,v0,0
			42f8: R_MIPS_LO16	__down_interruptible
    42fc:	0040f809 	jalr	v0
    4300:	00000000 	nop
    4304:	1440ffb9 	bnez	v0,41ec <SDIOIrqHelperFunction+0x23c>
    4308:	8e020000 	lw	v0,0(s0)
			4308: R_MIPS_LO16	pBusContext
    430c:	8c450028 	lw	a1,40(v0)
    4310:	24420024 	addiu	v0,v0,36
    4314:	1445ff5c 	bne	v0,a1,4088 <SDIOIrqHelperFunction+0xd8>
    4318:	00000000 	nop
    431c:	08001041 	j	4104 <SDIOIrqHelperFunction+0x154>
			431c: R_MIPS_26	.text
    4320:	0000a021 	move	s4,zero

00004324 <DeviceInterrupt>:
    4324:	27bdffc0 	addiu	sp,sp,-64
    4328:	afb10024 	sw	s1,36(sp)
    432c:	afbf003c 	sw	ra,60(sp)
    4330:	afb60038 	sw	s6,56(sp)
    4334:	afb50034 	sw	s5,52(sp)
    4338:	afb40030 	sw	s4,48(sp)
    433c:	afb3002c 	sw	s3,44(sp)
    4340:	afb20028 	sw	s2,40(sp)
    4344:	afb00020 	sw	s0,32(sp)
    4348:	9482004a 	lhu	v0,74(a0)
    434c:	3042000f 	andi	v0,v0,0xf
    4350:	104000d3 	beqz	v0,46a0 <DeviceInterrupt+0x37c>
    4354:	00808821 	move	s1,a0
    4358:	40046000 	mfc0	a0,c0_status
    435c:	3481001f 	ori	at,a0,0x1f
    4360:	3821001f 	xori	at,at,0x1f
    4364:	40816000 	mtc0	at,c0_status
    4368:	00000040 	ssnop
    436c:	00000040 	ssnop
    4370:	00000040 	ssnop
    4374:	000000c0 	sll	zero,zero,0x3
    4378:	8f830014 	lw	v1,20(gp)
    437c:	24630001 	addiu	v1,v1,1
    4380:	af830014 	sw	v1,20(gp)
    4384:	8e220088 	lw	v0,136(s1)
    4388:	144000b0 	bnez	v0,464c <DeviceInterrupt+0x328>
    438c:	24020001 	li	v0,1
    4390:	ae220088 	sw	v0,136(s1)
    4394:	40016000 	mfc0	at,c0_status
    4398:	30840001 	andi	a0,a0,0x1
    439c:	3421001f 	ori	at,at,0x1f
    43a0:	3821001f 	xori	at,at,0x1f
    43a4:	00812025 	or	a0,a0,at
    43a8:	40846000 	mtc0	a0,c0_status
    43ac:	00000040 	ssnop
    43b0:	00000040 	ssnop
    43b4:	00000040 	ssnop
    43b8:	000000c0 	sll	zero,zero,0x3
    43bc:	8f830014 	lw	v1,20(gp)
    43c0:	2463ffff 	addiu	v1,v1,-1
    43c4:	af830014 	sw	v1,20(gp)
    43c8:	8f830008 	lw	v1,8(gp)
    43cc:	30630004 	andi	v1,v1,0x4
    43d0:	14600116 	bnez	v1,482c <DeviceInterrupt+0x508>
    43d4:	3c020000 	lui	v0,0x0
			43d4: R_MIPS_HI16	preempt_schedule
    43d8:	40106000 	mfc0	s0,c0_status
    43dc:	3601001f 	ori	at,s0,0x1f
    43e0:	3821001f 	xori	at,at,0x1f
    43e4:	40816000 	mtc0	at,c0_status
    43e8:	00000040 	ssnop
    43ec:	00000040 	ssnop
    43f0:	00000040 	ssnop
    43f4:	000000c0 	sll	zero,zero,0x3
    43f8:	8f820014 	lw	v0,20(gp)
    43fc:	24420001 	addiu	v0,v0,1
    4400:	af820014 	sw	v0,20(gp)
    4404:	92220086 	lbu	v0,134(s1)
    4408:	30430002 	andi	v1,v0,0x2
    440c:	14600021 	bnez	v1,4494 <DeviceInterrupt+0x170>
    4410:	24130002 	li	s3,2
    4414:	1460001f 	bnez	v1,4494 <DeviceInterrupt+0x170>
    4418:	00609821 	move	s3,v1
    441c:	144000f0 	bnez	v0,47e0 <DeviceInterrupt+0x4bc>
    4420:	ae200088 	sw	zero,136(s1)
    4424:	40016000 	mfc0	at,c0_status
    4428:	32100001 	andi	s0,s0,0x1
    442c:	3421001f 	ori	at,at,0x1f
    4430:	3821001f 	xori	at,at,0x1f
    4434:	02018025 	or	s0,s0,at
    4438:	40906000 	mtc0	s0,c0_status
    443c:	00000040 	ssnop
    4440:	00000040 	ssnop
    4444:	00000040 	ssnop
    4448:	000000c0 	sll	zero,zero,0x3
    444c:	8f830014 	lw	v1,20(gp)
    4450:	2463ffff 	addiu	v1,v1,-1
    4454:	af830014 	sw	v1,20(gp)
    4458:	8f830008 	lw	v1,8(gp)
    445c:	30630004 	andi	v1,v1,0x4
    4460:	146000ed 	bnez	v1,4818 <DeviceInterrupt+0x4f4>
    4464:	3c020000 	lui	v0,0x0
			4464: R_MIPS_HI16	preempt_schedule
    4468:	00001021 	move	v0,zero
    446c:	8fbf003c 	lw	ra,60(sp)
    4470:	8fb60038 	lw	s6,56(sp)
    4474:	8fb50034 	lw	s5,52(sp)
    4478:	8fb40030 	lw	s4,48(sp)
    447c:	8fb3002c 	lw	s3,44(sp)
    4480:	8fb20028 	lw	s2,40(sp)
    4484:	8fb10024 	lw	s1,36(sp)
    4488:	8fb00020 	lw	s0,32(sp)
    448c:	03e00008 	jr	ra
    4490:	27bd0040 	addiu	sp,sp,64
    4494:	a2200084 	sb	zero,132(s1)
    4498:	a2330085 	sb	s3,133(s1)
    449c:	40016000 	mfc0	at,c0_status
    44a0:	32100001 	andi	s0,s0,0x1
    44a4:	3421001f 	ori	at,at,0x1f
    44a8:	3821001f 	xori	at,at,0x1f
    44ac:	02018025 	or	s0,s0,at
    44b0:	40906000 	mtc0	s0,c0_status
    44b4:	00000040 	ssnop
    44b8:	00000040 	ssnop
    44bc:	00000040 	ssnop
    44c0:	000000c0 	sll	zero,zero,0x3
    44c4:	8f830014 	lw	v1,20(gp)
    44c8:	2463ffff 	addiu	v1,v1,-1
    44cc:	af830014 	sw	v1,20(gp)
    44d0:	8f830008 	lw	v1,8(gp)
    44d4:	30630004 	andi	v1,v1,0x4
    44d8:	146000d9 	bnez	v1,4840 <DeviceInterrupt+0x51c>
    44dc:	3c020000 	lui	v0,0x0
			44dc: R_MIPS_HI16	preempt_schedule
    44e0:	3c120000 	lui	s2,0x0
			44e0: R_MIPS_HI16	pBusContext
    44e4:	8e450000 	lw	a1,0(s2)
			44e4: R_MIPS_LO16	pBusContext
    44e8:	24a6002c 	addiu	a2,a1,44
    44ec:	3c150000 	lui	s5,0x0
			44ec: R_MIPS_HI16	cpu_data
    44f0:	26a20000 	addiu	v0,s5,0
			44f0: R_MIPS_LO16	cpu_data
    44f4:	8c430008 	lw	v1,8(v0)
    44f8:	3c040001 	lui	a0,0x1
    44fc:	00641824 	and	v1,v1,a0
    4500:	10600072 	beqz	v1,46cc <DeviceInterrupt+0x3a8>
    4504:	00000000 	nop
    4508:	c0a3002c 	ll	v1,44(a1)
    450c:	2462ffff 	addiu	v0,v1,-1
    4510:	e0a2002c 	sc	v0,44(a1)
    4514:	10400523 	beqz	v0,59a4 <CardDetectHelperFunction+0x268>
    4518:	00000000 	nop
    451c:	2462ffff 	addiu	v0,v1,-1
    4520:	044000d1 	bltz	v0,4868 <DeviceInterrupt+0x544>
    4524:	8e450000 	lw	a1,0(s2)
			4524: R_MIPS_LO16	pBusContext
    4528:	8cb00028 	lw	s0,40(a1)
    452c:	24a20024 	addiu	v0,a1,36
    4530:	1050001f 	beq	v0,s0,45b0 <DeviceInterrupt+0x28c>
    4534:	3c020000 	lui	v0,0x0
			4534: R_MIPS_HI16	printk
    4538:	24560000 	addiu	s6,v0,0
			4538: R_MIPS_LO16	printk
    453c:	08001156 	j	4558 <DeviceInterrupt+0x234>
			453c: R_MIPS_26	.text
    4540:	24140001 	li	s4,1
    4544:	8e450000 	lw	a1,0(s2)
			4544: R_MIPS_LO16	pBusContext
    4548:	8e100004 	lw	s0,4(s0)
    454c:	24a20024 	addiu	v0,a1,36
    4550:	10500018 	beq	v0,s0,45b4 <DeviceInterrupt+0x290>
    4554:	24a6002c 	addiu	a2,a1,44
    4558:	8e020034 	lw	v0,52(s0)
    455c:	1622fffa 	bne	s1,v0,4548 <DeviceInterrupt+0x224>
    4560:	8e450000 	lw	a1,0(s2)
			4560: R_MIPS_LO16	pBusContext
    4564:	9205003a 	lbu	a1,58(s0)
    4568:	00b41004 	sllv	v0,s4,a1
    456c:	304600ff 	andi	a2,v0,0xff
    4570:	02661824 	and	v1,s3,a2
    4574:	1060fff3 	beqz	v1,4544 <DeviceInterrupt+0x220>
    4578:	3c040000 	lui	a0,0x0
			4578: R_MIPS_HI16	$LC0
    457c:	8e020024 	lw	v0,36(s0)
    4580:	104000a1 	beqz	v0,4808 <DeviceInterrupt+0x4e4>
    4584:	24840000 	addiu	a0,a0,0
			4584: R_MIPS_LO16	$LC0
    4588:	02c0f809 	jalr	s6
    458c:	00000000 	nop
    4590:	8e030024 	lw	v1,36(s0)
    4594:	0060f809 	jalr	v1
    4598:	8e04002c 	lw	a0,44(s0)
    459c:	8e450000 	lw	a1,0(s2)
			459c: R_MIPS_LO16	pBusContext
    45a0:	8e100004 	lw	s0,4(s0)
    45a4:	24a20024 	addiu	v0,a1,36
    45a8:	1450ffeb 	bne	v0,s0,4558 <DeviceInterrupt+0x234>
    45ac:	00000000 	nop
    45b0:	24a6002c 	addiu	a2,a1,44
    45b4:	26a20000 	addiu	v0,s5,0
			45b4: R_MIPS_LO16	cpu_data
    45b8:	8c430008 	lw	v1,8(v0)
    45bc:	3c040001 	lui	a0,0x1
    45c0:	00641824 	and	v1,v1,a0
    45c4:	10600058 	beqz	v1,4728 <DeviceInterrupt+0x404>
    45c8:	00000000 	nop
    45cc:	c0a3002c 	ll	v1,44(a1)
    45d0:	24620001 	addiu	v0,v1,1
    45d4:	e0a2002c 	sc	v0,44(a1)
    45d8:	104004f4 	beqz	v0,59ac <CardDetectHelperFunction+0x270>
    45dc:	00000000 	nop
    45e0:	24620001 	addiu	v0,v1,1
    45e4:	1840009b 	blez	v0,4854 <DeviceInterrupt+0x530>
    45e8:	3c020000 	lui	v0,0x0
			45e8: R_MIPS_HI16	__up
    45ec:	92220084 	lbu	v0,132(s1)
    45f0:	1040ff9d 	beqz	v0,4468 <DeviceInterrupt+0x144>
    45f4:	24020002 	li	v0,2
    45f8:	ae220088 	sw	v0,136(s1)
    45fc:	26250060 	addiu	a1,s1,96
    4600:	26a30000 	addiu	v1,s5,0
			4600: R_MIPS_LO16	cpu_data
    4604:	8c620008 	lw	v0,8(v1)
    4608:	3c040001 	lui	a0,0x1
    460c:	00441024 	and	v0,v0,a0
    4610:	1040005c 	beqz	v0,4784 <DeviceInterrupt+0x460>
    4614:	00000000 	nop
    4618:	c2230060 	ll	v1,96(s1)
    461c:	24620001 	addiu	v0,v1,1
    4620:	e2220060 	sc	v0,96(s1)
    4624:	104004e3 	beqz	v0,59b4 <CardDetectHelperFunction+0x278>
    4628:	00000000 	nop
    462c:	24620001 	addiu	v0,v1,1
    4630:	1c40ff8d 	bgtz	v0,4468 <DeviceInterrupt+0x144>
    4634:	3c020000 	lui	v0,0x0
			4634: R_MIPS_HI16	__up
    4638:	24420000 	addiu	v0,v0,0
			4638: R_MIPS_LO16	__up
    463c:	0040f809 	jalr	v0
    4640:	00a02021 	move	a0,a1
    4644:	0800111b 	j	446c <DeviceInterrupt+0x148>
			4644: R_MIPS_26	.text
    4648:	00001021 	move	v0,zero
    464c:	40016000 	mfc0	at,c0_status
    4650:	30840001 	andi	a0,a0,0x1
    4654:	3421001f 	ori	at,at,0x1f
    4658:	3821001f 	xori	at,at,0x1f
    465c:	00812025 	or	a0,a0,at
    4660:	40846000 	mtc0	a0,c0_status
    4664:	00000040 	ssnop
    4668:	00000040 	ssnop
    466c:	00000040 	ssnop
    4670:	000000c0 	sll	zero,zero,0x3
    4674:	8f830014 	lw	v1,20(gp)
    4678:	2463ffff 	addiu	v1,v1,-1
    467c:	af830014 	sw	v1,20(gp)
    4680:	8f830008 	lw	v1,8(gp)
    4684:	30630004 	andi	v1,v1,0x4
    4688:	10600006 	beqz	v1,46a4 <DeviceInterrupt+0x380>
    468c:	8fbf003c 	lw	ra,60(sp)
    4690:	3c020000 	lui	v0,0x0
			4690: R_MIPS_HI16	preempt_schedule
    4694:	24420000 	addiu	v0,v0,0
			4694: R_MIPS_LO16	preempt_schedule
    4698:	0040f809 	jalr	v0
    469c:	00000000 	nop
    46a0:	8fbf003c 	lw	ra,60(sp)
    46a4:	8fb60038 	lw	s6,56(sp)
    46a8:	8fb50034 	lw	s5,52(sp)
    46ac:	8fb40030 	lw	s4,48(sp)
    46b0:	8fb3002c 	lw	s3,44(sp)
    46b4:	8fb20028 	lw	s2,40(sp)
    46b8:	8fb10024 	lw	s1,36(sp)
    46bc:	8fb00020 	lw	s0,32(sp)
    46c0:	2402ffff 	li	v0,-1
    46c4:	03e00008 	jr	ra
    46c8:	27bd0040 	addiu	sp,sp,64
    46cc:	40036000 	mfc0	v1,c0_status
    46d0:	3461001f 	ori	at,v1,0x1f
    46d4:	3821001f 	xori	at,at,0x1f
    46d8:	40816000 	mtc0	at,c0_status
    46dc:	00000040 	ssnop
    46e0:	00000040 	ssnop
    46e4:	00000040 	ssnop
    46e8:	000000c0 	sll	zero,zero,0x3
    46ec:	8ca2002c 	lw	v0,44(a1)
    46f0:	2442ffff 	addiu	v0,v0,-1
    46f4:	aca2002c 	sw	v0,44(a1)
    46f8:	40016000 	mfc0	at,c0_status
    46fc:	30630001 	andi	v1,v1,0x1
    4700:	3421001f 	ori	at,at,0x1f
    4704:	3821001f 	xori	at,at,0x1f
    4708:	00611825 	or	v1,v1,at
    470c:	40836000 	mtc0	v1,c0_status
    4710:	00000040 	ssnop
    4714:	00000040 	ssnop
    4718:	00000040 	ssnop
    471c:	000000c0 	sll	zero,zero,0x3
    4720:	08001148 	j	4520 <DeviceInterrupt+0x1fc>
			4720: R_MIPS_26	.text
    4724:	00000000 	nop
    4728:	40036000 	mfc0	v1,c0_status
    472c:	3461001f 	ori	at,v1,0x1f
    4730:	3821001f 	xori	at,at,0x1f
    4734:	40816000 	mtc0	at,c0_status
    4738:	00000040 	ssnop
    473c:	00000040 	ssnop
    4740:	00000040 	ssnop
    4744:	000000c0 	sll	zero,zero,0x3
    4748:	8ca2002c 	lw	v0,44(a1)
    474c:	24420001 	addiu	v0,v0,1
    4750:	aca2002c 	sw	v0,44(a1)
    4754:	40016000 	mfc0	at,c0_status
    4758:	30630001 	andi	v1,v1,0x1
    475c:	3421001f 	ori	at,at,0x1f
    4760:	3821001f 	xori	at,at,0x1f
    4764:	00611825 	or	v1,v1,at
    4768:	40836000 	mtc0	v1,c0_status
    476c:	00000040 	ssnop
    4770:	00000040 	ssnop
    4774:	00000040 	ssnop
    4778:	000000c0 	sll	zero,zero,0x3
    477c:	08001179 	j	45e4 <DeviceInterrupt+0x2c0>
			477c: R_MIPS_26	.text
    4780:	00000000 	nop
    4784:	40036000 	mfc0	v1,c0_status
    4788:	3461001f 	ori	at,v1,0x1f
    478c:	3821001f 	xori	at,at,0x1f
    4790:	40816000 	mtc0	at,c0_status
    4794:	00000040 	ssnop
    4798:	00000040 	ssnop
    479c:	00000040 	ssnop
    47a0:	000000c0 	sll	zero,zero,0x3
    47a4:	8e220060 	lw	v0,96(s1)
    47a8:	24420001 	addiu	v0,v0,1
    47ac:	ae220060 	sw	v0,96(s1)
    47b0:	40016000 	mfc0	at,c0_status
    47b4:	30630001 	andi	v1,v1,0x1
    47b8:	3421001f 	ori	at,at,0x1f
    47bc:	3821001f 	xori	at,at,0x1f
    47c0:	00611825 	or	v1,v1,at
    47c4:	40836000 	mtc0	v1,c0_status
    47c8:	00000040 	ssnop
    47cc:	00000040 	ssnop
    47d0:	00000040 	ssnop
    47d4:	000000c0 	sll	zero,zero,0x3
    47d8:	0800118c 	j	4630 <DeviceInterrupt+0x30c>
			47d8: R_MIPS_26	.text
    47dc:	00000000 	nop
    47e0:	8e220028 	lw	v0,40(s1)
    47e4:	24032003 	li	v1,8195
    47e8:	a7a30010 	sh	v1,16(sp)
    47ec:	afa00014 	sw	zero,20(sp)
    47f0:	afa00018 	sw	zero,24(sp)
    47f4:	02202021 	move	a0,s1
    47f8:	0040f809 	jalr	v0
    47fc:	27a50010 	addiu	a1,sp,16
    4800:	08001109 	j	4424 <DeviceInterrupt+0x100>
			4800: R_MIPS_26	.text
    4804:	00000000 	nop
    4808:	92220084 	lbu	v0,132(s1)
    480c:	00c21025 	or	v0,a2,v0
    4810:	08001151 	j	4544 <DeviceInterrupt+0x220>
			4810: R_MIPS_26	.text
    4814:	a2220084 	sb	v0,132(s1)
    4818:	24420000 	addiu	v0,v0,0
			4818: R_MIPS_LO16	preempt_schedule
    481c:	0040f809 	jalr	v0
    4820:	00000000 	nop
    4824:	0800111b 	j	446c <DeviceInterrupt+0x148>
			4824: R_MIPS_26	.text
    4828:	00001021 	move	v0,zero
    482c:	24420000 	addiu	v0,v0,0
			482c: R_MIPS_LO16	preempt_schedule
    4830:	0040f809 	jalr	v0
    4834:	00000000 	nop
    4838:	080010f6 	j	43d8 <DeviceInterrupt+0xb4>
			4838: R_MIPS_26	.text
    483c:	00000000 	nop
    4840:	24420000 	addiu	v0,v0,0
			4840: R_MIPS_LO16	preempt_schedule
    4844:	0040f809 	jalr	v0
    4848:	3c120000 	lui	s2,0x0
			4848: R_MIPS_HI16	pBusContext
    484c:	0800113a 	j	44e8 <DeviceInterrupt+0x1c4>
			484c: R_MIPS_26	.text
    4850:	8e450000 	lw	a1,0(s2)
			4850: R_MIPS_LO16	pBusContext
    4854:	24420000 	addiu	v0,v0,0
			4854: R_MIPS_LO16	__up
    4858:	0040f809 	jalr	v0
    485c:	00c02021 	move	a0,a2
    4860:	0800117c 	j	45f0 <DeviceInterrupt+0x2cc>
			4860: R_MIPS_26	.text
    4864:	92220084 	lbu	v0,132(s1)
    4868:	3c020000 	lui	v0,0x0
			4868: R_MIPS_HI16	__down_interruptible
    486c:	24420000 	addiu	v0,v0,0
			486c: R_MIPS_LO16	__down_interruptible
    4870:	0040f809 	jalr	v0
    4874:	00c02021 	move	a0,a2
    4878:	1440fefc 	bnez	v0,446c <DeviceInterrupt+0x148>
    487c:	00001021 	move	v0,zero
    4880:	0800114a 	j	4528 <DeviceInterrupt+0x204>
			4880: R_MIPS_26	.text
    4884:	8e450000 	lw	a1,0(s2)
			4884: R_MIPS_LO16	pBusContext

00004888 <_SDIO_HandleHcdEvent>:
    4888:	27bdffc0 	addiu	sp,sp,-64
    488c:	30a500ff 	andi	a1,a1,0xff
    4890:	24020004 	li	v0,4
    4894:	afb20020 	sw	s2,32(sp)
    4898:	afbf0038 	sw	ra,56(sp)
    489c:	afb70034 	sw	s7,52(sp)
    48a0:	afb60030 	sw	s6,48(sp)
    48a4:	afb5002c 	sw	s5,44(sp)
    48a8:	afb40028 	sw	s4,40(sp)
    48ac:	afb30024 	sw	s3,36(sp)
    48b0:	afb1001c 	sw	s1,28(sp)
    48b4:	afb00018 	sw	s0,24(sp)
    48b8:	10a20040 	beq	a1,v0,49bc <_SDIO_HandleHcdEvent+0x134>
    48bc:	00809021 	move	s2,a0
    48c0:	14a0000e 	bnez	a1,48fc <_SDIO_HandleHcdEvent+0x74>
    48c4:	2ca20003 	sltiu	v0,a1,3
    48c8:	2410fffe 	li	s0,-2
    48cc:	02001021 	move	v0,s0
    48d0:	8fbf0038 	lw	ra,56(sp)
    48d4:	8fb70034 	lw	s7,52(sp)
    48d8:	8fb60030 	lw	s6,48(sp)
    48dc:	8fb5002c 	lw	s5,44(sp)
    48e0:	8fb40028 	lw	s4,40(sp)
    48e4:	8fb30024 	lw	s3,36(sp)
    48e8:	8fb20020 	lw	s2,32(sp)
    48ec:	8fb1001c 	lw	s1,28(sp)
    48f0:	8fb00018 	lw	s0,24(sp)
    48f4:	03e00008 	jr	ra
    48f8:	27bd0040 	addiu	sp,sp,64
    48fc:	104000af 	beqz	v0,4bbc <_SDIO_HandleHcdEvent+0x334>
    4900:	24020003 	li	v0,3
    4904:	3c020000 	lui	v0,0x0
			4904: R_MIPS_HI16	pBusContext
    4908:	a3a50010 	sb	a1,16(sp)
    490c:	8c510000 	lw	s1,0(v0)
			490c: R_MIPS_LO16	pBusContext
    4910:	10800006 	beqz	a0,492c <_SDIO_HandleHcdEvent+0xa4>
    4914:	afa40014 	sw	a0,20(sp)
    4918:	90820000 	lbu	v0,0(a0)
    491c:	3042000f 	andi	v0,v0,0xf
    4920:	28420003 	slti	v0,v0,3
    4924:	10400271 	beqz	v0,52ec <_SDIO_HandleHcdEvent+0xa64>
    4928:	3c020000 	lui	v0,0x0
			4928: R_MIPS_HI16	Do_OS_IncHcdReference
    492c:	8e240098 	lw	a0,152(s1)
    4930:	3c020000 	lui	v0,0x0
			4930: R_MIPS_HI16	SDLIB_PostMessage
    4934:	27a50010 	addiu	a1,sp,16
    4938:	24420000 	addiu	v0,v0,0
			4938: R_MIPS_LO16	SDLIB_PostMessage
    493c:	0040f809 	jalr	v0
    4940:	24060008 	li	a2,8
    4944:	04400270 	bltz	v0,5308 <_SDIO_HandleHcdEvent+0xa80>
    4948:	00408021 	move	s0,v0
    494c:	26250078 	addiu	a1,s1,120
    4950:	3c020000 	lui	v0,0x0
			4950: R_MIPS_HI16	cpu_data
    4954:	8c430008 	lw	v1,8(v0)
			4954: R_MIPS_LO16	cpu_data
    4958:	3c040001 	lui	a0,0x1
    495c:	00641824 	and	v1,v1,a0
    4960:	106001f3 	beqz	v1,5130 <_SDIO_HandleHcdEvent+0x8a8>
    4964:	00000000 	nop
    4968:	c2230078 	ll	v1,120(s1)
    496c:	24620001 	addiu	v0,v1,1
    4970:	e2220078 	sc	v0,120(s1)
    4974:	10400411 	beqz	v0,59bc <CardDetectHelperFunction+0x280>
    4978:	00000000 	nop
    497c:	24620001 	addiu	v0,v1,1
    4980:	18400241 	blez	v0,5288 <_SDIO_HandleHcdEvent+0xa00>
    4984:	3c020000 	lui	v0,0x0
			4984: R_MIPS_HI16	__up
    4988:	00008021 	move	s0,zero
    498c:	02001021 	move	v0,s0
    4990:	8fbf0038 	lw	ra,56(sp)
    4994:	8fb70034 	lw	s7,52(sp)
    4998:	8fb60030 	lw	s6,48(sp)
    499c:	8fb5002c 	lw	s5,44(sp)
    49a0:	8fb40028 	lw	s4,40(sp)
    49a4:	8fb30024 	lw	s3,36(sp)
    49a8:	8fb20020 	lw	s2,32(sp)
    49ac:	8fb1001c 	lw	s1,28(sp)
    49b0:	8fb00018 	lw	s0,24(sp)
    49b4:	03e00008 	jr	ra
    49b8:	27bd0040 	addiu	sp,sp,64
    49bc:	8c900044 	lw	s0,68(a0)
    49c0:	12000283 	beqz	s0,53d0 <_SDIO_HandleHcdEvent+0xb48>
    49c4:	00000000 	nop
    49c8:	40046000 	mfc0	a0,c0_status
    49cc:	3481001f 	ori	at,a0,0x1f
    49d0:	3821001f 	xori	at,at,0x1f
    49d4:	40816000 	mtc0	at,c0_status
    49d8:	00000040 	ssnop
    49dc:	00000040 	ssnop
    49e0:	00000040 	ssnop
    49e4:	000000c0 	sll	zero,zero,0x3
    49e8:	8f830014 	lw	v1,20(gp)
    49ec:	24630001 	addiu	v1,v1,1
    49f0:	af830014 	sw	v1,20(gp)
    49f4:	ae400044 	sw	zero,68(s2)
    49f8:	40016000 	mfc0	at,c0_status
    49fc:	30840001 	andi	a0,a0,0x1
    4a00:	3421001f 	ori	at,at,0x1f
    4a04:	3821001f 	xori	at,at,0x1f
    4a08:	00812025 	or	a0,a0,at
    4a0c:	40846000 	mtc0	a0,c0_status
    4a10:	00000040 	ssnop
    4a14:	00000040 	ssnop
    4a18:	00000040 	ssnop
    4a1c:	000000c0 	sll	zero,zero,0x3
    4a20:	8f830014 	lw	v1,20(gp)
    4a24:	2463ffff 	addiu	v1,v1,-1
    4a28:	af830014 	sw	v1,20(gp)
    4a2c:	8f830008 	lw	v1,8(gp)
    4a30:	30630004 	andi	v1,v1,0x4
    4a34:	146002c8 	bnez	v1,5558 <_SDIO_HandleHcdEvent+0xcd0>
    4a38:	3c020000 	lui	v0,0x0
			4a38: R_MIPS_HI16	preempt_schedule
    4a3c:	8e030040 	lw	v1,64(s0)
    4a40:	0460013a 	bltz	v1,4f2c <_SDIO_HandleHcdEvent+0x6a4>
    4a44:	2402fff8 	li	v0,-8
    4a48:	8e040008 	lw	a0,8(s0)
    4a4c:	3c020004 	lui	v0,0x4
    4a50:	00821024 	and	v0,a0,v0
    4a54:	10400060 	beqz	v0,4bd8 <_SDIO_HandleHcdEvent+0x350>
    4a58:	00008821 	move	s1,zero
    4a5c:	30820020 	andi	v0,a0,0x20
    4a60:	144001ca 	bnez	v0,518c <_SDIO_HandleHcdEvent+0x904>
    4a64:	2402fff8 	li	v0,-8
    4a68:	00009821 	move	s3,zero
    4a6c:	00008821 	move	s1,zero
    4a70:	2402feff 	li	v0,-257
    4a74:	8e030038 	lw	v1,56(s0)
    4a78:	00821024 	and	v0,a0,v0
    4a7c:	10600256 	beqz	v1,53d8 <_SDIO_HandleHcdEvent+0xb50>
    4a80:	ae020008 	sw	v0,8(s0)
    4a84:	3c140000 	lui	s4,0x0
			4a84: R_MIPS_HI16	cpu_data
    4a88:	26820000 	addiu	v0,s4,0
			4a88: R_MIPS_LO16	cpu_data
    4a8c:	8c430008 	lw	v1,8(v0)
    4a90:	3c040001 	lui	a0,0x1
    4a94:	00641824 	and	v1,v1,a0
    4a98:	106001d7 	beqz	v1,51f8 <_SDIO_HandleHcdEvent+0x970>
    4a9c:	34028000 	li	v0,0x8000
    4aa0:	c204000c 	ll	a0,12(s0)
    4aa4:	00821825 	or	v1,a0,v0
    4aa8:	00621826 	xor	v1,v1,v0
    4aac:	e203000c 	sc	v1,12(s0)
    4ab0:	106003c4 	beqz	v1,59c4 <CardDetectHelperFunction+0x288>
    4ab4:	00821824 	and	v1,a0,v0
    4ab8:	8e020038 	lw	v0,56(s0)
    4abc:	0040f809 	jalr	v0
    4ac0:	02002021 	move	a0,s0
    4ac4:	12600011 	beqz	s3,4b0c <_SDIO_HandleHcdEvent+0x284>
    4ac8:	3c020000 	lui	v0,0x0
			4ac8: R_MIPS_HI16	pBusContext
    4acc:	262500cc 	addiu	a1,s1,204
    4ad0:	26820000 	addiu	v0,s4,0
			4ad0: R_MIPS_LO16	cpu_data
    4ad4:	8c430008 	lw	v1,8(v0)
    4ad8:	3c040001 	lui	a0,0x1
    4adc:	00641824 	and	v1,v1,a0
    4ae0:	10600224 	beqz	v1,5374 <_SDIO_HandleHcdEvent+0xaec>
    4ae4:	00000000 	nop
    4ae8:	c22300cc 	ll	v1,204(s1)
    4aec:	24620001 	addiu	v0,v1,1
    4af0:	e22200cc 	sc	v0,204(s1)
    4af4:	104003b5 	beqz	v0,59cc <CardDetectHelperFunction+0x290>
    4af8:	00000000 	nop
    4afc:	24620001 	addiu	v0,v1,1
    4b00:	1840029c 	blez	v0,5574 <_SDIO_HandleHcdEvent+0xcec>
    4b04:	3c020000 	lui	v0,0x0
			4b04: R_MIPS_HI16	__up
    4b08:	3c020000 	lui	v0,0x0
			4b08: R_MIPS_HI16	pBusContext
    4b0c:	8c440000 	lw	a0,0(v0)
			4b0c: R_MIPS_LO16	pBusContext
    4b10:	908300a0 	lbu	v1,160(a0)
    4b14:	30630001 	andi	v1,v1,0x1
    4b18:	14600026 	bnez	v1,4bb4 <_SDIO_HandleHcdEvent+0x32c>
    4b1c:	00002021 	move	a0,zero
    4b20:	92420000 	lbu	v0,0(s2)
    4b24:	3042000f 	andi	v0,v0,0xf
    4b28:	28420006 	slti	v0,v0,6
    4b2c:	14400202 	bnez	v0,5338 <_SDIO_HandleHcdEvent+0xab0>
    4b30:	00000000 	nop
    4b34:	40046000 	mfc0	a0,c0_status
    4b38:	3481001f 	ori	at,a0,0x1f
    4b3c:	3821001f 	xori	at,at,0x1f
    4b40:	40816000 	mtc0	at,c0_status
    4b44:	00000040 	ssnop
    4b48:	00000040 	ssnop
    4b4c:	00000040 	ssnop
    4b50:	000000c0 	sll	zero,zero,0x3
    4b54:	8f820014 	lw	v0,20(gp)
    4b58:	24420001 	addiu	v0,v0,1
    4b5c:	af820014 	sw	v0,20(gp)
    4b60:	8e4200a8 	lw	v0,168(s2)
    4b64:	2442ffff 	addiu	v0,v0,-1
    4b68:	ae4200a8 	sw	v0,168(s2)
    4b6c:	40016000 	mfc0	at,c0_status
    4b70:	30840001 	andi	a0,a0,0x1
    4b74:	3421001f 	ori	at,at,0x1f
    4b78:	3821001f 	xori	at,at,0x1f
    4b7c:	00812025 	or	a0,a0,at
    4b80:	40846000 	mtc0	a0,c0_status
    4b84:	00000040 	ssnop
    4b88:	00000040 	ssnop
    4b8c:	00000040 	ssnop
    4b90:	000000c0 	sll	zero,zero,0x3
    4b94:	8f830014 	lw	v1,20(gp)
    4b98:	2463ffff 	addiu	v1,v1,-1
    4b9c:	af830014 	sw	v1,20(gp)
    4ba0:	8f830008 	lw	v1,8(gp)
    4ba4:	30630004 	andi	v1,v1,0x4
    4ba8:	146001bc 	bnez	v1,529c <_SDIO_HandleHcdEvent+0xa14>
    4bac:	3c020000 	lui	v0,0x0
			4bac: R_MIPS_HI16	preempt_schedule
    4bb0:	00002021 	move	a0,zero
    4bb4:	080012f7 	j	4bdc <_SDIO_HandleHcdEvent+0x354>
			4bb4: R_MIPS_26	.text
    4bb8:	00008821 	move	s1,zero
    4bbc:	14a2ff42 	bne	a1,v0,48c8 <_SDIO_HandleHcdEvent+0x40>
    4bc0:	3c020000 	lui	v0,0x0
			4bc0: R_MIPS_HI16	DeviceInterrupt
    4bc4:	24420000 	addiu	v0,v0,0
			4bc4: R_MIPS_LO16	DeviceInterrupt
    4bc8:	0040f809 	jalr	v0
    4bcc:	00000000 	nop
    4bd0:	08001233 	j	48cc <_SDIO_HandleHcdEvent+0x44>
			4bd0: R_MIPS_26	.text
    4bd4:	00408021 	move	s0,v0
    4bd8:	02002021 	move	a0,s0
    4bdc:	40066000 	mfc0	a2,c0_status
    4be0:	34c1001f 	ori	at,a2,0x1f
    4be4:	3821001f 	xori	at,at,0x1f
    4be8:	40816000 	mtc0	at,c0_status
    4bec:	00000040 	ssnop
    4bf0:	00000040 	ssnop
    4bf4:	00000040 	ssnop
    4bf8:	000000c0 	sll	zero,zero,0x3
    4bfc:	8f820014 	lw	v0,20(gp)
    4c00:	24420001 	addiu	v0,v0,1
    4c04:	af820014 	sw	v0,20(gp)
    4c08:	10800007 	beqz	a0,4c28 <_SDIO_HandleHcdEvent+0x3a0>
    4c0c:	26540094 	addiu	s4,s2,148
    4c10:	8e420094 	lw	v0,148(s2)
    4c14:	ac820000 	sw	v0,0(a0)
    4c18:	8e430094 	lw	v1,148(s2)
    4c1c:	ac940004 	sw	s4,4(a0)
    4c20:	ae440094 	sw	a0,148(s2)
    4c24:	ac640004 	sw	a0,4(v1)
    4c28:	122001a1 	beqz	s1,52b0 <_SDIO_HandleHcdEvent+0xa28>
    4c2c:	00000000 	nop
    4c30:	92420000 	lbu	v0,0(s2)
    4c34:	3042000f 	andi	v0,v0,0xf
    4c38:	28420006 	slti	v0,v0,6
    4c3c:	1440000c 	bnez	v0,4c70 <_SDIO_HandleHcdEvent+0x3e8>
    4c40:	3c030000 	lui	v1,0x0
			4c40: R_MIPS_HI16	pBusContext
    4c44:	8e4200a8 	lw	v0,168(s2)
    4c48:	24420001 	addiu	v0,v0,1
    4c4c:	ae4200a8 	sw	v0,168(s2)
    4c50:	8c640000 	lw	a0,0(v1)
			4c50: R_MIPS_LO16	pBusContext
    4c54:	8c8500a4 	lw	a1,164(a0)
    4c58:	00a2102a 	slt	v0,a1,v0
    4c5c:	10400004 	beqz	v0,4c70 <_SDIO_HandleHcdEvent+0x3e8>
    4c60:	00000000 	nop
    4c64:	8e220008 	lw	v0,8(s1)
    4c68:	34420100 	ori	v0,v0,0x100
    4c6c:	ae220008 	sw	v0,8(s1)
    4c70:	40016000 	mfc0	at,c0_status
    4c74:	30c60001 	andi	a2,a2,0x1
    4c78:	3421001f 	ori	at,at,0x1f
    4c7c:	3821001f 	xori	at,at,0x1f
    4c80:	00c13025 	or	a2,a2,at
    4c84:	40866000 	mtc0	a2,c0_status
    4c88:	00000040 	ssnop
    4c8c:	00000040 	ssnop
    4c90:	00000040 	ssnop
    4c94:	000000c0 	sll	zero,zero,0x3
    4c98:	8f830014 	lw	v1,20(gp)
    4c9c:	2463ffff 	addiu	v1,v1,-1
    4ca0:	af830014 	sw	v1,20(gp)
    4ca4:	8f830008 	lw	v1,8(gp)
    4ca8:	30630004 	andi	v1,v1,0x4
    4cac:	14600171 	bnez	v1,5274 <_SDIO_HandleHcdEvent+0x9ec>
    4cb0:	3c020000 	lui	v0,0x0
			4cb0: R_MIPS_HI16	preempt_schedule
    4cb4:	12200017 	beqz	s1,4d14 <_SDIO_HandleHcdEvent+0x48c>
    4cb8:	3c020008 	lui	v0,0x8
    4cbc:	ae510044 	sw	s1,68(s2)
    4cc0:	8e250008 	lw	a1,8(s1)
    4cc4:	00a21024 	and	v0,a1,v0
    4cc8:	1440000e 	bnez	v0,4d04 <_SDIO_HandleHcdEvent+0x47c>
    4ccc:	3c020000 	lui	v0,0x0
			4ccc: R_MIPS_HI16	_SDIO_HandleHcdEvent
    4cd0:	3c020000 	lui	v0,0x0
			4cd0: R_MIPS_HI16	pBusContext
    4cd4:	8c440000 	lw	a0,0(v0)
			4cd4: R_MIPS_LO16	pBusContext
    4cd8:	908300a0 	lbu	v1,160(a0)
    4cdc:	30630001 	andi	v1,v1,0x1
    4ce0:	1060012e 	beqz	v1,519c <_SDIO_HandleHcdEvent+0x914>
    4ce4:	34a20100 	ori	v0,a1,0x100
    4ce8:	ae220008 	sw	v0,8(s1)
    4cec:	8e420024 	lw	v0,36(s2)
    4cf0:	0040f809 	jalr	v0
    4cf4:	02402021 	move	a0,s2
    4cf8:	24030003 	li	v1,3
    4cfc:	10430005 	beq	v0,v1,4d14 <_SDIO_HandleHcdEvent+0x48c>
    4d00:	3c020000 	lui	v0,0x0
			4d00: R_MIPS_HI16	_SDIO_HandleHcdEvent
    4d04:	02402021 	move	a0,s2
    4d08:	24420000 	addiu	v0,v0,0
			4d08: R_MIPS_LO16	_SDIO_HandleHcdEvent
    4d0c:	0040f809 	jalr	v0
    4d10:	24050004 	li	a1,4
    4d14:	40066000 	mfc0	a2,c0_status
    4d18:	34c1001f 	ori	at,a2,0x1f
    4d1c:	3821001f 	xori	at,at,0x1f
    4d20:	40816000 	mtc0	at,c0_status
    4d24:	00000040 	ssnop
    4d28:	00000040 	ssnop
    4d2c:	00000040 	ssnop
    4d30:	000000c0 	sll	zero,zero,0x3
    4d34:	8f820014 	lw	v0,20(gp)
    4d38:	24420001 	addiu	v0,v0,1
    4d3c:	af820014 	sw	v0,20(gp)
    4d40:	3c020000 	lui	v0,0x0
			4d40: R_MIPS_HI16	cpu_data
    4d44:	3c03ffff 	lui	v1,0xffff
    4d48:	24560000 	addiu	s6,v0,0
			4d48: R_MIPS_LO16	cpu_data
    4d4c:	34777fff 	ori	s7,v1,0x7fff
    4d50:	3c150001 	lui	s5,0x1
    4d54:	8e850004 	lw	a1,4(s4)
    4d58:	12850009 	beq	s4,a1,4d80 <_SDIO_HandleHcdEvent+0x4f8>
    4d5c:	00008021 	move	s0,zero
    4d60:	8ca20004 	lw	v0,4(a1)
    4d64:	8ca30000 	lw	v1,0(a1)
    4d68:	00a08021 	move	s0,a1
    4d6c:	ac430000 	sw	v1,0(v0)
    4d70:	8ca40000 	lw	a0,0(a1)
    4d74:	aca50000 	sw	a1,0(a1)
    4d78:	ac820004 	sw	v0,4(a0)
    4d7c:	aca50004 	sw	a1,4(a1)
    4d80:	40016000 	mfc0	at,c0_status
    4d84:	30c60001 	andi	a2,a2,0x1
    4d88:	3421001f 	ori	at,at,0x1f
    4d8c:	3821001f 	xori	at,at,0x1f
    4d90:	00c13025 	or	a2,a2,at
    4d94:	40866000 	mtc0	a2,c0_status
    4d98:	00000040 	ssnop
    4d9c:	00000040 	ssnop
    4da0:	00000040 	ssnop
    4da4:	000000c0 	sll	zero,zero,0x3
    4da8:	8f830014 	lw	v1,20(gp)
    4dac:	2463ffff 	addiu	v1,v1,-1
    4db0:	af830014 	sw	v1,20(gp)
    4db4:	8f830008 	lw	v1,8(gp)
    4db8:	30630004 	andi	v1,v1,0x4
    4dbc:	14600128 	bnez	v1,5260 <_SDIO_HandleHcdEvent+0x9d8>
    4dc0:	3c020000 	lui	v0,0x0
			4dc0: R_MIPS_HI16	preempt_schedule
    4dc4:	1200fef0 	beqz	s0,4988 <_SDIO_HandleHcdEvent+0x100>
    4dc8:	00000000 	nop
    4dcc:	8e040008 	lw	a0,8(s0)
    4dd0:	30820020 	andi	v0,a0,0x20
    4dd4:	14400062 	bnez	v0,4f60 <_SDIO_HandleHcdEvent+0x6d8>
    4dd8:	2402fff8 	li	v0,-8
    4ddc:	2402feff 	li	v0,-257
    4de0:	8e030038 	lw	v1,56(s0)
    4de4:	00821024 	and	v0,a0,v0
    4de8:	00009821 	move	s3,zero
    4dec:	00008821 	move	s1,zero
    4df0:	10600063 	beqz	v1,4f80 <_SDIO_HandleHcdEvent+0x6f8>
    4df4:	ae020008 	sw	v0,8(s0)
    4df8:	8ec20008 	lw	v0,8(s6)
    4dfc:	00551024 	and	v0,v0,s5
    4e00:	1040006b 	beqz	v0,4fb0 <_SDIO_HandleHcdEvent+0x728>
    4e04:	34028000 	li	v0,0x8000
    4e08:	c204000c 	ll	a0,12(s0)
    4e0c:	00821825 	or	v1,a0,v0
    4e10:	00621826 	xor	v1,v1,v0
    4e14:	e203000c 	sc	v1,12(s0)
    4e18:	106002ee 	beqz	v1,59d4 <CardDetectHelperFunction+0x298>
    4e1c:	00821824 	and	v1,a0,v0
    4e20:	8e020038 	lw	v0,56(s0)
    4e24:	0040f809 	jalr	v0
    4e28:	02002021 	move	a0,s0
    4e2c:	1260000e 	beqz	s3,4e68 <_SDIO_HandleHcdEvent+0x5e0>
    4e30:	00000000 	nop
    4e34:	262400cc 	addiu	a0,s1,204
    4e38:	8ec20008 	lw	v0,8(s6)
    4e3c:	00551024 	and	v0,v0,s5
    4e40:	10400073 	beqz	v0,5010 <_SDIO_HandleHcdEvent+0x788>
    4e44:	00000000 	nop
    4e48:	c22300cc 	ll	v1,204(s1)
    4e4c:	24620001 	addiu	v0,v1,1
    4e50:	e22200cc 	sc	v0,204(s1)
    4e54:	104002e1 	beqz	v0,59dc <CardDetectHelperFunction+0x2a0>
    4e58:	00000000 	nop
    4e5c:	24620001 	addiu	v0,v1,1
    4e60:	1840019e 	blez	v0,54dc <_SDIO_HandleHcdEvent+0xc54>
    4e64:	3c020000 	lui	v0,0x0
			4e64: R_MIPS_HI16	__up
    4e68:	92420000 	lbu	v0,0(s2)
    4e6c:	3042000f 	andi	v0,v0,0xf
    4e70:	28420006 	slti	v0,v0,6
    4e74:	10400010 	beqz	v0,4eb8 <_SDIO_HandleHcdEvent+0x630>
    4e78:	3c020000 	lui	v0,0x0
			4e78: R_MIPS_HI16	pBusContext
    4e7c:	8c440000 	lw	a0,0(v0)
			4e7c: R_MIPS_LO16	pBusContext
    4e80:	908300a0 	lbu	v1,160(a0)
    4e84:	30630001 	andi	v1,v1,0x1
    4e88:	1460000b 	bnez	v1,4eb8 <_SDIO_HandleHcdEvent+0x630>
    4e8c:	00000000 	nop
    4e90:	8ec20008 	lw	v0,8(s6)
    4e94:	00551024 	and	v0,v0,s5
    4e98:	10400074 	beqz	v0,506c <_SDIO_HandleHcdEvent+0x7e4>
    4e9c:	24020001 	li	v0,1
    4ea0:	c2440090 	ll	a0,144(s2)
    4ea4:	00821825 	or	v1,a0,v0
    4ea8:	00621826 	xor	v1,v1,v0
    4eac:	e2430090 	sc	v1,144(s2)
    4eb0:	106002cc 	beqz	v1,59e4 <CardDetectHelperFunction+0x2a8>
    4eb4:	00821824 	and	v1,a0,v0
    4eb8:	40066000 	mfc0	a2,c0_status
    4ebc:	34c1001f 	ori	at,a2,0x1f
    4ec0:	3821001f 	xori	at,at,0x1f
    4ec4:	40816000 	mtc0	at,c0_status
    4ec8:	00000040 	ssnop
    4ecc:	00000040 	ssnop
    4ed0:	00000040 	ssnop
    4ed4:	000000c0 	sll	zero,zero,0x3
    4ed8:	8f830014 	lw	v1,20(gp)
    4edc:	24630001 	addiu	v1,v1,1
    4ee0:	af830014 	sw	v1,20(gp)
    4ee4:	92420000 	lbu	v0,0(s2)
    4ee8:	3042000f 	andi	v0,v0,0xf
    4eec:	28420006 	slti	v0,v0,6
    4ef0:	1440ff98 	bnez	v0,4d54 <_SDIO_HandleHcdEvent+0x4cc>
    4ef4:	3c020000 	lui	v0,0x0
			4ef4: R_MIPS_HI16	pBusContext
    4ef8:	8c440000 	lw	a0,0(v0)
			4ef8: R_MIPS_LO16	pBusContext
    4efc:	908300a0 	lbu	v1,160(a0)
    4f00:	30630001 	andi	v1,v1,0x1
    4f04:	1460ff93 	bnez	v1,4d54 <_SDIO_HandleHcdEvent+0x4cc>
    4f08:	00000000 	nop
    4f0c:	8e4200a8 	lw	v0,168(s2)
    4f10:	2442ffff 	addiu	v0,v0,-1
    4f14:	ae4200a8 	sw	v0,168(s2)
    4f18:	8e850004 	lw	a1,4(s4)
    4f1c:	1685ff90 	bne	s4,a1,4d60 <_SDIO_HandleHcdEvent+0x4d8>
    4f20:	00008021 	move	s0,zero
    4f24:	08001360 	j	4d80 <_SDIO_HandleHcdEvent+0x4f8>
			4f24: R_MIPS_26	.text
    4f28:	00000000 	nop
    4f2c:	1062fec6 	beq	v1,v0,4a48 <_SDIO_HandleHcdEvent+0x1c0>
    4f30:	00000000 	nop
    4f34:	8e040008 	lw	a0,8(s0)
    4f38:	30820020 	andi	v0,a0,0x20
    4f3c:	1440fec4 	bnez	v0,4a50 <_SDIO_HandleHcdEvent+0x1c8>
    4f40:	3c020004 	lui	v0,0x4
    4f44:	8e020048 	lw	v0,72(s0)
    4f48:	1840fec0 	blez	v0,4a4c <_SDIO_HandleHcdEvent+0x1c4>
    4f4c:	2442ffff 	addiu	v0,v0,-1
    4f50:	02008821 	move	s1,s0
    4f54:	00002021 	move	a0,zero
    4f58:	080012f7 	j	4bdc <_SDIO_HandleHcdEvent+0x354>
			4f58: R_MIPS_26	.text
    4f5c:	ae020048 	sw	v0,72(s0)
    4f60:	ae020040 	sw	v0,64(s0)
    4f64:	8e030038 	lw	v1,56(s0)
    4f68:	2402feff 	li	v0,-257
    4f6c:	00821024 	and	v0,a0,v0
    4f70:	8e110044 	lw	s1,68(s0)
    4f74:	24130001 	li	s3,1
    4f78:	1460ff9f 	bnez	v1,4df8 <_SDIO_HandleHcdEvent+0x570>
    4f7c:	ae020008 	sw	v0,8(s0)
    4f80:	8ec20008 	lw	v0,8(s6)
    4f84:	00551024 	and	v0,v0,s5
    4f88:	10400051 	beqz	v0,50d0 <_SDIO_HandleHcdEvent+0x848>
    4f8c:	34028000 	li	v0,0x8000
    4f90:	c204000c 	ll	a0,12(s0)
    4f94:	00821825 	or	v1,a0,v0
    4f98:	00621826 	xor	v1,v1,v0
    4f9c:	e203000c 	sc	v1,12(s0)
    4fa0:	10600292 	beqz	v1,59ec <CardDetectHelperFunction+0x2b0>
    4fa4:	00821824 	and	v1,a0,v0
    4fa8:	0800138b 	j	4e2c <_SDIO_HandleHcdEvent+0x5a4>
			4fa8: R_MIPS_26	.text
    4fac:	00000000 	nop
    4fb0:	40026000 	mfc0	v0,c0_status
    4fb4:	3441001f 	ori	at,v0,0x1f
    4fb8:	3821001f 	xori	at,at,0x1f
    4fbc:	40816000 	mtc0	at,c0_status
    4fc0:	00000040 	ssnop
    4fc4:	00000040 	ssnop
    4fc8:	00000040 	ssnop
    4fcc:	000000c0 	sll	zero,zero,0x3
    4fd0:	8e04000c 	lw	a0,12(s0)
    4fd4:	8e03000c 	lw	v1,12(s0)
    4fd8:	00771824 	and	v1,v1,s7
    4fdc:	ae03000c 	sw	v1,12(s0)
    4fe0:	40016000 	mfc0	at,c0_status
    4fe4:	30420001 	andi	v0,v0,0x1
    4fe8:	3421001f 	ori	at,at,0x1f
    4fec:	3821001f 	xori	at,at,0x1f
    4ff0:	00411025 	or	v0,v0,at
    4ff4:	40826000 	mtc0	v0,c0_status
    4ff8:	00000040 	ssnop
    4ffc:	00000040 	ssnop
    5000:	00000040 	ssnop
    5004:	000000c0 	sll	zero,zero,0x3
    5008:	08001388 	j	4e20 <_SDIO_HandleHcdEvent+0x598>
			5008: R_MIPS_26	.text
    500c:	00000000 	nop
    5010:	40036000 	mfc0	v1,c0_status
    5014:	3461001f 	ori	at,v1,0x1f
    5018:	3821001f 	xori	at,at,0x1f
    501c:	40816000 	mtc0	at,c0_status
    5020:	00000040 	ssnop
    5024:	00000040 	ssnop
    5028:	00000040 	ssnop
    502c:	000000c0 	sll	zero,zero,0x3
    5030:	8e2200cc 	lw	v0,204(s1)
    5034:	24420001 	addiu	v0,v0,1
    5038:	ae2200cc 	sw	v0,204(s1)
    503c:	40016000 	mfc0	at,c0_status
    5040:	30630001 	andi	v1,v1,0x1
    5044:	3421001f 	ori	at,at,0x1f
    5048:	3821001f 	xori	at,at,0x1f
    504c:	00611825 	or	v1,v1,at
    5050:	40836000 	mtc0	v1,c0_status
    5054:	00000040 	ssnop
    5058:	00000040 	ssnop
    505c:	00000040 	ssnop
    5060:	000000c0 	sll	zero,zero,0x3
    5064:	08001398 	j	4e60 <_SDIO_HandleHcdEvent+0x5d8>
			5064: R_MIPS_26	.text
    5068:	00000000 	nop
    506c:	40046000 	mfc0	a0,c0_status
    5070:	3481001f 	ori	at,a0,0x1f
    5074:	3821001f 	xori	at,at,0x1f
    5078:	40816000 	mtc0	at,c0_status
    507c:	00000040 	ssnop
    5080:	00000040 	ssnop
    5084:	00000040 	ssnop
    5088:	000000c0 	sll	zero,zero,0x3
    508c:	8e430090 	lw	v1,144(s2)
    5090:	8e420090 	lw	v0,144(s2)
    5094:	2403fffe 	li	v1,-2
    5098:	00431024 	and	v0,v0,v1
    509c:	ae420090 	sw	v0,144(s2)
    50a0:	40016000 	mfc0	at,c0_status
    50a4:	30840001 	andi	a0,a0,0x1
    50a8:	3421001f 	ori	at,at,0x1f
    50ac:	3821001f 	xori	at,at,0x1f
    50b0:	00812025 	or	a0,a0,at
    50b4:	40846000 	mtc0	a0,c0_status
    50b8:	00000040 	ssnop
    50bc:	00000040 	ssnop
    50c0:	00000040 	ssnop
    50c4:	000000c0 	sll	zero,zero,0x3
    50c8:	080013ae 	j	4eb8 <_SDIO_HandleHcdEvent+0x630>
			50c8: R_MIPS_26	.text
    50cc:	00000000 	nop
    50d0:	40026000 	mfc0	v0,c0_status
    50d4:	3441001f 	ori	at,v0,0x1f
    50d8:	3821001f 	xori	at,at,0x1f
    50dc:	40816000 	mtc0	at,c0_status
    50e0:	00000040 	ssnop
    50e4:	00000040 	ssnop
    50e8:	00000040 	ssnop
    50ec:	000000c0 	sll	zero,zero,0x3
    50f0:	8e04000c 	lw	a0,12(s0)
    50f4:	8e03000c 	lw	v1,12(s0)
    50f8:	00771824 	and	v1,v1,s7
    50fc:	ae03000c 	sw	v1,12(s0)
    5100:	40016000 	mfc0	at,c0_status
    5104:	30420001 	andi	v0,v0,0x1
    5108:	3421001f 	ori	at,at,0x1f
    510c:	3821001f 	xori	at,at,0x1f
    5110:	00411025 	or	v0,v0,at
    5114:	40826000 	mtc0	v0,c0_status
    5118:	00000040 	ssnop
    511c:	00000040 	ssnop
    5120:	00000040 	ssnop
    5124:	000000c0 	sll	zero,zero,0x3
    5128:	0800138b 	j	4e2c <_SDIO_HandleHcdEvent+0x5a4>
			5128: R_MIPS_26	.text
    512c:	00000000 	nop
    5130:	40036000 	mfc0	v1,c0_status
    5134:	3461001f 	ori	at,v1,0x1f
    5138:	3821001f 	xori	at,at,0x1f
    513c:	40816000 	mtc0	at,c0_status
    5140:	00000040 	ssnop
    5144:	00000040 	ssnop
    5148:	00000040 	ssnop
    514c:	000000c0 	sll	zero,zero,0x3
    5150:	8e220078 	lw	v0,120(s1)
    5154:	24420001 	addiu	v0,v0,1
    5158:	ae220078 	sw	v0,120(s1)
    515c:	40016000 	mfc0	at,c0_status
    5160:	30630001 	andi	v1,v1,0x1
    5164:	3421001f 	ori	at,at,0x1f
    5168:	3821001f 	xori	at,at,0x1f
    516c:	00611825 	or	v1,v1,at
    5170:	40836000 	mtc0	v1,c0_status
    5174:	00000040 	ssnop
    5178:	00000040 	ssnop
    517c:	00000040 	ssnop
    5180:	000000c0 	sll	zero,zero,0x3
    5184:	08001260 	j	4980 <_SDIO_HandleHcdEvent+0xf8>
			5184: R_MIPS_26	.text
    5188:	00000000 	nop
    518c:	8e110044 	lw	s1,68(s0)
    5190:	24130001 	li	s3,1
    5194:	0800129c 	j	4a70 <_SDIO_HandleHcdEvent+0x1e8>
			5194: R_MIPS_26	.text
    5198:	ae020040 	sw	v0,64(s0)
    519c:	92420000 	lbu	v0,0(s2)
    51a0:	3042000f 	andi	v0,v0,0xf
    51a4:	28420006 	slti	v0,v0,6
    51a8:	1040fed0 	beqz	v0,4cec <_SDIO_HandleHcdEvent+0x464>
    51ac:	00000000 	nop
    51b0:	3c020000 	lui	v0,0x0
			51b0: R_MIPS_HI16	cpu_data
    51b4:	8c430008 	lw	v1,8(v0)
			51b4: R_MIPS_LO16	cpu_data
    51b8:	3c040001 	lui	a0,0x1
    51bc:	00641824 	and	v1,v1,a0
    51c0:	106000ad 	beqz	v1,5478 <_SDIO_HandleHcdEvent+0xbf0>
    51c4:	24020001 	li	v0,1
    51c8:	c2430090 	ll	v1,144(s2)
    51cc:	00622025 	or	a0,v1,v0
    51d0:	e2440090 	sc	a0,144(s2)
    51d4:	10800207 	beqz	a0,59f4 <CardDetectHelperFunction+0x2b8>
    51d8:	00622024 	and	a0,v1,v0
    51dc:	1080fec3 	beqz	a0,4cec <_SDIO_HandleHcdEvent+0x464>
    51e0:	00000000 	nop
    51e4:	8e430044 	lw	v1,68(s2)
    51e8:	8c620008 	lw	v0,8(v1)
    51ec:	34420100 	ori	v0,v0,0x100
    51f0:	0800133b 	j	4cec <_SDIO_HandleHcdEvent+0x464>
			51f0: R_MIPS_26	.text
    51f4:	ac620008 	sw	v0,8(v1)
    51f8:	40046000 	mfc0	a0,c0_status
    51fc:	3481001f 	ori	at,a0,0x1f
    5200:	3821001f 	xori	at,at,0x1f
    5204:	40816000 	mtc0	at,c0_status
    5208:	00000040 	ssnop
    520c:	00000040 	ssnop
    5210:	00000040 	ssnop
    5214:	000000c0 	sll	zero,zero,0x3
    5218:	8e02000c 	lw	v0,12(s0)
    521c:	8e03000c 	lw	v1,12(s0)
    5220:	3c02ffff 	lui	v0,0xffff
    5224:	34427fff 	ori	v0,v0,0x7fff
    5228:	00621824 	and	v1,v1,v0
    522c:	ae03000c 	sw	v1,12(s0)
    5230:	40016000 	mfc0	at,c0_status
    5234:	30840001 	andi	a0,a0,0x1
    5238:	3421001f 	ori	at,at,0x1f
    523c:	3821001f 	xori	at,at,0x1f
    5240:	00812025 	or	a0,a0,at
    5244:	40846000 	mtc0	a0,c0_status
    5248:	00000040 	ssnop
    524c:	00000040 	ssnop
    5250:	00000040 	ssnop
    5254:	000000c0 	sll	zero,zero,0x3
    5258:	080012ae 	j	4ab8 <_SDIO_HandleHcdEvent+0x230>
			5258: R_MIPS_26	.text
    525c:	00000000 	nop
    5260:	24420000 	addiu	v0,v0,0
			5260: R_MIPS_LO16	preempt_schedule
    5264:	0040f809 	jalr	v0
    5268:	00000000 	nop
    526c:	08001371 	j	4dc4 <_SDIO_HandleHcdEvent+0x53c>
			526c: R_MIPS_26	.text
    5270:	00000000 	nop
    5274:	24420000 	addiu	v0,v0,0
			5274: R_MIPS_LO16	preempt_schedule
    5278:	0040f809 	jalr	v0
    527c:	00000000 	nop
    5280:	0800132d 	j	4cb4 <_SDIO_HandleHcdEvent+0x42c>
			5280: R_MIPS_26	.text
    5284:	00000000 	nop
    5288:	24420000 	addiu	v0,v0,0
			5288: R_MIPS_LO16	__up
    528c:	0040f809 	jalr	v0
    5290:	00a02021 	move	a0,a1
    5294:	08001233 	j	48cc <_SDIO_HandleHcdEvent+0x44>
			5294: R_MIPS_26	.text
    5298:	00008021 	move	s0,zero
    529c:	24420000 	addiu	v0,v0,0
			529c: R_MIPS_LO16	preempt_schedule
    52a0:	0040f809 	jalr	v0
    52a4:	00008821 	move	s1,zero
    52a8:	080012f7 	j	4bdc <_SDIO_HandleHcdEvent+0x354>
			52a8: R_MIPS_26	.text
    52ac:	00002021 	move	a0,zero
    52b0:	8e420044 	lw	v0,68(s2)
    52b4:	1440fe6e 	bnez	v0,4c70 <_SDIO_HandleHcdEvent+0x3e8>
    52b8:	26420038 	addiu	v0,s2,56
    52bc:	8c450004 	lw	a1,4(v0)
    52c0:	104500aa 	beq	v0,a1,556c <_SDIO_HandleHcdEvent+0xce4>
    52c4:	00000000 	nop
    52c8:	8ca20004 	lw	v0,4(a1)
    52cc:	8ca30000 	lw	v1,0(a1)
    52d0:	00a08821 	move	s1,a1
    52d4:	ac430000 	sw	v1,0(v0)
    52d8:	8ca40000 	lw	a0,0(a1)
    52dc:	aca50000 	sw	a1,0(a1)
    52e0:	ac820004 	sw	v0,4(a0)
    52e4:	0800130c 	j	4c30 <_SDIO_HandleHcdEvent+0x3a8>
			52e4: R_MIPS_26	.text
    52e8:	aca50004 	sw	a1,4(a1)
    52ec:	24420000 	addiu	v0,v0,0
			52ec: R_MIPS_LO16	Do_OS_IncHcdReference
    52f0:	0040f809 	jalr	v0
    52f4:	00000000 	nop
    52f8:	0441fd8c 	bgez	v0,492c <_SDIO_HandleHcdEvent+0xa4>
    52fc:	00408021 	move	s0,v0
    5300:	08001234 	j	48d0 <_SDIO_HandleHcdEvent+0x48>
			5300: R_MIPS_26	.text
    5304:	02001021 	move	v0,s0
    5308:	1240fd71 	beqz	s2,48d0 <_SDIO_HandleHcdEvent+0x48>
    530c:	02001021 	move	v0,s0
    5310:	92420000 	lbu	v0,0(s2)
    5314:	3042000f 	andi	v0,v0,0xf
    5318:	28420003 	slti	v0,v0,3
    531c:	1440fd6b 	bnez	v0,48cc <_SDIO_HandleHcdEvent+0x44>
    5320:	3c020000 	lui	v0,0x0
			5320: R_MIPS_HI16	Do_OS_DecHcdReference
    5324:	24420000 	addiu	v0,v0,0
			5324: R_MIPS_LO16	Do_OS_DecHcdReference
    5328:	0040f809 	jalr	v0
    532c:	02402021 	move	a0,s2
    5330:	08001234 	j	48d0 <_SDIO_HandleHcdEvent+0x48>
			5330: R_MIPS_26	.text
    5334:	02001021 	move	v0,s0
    5338:	26820000 	addiu	v0,s4,0
			5338: R_MIPS_LO16	cpu_data
    533c:	8c430008 	lw	v1,8(v0)
    5340:	3c040001 	lui	a0,0x1
    5344:	00641824 	and	v1,v1,a0
    5348:	10600032 	beqz	v1,5414 <_SDIO_HandleHcdEvent+0xb8c>
    534c:	24020001 	li	v0,1
    5350:	c2440090 	ll	a0,144(s2)
    5354:	00821825 	or	v1,a0,v0
    5358:	00621826 	xor	v1,v1,v0
    535c:	e2430090 	sc	v1,144(s2)
    5360:	106001a6 	beqz	v1,59fc <CardDetectHelperFunction+0x2c0>
    5364:	00821824 	and	v1,a0,v0
    5368:	00002021 	move	a0,zero
    536c:	080012f7 	j	4bdc <_SDIO_HandleHcdEvent+0x354>
			536c: R_MIPS_26	.text
    5370:	00008821 	move	s1,zero
    5374:	40036000 	mfc0	v1,c0_status
    5378:	3461001f 	ori	at,v1,0x1f
    537c:	3821001f 	xori	at,at,0x1f
    5380:	40816000 	mtc0	at,c0_status
    5384:	00000040 	ssnop
    5388:	00000040 	ssnop
    538c:	00000040 	ssnop
    5390:	000000c0 	sll	zero,zero,0x3
    5394:	8e2200cc 	lw	v0,204(s1)
    5398:	24420001 	addiu	v0,v0,1
    539c:	ae2200cc 	sw	v0,204(s1)
    53a0:	40016000 	mfc0	at,c0_status
    53a4:	30630001 	andi	v1,v1,0x1
    53a8:	3421001f 	ori	at,at,0x1f
    53ac:	3821001f 	xori	at,at,0x1f
    53b0:	00611825 	or	v1,v1,at
    53b4:	40836000 	mtc0	v1,c0_status
    53b8:	00000040 	ssnop
    53bc:	00000040 	ssnop
    53c0:	00000040 	ssnop
    53c4:	000000c0 	sll	zero,zero,0x3
    53c8:	080012c0 	j	4b00 <_SDIO_HandleHcdEvent+0x278>
			53c8: R_MIPS_26	.text
    53cc:	00000000 	nop
    53d0:	08001233 	j	48cc <_SDIO_HandleHcdEvent+0x44>
			53d0: R_MIPS_26	.text
    53d4:	2410ffff 	li	s0,-1
    53d8:	3c140000 	lui	s4,0x0
			53d8: R_MIPS_HI16	cpu_data
    53dc:	26820000 	addiu	v0,s4,0
			53dc: R_MIPS_LO16	cpu_data
    53e0:	8c430008 	lw	v1,8(v0)
    53e4:	3c040001 	lui	a0,0x1
    53e8:	00641824 	and	v1,v1,a0
    53ec:	10600040 	beqz	v1,54f0 <_SDIO_HandleHcdEvent+0xc68>
    53f0:	34028000 	li	v0,0x8000
    53f4:	c204000c 	ll	a0,12(s0)
    53f8:	00821825 	or	v1,a0,v0
    53fc:	00621826 	xor	v1,v1,v0
    5400:	e203000c 	sc	v1,12(s0)
    5404:	1060017f 	beqz	v1,5a04 <CardDetectHelperFunction+0x2c8>
    5408:	00821824 	and	v1,a0,v0
    540c:	080012b1 	j	4ac4 <_SDIO_HandleHcdEvent+0x23c>
			540c: R_MIPS_26	.text
    5410:	00000000 	nop
    5414:	40046000 	mfc0	a0,c0_status
    5418:	3481001f 	ori	at,a0,0x1f
    541c:	3821001f 	xori	at,at,0x1f
    5420:	40816000 	mtc0	at,c0_status
    5424:	00000040 	ssnop
    5428:	00000040 	ssnop
    542c:	00000040 	ssnop
    5430:	000000c0 	sll	zero,zero,0x3
    5434:	8e430090 	lw	v1,144(s2)
    5438:	8e420090 	lw	v0,144(s2)
    543c:	2403fffe 	li	v1,-2
    5440:	00431024 	and	v0,v0,v1
    5444:	ae420090 	sw	v0,144(s2)
    5448:	40016000 	mfc0	at,c0_status
    544c:	30840001 	andi	a0,a0,0x1
    5450:	3421001f 	ori	at,at,0x1f
    5454:	3821001f 	xori	at,at,0x1f
    5458:	00812025 	or	a0,a0,at
    545c:	40846000 	mtc0	a0,c0_status
    5460:	00000040 	ssnop
    5464:	00000040 	ssnop
    5468:	00000040 	ssnop
    546c:	000000c0 	sll	zero,zero,0x3
    5470:	080014da 	j	5368 <_SDIO_HandleHcdEvent+0xae0>
			5470: R_MIPS_26	.text
    5474:	00000000 	nop
    5478:	40026000 	mfc0	v0,c0_status
    547c:	3441001f 	ori	at,v0,0x1f
    5480:	3821001f 	xori	at,at,0x1f
    5484:	40816000 	mtc0	at,c0_status
    5488:	00000040 	ssnop
    548c:	00000040 	ssnop
    5490:	00000040 	ssnop
    5494:	000000c0 	sll	zero,zero,0x3
    5498:	8e440090 	lw	a0,144(s2)
    549c:	8e430090 	lw	v1,144(s2)
    54a0:	30840001 	andi	a0,a0,0x1
    54a4:	34630001 	ori	v1,v1,0x1
    54a8:	ae430090 	sw	v1,144(s2)
    54ac:	40016000 	mfc0	at,c0_status
    54b0:	30420001 	andi	v0,v0,0x1
    54b4:	3421001f 	ori	at,at,0x1f
    54b8:	3821001f 	xori	at,at,0x1f
    54bc:	00411025 	or	v0,v0,at
    54c0:	40826000 	mtc0	v0,c0_status
    54c4:	00000040 	ssnop
    54c8:	00000040 	ssnop
    54cc:	00000040 	ssnop
    54d0:	000000c0 	sll	zero,zero,0x3
    54d4:	08001477 	j	51dc <_SDIO_HandleHcdEvent+0x954>
			54d4: R_MIPS_26	.text
    54d8:	00000000 	nop
    54dc:	24420000 	addiu	v0,v0,0
			54dc: R_MIPS_LO16	__up
    54e0:	0040f809 	jalr	v0
    54e4:	00000000 	nop
    54e8:	0800139b 	j	4e6c <_SDIO_HandleHcdEvent+0x5e4>
			54e8: R_MIPS_26	.text
    54ec:	92420000 	lbu	v0,0(s2)
    54f0:	40046000 	mfc0	a0,c0_status
    54f4:	3481001f 	ori	at,a0,0x1f
    54f8:	3821001f 	xori	at,at,0x1f
    54fc:	40816000 	mtc0	at,c0_status
    5500:	00000040 	ssnop
    5504:	00000040 	ssnop
    5508:	00000040 	ssnop
    550c:	000000c0 	sll	zero,zero,0x3
    5510:	8e02000c 	lw	v0,12(s0)
    5514:	8e03000c 	lw	v1,12(s0)
    5518:	3c02ffff 	lui	v0,0xffff
    551c:	34427fff 	ori	v0,v0,0x7fff
    5520:	00621824 	and	v1,v1,v0
    5524:	ae03000c 	sw	v1,12(s0)
    5528:	40016000 	mfc0	at,c0_status
    552c:	30840001 	andi	a0,a0,0x1
    5530:	3421001f 	ori	at,at,0x1f
    5534:	3821001f 	xori	at,at,0x1f
    5538:	00812025 	or	a0,a0,at
    553c:	40846000 	mtc0	a0,c0_status
    5540:	00000040 	ssnop
    5544:	00000040 	ssnop
    5548:	00000040 	ssnop
    554c:	000000c0 	sll	zero,zero,0x3
    5550:	080012b1 	j	4ac4 <_SDIO_HandleHcdEvent+0x23c>
			5550: R_MIPS_26	.text
    5554:	00000000 	nop
    5558:	24420000 	addiu	v0,v0,0
			5558: R_MIPS_LO16	preempt_schedule
    555c:	0040f809 	jalr	v0
    5560:	00000000 	nop
    5564:	08001290 	j	4a40 <_SDIO_HandleHcdEvent+0x1b8>
			5564: R_MIPS_26	.text
    5568:	8e030040 	lw	v1,64(s0)
    556c:	0800131c 	j	4c70 <_SDIO_HandleHcdEvent+0x3e8>
			556c: R_MIPS_26	.text
    5570:	a2400040 	sb	zero,64(s2)
    5574:	24420000 	addiu	v0,v0,0
			5574: R_MIPS_LO16	__up
    5578:	0040f809 	jalr	v0
    557c:	00a02021 	move	a0,a1
    5580:	080012c3 	j	4b0c <_SDIO_HandleHcdEvent+0x284>
			5580: R_MIPS_26	.text
    5584:	3c020000 	lui	v0,0x0
			5584: R_MIPS_HI16	pBusContext

00005588 <DeviceAttach>:
    5588:	27bdffe0 	addiu	sp,sp,-32
    558c:	afb10014 	sw	s1,20(sp)
    5590:	afbf0018 	sw	ra,24(sp)
    5594:	00808821 	move	s1,a0
    5598:	afb00010 	sw	s0,16(sp)
    559c:	9622004a 	lhu	v0,74(s1)
    55a0:	24060010 	li	a2,16
    55a4:	3042000f 	andi	v0,v0,0xf
    55a8:	00002821 	move	a1,zero
    55ac:	24840048 	addiu	a0,a0,72
    55b0:	10400007 	beqz	v0,55d0 <DeviceAttach+0x48>
    55b4:	2403ffff 	li	v1,-1
    55b8:	8fbf0018 	lw	ra,24(sp)
    55bc:	8fb10014 	lw	s1,20(sp)
    55c0:	8fb00010 	lw	s0,16(sp)
    55c4:	00601021 	move	v0,v1
    55c8:	03e00008 	jr	ra
    55cc:	27bd0020 	addiu	sp,sp,32
    55d0:	3c020000 	lui	v0,0x0
			55d0: R_MIPS_HI16	memset
    55d4:	24420000 	addiu	v0,v0,0
			55d4: R_MIPS_LO16	memset
    55d8:	0040f809 	jalr	v0
    55dc:	00000000 	nop
    55e0:	8e23001c 	lw	v1,28(s1)
    55e4:	96240014 	lhu	a0,20(s1)
    55e8:	96250016 	lhu	a1,22(s1)
    55ec:	24020008 	li	v0,8
    55f0:	a622004a 	sh	v0,74(s1)
    55f4:	3c020000 	lui	v0,0x0
			55f4: R_MIPS_HI16	AllocateDevice
    55f8:	ae23004c 	sw	v1,76(s1)
    55fc:	a6240050 	sh	a0,80(s1)
    5600:	a6250052 	sh	a1,82(s1)
    5604:	02202021 	move	a0,s1
    5608:	24420000 	addiu	v0,v0,0
			5608: R_MIPS_LO16	AllocateDevice
    560c:	0040f809 	jalr	v0
    5610:	a2200048 	sb	zero,72(s1)
    5614:	00408021 	move	s0,v0
    5618:	00402021 	move	a0,v0
    561c:	1040ffe6 	beqz	v0,55b8 <DeviceAttach+0x30>
    5620:	00001821 	move	v1,zero
    5624:	24020001 	li	v0,1
    5628:	a202003a 	sb	v0,58(s0)
    562c:	3c020000 	lui	v0,0x0
			562c: R_MIPS_HI16	AddDeviceToList
    5630:	24420000 	addiu	v0,v0,0
			5630: R_MIPS_LO16	AddDeviceToList
    5634:	0040f809 	jalr	v0
    5638:	00000000 	nop
    563c:	3c020000 	lui	v0,0x0
			563c: R_MIPS_HI16	ProbeForFunction
    5640:	02002021 	move	a0,s0
    5644:	24420000 	addiu	v0,v0,0
			5644: R_MIPS_LO16	ProbeForFunction
    5648:	0040f809 	jalr	v0
    564c:	02202821 	move	a1,s1
    5650:	00001821 	move	v1,zero
    5654:	8fbf0018 	lw	ra,24(sp)
    5658:	8fb10014 	lw	s1,20(sp)
    565c:	8fb00010 	lw	s0,16(sp)
    5660:	00601021 	move	v0,v1
    5664:	03e00008 	jr	ra
    5668:	27bd0020 	addiu	sp,sp,32

0000566c <DeviceDetach>:
    566c:	27bdffd0 	addiu	sp,sp,-48
    5670:	afb20028 	sw	s2,40(sp)
    5674:	3c020000 	lui	v0,0x0
			5674: R_MIPS_HI16	memset
    5678:	27b20010 	addiu	s2,sp,16
    567c:	00002821 	move	a1,zero
    5680:	24060001 	li	a2,1
    5684:	afb10024 	sw	s1,36(sp)
    5688:	afb00020 	sw	s0,32(sp)
    568c:	24510000 	addiu	s1,v0,0
			568c: R_MIPS_LO16	memset
    5690:	00808021 	move	s0,a0
    5694:	afbf002c 	sw	ra,44(sp)
    5698:	0220f809 	jalr	s1
    569c:	02402021 	move	a0,s2
    56a0:	3c020000 	lui	v0,0x0
			56a0: R_MIPS_HI16	RemoveHcdFunctions
    56a4:	24420000 	addiu	v0,v0,0
			56a4: R_MIPS_LO16	RemoveHcdFunctions
    56a8:	0040f809 	jalr	v0
    56ac:	02002021 	move	a0,s0
    56b0:	3c020000 	lui	v0,0x0
			56b0: R_MIPS_HI16	DeleteDevices
    56b4:	24420000 	addiu	v0,v0,0
			56b4: R_MIPS_LO16	DeleteDevices
    56b8:	0040f809 	jalr	v0
    56bc:	02002021 	move	a0,s0
    56c0:	92030086 	lbu	v1,134(s0)
    56c4:	02002021 	move	a0,s0
    56c8:	10600009 	beqz	v1,56f0 <DeviceDetach+0x84>
    56cc:	27a50014 	addiu	a1,sp,20
    56d0:	24036002 	li	v1,24578
    56d4:	8e020028 	lw	v0,40(s0)
    56d8:	a7a30014 	sh	v1,20(sp)
    56dc:	24030001 	li	v1,1
    56e0:	afb20018 	sw	s2,24(sp)
    56e4:	afa3001c 	sw	v1,28(sp)
    56e8:	0040f809 	jalr	v0
    56ec:	a3a00010 	sb	zero,16(sp)
    56f0:	26040048 	addiu	a0,s0,72
    56f4:	00002821 	move	a1,zero
    56f8:	0220f809 	jalr	s1
    56fc:	24060010 	li	a2,16
    5700:	8e030080 	lw	v1,128(s0)
    5704:	24020020 	li	v0,32
    5708:	a2000084 	sb	zero,132(s0)
    570c:	a2000085 	sb	zero,133(s0)
    5710:	a2000086 	sb	zero,134(s0)
    5714:	ae000044 	sw	zero,68(s0)
    5718:	ae000088 	sw	zero,136(s0)
    571c:	a4620038 	sh	v0,56(v1)
    5720:	8fbf002c 	lw	ra,44(sp)
    5724:	8fb20028 	lw	s2,40(sp)
    5728:	8fb10024 	lw	s1,36(sp)
    572c:	8fb00020 	lw	s0,32(sp)
    5730:	00001021 	move	v0,zero
    5734:	03e00008 	jr	ra
    5738:	27bd0030 	addiu	sp,sp,48

0000573c <CardDetectHelperFunction>:
    573c:	27bdffb8 	addiu	sp,sp,-72
    5740:	afb50034 	sw	s5,52(sp)
    5744:	3c030000 	lui	v1,0x0
			5744: R_MIPS_HI16	DeviceAttach
    5748:	3c150000 	lui	s5,0x0
			5748: R_MIPS_HI16	SDLIB_GetMessage
    574c:	afbe0040 	sw	s8,64(sp)
    5750:	afb7003c 	sw	s7,60(sp)
    5754:	afb60038 	sw	s6,56(sp)
    5758:	afb40030 	sw	s4,48(sp)
    575c:	afb3002c 	sw	s3,44(sp)
    5760:	afb20028 	sw	s2,40(sp)
    5764:	afb10024 	sw	s1,36(sp)
    5768:	afb00020 	sw	s0,32(sp)
    576c:	247e0000 	addiu	s8,v1,0
			576c: R_MIPS_LO16	DeviceAttach
    5770:	00808021 	move	s0,a0
    5774:	24960008 	addiu	s6,a0,8
    5778:	3c110000 	lui	s1,0x0
			5778: R_MIPS_HI16	cpu_data
    577c:	3c140000 	lui	s4,0x0
			577c: R_MIPS_HI16	pBusContext
    5780:	27b30014 	addiu	s3,sp,20
    5784:	27b20010 	addiu	s2,sp,16
    5788:	26b70000 	addiu	s7,s5,0
			5788: R_MIPS_LO16	SDLIB_GetMessage
    578c:	080015fa 	j	57e8 <CardDetectHelperFunction+0xac>
			578c: R_MIPS_26	.text
    5790:	afbf0044 	sw	ra,68(sp)
    5794:	c2030008 	ll	v1,8(s0)
    5798:	2462ffff 	addiu	v0,v1,-1
    579c:	e2020008 	sc	v0,8(s0)
    57a0:	1040009a 	beqz	v0,5a0c <CardDetectHelperFunction+0x2d0>
    57a4:	00000000 	nop
    57a8:	2462ffff 	addiu	v0,v1,-1
    57ac:	0440002b 	bltz	v0,585c <CardDetectHelperFunction+0x120>
    57b0:	3c020000 	lui	v0,0x0
			57b0: R_MIPS_HI16	__down
    57b4:	92020004 	lbu	v0,4(s0)
    57b8:	1440002f 	bnez	v0,5878 <CardDetectHelperFunction+0x13c>
    57bc:	3c020000 	lui	v0,0x0
			57bc: R_MIPS_HI16	Do_OS_DecHcdReference
    57c0:	8e820000 	lw	v0,0(s4)
			57c0: R_MIPS_LO16	pBusContext
    57c4:	24030008 	li	v1,8
    57c8:	afa30010 	sw	v1,16(sp)
    57cc:	8c440098 	lw	a0,152(v0)
    57d0:	02602821 	move	a1,s3
    57d4:	26a20000 	addiu	v0,s5,0
			57d4: R_MIPS_LO16	SDLIB_GetMessage
    57d8:	0040f809 	jalr	v0
    57dc:	02403021 	move	a2,s2
    57e0:	0441004f 	bgez	v0,5920 <CardDetectHelperFunction+0x1e4>
    57e4:	93a30014 	lbu	v1,20(sp)
    57e8:	26220000 	addiu	v0,s1,0
			57e8: R_MIPS_LO16	cpu_data
    57ec:	8c430008 	lw	v1,8(v0)
    57f0:	3c040001 	lui	a0,0x1
    57f4:	00641824 	and	v1,v1,a0
    57f8:	1460ffe6 	bnez	v1,5794 <CardDetectHelperFunction+0x58>
    57fc:	00000000 	nop
    5800:	40036000 	mfc0	v1,c0_status
    5804:	3461001f 	ori	at,v1,0x1f
    5808:	3821001f 	xori	at,at,0x1f
    580c:	40816000 	mtc0	at,c0_status
    5810:	00000040 	ssnop
    5814:	00000040 	ssnop
    5818:	00000040 	ssnop
    581c:	000000c0 	sll	zero,zero,0x3
    5820:	8e020008 	lw	v0,8(s0)
    5824:	2442ffff 	addiu	v0,v0,-1
    5828:	ae020008 	sw	v0,8(s0)
    582c:	40016000 	mfc0	at,c0_status
    5830:	30630001 	andi	v1,v1,0x1
    5834:	3421001f 	ori	at,at,0x1f
    5838:	3821001f 	xori	at,at,0x1f
    583c:	00611825 	or	v1,v1,at
    5840:	40836000 	mtc0	v1,c0_status
    5844:	00000040 	ssnop
    5848:	00000040 	ssnop
    584c:	00000040 	ssnop
    5850:	000000c0 	sll	zero,zero,0x3
    5854:	0441ffd7 	bgez	v0,57b4 <CardDetectHelperFunction+0x78>
    5858:	3c020000 	lui	v0,0x0
			5858: R_MIPS_HI16	__down
    585c:	24420000 	addiu	v0,v0,0
			585c: R_MIPS_LO16	__down
    5860:	0040f809 	jalr	v0
    5864:	02c02021 	move	a0,s6
    5868:	92020004 	lbu	v0,4(s0)
    586c:	1040ffd5 	beqz	v0,57c4 <CardDetectHelperFunction+0x88>
    5870:	8e820000 	lw	v0,0(s4)
			5870: R_MIPS_LO16	pBusContext
    5874:	3c020000 	lui	v0,0x0
			5874: R_MIPS_HI16	Do_OS_DecHcdReference
    5878:	02e08821 	move	s1,s7
    587c:	24550000 	addiu	s5,v0,0
			587c: R_MIPS_LO16	Do_OS_DecHcdReference
    5880:	24100008 	li	s0,8
    5884:	8e820000 	lw	v0,0(s4)
			5884: R_MIPS_LO16	pBusContext
    5888:	afb00010 	sw	s0,16(sp)
    588c:	8c440098 	lw	a0,152(v0)
    5890:	02602821 	move	a1,s3
    5894:	0220f809 	jalr	s1
    5898:	02403021 	move	a2,s2
    589c:	04400014 	bltz	v0,58f0 <CardDetectHelperFunction+0x1b4>
    58a0:	8fbf0044 	lw	ra,68(sp)
    58a4:	8fa40018 	lw	a0,24(sp)
    58a8:	1080fff7 	beqz	a0,5888 <CardDetectHelperFunction+0x14c>
    58ac:	8e820000 	lw	v0,0(s4)
			58ac: R_MIPS_LO16	pBusContext
    58b0:	90820000 	lbu	v0,0(a0)
    58b4:	3042000f 	andi	v0,v0,0xf
    58b8:	28420003 	slti	v0,v0,3
    58bc:	1440fff2 	bnez	v0,5888 <CardDetectHelperFunction+0x14c>
    58c0:	8e820000 	lw	v0,0(s4)
			58c0: R_MIPS_LO16	pBusContext
    58c4:	02a0f809 	jalr	s5
    58c8:	00000000 	nop
    58cc:	8e820000 	lw	v0,0(s4)
			58cc: R_MIPS_LO16	pBusContext
    58d0:	afb00010 	sw	s0,16(sp)
    58d4:	8c440098 	lw	a0,152(v0)
    58d8:	02602821 	move	a1,s3
    58dc:	0220f809 	jalr	s1
    58e0:	02403021 	move	a2,s2
    58e4:	0441fff0 	bgez	v0,58a8 <CardDetectHelperFunction+0x16c>
    58e8:	8fa40018 	lw	a0,24(sp)
    58ec:	8fbf0044 	lw	ra,68(sp)
    58f0:	8fbe0040 	lw	s8,64(sp)
    58f4:	8fb7003c 	lw	s7,60(sp)
    58f8:	8fb60038 	lw	s6,56(sp)
    58fc:	8fb50034 	lw	s5,52(sp)
    5900:	8fb40030 	lw	s4,48(sp)
    5904:	8fb3002c 	lw	s3,44(sp)
    5908:	8fb20028 	lw	s2,40(sp)
    590c:	8fb10024 	lw	s1,36(sp)
    5910:	8fb00020 	lw	s0,32(sp)
    5914:	00001021 	move	v0,zero
    5918:	03e00008 	jr	ra
    591c:	27bd0048 	addiu	sp,sp,72
    5920:	24020001 	li	v0,1
    5924:	10620010 	beq	v1,v0,5968 <CardDetectHelperFunction+0x22c>
    5928:	24020002 	li	v0,2
    592c:	10620012 	beq	v1,v0,5978 <CardDetectHelperFunction+0x23c>
    5930:	3c030000 	lui	v1,0x0
			5930: R_MIPS_HI16	DeviceDetach
    5934:	8fa40018 	lw	a0,24(sp)
    5938:	1080ffa2 	beqz	a0,57c4 <CardDetectHelperFunction+0x88>
    593c:	8e820000 	lw	v0,0(s4)
			593c: R_MIPS_LO16	pBusContext
    5940:	90820000 	lbu	v0,0(a0)
    5944:	3042000f 	andi	v0,v0,0xf
    5948:	28420003 	slti	v0,v0,3
    594c:	1440ff9c 	bnez	v0,57c0 <CardDetectHelperFunction+0x84>
    5950:	3c020000 	lui	v0,0x0
			5950: R_MIPS_HI16	Do_OS_DecHcdReference
    5954:	24420000 	addiu	v0,v0,0
			5954: R_MIPS_LO16	Do_OS_DecHcdReference
    5958:	0040f809 	jalr	v0
    595c:	00000000 	nop
    5960:	080015f1 	j	57c4 <CardDetectHelperFunction+0x88>
			5960: R_MIPS_26	.text
    5964:	8e820000 	lw	v0,0(s4)
			5964: R_MIPS_LO16	pBusContext
    5968:	03c0f809 	jalr	s8
    596c:	8fa40018 	lw	a0,24(sp)
    5970:	0800164e 	j	5938 <CardDetectHelperFunction+0x1fc>
			5970: R_MIPS_26	.text
    5974:	8fa40018 	lw	a0,24(sp)
    5978:	24630000 	addiu	v1,v1,0
			5978: R_MIPS_LO16	DeviceDetach
    597c:	0060f809 	jalr	v1
    5980:	8fa40018 	lw	a0,24(sp)
    5984:	0800164e 	j	5938 <CardDetectHelperFunction+0x1fc>
			5984: R_MIPS_26	.text
    5988:	8fa40018 	lw	a0,24(sp)
    598c:	1000f99f 	b	400c <SDIOIrqHelperFunction+0x5c>
    5990:	00000000 	nop
    5994:	1000f9af 	b	4054 <SDIOIrqHelperFunction+0xa4>
    5998:	00000000 	nop
    599c:	1000f9e0 	b	4120 <SDIOIrqHelperFunction+0x170>
    59a0:	00000000 	nop
    59a4:	1000fad8 	b	4508 <DeviceInterrupt+0x1e4>
    59a8:	00000000 	nop
    59ac:	1000fb07 	b	45cc <DeviceInterrupt+0x2a8>
    59b0:	00000000 	nop
    59b4:	1000fb18 	b	4618 <DeviceInterrupt+0x2f4>
    59b8:	00000000 	nop
    59bc:	1000fbea 	b	4968 <_SDIO_HandleHcdEvent+0xe0>
    59c0:	00000000 	nop
    59c4:	1000fc36 	b	4aa0 <_SDIO_HandleHcdEvent+0x218>
    59c8:	00000000 	nop
    59cc:	1000fc46 	b	4ae8 <_SDIO_HandleHcdEvent+0x260>
    59d0:	00000000 	nop
    59d4:	1000fd0c 	b	4e08 <_SDIO_HandleHcdEvent+0x580>
    59d8:	00000000 	nop
    59dc:	1000fd1a 	b	4e48 <_SDIO_HandleHcdEvent+0x5c0>
    59e0:	00000000 	nop
    59e4:	1000fd2e 	b	4ea0 <_SDIO_HandleHcdEvent+0x618>
    59e8:	00000000 	nop
    59ec:	1000fd68 	b	4f90 <_SDIO_HandleHcdEvent+0x708>
    59f0:	00000000 	nop
    59f4:	1000fdf4 	b	51c8 <_SDIO_HandleHcdEvent+0x940>
    59f8:	00000000 	nop
    59fc:	1000fe54 	b	5350 <_SDIO_HandleHcdEvent+0xac8>
    5a00:	00000000 	nop
    5a04:	1000fe7b 	b	53f4 <_SDIO_HandleHcdEvent+0xb6c>
    5a08:	00000000 	nop
    5a0c:	1000ff61 	b	5794 <CardDetectHelperFunction+0x58>
    5a10:	00000000 	nop
	...

00005a20 <_SDIO_BusGetDefaultSettings>:
    5a20:	3c020000 	lui	v0,0x0
			5a20: R_MIPS_HI16	.bss
    5a24:	8c430010 	lw	v1,16(v0)
			5a24: R_MIPS_LO16	.bss
    5a28:	3c020000 	lui	v0,0x0
			5a28: R_MIPS_HI16	.data
    5a2c:	ac830064 	sw	v1,100(a0)
    5a30:	8c430150 	lw	v1,336(v0)
			5a30: R_MIPS_LO16	.data
    5a34:	3c020000 	lui	v0,0x0
			5a34: R_MIPS_HI16	.data
    5a38:	ac83004c 	sw	v1,76(a0)
    5a3c:	8c43014c 	lw	v1,332(v0)
			5a3c: R_MIPS_LO16	.data
    5a40:	3c020000 	lui	v0,0x0
			5a40: R_MIPS_HI16	.data
    5a44:	ac830050 	sw	v1,80(a0)
    5a48:	8c430148 	lw	v1,328(v0)
			5a48: R_MIPS_LO16	.data
    5a4c:	00001021 	move	v0,zero
    5a50:	03e00008 	jr	ra
    5a54:	ac8300a4 	sw	v1,164(a0)

00005a58 <sdio_get_resources>:
    5a58:	03e00008 	jr	ra
    5a5c:	00001021 	move	v0,zero

00005a60 <sdio_set_resources>:
    5a60:	03e00008 	jr	ra
    5a64:	00001021 	move	v0,zero

00005a68 <sdio_disable_resources>:
    5a68:	10800002 	beqz	a0,5a74 <sdio_disable_resources+0xc>
    5a6c:	00000000 	nop
    5a70:	ac80014c 	sw	zero,332(a0)
    5a74:	03e00008 	jr	ra
    5a78:	00001021 	move	v0,zero

00005a7c <release>:
    5a7c:	03e00008 	jr	ra
    5a80:	00000000 	nop

00005a84 <driver_probe>:
    5a84:	8c8200b8 	lw	v0,184(a0)
    5a88:	14400003 	bnez	v0,5a98 <driver_probe+0x14>
    5a8c:	00000000 	nop
    5a90:	03e00008 	jr	ra
    5a94:	2402ffff 	li	v0,-1
    5a98:	8c8400b4 	lw	a0,180(a0)
    5a9c:	8c43000c 	lw	v1,12(v0)
    5aa0:	8c820000 	lw	v0,0(a0)
    5aa4:	90650000 	lbu	a1,0(v1)
    5aa8:	90410000 	lbu	at,0(v0)
    5aac:	24630001 	addiu	v1,v1,1
    5ab0:	14250004 	bne	at,a1,5ac4 <driver_probe+0x40>
    5ab4:	24420001 	addiu	v0,v0,1
    5ab8:	14a0fffb 	bnez	a1,5aa8 <driver_probe+0x24>
    5abc:	90650000 	lbu	a1,0(v1)
    5ac0:	00202821 	move	a1,at
    5ac4:	00a12823 	subu	a1,a1,at
    5ac8:	14a0fff1 	bnez	a1,5a90 <driver_probe+0xc>
    5acc:	24020001 	li	v0,1
    5ad0:	03e00008 	jr	ra
    5ad4:	00000000 	nop

00005ad8 <Do_OS_IncHcdReference>:
    5ad8:	27bdffe8 	addiu	sp,sp,-24
    5adc:	afbf0014 	sw	ra,20(sp)
    5ae0:	afb00010 	sw	s0,16(sp)
    5ae4:	8c8500a4 	lw	a1,164(a0)
    5ae8:	10a0001d 	beqz	a1,5b60 <Do_OS_IncHcdReference+0x88>
    5aec:	00001021 	move	v0,zero
    5af0:	8f820014 	lw	v0,20(gp)
    5af4:	24420001 	addiu	v0,v0,1
    5af8:	af820014 	sw	v0,20(gp)
    5afc:	8ca30000 	lw	v1,0(a1)
    5b00:	24020002 	li	v0,2
    5b04:	10620038 	beq	v1,v0,5be8 <Do_OS_IncHcdReference+0x110>
    5b08:	3c020000 	lui	v0,0x0
			5b08: R_MIPS_HI16	cpu_data
    5b0c:	8c430008 	lw	v1,8(v0)
			5b0c: R_MIPS_LO16	cpu_data
    5b10:	3c040001 	lui	a0,0x1
    5b14:	00641824 	and	v1,v1,a0
    5b18:	10600015 	beqz	v1,5b70 <Do_OS_IncHcdReference+0x98>
    5b1c:	00000000 	nop
    5b20:	c0a20100 	ll	v0,256(a1)
    5b24:	24420001 	addiu	v0,v0,1
    5b28:	e0a20100 	sc	v0,256(a1)
    5b2c:	10400272 	beqz	v0,64f8 <SDIO_BusAddOSDevice+0x2ec>
    5b30:	00000000 	nop
    5b34:	24100001 	li	s0,1
    5b38:	8f830014 	lw	v1,20(gp)
    5b3c:	2463ffff 	addiu	v1,v1,-1
    5b40:	af830014 	sw	v1,20(gp)
    5b44:	8f830008 	lw	v1,8(gp)
    5b48:	30630004 	andi	v1,v1,0x4
    5b4c:	1460001f 	bnez	v1,5bcc <Do_OS_IncHcdReference+0xf4>
    5b50:	3c020000 	lui	v0,0x0
			5b50: R_MIPS_HI16	preempt_schedule
    5b54:	12000002 	beqz	s0,5b60 <Do_OS_IncHcdReference+0x88>
    5b58:	2402ffff 	li	v0,-1
    5b5c:	00001021 	move	v0,zero
    5b60:	8fbf0014 	lw	ra,20(sp)
    5b64:	8fb00010 	lw	s0,16(sp)
    5b68:	03e00008 	jr	ra
    5b6c:	27bd0018 	addiu	sp,sp,24
    5b70:	40036000 	mfc0	v1,c0_status
    5b74:	3461001f 	ori	at,v1,0x1f
    5b78:	3821001f 	xori	at,at,0x1f
    5b7c:	40816000 	mtc0	at,c0_status
    5b80:	00000040 	ssnop
    5b84:	00000040 	ssnop
    5b88:	00000040 	ssnop
    5b8c:	000000c0 	sll	zero,zero,0x3
    5b90:	8ca20100 	lw	v0,256(a1)
    5b94:	24420001 	addiu	v0,v0,1
    5b98:	aca20100 	sw	v0,256(a1)
    5b9c:	40016000 	mfc0	at,c0_status
    5ba0:	30630001 	andi	v1,v1,0x1
    5ba4:	3421001f 	ori	at,at,0x1f
    5ba8:	3821001f 	xori	at,at,0x1f
    5bac:	00611825 	or	v1,v1,at
    5bb0:	40836000 	mtc0	v1,c0_status
    5bb4:	00000040 	ssnop
    5bb8:	00000040 	ssnop
    5bbc:	00000040 	ssnop
    5bc0:	000000c0 	sll	zero,zero,0x3
    5bc4:	080016ce 	j	5b38 <Do_OS_IncHcdReference+0x60>
			5bc4: R_MIPS_26	.text
    5bc8:	24100001 	li	s0,1
    5bcc:	24420000 	addiu	v0,v0,0
			5bcc: R_MIPS_LO16	preempt_schedule
    5bd0:	0040f809 	jalr	v0
    5bd4:	00000000 	nop
    5bd8:	1600ffe0 	bnez	s0,5b5c <Do_OS_IncHcdReference+0x84>
    5bdc:	2402ffff 	li	v0,-1
    5be0:	080016d9 	j	5b64 <Do_OS_IncHcdReference+0x8c>
			5be0: R_MIPS_26	.text
    5be4:	8fbf0014 	lw	ra,20(sp)
    5be8:	080016ce 	j	5b38 <Do_OS_IncHcdReference+0x60>
			5be8: R_MIPS_26	.text
    5bec:	00008021 	move	s0,zero

00005bf0 <UnregisterDriver>:
    5bf0:	27bdffe8 	addiu	sp,sp,-24
    5bf4:	3c020000 	lui	v0,0x0
			5bf4: R_MIPS_HI16	pnp_unregister_driver
    5bf8:	afbf0010 	sw	ra,16(sp)
    5bfc:	24420000 	addiu	v0,v0,0
			5bfc: R_MIPS_LO16	pnp_unregister_driver
    5c00:	0040f809 	jalr	v0
    5c04:	24840034 	addiu	a0,a0,52
    5c08:	8fbf0010 	lw	ra,16(sp)
    5c0c:	00001021 	move	v0,zero
    5c10:	03e00008 	jr	ra
    5c14:	27bd0018 	addiu	sp,sp,24

00005c18 <Do_OS_DecHcdReference>:
    5c18:	27bdffe8 	addiu	sp,sp,-24
    5c1c:	afbf0010 	sw	ra,16(sp)
    5c20:	8c8200a4 	lw	v0,164(a0)
    5c24:	10400005 	beqz	v0,5c3c <Do_OS_DecHcdReference+0x24>
    5c28:	00402021 	move	a0,v0
    5c2c:	3c020000 	lui	v0,0x0
			5c2c: R_MIPS_HI16	module_put
    5c30:	24420000 	addiu	v0,v0,0
			5c30: R_MIPS_LO16	module_put
    5c34:	0040f809 	jalr	v0
    5c38:	00000000 	nop
    5c3c:	8fbf0010 	lw	ra,16(sp)
    5c40:	00001021 	move	v0,zero
    5c44:	03e00008 	jr	ra
    5c48:	27bd0018 	addiu	sp,sp,24

00005c4c <SDIO_HandleHcdEvent>:
    5c4c:	3c190000 	lui	t9,0x0
			5c4c: R_MIPS_HI16	_SDIO_HandleHcdEvent
    5c50:	27390000 	addiu	t9,t9,0
			5c50: R_MIPS_LO16	_SDIO_HandleHcdEvent
    5c54:	03200008 	jr	t9
    5c58:	30a500ff 	andi	a1,a1,0xff

00005c5c <SDIO_UnregisterFunction>:
    5c5c:	27bdffe0 	addiu	sp,sp,-32
    5c60:	3c020000 	lui	v0,0x0
			5c60: R_MIPS_HI16	_SDIO_UnregisterFunction
    5c64:	afbf0018 	sw	ra,24(sp)
    5c68:	afb10014 	sw	s1,20(sp)
    5c6c:	afb00010 	sw	s0,16(sp)
    5c70:	24420000 	addiu	v0,v0,0
			5c70: R_MIPS_LO16	_SDIO_UnregisterFunction
    5c74:	0040f809 	jalr	v0
    5c78:	00808021 	move	s0,a0
    5c7c:	00408821 	move	s1,v0
    5c80:	3c020000 	lui	v0,0x0
			5c80: R_MIPS_HI16	.text
    5c84:	24425bf0 	addiu	v0,v0,23536
			5c84: R_MIPS_LO16	.text
    5c88:	0040f809 	jalr	v0
    5c8c:	02002021 	move	a0,s0
    5c90:	02201021 	move	v0,s1
    5c94:	8fbf0018 	lw	ra,24(sp)
    5c98:	8fb10014 	lw	s1,20(sp)
    5c9c:	8fb00010 	lw	s0,16(sp)
    5ca0:	03e00008 	jr	ra
    5ca4:	27bd0020 	addiu	sp,sp,32

00005ca8 <SDIO_UnregisterHostController>:
    5ca8:	3c190000 	lui	t9,0x0
			5ca8: R_MIPS_HI16	_SDIO_UnregisterHostController
    5cac:	27390000 	addiu	t9,t9,0
			5cac: R_MIPS_LO16	_SDIO_UnregisterHostController
    5cb0:	03200008 	jr	t9
    5cb4:	00000000 	nop

00005cb8 <SDIO_RegisterHostController>:
    5cb8:	3c190000 	lui	t9,0x0
			5cb8: R_MIPS_HI16	_SDIO_RegisterHostController
    5cbc:	27390000 	addiu	t9,t9,0
			5cbc: R_MIPS_LO16	_SDIO_RegisterHostController
    5cc0:	03200008 	jr	t9
    5cc4:	00000000 	nop

00005cc8 <SDIO_RegisterFunction>:
    5cc8:	27bdffe0 	addiu	sp,sp,-32
    5ccc:	afb10014 	sw	s1,20(sp)
    5cd0:	afbf0018 	sw	ra,24(sp)
    5cd4:	afb00010 	sw	s0,16(sp)
    5cd8:	3c030000 	lui	v1,0x0
			5cd8: R_MIPS_HI16	g_Version
    5cdc:	00808821 	move	s1,a0
    5ce0:	90620000 	lbu	v0,0(v1)
			5ce0: R_MIPS_LO16	g_Version
    5ce4:	90840000 	lbu	a0,0(a0)
    5ce8:	00021102 	srl	v0,v0,0x4
    5cec:	00042102 	srl	a0,a0,0x4
    5cf0:	10820008 	beq	a0,v0,5d14 <SDIO_RegisterFunction+0x4c>
    5cf4:	26300034 	addiu	s0,s1,52
    5cf8:	2410fffe 	li	s0,-2
    5cfc:	02001021 	move	v0,s0
    5d00:	8fbf0018 	lw	ra,24(sp)
    5d04:	8fb10014 	lw	s1,20(sp)
    5d08:	8fb00010 	lw	s0,16(sp)
    5d0c:	03e00008 	jr	ra
    5d10:	27bd0020 	addiu	sp,sp,32
    5d14:	3c020000 	lui	v0,0x0
			5d14: R_MIPS_HI16	memset
    5d18:	02002021 	move	a0,s0
    5d1c:	00002821 	move	a1,zero
    5d20:	24420000 	addiu	v0,v0,0
			5d20: R_MIPS_LO16	memset
    5d24:	0040f809 	jalr	v0
    5d28:	24060090 	li	a2,144
    5d2c:	8e23000c 	lw	v1,12(s1)
    5d30:	3c020000 	lui	v0,0x0
			5d30: R_MIPS_HI16	.text
    5d34:	24425a84 	addiu	v0,v0,23172
			5d34: R_MIPS_LO16	.text
    5d38:	ae230034 	sw	v1,52(s1)
    5d3c:	ae220040 	sw	v0,64(s1)
    5d40:	3c030000 	lui	v1,0x0
			5d40: R_MIPS_HI16	.rodata
    5d44:	24020001 	li	v0,1
    5d48:	2463016c 	addiu	v1,v1,364
			5d48: R_MIPS_LO16	.rodata
    5d4c:	ae22003c 	sw	v0,60(s1)
    5d50:	3c020000 	lui	v0,0x0
			5d50: R_MIPS_HI16	pnp_register_driver
    5d54:	ae230038 	sw	v1,56(s1)
    5d58:	24420000 	addiu	v0,v0,0
			5d58: R_MIPS_LO16	pnp_register_driver
    5d5c:	0040f809 	jalr	v0
    5d60:	02002021 	move	a0,s0
    5d64:	0440000d 	bltz	v0,5d9c <SDIO_RegisterFunction+0xd4>
    5d68:	24430016 	addiu	v1,v0,22
    5d6c:	3c020000 	lui	v0,0x0
			5d6c: R_MIPS_HI16	_SDIO_RegisterFunction
    5d70:	24420000 	addiu	v0,v0,0
			5d70: R_MIPS_LO16	_SDIO_RegisterFunction
    5d74:	0040f809 	jalr	v0
    5d78:	02202021 	move	a0,s1
    5d7c:	0441ffdf 	bgez	v0,5cfc <SDIO_RegisterFunction+0x34>
    5d80:	00408021 	move	s0,v0
    5d84:	3c020000 	lui	v0,0x0
			5d84: R_MIPS_HI16	.text
    5d88:	24425bf0 	addiu	v0,v0,23536
			5d88: R_MIPS_LO16	.text
    5d8c:	0040f809 	jalr	v0
    5d90:	02202021 	move	a0,s1
    5d94:	08001740 	j	5d00 <SDIO_RegisterFunction+0x38>
			5d94: R_MIPS_26	.text
    5d98:	02001021 	move	v0,s0
    5d9c:	2c620013 	sltiu	v0,v1,19
    5da0:	1040ffd6 	beqz	v0,5cfc <SDIO_RegisterFunction+0x34>
    5da4:	2410ffff 	li	s0,-1
    5da8:	00031080 	sll	v0,v1,0x2
    5dac:	3c030000 	lui	v1,0x0
			5dac: R_MIPS_HI16	.rodata
    5db0:	2463003c 	addiu	v1,v1,60
			5db0: R_MIPS_LO16	.rodata
    5db4:	00431021 	addu	v0,v0,v1
    5db8:	8c440000 	lw	a0,0(v0)
    5dbc:	00800008 	jr	a0
    5dc0:	00000000 	nop
    5dc4:	0800173f 	j	5cfc <SDIO_RegisterFunction+0x34>
			5dc4: R_MIPS_26	.text
    5dc8:	2410ffff 	li	s0,-1
    5dcc:	0800173f 	j	5cfc <SDIO_RegisterFunction+0x34>
			5dcc: R_MIPS_26	.text
    5dd0:	2410fff9 	li	s0,-7
    5dd4:	0800173f 	j	5cfc <SDIO_RegisterFunction+0x34>
			5dd4: R_MIPS_26	.text
    5dd8:	2410fffc 	li	s0,-4
    5ddc:	0800173f 	j	5cfc <SDIO_RegisterFunction+0x34>
			5ddc: R_MIPS_26	.text
    5de0:	2410fffb 	li	s0,-5
    5de4:	0800173f 	j	5cfc <SDIO_RegisterFunction+0x34>
			5de4: R_MIPS_26	.text
    5de8:	2410fffa 	li	s0,-6

00005dec <OS_AddDevice>:
    5dec:	27bdffe8 	addiu	sp,sp,-24
    5df0:	3c020000 	lui	v0,0x0
			5df0: R_MIPS_HI16	pnp_add_device
    5df4:	afb00010 	sw	s0,16(sp)
    5df8:	afbf0014 	sw	ra,20(sp)
    5dfc:	00808021 	move	s0,a0
    5e00:	24420000 	addiu	v0,v0,0
			5e00: R_MIPS_LO16	pnp_add_device
    5e04:	0040f809 	jalr	v0
    5e08:	24840040 	addiu	a0,a0,64
    5e0c:	00401821 	move	v1,v0
    5e10:	3c020000 	lui	v0,0x0
			5e10: R_MIPS_HI16	release
    5e14:	24420000 	addiu	v0,v0,0
			5e14: R_MIPS_LO16	release
    5e18:	04600006 	bltz	v1,5e34 <OS_AddDevice+0x48>
    5e1c:	ae020140 	sw	v0,320(s0)
    5e20:	00001021 	move	v0,zero
    5e24:	8fbf0014 	lw	ra,20(sp)
    5e28:	8fb00010 	lw	s0,16(sp)
    5e2c:	03e00008 	jr	ra
    5e30:	27bd0018 	addiu	sp,sp,24
    5e34:	24630016 	addiu	v1,v1,22
    5e38:	2c620013 	sltiu	v0,v1,19
    5e3c:	1040fff9 	beqz	v0,5e24 <OS_AddDevice+0x38>
    5e40:	2402ffff 	li	v0,-1
    5e44:	00031080 	sll	v0,v1,0x2
    5e48:	3c030000 	lui	v1,0x0
			5e48: R_MIPS_HI16	.rodata
    5e4c:	24630088 	addiu	v1,v1,136
			5e4c: R_MIPS_LO16	.rodata
    5e50:	00431021 	addu	v0,v0,v1
    5e54:	8c440000 	lw	a0,0(v0)
    5e58:	00800008 	jr	a0
    5e5c:	00000000 	nop
    5e60:	08001789 	j	5e24 <OS_AddDevice+0x38>
			5e60: R_MIPS_26	.text
    5e64:	2402ffff 	li	v0,-1
    5e68:	08001789 	j	5e24 <OS_AddDevice+0x38>
			5e68: R_MIPS_26	.text
    5e6c:	2402fffe 	li	v0,-2
    5e70:	08001789 	j	5e24 <OS_AddDevice+0x38>
			5e70: R_MIPS_26	.text
    5e74:	2402fff9 	li	v0,-7
    5e78:	08001789 	j	5e24 <OS_AddDevice+0x38>
			5e78: R_MIPS_26	.text
    5e7c:	2402fffc 	li	v0,-4
    5e80:	08001789 	j	5e24 <OS_AddDevice+0x38>
			5e80: R_MIPS_26	.text
    5e84:	2402fffb 	li	v0,-5
    5e88:	08001789 	j	5e24 <OS_AddDevice+0x38>
			5e88: R_MIPS_26	.text
    5e8c:	2402fffa 	li	v0,-6

00005e90 <OS_RemoveDevice>:
    5e90:	27bdffe8 	addiu	sp,sp,-24
    5e94:	3c020000 	lui	v0,0x0
			5e94: R_MIPS_HI16	pnp_remove_device
    5e98:	afb00010 	sw	s0,16(sp)
    5e9c:	afbf0014 	sw	ra,20(sp)
    5ea0:	00808021 	move	s0,a0
    5ea4:	24420000 	addiu	v0,v0,0
			5ea4: R_MIPS_LO16	pnp_remove_device
    5ea8:	0040f809 	jalr	v0
    5eac:	24840040 	addiu	a0,a0,64
    5eb0:	8f820014 	lw	v0,20(gp)
    5eb4:	24420001 	addiu	v0,v0,1
    5eb8:	af820014 	sw	v0,20(gp)
    5ebc:	92050150 	lbu	a1,336(s0)
    5ec0:	3c060000 	lui	a2,0x0
			5ec0: R_MIPS_HI16	.bss
    5ec4:	24020001 	li	v0,1
    5ec8:	8cc30014 	lw	v1,20(a2)
			5ec8: R_MIPS_LO16	.bss
    5ecc:	00a21004 	sllv	v0,v0,a1
    5ed0:	00021027 	nor	v0,zero,v0
    5ed4:	00621824 	and	v1,v1,v0
    5ed8:	acc30014 	sw	v1,20(a2)
			5ed8: R_MIPS_LO16	.bss
    5edc:	8f820014 	lw	v0,20(gp)
    5ee0:	2442ffff 	addiu	v0,v0,-1
    5ee4:	af820014 	sw	v0,20(gp)
    5ee8:	8f820008 	lw	v0,8(gp)
    5eec:	30420004 	andi	v0,v0,0x4
    5ef0:	1440000d 	bnez	v0,5f28 <OS_RemoveDevice+0x98>
    5ef4:	3c020000 	lui	v0,0x0
			5ef4: R_MIPS_HI16	preempt_schedule
    5ef8:	8e020188 	lw	v0,392(s0)
    5efc:	10400006 	beqz	v0,5f18 <OS_RemoveDevice+0x88>
    5f00:	00402021 	move	a0,v0
    5f04:	3c020000 	lui	v0,0x0
			5f04: R_MIPS_HI16	kfree
    5f08:	24420000 	addiu	v0,v0,0
			5f08: R_MIPS_LO16	kfree
    5f0c:	0040f809 	jalr	v0
    5f10:	00000000 	nop
    5f14:	ae000188 	sw	zero,392(s0)
    5f18:	8fbf0014 	lw	ra,20(sp)
    5f1c:	8fb00010 	lw	s0,16(sp)
    5f20:	03e00008 	jr	ra
    5f24:	27bd0018 	addiu	sp,sp,24
    5f28:	24420000 	addiu	v0,v0,0
			5f28: R_MIPS_LO16	preempt_schedule
    5f2c:	0040f809 	jalr	v0
    5f30:	00000000 	nop
    5f34:	080017bf 	j	5efc <OS_RemoveDevice+0x6c>
			5f34: R_MIPS_26	.text
    5f38:	8e020188 	lw	v0,392(s0)

00005f3c <SDIO_BusRemoveOSDevice>:
    5f3c:	27bdffe0 	addiu	sp,sp,-32
    5f40:	3c020000 	lui	v0,0x0
			5f40: R_MIPS_HI16	pnp_remove_device
    5f44:	afb10014 	sw	s1,20(sp)
    5f48:	afb00010 	sw	s0,16(sp)
    5f4c:	afbf0018 	sw	ra,24(sp)
    5f50:	00a08021 	move	s0,a1
    5f54:	00808821 	move	s1,a0
    5f58:	24420000 	addiu	v0,v0,0
			5f58: R_MIPS_LO16	pnp_remove_device
    5f5c:	0040f809 	jalr	v0
    5f60:	00a02021 	move	a0,a1
    5f64:	8e030148 	lw	v1,328(s0)
    5f68:	10600006 	beqz	v1,5f84 <SDIO_BusRemoveOSDevice+0x48>
    5f6c:	00602021 	move	a0,v1
    5f70:	3c020000 	lui	v0,0x0
			5f70: R_MIPS_HI16	kfree
    5f74:	24420000 	addiu	v0,v0,0
			5f74: R_MIPS_LO16	kfree
    5f78:	0040f809 	jalr	v0
    5f7c:	00000000 	nop
    5f80:	ae000148 	sw	zero,328(s0)
    5f84:	8f820014 	lw	v0,20(gp)
    5f88:	24420001 	addiu	v0,v0,1
    5f8c:	af820014 	sw	v0,20(gp)
    5f90:	92050110 	lbu	a1,272(s0)
    5f94:	3c060000 	lui	a2,0x0
			5f94: R_MIPS_HI16	.bss
    5f98:	24020001 	li	v0,1
    5f9c:	8cc30014 	lw	v1,20(a2)
			5f9c: R_MIPS_LO16	.bss
    5fa0:	00a21004 	sllv	v0,v0,a1
    5fa4:	00021027 	nor	v0,zero,v0
    5fa8:	00621824 	and	v1,v1,v0
    5fac:	acc30014 	sw	v1,20(a2)
			5fac: R_MIPS_LO16	.bss
    5fb0:	8f820014 	lw	v0,20(gp)
    5fb4:	2442ffff 	addiu	v0,v0,-1
    5fb8:	af820014 	sw	v0,20(gp)
    5fbc:	8f820008 	lw	v0,8(gp)
    5fc0:	30420004 	andi	v0,v0,0x4
    5fc4:	14400012 	bnez	v0,6010 <SDIO_BusRemoveOSDevice+0xd4>
    5fc8:	3c020000 	lui	v0,0x0
			5fc8: R_MIPS_HI16	preempt_schedule
    5fcc:	3c020000 	lui	v0,0x0
			5fcc: R_MIPS_HI16	pnp_unregister_driver
    5fd0:	24420000 	addiu	v0,v0,0
			5fd0: R_MIPS_LO16	pnp_unregister_driver
    5fd4:	0040f809 	jalr	v0
    5fd8:	02202021 	move	a0,s1
    5fdc:	8e230004 	lw	v1,4(s1)
    5fe0:	10600006 	beqz	v1,5ffc <SDIO_BusRemoveOSDevice+0xc0>
    5fe4:	00602021 	move	a0,v1
    5fe8:	3c020000 	lui	v0,0x0
			5fe8: R_MIPS_HI16	kfree
    5fec:	24420000 	addiu	v0,v0,0
			5fec: R_MIPS_LO16	kfree
    5ff0:	0040f809 	jalr	v0
    5ff4:	00000000 	nop
    5ff8:	ae200004 	sw	zero,4(s1)
    5ffc:	8fbf0018 	lw	ra,24(sp)
    6000:	8fb10014 	lw	s1,20(sp)
    6004:	8fb00010 	lw	s0,16(sp)
    6008:	03e00008 	jr	ra
    600c:	27bd0020 	addiu	sp,sp,32
    6010:	24420000 	addiu	v0,v0,0
			6010: R_MIPS_LO16	preempt_schedule
    6014:	0040f809 	jalr	v0
    6018:	00000000 	nop
    601c:	080017f4 	j	5fd0 <SDIO_BusRemoveOSDevice+0x94>
			601c: R_MIPS_26	.text
    6020:	3c020000 	lui	v0,0x0
			6020: R_MIPS_HI16	pnp_unregister_driver

00006024 <OS_InitializeDevice>:
    6024:	27bdffd0 	addiu	sp,sp,-48
    6028:	afb30024 	sw	s3,36(sp)
    602c:	afb20020 	sw	s2,32(sp)
    6030:	3c130000 	lui	s3,0x0
			6030: R_MIPS_HI16	memset
    6034:	24920040 	addiu	s2,a0,64
    6038:	afb1001c 	sw	s1,28(sp)
    603c:	afb00018 	sw	s0,24(sp)
    6040:	00808821 	move	s1,a0
    6044:	00a08021 	move	s0,a1
    6048:	afbf0028 	sw	ra,40(sp)
    604c:	02402021 	move	a0,s2
    6050:	00002821 	move	a1,zero
    6054:	26620000 	addiu	v0,s3,0
			6054: R_MIPS_LO16	memset
    6058:	0040f809 	jalr	v0
    605c:	240607c0 	li	a2,1984
    6060:	ae3000f8 	sw	s0,248(s1)
    6064:	8f820014 	lw	v0,20(gp)
    6068:	24420001 	addiu	v0,v0,1
    606c:	af820014 	sw	v0,20(gp)
    6070:	3c070000 	lui	a3,0x0
			6070: R_MIPS_HI16	.bss
    6074:	90e40014 	lbu	a0,20(a3)
			6074: R_MIPS_LO16	.bss
    6078:	00001821 	move	v1,zero
    607c:	24060001 	li	a2,1
    6080:	08001824 	j	6090 <OS_InitializeDevice+0x6c>
			6080: R_MIPS_26	.text
    6084:	24050020 	li	a1,32
    6088:	10650007 	beq	v1,a1,60a8 <OS_InitializeDevice+0x84>
    608c:	240200ff 	li	v0,255
    6090:	00661004 	sllv	v0,a2,v1
    6094:	00821024 	and	v0,a0,v0
    6098:	1440fffb 	bnez	v0,6088 <OS_InitializeDevice+0x64>
    609c:	24630001 	addiu	v1,v1,1
    60a0:	2463ffff 	addiu	v1,v1,-1
    60a4:	306200ff 	andi	v0,v1,0xff
    60a8:	a2220150 	sb	v0,336(s1)
    60ac:	8ce30014 	lw	v1,20(a3)
			60ac: R_MIPS_LO16	.bss
    60b0:	24100001 	li	s0,1
    60b4:	304200ff 	andi	v0,v0,0xff
    60b8:	00501004 	sllv	v0,s0,v0
    60bc:	00621825 	or	v1,v1,v0
    60c0:	ace30014 	sw	v1,20(a3)
			60c0: R_MIPS_LO16	.bss
    60c4:	8f820014 	lw	v0,20(gp)
    60c8:	2442ffff 	addiu	v0,v0,-1
    60cc:	af820014 	sw	v0,20(gp)
    60d0:	8f820008 	lw	v0,8(gp)
    60d4:	30420004 	andi	v0,v0,0x4
    60d8:	14400047 	bnez	v0,61f8 <OS_InitializeDevice+0x1d4>
    60dc:	3c020000 	lui	v0,0x0
			60dc: R_MIPS_HI16	preempt_schedule
    60e0:	3c020000 	lui	v0,0x0
			60e0: R_MIPS_HI16	sdio_protocol
    60e4:	24420000 	addiu	v0,v0,0
			60e4: R_MIPS_LO16	sdio_protocol
    60e8:	24030014 	li	v1,20
    60ec:	ae220178 	sw	v0,376(s1)
    60f0:	3c020000 	lui	v0,0x0
			60f0: R_MIPS_HI16	pnp_init_resource_table
    60f4:	ae230190 	sw	v1,400(s1)
    60f8:	ae30018c 	sw	s0,396(s1)
    60fc:	24420000 	addiu	v0,v0,0
			60fc: R_MIPS_LO16	pnp_init_resource_table
    6100:	0040f809 	jalr	v0
    6104:	2624019c 	addiu	a0,s1,412
    6108:	3c030000 	lui	v1,0x0
			6108: R_MIPS_HI16	malloc_sizes
    610c:	8c640004 	lw	a0,4(v1)
			610c: R_MIPS_LO16	malloc_sizes
    6110:	3c020000 	lui	v0,0x0
			6110: R_MIPS_HI16	kmem_cache_alloc
    6114:	24420000 	addiu	v0,v0,0
			6114: R_MIPS_LO16	kmem_cache_alloc
    6118:	0040f809 	jalr	v0
    611c:	240500d0 	li	a1,208
    6120:	10400033 	beqz	v0,61f0 <OS_InitializeDevice+0x1cc>
    6124:	00408021 	move	s0,v0
    6128:	02002021 	move	a0,s0
    612c:	00002821 	move	a1,zero
    6130:	26620000 	addiu	v0,s3,0
			6130: R_MIPS_LO16	memset
    6134:	0040f809 	jalr	v0
    6138:	2406000c 	li	a2,12
    613c:	8e230034 	lw	v1,52(s1)
    6140:	9222003a 	lbu	v0,58(s1)
    6144:	90670018 	lbu	a3,24(v1)
    6148:	3c060000 	lui	a2,0x0
			6148: R_MIPS_HI16	$LC3
    614c:	afa20010 	sw	v0,16(sp)
    6150:	3c020000 	lui	v0,0x0
			6150: R_MIPS_HI16	snprintf
    6154:	24c60000 	addiu	a2,a2,0
			6154: R_MIPS_LO16	$LC3
    6158:	02002021 	move	a0,s0
    615c:	24420000 	addiu	v0,v0,0
			615c: R_MIPS_LO16	snprintf
    6160:	0040f809 	jalr	v0
    6164:	24050008 	li	a1,8
    6168:	3c020000 	lui	v0,0x0
			6168: R_MIPS_HI16	pnp_add_id
    616c:	ae000008 	sw	zero,8(s0)
    6170:	02002021 	move	a0,s0
    6174:	24420000 	addiu	v0,v0,0
			6174: R_MIPS_LO16	pnp_add_id
    6178:	0040f809 	jalr	v0
    617c:	02402821 	move	a1,s2
    6180:	8e230034 	lw	v1,52(s1)
    6184:	8c6200a0 	lw	v0,160(v1)
    6188:	10400010 	beqz	v0,61cc <OS_InitializeDevice+0x1a8>
    618c:	24420008 	addiu	v0,v0,8
    6190:	ae220108 	sw	v0,264(s1)
    6194:	8c6400a0 	lw	a0,160(v1)
    6198:	00002821 	move	a1,zero
    619c:	8c820008 	lw	v0,8(a0)
    61a0:	8c83000c 	lw	v1,12(a0)
    61a4:	ae220110 	sw	v0,272(s1)
    61a8:	ae230114 	sw	v1,276(s1)
    61ac:	8fbf0028 	lw	ra,40(sp)
    61b0:	8fb30024 	lw	s3,36(sp)
    61b4:	8fb20020 	lw	s2,32(sp)
    61b8:	8fb1001c 	lw	s1,28(sp)
    61bc:	8fb00018 	lw	s0,24(sp)
    61c0:	00a01021 	move	v0,a1
    61c4:	03e00008 	jr	ra
    61c8:	27bd0030 	addiu	sp,sp,48
    61cc:	00002821 	move	a1,zero
    61d0:	8fbf0028 	lw	ra,40(sp)
    61d4:	8fb30024 	lw	s3,36(sp)
    61d8:	8fb20020 	lw	s2,32(sp)
    61dc:	8fb1001c 	lw	s1,28(sp)
    61e0:	8fb00018 	lw	s0,24(sp)
    61e4:	00a01021 	move	v0,a1
    61e8:	03e00008 	jr	ra
    61ec:	27bd0030 	addiu	sp,sp,48
    61f0:	0800186b 	j	61ac <OS_InitializeDevice+0x188>
			61f0: R_MIPS_26	.text
    61f4:	2405fff9 	li	a1,-7
    61f8:	24420000 	addiu	v0,v0,0
			61f8: R_MIPS_LO16	preempt_schedule
    61fc:	0040f809 	jalr	v0
    6200:	00000000 	nop
    6204:	08001839 	j	60e4 <OS_InitializeDevice+0xc0>
			6204: R_MIPS_26	.text
    6208:	3c020000 	lui	v0,0x0
			6208: R_MIPS_HI16	sdio_protocol

0000620c <SDIO_BusAddOSDevice>:
    620c:	27bdffc8 	addiu	sp,sp,-56
    6210:	afb60028 	sw	s6,40(sp)
    6214:	afb10014 	sw	s1,20(sp)
    6218:	afbf0030 	sw	ra,48(sp)
    621c:	afb7002c 	sw	s7,44(sp)
    6220:	afb50024 	sw	s5,36(sp)
    6224:	afb40020 	sw	s4,32(sp)
    6228:	afb3001c 	sw	s3,28(sp)
    622c:	afb20018 	sw	s2,24(sp)
    6230:	afb00010 	sw	s0,16(sp)
    6234:	00801021 	move	v0,a0
    6238:	00a0b021 	move	s6,a1
    623c:	10800007 	beqz	a0,625c <SDIO_BusAddOSDevice+0x50>
    6240:	00c08821 	move	s1,a2
    6244:	24840008 	addiu	a0,a0,8
    6248:	acc400c8 	sw	a0,200(a2)
    624c:	8c43000c 	lw	v1,12(v0)
    6250:	8c420008 	lw	v0,8(v0)
    6254:	acc300d4 	sw	v1,212(a2)
    6258:	acc200d0 	sw	v0,208(a2)
    625c:	3c020000 	lui	v0,0x0
			625c: R_MIPS_HI16	malloc_sizes
    6260:	24570000 	addiu	s7,v0,0
			6260: R_MIPS_LO16	malloc_sizes
    6264:	8ee40004 	lw	a0,4(s7)
    6268:	3c020000 	lui	v0,0x0
			6268: R_MIPS_HI16	kmem_cache_alloc
    626c:	24550000 	addiu	s5,v0,0
			626c: R_MIPS_LO16	kmem_cache_alloc
    6270:	02a0f809 	jalr	s5
    6274:	240500d0 	li	a1,208
    6278:	10400007 	beqz	v0,6298 <SDIO_BusAddOSDevice+0x8c>
    627c:	00408021 	move	s0,v0
    6280:	00402021 	move	a0,v0
    6284:	3c020000 	lui	v0,0x0
			6284: R_MIPS_HI16	memset
    6288:	00002821 	move	a1,zero
    628c:	24420000 	addiu	v0,v0,0
			628c: R_MIPS_LO16	memset
    6290:	0040f809 	jalr	v0
    6294:	24060018 	li	a2,24
    6298:	3c080000 	lui	t0,0x0
			6298: R_MIPS_HI16	.bss
    629c:	8d030018 	lw	v1,24(t0)
			629c: R_MIPS_LO16	.bss
    62a0:	3c020000 	lui	v0,0x0
			62a0: R_MIPS_HI16	snprintf
    62a4:	3c130000 	lui	s3,0x0
			62a4: R_MIPS_HI16	$LC4
    62a8:	00603821 	move	a3,v1
    62ac:	02002021 	move	a0,s0
    62b0:	24630001 	addiu	v1,v1,1
    62b4:	24540000 	addiu	s4,v0,0
			62b4: R_MIPS_LO16	snprintf
    62b8:	24050008 	li	a1,8
    62bc:	26660000 	addiu	a2,s3,0
			62bc: R_MIPS_LO16	$LC4
    62c0:	ad030018 	sw	v1,24(t0)
			62c0: R_MIPS_LO16	.bss
    62c4:	0280f809 	jalr	s4
    62c8:	24120001 	li	s2,1
    62cc:	3c020000 	lui	v0,0x0
			62cc: R_MIPS_HI16	pnp_register_driver
    62d0:	ae000008 	sw	zero,8(s0)
    62d4:	a200000c 	sb	zero,12(s0)
    62d8:	ae000014 	sw	zero,20(s0)
    62dc:	02c02021 	move	a0,s6
    62e0:	aed00004 	sw	s0,4(s6)
    62e4:	24420000 	addiu	v0,v0,0
			62e4: R_MIPS_LO16	pnp_register_driver
    62e8:	0040f809 	jalr	v0
    62ec:	aed20008 	sw	s2,8(s6)
    62f0:	04400055 	bltz	v0,6448 <SDIO_BusAddOSDevice+0x23c>
    62f4:	24030014 	li	v1,20
    62f8:	3c020000 	lui	v0,0x0
			62f8: R_MIPS_HI16	sdio_protocol
    62fc:	24420000 	addiu	v0,v0,0
			62fc: R_MIPS_LO16	sdio_protocol
    6300:	ae220138 	sw	v0,312(s1)
    6304:	ae230150 	sw	v1,336(s1)
    6308:	ae32014c 	sw	s2,332(s1)
    630c:	8ee40004 	lw	a0,4(s7)
    6310:	02a0f809 	jalr	s5
    6314:	240500d0 	li	a1,208
    6318:	10400007 	beqz	v0,6338 <SDIO_BusAddOSDevice+0x12c>
    631c:	00408021 	move	s0,v0
    6320:	00402021 	move	a0,v0
    6324:	3c020000 	lui	v0,0x0
			6324: R_MIPS_HI16	memset
    6328:	00002821 	move	a1,zero
    632c:	24420000 	addiu	v0,v0,0
			632c: R_MIPS_LO16	memset
    6330:	0040f809 	jalr	v0
    6334:	2406000c 	li	a2,12
    6338:	26660000 	addiu	a2,s3,0
			6338: R_MIPS_LO16	$LC4
    633c:	02002021 	move	a0,s0
    6340:	00003821 	move	a3,zero
    6344:	0280f809 	jalr	s4
    6348:	24050008 	li	a1,8
    634c:	3c020000 	lui	v0,0x0
			634c: R_MIPS_HI16	pnp_add_id
    6350:	ae000008 	sw	zero,8(s0)
    6354:	02002021 	move	a0,s0
    6358:	24420000 	addiu	v0,v0,0
			6358: R_MIPS_LO16	pnp_add_id
    635c:	0040f809 	jalr	v0
    6360:	02202821 	move	a1,s1
    6364:	8f820014 	lw	v0,20(gp)
    6368:	24420001 	addiu	v0,v0,1
    636c:	af820014 	sw	v0,20(gp)
    6370:	3c070000 	lui	a3,0x0
			6370: R_MIPS_HI16	.bss
    6374:	90e40014 	lbu	a0,20(a3)
			6374: R_MIPS_LO16	.bss
    6378:	00001821 	move	v1,zero
    637c:	24060001 	li	a2,1
    6380:	080018e4 	j	6390 <SDIO_BusAddOSDevice+0x184>
			6380: R_MIPS_26	.text
    6384:	24050020 	li	a1,32
    6388:	10650007 	beq	v1,a1,63a8 <SDIO_BusAddOSDevice+0x19c>
    638c:	240200ff 	li	v0,255
    6390:	00661004 	sllv	v0,a2,v1
    6394:	00821024 	and	v0,a0,v0
    6398:	1440fffb 	bnez	v0,6388 <SDIO_BusAddOSDevice+0x17c>
    639c:	24630001 	addiu	v1,v1,1
    63a0:	2463ffff 	addiu	v1,v1,-1
    63a4:	306200ff 	andi	v0,v1,0xff
    63a8:	a2220110 	sb	v0,272(s1)
    63ac:	304400ff 	andi	a0,v0,0xff
    63b0:	8ce30014 	lw	v1,20(a3)
			63b0: R_MIPS_LO16	.bss
    63b4:	24020001 	li	v0,1
    63b8:	00821004 	sllv	v0,v0,a0
    63bc:	00621825 	or	v1,v1,v0
    63c0:	ace30014 	sw	v1,20(a3)
			63c0: R_MIPS_LO16	.bss
    63c4:	8f820014 	lw	v0,20(gp)
    63c8:	2442ffff 	addiu	v0,v0,-1
    63cc:	af820014 	sw	v0,20(gp)
    63d0:	8f820008 	lw	v0,8(gp)
    63d4:	30420004 	andi	v0,v0,0x4
    63d8:	14400031 	bnez	v0,64a0 <SDIO_BusAddOSDevice+0x294>
    63dc:	3c020000 	lui	v0,0x0
			63dc: R_MIPS_HI16	preempt_schedule
    63e0:	3c020000 	lui	v0,0x0
			63e0: R_MIPS_HI16	pnp_init_resource_table
    63e4:	24420000 	addiu	v0,v0,0
			63e4: R_MIPS_LO16	pnp_init_resource_table
    63e8:	0040f809 	jalr	v0
    63ec:	2624015c 	addiu	a0,s1,348
    63f0:	3c020000 	lui	v0,0x0
			63f0: R_MIPS_HI16	pnp_add_device
    63f4:	24420000 	addiu	v0,v0,0
			63f4: R_MIPS_LO16	pnp_add_device
    63f8:	0040f809 	jalr	v0
    63fc:	02202021 	move	a0,s1
    6400:	0440002c 	bltz	v0,64b4 <SDIO_BusAddOSDevice+0x2a8>
    6404:	00408021 	move	s0,v0
    6408:	3c020000 	lui	v0,0x0
			6408: R_MIPS_HI16	release
    640c:	24420000 	addiu	v0,v0,0
			640c: R_MIPS_LO16	release
    6410:	00001821 	move	v1,zero
    6414:	ae220100 	sw	v0,256(s1)
    6418:	8fbf0030 	lw	ra,48(sp)
    641c:	8fb7002c 	lw	s7,44(sp)
    6420:	8fb60028 	lw	s6,40(sp)
    6424:	8fb50024 	lw	s5,36(sp)
    6428:	8fb40020 	lw	s4,32(sp)
    642c:	8fb3001c 	lw	s3,28(sp)
    6430:	8fb20018 	lw	s2,24(sp)
    6434:	8fb10014 	lw	s1,20(sp)
    6438:	8fb00010 	lw	s0,16(sp)
    643c:	00601021 	move	v0,v1
    6440:	03e00008 	jr	ra
    6444:	27bd0038 	addiu	sp,sp,56
    6448:	24430016 	addiu	v1,v0,22
    644c:	2c620013 	sltiu	v0,v1,19
    6450:	10400007 	beqz	v0,6470 <SDIO_BusAddOSDevice+0x264>
    6454:	00031080 	sll	v0,v1,0x2
    6458:	3c030000 	lui	v1,0x0
			6458: R_MIPS_HI16	.rodata
    645c:	246300d4 	addiu	v1,v1,212
			645c: R_MIPS_LO16	.rodata
    6460:	00431021 	addu	v0,v0,v1
    6464:	8c440000 	lw	a0,0(v0)
    6468:	00800008 	jr	a0
    646c:	00000000 	nop
    6470:	08001906 	j	6418 <SDIO_BusAddOSDevice+0x20c>
			6470: R_MIPS_26	.text
    6474:	2403ffff 	li	v1,-1
    6478:	08001906 	j	6418 <SDIO_BusAddOSDevice+0x20c>
			6478: R_MIPS_26	.text
    647c:	2403fffe 	li	v1,-2
    6480:	08001906 	j	6418 <SDIO_BusAddOSDevice+0x20c>
			6480: R_MIPS_26	.text
    6484:	2403fff9 	li	v1,-7
    6488:	08001906 	j	6418 <SDIO_BusAddOSDevice+0x20c>
			6488: R_MIPS_26	.text
    648c:	2403fffc 	li	v1,-4
    6490:	08001906 	j	6418 <SDIO_BusAddOSDevice+0x20c>
			6490: R_MIPS_26	.text
    6494:	2403fffb 	li	v1,-5
    6498:	08001906 	j	6418 <SDIO_BusAddOSDevice+0x20c>
			6498: R_MIPS_26	.text
    649c:	2403fffa 	li	v1,-6
    64a0:	24420000 	addiu	v0,v0,0
			64a0: R_MIPS_LO16	preempt_schedule
    64a4:	0040f809 	jalr	v0
    64a8:	00000000 	nop
    64ac:	080018f9 	j	63e4 <SDIO_BusAddOSDevice+0x1d8>
			64ac: R_MIPS_26	.text
    64b0:	3c020000 	lui	v0,0x0
			64b0: R_MIPS_HI16	pnp_init_resource_table
    64b4:	3c020000 	lui	v0,0x0
			64b4: R_MIPS_HI16	pnp_unregister_driver
    64b8:	24420000 	addiu	v0,v0,0
			64b8: R_MIPS_LO16	pnp_unregister_driver
    64bc:	0040f809 	jalr	v0
    64c0:	02c02021 	move	a0,s6
    64c4:	26040016 	addiu	a0,s0,22
    64c8:	3c020000 	lui	v0,0x0
			64c8: R_MIPS_HI16	release
    64cc:	24420000 	addiu	v0,v0,0
			64cc: R_MIPS_LO16	release
    64d0:	2c830013 	sltiu	v1,a0,19
    64d4:	1060ffe6 	beqz	v1,6470 <SDIO_BusAddOSDevice+0x264>
    64d8:	ae220100 	sw	v0,256(s1)
    64dc:	3c030000 	lui	v1,0x0
			64dc: R_MIPS_HI16	.rodata
    64e0:	00041080 	sll	v0,a0,0x2
    64e4:	24630120 	addiu	v1,v1,288
			64e4: R_MIPS_LO16	.rodata
    64e8:	00431021 	addu	v0,v0,v1
    64ec:	8c440000 	lw	a0,0(v0)
    64f0:	00800008 	jr	a0
    64f4:	00000000 	nop
    64f8:	1000fd89 	b	5b20 <Do_OS_IncHcdReference+0x48>
    64fc:	00000000 	nop
Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	27bdffe8 	addiu	sp,sp,-24
   4:	afbf0010 	sw	ra,16(sp)
   8:	3c020000 	lui	v0,0x0
			8: R_MIPS_HI16	debuglevel
   c:	8c430000 	lw	v1,0(v0)
			c: R_MIPS_LO16	debuglevel
  10:	3c040000 	lui	a0,0x0
			10: R_MIPS_HI16	$LC0
  14:	28630007 	slti	v1,v1,7
  18:	14600005 	bnez	v1,30 <cleanup_module+0x30>
  1c:	24840000 	addiu	a0,a0,0
			1c: R_MIPS_LO16	$LC0
  20:	3c020000 	lui	v0,0x0
			20: R_MIPS_HI16	printk
  24:	24420000 	addiu	v0,v0,0
			24: R_MIPS_LO16	printk
  28:	0040f809 	jalr	v0
  2c:	00000000 	nop
  30:	3c020000 	lui	v0,0x0
			30: R_MIPS_HI16	_SDIO_BusDriverCleanup
  34:	24420000 	addiu	v0,v0,0
			34: R_MIPS_LO16	_SDIO_BusDriverCleanup
  38:	0040f809 	jalr	v0
  3c:	00000000 	nop
  40:	3c040000 	lui	a0,0x0
			40: R_MIPS_HI16	sdio_protocol
  44:	3c190000 	lui	t9,0x0
			44: R_MIPS_HI16	pnp_unregister_protocol
  48:	8fbf0010 	lw	ra,16(sp)
  4c:	24840000 	addiu	a0,a0,0
			4c: R_MIPS_LO16	sdio_protocol
  50:	27390000 	addiu	t9,t9,0
			50: R_MIPS_LO16	pnp_unregister_protocol
  54:	03200008 	jr	t9
  58:	27bd0018 	addiu	sp,sp,24
Disassembly of section .init.text:

00000000 <init_module>:
   0:	27bdffe0 	addiu	sp,sp,-32
   4:	afb10014 	sw	s1,20(sp)
   8:	afbf0018 	sw	ra,24(sp)
   c:	afb00010 	sw	s0,16(sp)
  10:	3c110000 	lui	s1,0x0
			10: R_MIPS_HI16	debuglevel
  14:	8e220000 	lw	v0,0(s1)
			14: R_MIPS_LO16	debuglevel
  18:	28420007 	slti	v0,v0,7
  1c:	10400022 	beqz	v0,a8 <init_module+0xa8>
  20:	3c040000 	lui	a0,0x0
			20: R_MIPS_HI16	$LC1
  24:	3c020000 	lui	v0,0x0
			24: R_MIPS_HI16	_SDIO_BusDriverInitialize
  28:	24420000 	addiu	v0,v0,0
			28: R_MIPS_LO16	_SDIO_BusDriverInitialize
  2c:	0040f809 	jalr	v0
  30:	00000000 	nop
  34:	04400029 	bltz	v0,dc <init_module+0xdc>
  38:	3c040000 	lui	a0,0x0
			38: R_MIPS_HI16	sdio_protocol
  3c:	3c020000 	lui	v0,0x0
			3c: R_MIPS_HI16	pnp_register_protocol
  40:	24420000 	addiu	v0,v0,0
			40: R_MIPS_LO16	pnp_register_protocol
  44:	0040f809 	jalr	v0
  48:	24840000 	addiu	a0,a0,0
			48: R_MIPS_LO16	sdio_protocol
  4c:	04400008 	bltz	v0,70 <init_module+0x70>
  50:	00408021 	move	s0,v0
  54:	00008021 	move	s0,zero
  58:	02001021 	move	v0,s0
  5c:	8fbf0018 	lw	ra,24(sp)
  60:	8fb10014 	lw	s1,20(sp)
  64:	8fb00010 	lw	s0,16(sp)
  68:	03e00008 	jr	ra
  6c:	27bd0020 	addiu	sp,sp,32
  70:	8e220000 	lw	v0,0(s1)
			70: R_MIPS_LO16	debuglevel
  74:	28420007 	slti	v0,v0,7
  78:	10400011 	beqz	v0,c0 <init_module+0xc0>
  7c:	3c040000 	lui	a0,0x0
			7c: R_MIPS_HI16	$LC2
  80:	3c020000 	lui	v0,0x0
			80: R_MIPS_HI16	_SDIO_BusDriverCleanup
  84:	24420000 	addiu	v0,v0,0
			84: R_MIPS_LO16	_SDIO_BusDriverCleanup
  88:	0040f809 	jalr	v0
  8c:	00000000 	nop
  90:	02001021 	move	v0,s0
  94:	8fbf0018 	lw	ra,24(sp)
  98:	8fb10014 	lw	s1,20(sp)
  9c:	8fb00010 	lw	s0,16(sp)
  a0:	03e00008 	jr	ra
  a4:	27bd0020 	addiu	sp,sp,32
  a8:	3c020000 	lui	v0,0x0
			a8: R_MIPS_HI16	printk
  ac:	24420000 	addiu	v0,v0,0
			ac: R_MIPS_LO16	printk
  b0:	0040f809 	jalr	v0
  b4:	24840000 	addiu	a0,a0,0
			b4: R_MIPS_LO16	$LC1
  b8:	0800000a 	j	28 <init_module+0x28>
			b8: R_MIPS_26	.init.text
  bc:	3c020000 	lui	v0,0x0
			bc: R_MIPS_HI16	_SDIO_BusDriverInitialize
  c0:	3c020000 	lui	v0,0x0
			c0: R_MIPS_HI16	printk
  c4:	24840000 	addiu	a0,a0,0
			c4: R_MIPS_LO16	$LC2
  c8:	24420000 	addiu	v0,v0,0
			c8: R_MIPS_LO16	printk
  cc:	0040f809 	jalr	v0
  d0:	02002821 	move	a1,s0
  d4:	08000021 	j	84 <init_module+0x84>
			d4: R_MIPS_26	.init.text
  d8:	3c020000 	lui	v0,0x0
			d8: R_MIPS_HI16	_SDIO_BusDriverCleanup
  dc:	24430007 	addiu	v1,v0,7
  e0:	2c62000b 	sltiu	v0,v1,11
  e4:	1040ffdc 	beqz	v0,58 <init_module+0x58>
  e8:	2410fff2 	li	s0,-14
  ec:	00031080 	sll	v0,v1,0x2
  f0:	3c030000 	lui	v1,0x0
			f0: R_MIPS_HI16	.rodata
  f4:	24630010 	addiu	v1,v1,16
			f4: R_MIPS_LO16	.rodata
  f8:	00431021 	addu	v0,v0,v1
  fc:	8c440000 	lw	a0,0(v0)
 100:	00800008 	jr	a0
 104:	00000000 	nop
 108:	08000016 	j	58 <init_module+0x58>
			108: R_MIPS_26	.init.text
 10c:	2410fff2 	li	s0,-14
 110:	08000016 	j	58 <init_module+0x58>
			110: R_MIPS_26	.init.text
 114:	2410fff4 	li	s0,-12
 118:	08000016 	j	58 <init_module+0x58>
			118: R_MIPS_26	.init.text
 11c:	2410fffc 	li	s0,-4
 120:	08000016 	j	58 <init_module+0x58>
			120: R_MIPS_26	.init.text
 124:	2410fffb 	li	s0,-5
 128:	08000016 	j	58 <init_module+0x58>
			128: R_MIPS_26	.init.text
 12c:	2410fffa 	li	s0,-6
 130:	08000016 	j	58 <init_module+0x58>
			130: R_MIPS_26	.init.text
 134:	2410ffea 	li	s0,-22
 138:	08000016 	j	58 <init_module+0x58>
			138: R_MIPS_26	.init.text
 13c:	2410fff5 	li	s0,-11
