
user/_stressfs:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
   0:	dd010113          	addi	sp,sp,-560
   4:	22113423          	sd	ra,552(sp)
   8:	22813023          	sd	s0,544(sp)
   c:	20913c23          	sd	s1,536(sp)
  10:	21213823          	sd	s2,528(sp)
  14:	1c00                	addi	s0,sp,560
  16:	00001797          	auipc	a5,0x1
  1a:	92a78793          	addi	a5,a5,-1750 # 940 <malloc+0x132>
  1e:	6398                	ld	a4,0(a5)
  20:	fce43823          	sd	a4,-48(s0)
  24:	0087d783          	lhu	a5,8(a5)
  28:	fcf41c23          	sh	a5,-40(s0)
  2c:	00001517          	auipc	a0,0x1
  30:	8e450513          	addi	a0,a0,-1820 # 910 <malloc+0x102>
  34:	726000ef          	jal	75a <printf>
  38:	20000613          	li	a2,512
  3c:	06100593          	li	a1,97
  40:	dd040513          	addi	a0,s0,-560
  44:	118000ef          	jal	15c <memset>
  48:	4481                	li	s1,0
  4a:	4911                	li	s2,4
  4c:	2ee000ef          	jal	33a <fork>
  50:	00a04563          	bgtz	a0,5a <main+0x5a>
  54:	2485                	addiw	s1,s1,1
  56:	ff249be3          	bne	s1,s2,4c <main+0x4c>
  5a:	85a6                	mv	a1,s1
  5c:	00001517          	auipc	a0,0x1
  60:	8cc50513          	addi	a0,a0,-1844 # 928 <malloc+0x11a>
  64:	6f6000ef          	jal	75a <printf>
  68:	fd844783          	lbu	a5,-40(s0)
  6c:	9fa5                	addw	a5,a5,s1
  6e:	fcf40c23          	sb	a5,-40(s0)
  72:	20200593          	li	a1,514
  76:	fd040513          	addi	a0,s0,-48
  7a:	308000ef          	jal	382 <open>
  7e:	892a                	mv	s2,a0
  80:	44d1                	li	s1,20
  82:	20000613          	li	a2,512
  86:	dd040593          	addi	a1,s0,-560
  8a:	854a                	mv	a0,s2
  8c:	2d6000ef          	jal	362 <write>
  90:	34fd                	addiw	s1,s1,-1
  92:	f8e5                	bnez	s1,82 <main+0x82>
  94:	854a                	mv	a0,s2
  96:	2d4000ef          	jal	36a <close>
  9a:	00001517          	auipc	a0,0x1
  9e:	89e50513          	addi	a0,a0,-1890 # 938 <malloc+0x12a>
  a2:	6b8000ef          	jal	75a <printf>
  a6:	4581                	li	a1,0
  a8:	fd040513          	addi	a0,s0,-48
  ac:	2d6000ef          	jal	382 <open>
  b0:	892a                	mv	s2,a0
  b2:	44d1                	li	s1,20
  b4:	20000613          	li	a2,512
  b8:	dd040593          	addi	a1,s0,-560
  bc:	854a                	mv	a0,s2
  be:	29c000ef          	jal	35a <read>
  c2:	34fd                	addiw	s1,s1,-1
  c4:	f8e5                	bnez	s1,b4 <main+0xb4>
  c6:	854a                	mv	a0,s2
  c8:	2a2000ef          	jal	36a <close>
  cc:	4501                	li	a0,0
  ce:	27c000ef          	jal	34a <wait>
  d2:	4501                	li	a0,0
  d4:	26e000ef          	jal	342 <exit>

00000000000000d8 <start>:
  d8:	1141                	addi	sp,sp,-16
  da:	e406                	sd	ra,8(sp)
  dc:	e022                	sd	s0,0(sp)
  de:	0800                	addi	s0,sp,16
  e0:	f21ff0ef          	jal	0 <main>
  e4:	4501                	li	a0,0
  e6:	25c000ef          	jal	342 <exit>

00000000000000ea <strcpy>:
  ea:	1141                	addi	sp,sp,-16
  ec:	e422                	sd	s0,8(sp)
  ee:	0800                	addi	s0,sp,16
  f0:	87aa                	mv	a5,a0
  f2:	0585                	addi	a1,a1,1
  f4:	0785                	addi	a5,a5,1
  f6:	fff5c703          	lbu	a4,-1(a1)
  fa:	fee78fa3          	sb	a4,-1(a5)
  fe:	fb75                	bnez	a4,f2 <strcpy+0x8>
 100:	6422                	ld	s0,8(sp)
 102:	0141                	addi	sp,sp,16
 104:	8082                	ret

0000000000000106 <strcmp>:
 106:	1141                	addi	sp,sp,-16
 108:	e422                	sd	s0,8(sp)
 10a:	0800                	addi	s0,sp,16
 10c:	00054783          	lbu	a5,0(a0)
 110:	cb91                	beqz	a5,124 <strcmp+0x1e>
 112:	0005c703          	lbu	a4,0(a1)
 116:	00f71763          	bne	a4,a5,124 <strcmp+0x1e>
 11a:	0505                	addi	a0,a0,1
 11c:	0585                	addi	a1,a1,1
 11e:	00054783          	lbu	a5,0(a0)
 122:	fbe5                	bnez	a5,112 <strcmp+0xc>
 124:	0005c503          	lbu	a0,0(a1)
 128:	40a7853b          	subw	a0,a5,a0
 12c:	6422                	ld	s0,8(sp)
 12e:	0141                	addi	sp,sp,16
 130:	8082                	ret

0000000000000132 <strlen>:
 132:	1141                	addi	sp,sp,-16
 134:	e422                	sd	s0,8(sp)
 136:	0800                	addi	s0,sp,16
 138:	00054783          	lbu	a5,0(a0)
 13c:	cf91                	beqz	a5,158 <strlen+0x26>
 13e:	0505                	addi	a0,a0,1
 140:	87aa                	mv	a5,a0
 142:	86be                	mv	a3,a5
 144:	0785                	addi	a5,a5,1
 146:	fff7c703          	lbu	a4,-1(a5)
 14a:	ff65                	bnez	a4,142 <strlen+0x10>
 14c:	40a6853b          	subw	a0,a3,a0
 150:	2505                	addiw	a0,a0,1
 152:	6422                	ld	s0,8(sp)
 154:	0141                	addi	sp,sp,16
 156:	8082                	ret
 158:	4501                	li	a0,0
 15a:	bfe5                	j	152 <strlen+0x20>

000000000000015c <memset>:
 15c:	1141                	addi	sp,sp,-16
 15e:	e422                	sd	s0,8(sp)
 160:	0800                	addi	s0,sp,16
 162:	ca19                	beqz	a2,178 <memset+0x1c>
 164:	87aa                	mv	a5,a0
 166:	1602                	slli	a2,a2,0x20
 168:	9201                	srli	a2,a2,0x20
 16a:	00a60733          	add	a4,a2,a0
 16e:	00b78023          	sb	a1,0(a5)
 172:	0785                	addi	a5,a5,1
 174:	fee79de3          	bne	a5,a4,16e <memset+0x12>
 178:	6422                	ld	s0,8(sp)
 17a:	0141                	addi	sp,sp,16
 17c:	8082                	ret

000000000000017e <strchr>:
 17e:	1141                	addi	sp,sp,-16
 180:	e422                	sd	s0,8(sp)
 182:	0800                	addi	s0,sp,16
 184:	00054783          	lbu	a5,0(a0)
 188:	cb99                	beqz	a5,19e <strchr+0x20>
 18a:	00f58763          	beq	a1,a5,198 <strchr+0x1a>
 18e:	0505                	addi	a0,a0,1
 190:	00054783          	lbu	a5,0(a0)
 194:	fbfd                	bnez	a5,18a <strchr+0xc>
 196:	4501                	li	a0,0
 198:	6422                	ld	s0,8(sp)
 19a:	0141                	addi	sp,sp,16
 19c:	8082                	ret
 19e:	4501                	li	a0,0
 1a0:	bfe5                	j	198 <strchr+0x1a>

00000000000001a2 <gets>:
 1a2:	711d                	addi	sp,sp,-96
 1a4:	ec86                	sd	ra,88(sp)
 1a6:	e8a2                	sd	s0,80(sp)
 1a8:	e4a6                	sd	s1,72(sp)
 1aa:	e0ca                	sd	s2,64(sp)
 1ac:	fc4e                	sd	s3,56(sp)
 1ae:	f852                	sd	s4,48(sp)
 1b0:	f456                	sd	s5,40(sp)
 1b2:	f05a                	sd	s6,32(sp)
 1b4:	ec5e                	sd	s7,24(sp)
 1b6:	1080                	addi	s0,sp,96
 1b8:	8baa                	mv	s7,a0
 1ba:	8a2e                	mv	s4,a1
 1bc:	892a                	mv	s2,a0
 1be:	4481                	li	s1,0
 1c0:	4aa9                	li	s5,10
 1c2:	4b35                	li	s6,13
 1c4:	89a6                	mv	s3,s1
 1c6:	2485                	addiw	s1,s1,1
 1c8:	0344d663          	bge	s1,s4,1f4 <gets+0x52>
 1cc:	4605                	li	a2,1
 1ce:	faf40593          	addi	a1,s0,-81
 1d2:	4501                	li	a0,0
 1d4:	186000ef          	jal	35a <read>
 1d8:	00a05e63          	blez	a0,1f4 <gets+0x52>
 1dc:	faf44783          	lbu	a5,-81(s0)
 1e0:	00f90023          	sb	a5,0(s2)
 1e4:	01578763          	beq	a5,s5,1f2 <gets+0x50>
 1e8:	0905                	addi	s2,s2,1
 1ea:	fd679de3          	bne	a5,s6,1c4 <gets+0x22>
 1ee:	89a6                	mv	s3,s1
 1f0:	a011                	j	1f4 <gets+0x52>
 1f2:	89a6                	mv	s3,s1
 1f4:	99de                	add	s3,s3,s7
 1f6:	00098023          	sb	zero,0(s3)
 1fa:	855e                	mv	a0,s7
 1fc:	60e6                	ld	ra,88(sp)
 1fe:	6446                	ld	s0,80(sp)
 200:	64a6                	ld	s1,72(sp)
 202:	6906                	ld	s2,64(sp)
 204:	79e2                	ld	s3,56(sp)
 206:	7a42                	ld	s4,48(sp)
 208:	7aa2                	ld	s5,40(sp)
 20a:	7b02                	ld	s6,32(sp)
 20c:	6be2                	ld	s7,24(sp)
 20e:	6125                	addi	sp,sp,96
 210:	8082                	ret

0000000000000212 <stat>:
 212:	1101                	addi	sp,sp,-32
 214:	ec06                	sd	ra,24(sp)
 216:	e822                	sd	s0,16(sp)
 218:	e04a                	sd	s2,0(sp)
 21a:	1000                	addi	s0,sp,32
 21c:	892e                	mv	s2,a1
 21e:	4581                	li	a1,0
 220:	162000ef          	jal	382 <open>
 224:	02054263          	bltz	a0,248 <stat+0x36>
 228:	e426                	sd	s1,8(sp)
 22a:	84aa                	mv	s1,a0
 22c:	85ca                	mv	a1,s2
 22e:	16c000ef          	jal	39a <fstat>
 232:	892a                	mv	s2,a0
 234:	8526                	mv	a0,s1
 236:	134000ef          	jal	36a <close>
 23a:	64a2                	ld	s1,8(sp)
 23c:	854a                	mv	a0,s2
 23e:	60e2                	ld	ra,24(sp)
 240:	6442                	ld	s0,16(sp)
 242:	6902                	ld	s2,0(sp)
 244:	6105                	addi	sp,sp,32
 246:	8082                	ret
 248:	597d                	li	s2,-1
 24a:	bfcd                	j	23c <stat+0x2a>

000000000000024c <atoi>:
 24c:	1141                	addi	sp,sp,-16
 24e:	e422                	sd	s0,8(sp)
 250:	0800                	addi	s0,sp,16
 252:	00054683          	lbu	a3,0(a0)
 256:	fd06879b          	addiw	a5,a3,-48
 25a:	0ff7f793          	zext.b	a5,a5
 25e:	4625                	li	a2,9
 260:	02f66863          	bltu	a2,a5,290 <atoi+0x44>
 264:	872a                	mv	a4,a0
 266:	4501                	li	a0,0
 268:	0705                	addi	a4,a4,1
 26a:	0025179b          	slliw	a5,a0,0x2
 26e:	9fa9                	addw	a5,a5,a0
 270:	0017979b          	slliw	a5,a5,0x1
 274:	9fb5                	addw	a5,a5,a3
 276:	fd07851b          	addiw	a0,a5,-48
 27a:	00074683          	lbu	a3,0(a4)
 27e:	fd06879b          	addiw	a5,a3,-48
 282:	0ff7f793          	zext.b	a5,a5
 286:	fef671e3          	bgeu	a2,a5,268 <atoi+0x1c>
 28a:	6422                	ld	s0,8(sp)
 28c:	0141                	addi	sp,sp,16
 28e:	8082                	ret
 290:	4501                	li	a0,0
 292:	bfe5                	j	28a <atoi+0x3e>

0000000000000294 <memmove>:
 294:	1141                	addi	sp,sp,-16
 296:	e422                	sd	s0,8(sp)
 298:	0800                	addi	s0,sp,16
 29a:	02b57463          	bgeu	a0,a1,2c2 <memmove+0x2e>
 29e:	00c05f63          	blez	a2,2bc <memmove+0x28>
 2a2:	1602                	slli	a2,a2,0x20
 2a4:	9201                	srli	a2,a2,0x20
 2a6:	00c507b3          	add	a5,a0,a2
 2aa:	872a                	mv	a4,a0
 2ac:	0585                	addi	a1,a1,1
 2ae:	0705                	addi	a4,a4,1
 2b0:	fff5c683          	lbu	a3,-1(a1)
 2b4:	fed70fa3          	sb	a3,-1(a4)
 2b8:	fef71ae3          	bne	a4,a5,2ac <memmove+0x18>
 2bc:	6422                	ld	s0,8(sp)
 2be:	0141                	addi	sp,sp,16
 2c0:	8082                	ret
 2c2:	00c50733          	add	a4,a0,a2
 2c6:	95b2                	add	a1,a1,a2
 2c8:	fec05ae3          	blez	a2,2bc <memmove+0x28>
 2cc:	fff6079b          	addiw	a5,a2,-1
 2d0:	1782                	slli	a5,a5,0x20
 2d2:	9381                	srli	a5,a5,0x20
 2d4:	fff7c793          	not	a5,a5
 2d8:	97ba                	add	a5,a5,a4
 2da:	15fd                	addi	a1,a1,-1
 2dc:	177d                	addi	a4,a4,-1
 2de:	0005c683          	lbu	a3,0(a1)
 2e2:	00d70023          	sb	a3,0(a4)
 2e6:	fee79ae3          	bne	a5,a4,2da <memmove+0x46>
 2ea:	bfc9                	j	2bc <memmove+0x28>

00000000000002ec <memcmp>:
 2ec:	1141                	addi	sp,sp,-16
 2ee:	e422                	sd	s0,8(sp)
 2f0:	0800                	addi	s0,sp,16
 2f2:	ca05                	beqz	a2,322 <memcmp+0x36>
 2f4:	fff6069b          	addiw	a3,a2,-1
 2f8:	1682                	slli	a3,a3,0x20
 2fa:	9281                	srli	a3,a3,0x20
 2fc:	0685                	addi	a3,a3,1
 2fe:	96aa                	add	a3,a3,a0
 300:	00054783          	lbu	a5,0(a0)
 304:	0005c703          	lbu	a4,0(a1)
 308:	00e79863          	bne	a5,a4,318 <memcmp+0x2c>
 30c:	0505                	addi	a0,a0,1
 30e:	0585                	addi	a1,a1,1
 310:	fed518e3          	bne	a0,a3,300 <memcmp+0x14>
 314:	4501                	li	a0,0
 316:	a019                	j	31c <memcmp+0x30>
 318:	40e7853b          	subw	a0,a5,a4
 31c:	6422                	ld	s0,8(sp)
 31e:	0141                	addi	sp,sp,16
 320:	8082                	ret
 322:	4501                	li	a0,0
 324:	bfe5                	j	31c <memcmp+0x30>

0000000000000326 <memcpy>:
 326:	1141                	addi	sp,sp,-16
 328:	e406                	sd	ra,8(sp)
 32a:	e022                	sd	s0,0(sp)
 32c:	0800                	addi	s0,sp,16
 32e:	f67ff0ef          	jal	294 <memmove>
 332:	60a2                	ld	ra,8(sp)
 334:	6402                	ld	s0,0(sp)
 336:	0141                	addi	sp,sp,16
 338:	8082                	ret

000000000000033a <fork>:
 33a:	4885                	li	a7,1
 33c:	00000073          	ecall
 340:	8082                	ret

0000000000000342 <exit>:
 342:	4889                	li	a7,2
 344:	00000073          	ecall
 348:	8082                	ret

000000000000034a <wait>:
 34a:	488d                	li	a7,3
 34c:	00000073          	ecall
 350:	8082                	ret

0000000000000352 <pipe>:
 352:	4891                	li	a7,4
 354:	00000073          	ecall
 358:	8082                	ret

000000000000035a <read>:
 35a:	4895                	li	a7,5
 35c:	00000073          	ecall
 360:	8082                	ret

0000000000000362 <write>:
 362:	48c1                	li	a7,16
 364:	00000073          	ecall
 368:	8082                	ret

000000000000036a <close>:
 36a:	48d5                	li	a7,21
 36c:	00000073          	ecall
 370:	8082                	ret

0000000000000372 <kill>:
 372:	4899                	li	a7,6
 374:	00000073          	ecall
 378:	8082                	ret

000000000000037a <exec>:
 37a:	489d                	li	a7,7
 37c:	00000073          	ecall
 380:	8082                	ret

0000000000000382 <open>:
 382:	48bd                	li	a7,15
 384:	00000073          	ecall
 388:	8082                	ret

000000000000038a <mknod>:
 38a:	48c5                	li	a7,17
 38c:	00000073          	ecall
 390:	8082                	ret

0000000000000392 <unlink>:
 392:	48c9                	li	a7,18
 394:	00000073          	ecall
 398:	8082                	ret

000000000000039a <fstat>:
 39a:	48a1                	li	a7,8
 39c:	00000073          	ecall
 3a0:	8082                	ret

00000000000003a2 <link>:
 3a2:	48cd                	li	a7,19
 3a4:	00000073          	ecall
 3a8:	8082                	ret

00000000000003aa <mkdir>:
 3aa:	48d1                	li	a7,20
 3ac:	00000073          	ecall
 3b0:	8082                	ret

00000000000003b2 <chdir>:
 3b2:	48a5                	li	a7,9
 3b4:	00000073          	ecall
 3b8:	8082                	ret

00000000000003ba <dup>:
 3ba:	48a9                	li	a7,10
 3bc:	00000073          	ecall
 3c0:	8082                	ret

00000000000003c2 <getpid>:
 3c2:	48ad                	li	a7,11
 3c4:	00000073          	ecall
 3c8:	8082                	ret

00000000000003ca <sbrk>:
 3ca:	48b1                	li	a7,12
 3cc:	00000073          	ecall
 3d0:	8082                	ret

00000000000003d2 <sleep>:
 3d2:	48b5                	li	a7,13
 3d4:	00000073          	ecall
 3d8:	8082                	ret

00000000000003da <uptime>:
 3da:	48b9                	li	a7,14
 3dc:	00000073          	ecall
 3e0:	8082                	ret

00000000000003e2 <putc>:
 3e2:	1101                	addi	sp,sp,-32
 3e4:	ec06                	sd	ra,24(sp)
 3e6:	e822                	sd	s0,16(sp)
 3e8:	1000                	addi	s0,sp,32
 3ea:	feb407a3          	sb	a1,-17(s0)
 3ee:	4605                	li	a2,1
 3f0:	fef40593          	addi	a1,s0,-17
 3f4:	f6fff0ef          	jal	362 <write>
 3f8:	60e2                	ld	ra,24(sp)
 3fa:	6442                	ld	s0,16(sp)
 3fc:	6105                	addi	sp,sp,32
 3fe:	8082                	ret

0000000000000400 <printint>:
 400:	7139                	addi	sp,sp,-64
 402:	fc06                	sd	ra,56(sp)
 404:	f822                	sd	s0,48(sp)
 406:	f426                	sd	s1,40(sp)
 408:	0080                	addi	s0,sp,64
 40a:	84aa                	mv	s1,a0
 40c:	c299                	beqz	a3,412 <printint+0x12>
 40e:	0805c963          	bltz	a1,4a0 <printint+0xa0>
 412:	2581                	sext.w	a1,a1
 414:	4881                	li	a7,0
 416:	fc040693          	addi	a3,s0,-64
 41a:	4701                	li	a4,0
 41c:	2601                	sext.w	a2,a2
 41e:	00000517          	auipc	a0,0x0
 422:	53a50513          	addi	a0,a0,1338 # 958 <digits>
 426:	883a                	mv	a6,a4
 428:	2705                	addiw	a4,a4,1
 42a:	02c5f7bb          	remuw	a5,a1,a2
 42e:	1782                	slli	a5,a5,0x20
 430:	9381                	srli	a5,a5,0x20
 432:	97aa                	add	a5,a5,a0
 434:	0007c783          	lbu	a5,0(a5)
 438:	00f68023          	sb	a5,0(a3)
 43c:	0005879b          	sext.w	a5,a1
 440:	02c5d5bb          	divuw	a1,a1,a2
 444:	0685                	addi	a3,a3,1
 446:	fec7f0e3          	bgeu	a5,a2,426 <printint+0x26>
 44a:	00088c63          	beqz	a7,462 <printint+0x62>
 44e:	fd070793          	addi	a5,a4,-48
 452:	00878733          	add	a4,a5,s0
 456:	02d00793          	li	a5,45
 45a:	fef70823          	sb	a5,-16(a4)
 45e:	0028071b          	addiw	a4,a6,2
 462:	02e05a63          	blez	a4,496 <printint+0x96>
 466:	f04a                	sd	s2,32(sp)
 468:	ec4e                	sd	s3,24(sp)
 46a:	fc040793          	addi	a5,s0,-64
 46e:	00e78933          	add	s2,a5,a4
 472:	fff78993          	addi	s3,a5,-1
 476:	99ba                	add	s3,s3,a4
 478:	377d                	addiw	a4,a4,-1
 47a:	1702                	slli	a4,a4,0x20
 47c:	9301                	srli	a4,a4,0x20
 47e:	40e989b3          	sub	s3,s3,a4
 482:	fff94583          	lbu	a1,-1(s2)
 486:	8526                	mv	a0,s1
 488:	f5bff0ef          	jal	3e2 <putc>
 48c:	197d                	addi	s2,s2,-1
 48e:	ff391ae3          	bne	s2,s3,482 <printint+0x82>
 492:	7902                	ld	s2,32(sp)
 494:	69e2                	ld	s3,24(sp)
 496:	70e2                	ld	ra,56(sp)
 498:	7442                	ld	s0,48(sp)
 49a:	74a2                	ld	s1,40(sp)
 49c:	6121                	addi	sp,sp,64
 49e:	8082                	ret
 4a0:	40b005bb          	negw	a1,a1
 4a4:	4885                	li	a7,1
 4a6:	bf85                	j	416 <printint+0x16>

00000000000004a8 <vprintf>:
 4a8:	711d                	addi	sp,sp,-96
 4aa:	ec86                	sd	ra,88(sp)
 4ac:	e8a2                	sd	s0,80(sp)
 4ae:	e0ca                	sd	s2,64(sp)
 4b0:	1080                	addi	s0,sp,96
 4b2:	0005c903          	lbu	s2,0(a1)
 4b6:	26090863          	beqz	s2,726 <vprintf+0x27e>
 4ba:	e4a6                	sd	s1,72(sp)
 4bc:	fc4e                	sd	s3,56(sp)
 4be:	f852                	sd	s4,48(sp)
 4c0:	f456                	sd	s5,40(sp)
 4c2:	f05a                	sd	s6,32(sp)
 4c4:	ec5e                	sd	s7,24(sp)
 4c6:	e862                	sd	s8,16(sp)
 4c8:	e466                	sd	s9,8(sp)
 4ca:	8b2a                	mv	s6,a0
 4cc:	8a2e                	mv	s4,a1
 4ce:	8bb2                	mv	s7,a2
 4d0:	4981                	li	s3,0
 4d2:	4481                	li	s1,0
 4d4:	4701                	li	a4,0
 4d6:	02500a93          	li	s5,37
 4da:	06400c13          	li	s8,100
 4de:	06c00c93          	li	s9,108
 4e2:	a005                	j	502 <vprintf+0x5a>
 4e4:	85ca                	mv	a1,s2
 4e6:	855a                	mv	a0,s6
 4e8:	efbff0ef          	jal	3e2 <putc>
 4ec:	a019                	j	4f2 <vprintf+0x4a>
 4ee:	03598263          	beq	s3,s5,512 <vprintf+0x6a>
 4f2:	2485                	addiw	s1,s1,1
 4f4:	8726                	mv	a4,s1
 4f6:	009a07b3          	add	a5,s4,s1
 4fa:	0007c903          	lbu	s2,0(a5)
 4fe:	20090c63          	beqz	s2,716 <vprintf+0x26e>
 502:	0009079b          	sext.w	a5,s2
 506:	fe0994e3          	bnez	s3,4ee <vprintf+0x46>
 50a:	fd579de3          	bne	a5,s5,4e4 <vprintf+0x3c>
 50e:	89be                	mv	s3,a5
 510:	b7cd                	j	4f2 <vprintf+0x4a>
 512:	00ea06b3          	add	a3,s4,a4
 516:	0016c683          	lbu	a3,1(a3)
 51a:	8636                	mv	a2,a3
 51c:	c681                	beqz	a3,524 <vprintf+0x7c>
 51e:	9752                	add	a4,a4,s4
 520:	00274603          	lbu	a2,2(a4)
 524:	03878f63          	beq	a5,s8,562 <vprintf+0xba>
 528:	05978963          	beq	a5,s9,57a <vprintf+0xd2>
 52c:	07500713          	li	a4,117
 530:	0ee78363          	beq	a5,a4,616 <vprintf+0x16e>
 534:	07800713          	li	a4,120
 538:	12e78563          	beq	a5,a4,662 <vprintf+0x1ba>
 53c:	07000713          	li	a4,112
 540:	14e78a63          	beq	a5,a4,694 <vprintf+0x1ec>
 544:	07300713          	li	a4,115
 548:	18e78a63          	beq	a5,a4,6dc <vprintf+0x234>
 54c:	02500713          	li	a4,37
 550:	04e79563          	bne	a5,a4,59a <vprintf+0xf2>
 554:	02500593          	li	a1,37
 558:	855a                	mv	a0,s6
 55a:	e89ff0ef          	jal	3e2 <putc>
 55e:	4981                	li	s3,0
 560:	bf49                	j	4f2 <vprintf+0x4a>
 562:	008b8913          	addi	s2,s7,8
 566:	4685                	li	a3,1
 568:	4629                	li	a2,10
 56a:	000ba583          	lw	a1,0(s7)
 56e:	855a                	mv	a0,s6
 570:	e91ff0ef          	jal	400 <printint>
 574:	8bca                	mv	s7,s2
 576:	4981                	li	s3,0
 578:	bfad                	j	4f2 <vprintf+0x4a>
 57a:	06400793          	li	a5,100
 57e:	02f68963          	beq	a3,a5,5b0 <vprintf+0x108>
 582:	06c00793          	li	a5,108
 586:	04f68263          	beq	a3,a5,5ca <vprintf+0x122>
 58a:	07500793          	li	a5,117
 58e:	0af68063          	beq	a3,a5,62e <vprintf+0x186>
 592:	07800793          	li	a5,120
 596:	0ef68263          	beq	a3,a5,67a <vprintf+0x1d2>
 59a:	02500593          	li	a1,37
 59e:	855a                	mv	a0,s6
 5a0:	e43ff0ef          	jal	3e2 <putc>
 5a4:	85ca                	mv	a1,s2
 5a6:	855a                	mv	a0,s6
 5a8:	e3bff0ef          	jal	3e2 <putc>
 5ac:	4981                	li	s3,0
 5ae:	b791                	j	4f2 <vprintf+0x4a>
 5b0:	008b8913          	addi	s2,s7,8
 5b4:	4685                	li	a3,1
 5b6:	4629                	li	a2,10
 5b8:	000ba583          	lw	a1,0(s7)
 5bc:	855a                	mv	a0,s6
 5be:	e43ff0ef          	jal	400 <printint>
 5c2:	2485                	addiw	s1,s1,1
 5c4:	8bca                	mv	s7,s2
 5c6:	4981                	li	s3,0
 5c8:	b72d                	j	4f2 <vprintf+0x4a>
 5ca:	06400793          	li	a5,100
 5ce:	02f60763          	beq	a2,a5,5fc <vprintf+0x154>
 5d2:	07500793          	li	a5,117
 5d6:	06f60963          	beq	a2,a5,648 <vprintf+0x1a0>
 5da:	07800793          	li	a5,120
 5de:	faf61ee3          	bne	a2,a5,59a <vprintf+0xf2>
 5e2:	008b8913          	addi	s2,s7,8
 5e6:	4681                	li	a3,0
 5e8:	4641                	li	a2,16
 5ea:	000ba583          	lw	a1,0(s7)
 5ee:	855a                	mv	a0,s6
 5f0:	e11ff0ef          	jal	400 <printint>
 5f4:	2489                	addiw	s1,s1,2
 5f6:	8bca                	mv	s7,s2
 5f8:	4981                	li	s3,0
 5fa:	bde5                	j	4f2 <vprintf+0x4a>
 5fc:	008b8913          	addi	s2,s7,8
 600:	4685                	li	a3,1
 602:	4629                	li	a2,10
 604:	000ba583          	lw	a1,0(s7)
 608:	855a                	mv	a0,s6
 60a:	df7ff0ef          	jal	400 <printint>
 60e:	2489                	addiw	s1,s1,2
 610:	8bca                	mv	s7,s2
 612:	4981                	li	s3,0
 614:	bdf9                	j	4f2 <vprintf+0x4a>
 616:	008b8913          	addi	s2,s7,8
 61a:	4681                	li	a3,0
 61c:	4629                	li	a2,10
 61e:	000ba583          	lw	a1,0(s7)
 622:	855a                	mv	a0,s6
 624:	dddff0ef          	jal	400 <printint>
 628:	8bca                	mv	s7,s2
 62a:	4981                	li	s3,0
 62c:	b5d9                	j	4f2 <vprintf+0x4a>
 62e:	008b8913          	addi	s2,s7,8
 632:	4681                	li	a3,0
 634:	4629                	li	a2,10
 636:	000ba583          	lw	a1,0(s7)
 63a:	855a                	mv	a0,s6
 63c:	dc5ff0ef          	jal	400 <printint>
 640:	2485                	addiw	s1,s1,1
 642:	8bca                	mv	s7,s2
 644:	4981                	li	s3,0
 646:	b575                	j	4f2 <vprintf+0x4a>
 648:	008b8913          	addi	s2,s7,8
 64c:	4681                	li	a3,0
 64e:	4629                	li	a2,10
 650:	000ba583          	lw	a1,0(s7)
 654:	855a                	mv	a0,s6
 656:	dabff0ef          	jal	400 <printint>
 65a:	2489                	addiw	s1,s1,2
 65c:	8bca                	mv	s7,s2
 65e:	4981                	li	s3,0
 660:	bd49                	j	4f2 <vprintf+0x4a>
 662:	008b8913          	addi	s2,s7,8
 666:	4681                	li	a3,0
 668:	4641                	li	a2,16
 66a:	000ba583          	lw	a1,0(s7)
 66e:	855a                	mv	a0,s6
 670:	d91ff0ef          	jal	400 <printint>
 674:	8bca                	mv	s7,s2
 676:	4981                	li	s3,0
 678:	bdad                	j	4f2 <vprintf+0x4a>
 67a:	008b8913          	addi	s2,s7,8
 67e:	4681                	li	a3,0
 680:	4641                	li	a2,16
 682:	000ba583          	lw	a1,0(s7)
 686:	855a                	mv	a0,s6
 688:	d79ff0ef          	jal	400 <printint>
 68c:	2485                	addiw	s1,s1,1
 68e:	8bca                	mv	s7,s2
 690:	4981                	li	s3,0
 692:	b585                	j	4f2 <vprintf+0x4a>
 694:	e06a                	sd	s10,0(sp)
 696:	008b8d13          	addi	s10,s7,8
 69a:	000bb983          	ld	s3,0(s7)
 69e:	03000593          	li	a1,48
 6a2:	855a                	mv	a0,s6
 6a4:	d3fff0ef          	jal	3e2 <putc>
 6a8:	07800593          	li	a1,120
 6ac:	855a                	mv	a0,s6
 6ae:	d35ff0ef          	jal	3e2 <putc>
 6b2:	4941                	li	s2,16
 6b4:	00000b97          	auipc	s7,0x0
 6b8:	2a4b8b93          	addi	s7,s7,676 # 958 <digits>
 6bc:	03c9d793          	srli	a5,s3,0x3c
 6c0:	97de                	add	a5,a5,s7
 6c2:	0007c583          	lbu	a1,0(a5)
 6c6:	855a                	mv	a0,s6
 6c8:	d1bff0ef          	jal	3e2 <putc>
 6cc:	0992                	slli	s3,s3,0x4
 6ce:	397d                	addiw	s2,s2,-1
 6d0:	fe0916e3          	bnez	s2,6bc <vprintf+0x214>
 6d4:	8bea                	mv	s7,s10
 6d6:	4981                	li	s3,0
 6d8:	6d02                	ld	s10,0(sp)
 6da:	bd21                	j	4f2 <vprintf+0x4a>
 6dc:	008b8993          	addi	s3,s7,8
 6e0:	000bb903          	ld	s2,0(s7)
 6e4:	00090f63          	beqz	s2,702 <vprintf+0x25a>
 6e8:	00094583          	lbu	a1,0(s2)
 6ec:	c195                	beqz	a1,710 <vprintf+0x268>
 6ee:	855a                	mv	a0,s6
 6f0:	cf3ff0ef          	jal	3e2 <putc>
 6f4:	0905                	addi	s2,s2,1
 6f6:	00094583          	lbu	a1,0(s2)
 6fa:	f9f5                	bnez	a1,6ee <vprintf+0x246>
 6fc:	8bce                	mv	s7,s3
 6fe:	4981                	li	s3,0
 700:	bbcd                	j	4f2 <vprintf+0x4a>
 702:	00000917          	auipc	s2,0x0
 706:	24e90913          	addi	s2,s2,590 # 950 <malloc+0x142>
 70a:	02800593          	li	a1,40
 70e:	b7c5                	j	6ee <vprintf+0x246>
 710:	8bce                	mv	s7,s3
 712:	4981                	li	s3,0
 714:	bbf9                	j	4f2 <vprintf+0x4a>
 716:	64a6                	ld	s1,72(sp)
 718:	79e2                	ld	s3,56(sp)
 71a:	7a42                	ld	s4,48(sp)
 71c:	7aa2                	ld	s5,40(sp)
 71e:	7b02                	ld	s6,32(sp)
 720:	6be2                	ld	s7,24(sp)
 722:	6c42                	ld	s8,16(sp)
 724:	6ca2                	ld	s9,8(sp)
 726:	60e6                	ld	ra,88(sp)
 728:	6446                	ld	s0,80(sp)
 72a:	6906                	ld	s2,64(sp)
 72c:	6125                	addi	sp,sp,96
 72e:	8082                	ret

0000000000000730 <fprintf>:
 730:	715d                	addi	sp,sp,-80
 732:	ec06                	sd	ra,24(sp)
 734:	e822                	sd	s0,16(sp)
 736:	1000                	addi	s0,sp,32
 738:	e010                	sd	a2,0(s0)
 73a:	e414                	sd	a3,8(s0)
 73c:	e818                	sd	a4,16(s0)
 73e:	ec1c                	sd	a5,24(s0)
 740:	03043023          	sd	a6,32(s0)
 744:	03143423          	sd	a7,40(s0)
 748:	fe843423          	sd	s0,-24(s0)
 74c:	8622                	mv	a2,s0
 74e:	d5bff0ef          	jal	4a8 <vprintf>
 752:	60e2                	ld	ra,24(sp)
 754:	6442                	ld	s0,16(sp)
 756:	6161                	addi	sp,sp,80
 758:	8082                	ret

000000000000075a <printf>:
 75a:	711d                	addi	sp,sp,-96
 75c:	ec06                	sd	ra,24(sp)
 75e:	e822                	sd	s0,16(sp)
 760:	1000                	addi	s0,sp,32
 762:	e40c                	sd	a1,8(s0)
 764:	e810                	sd	a2,16(s0)
 766:	ec14                	sd	a3,24(s0)
 768:	f018                	sd	a4,32(s0)
 76a:	f41c                	sd	a5,40(s0)
 76c:	03043823          	sd	a6,48(s0)
 770:	03143c23          	sd	a7,56(s0)
 774:	00840613          	addi	a2,s0,8
 778:	fec43423          	sd	a2,-24(s0)
 77c:	85aa                	mv	a1,a0
 77e:	4505                	li	a0,1
 780:	d29ff0ef          	jal	4a8 <vprintf>
 784:	60e2                	ld	ra,24(sp)
 786:	6442                	ld	s0,16(sp)
 788:	6125                	addi	sp,sp,96
 78a:	8082                	ret

000000000000078c <free>:
 78c:	1141                	addi	sp,sp,-16
 78e:	e422                	sd	s0,8(sp)
 790:	0800                	addi	s0,sp,16
 792:	ff050693          	addi	a3,a0,-16
 796:	00001797          	auipc	a5,0x1
 79a:	86a7b783          	ld	a5,-1942(a5) # 1000 <freep>
 79e:	a02d                	j	7c8 <free+0x3c>
 7a0:	4618                	lw	a4,8(a2)
 7a2:	9f2d                	addw	a4,a4,a1
 7a4:	fee52c23          	sw	a4,-8(a0)
 7a8:	6398                	ld	a4,0(a5)
 7aa:	6310                	ld	a2,0(a4)
 7ac:	a83d                	j	7ea <free+0x5e>
 7ae:	ff852703          	lw	a4,-8(a0)
 7b2:	9f31                	addw	a4,a4,a2
 7b4:	c798                	sw	a4,8(a5)
 7b6:	ff053683          	ld	a3,-16(a0)
 7ba:	a091                	j	7fe <free+0x72>
 7bc:	6398                	ld	a4,0(a5)
 7be:	00e7e463          	bltu	a5,a4,7c6 <free+0x3a>
 7c2:	00e6ea63          	bltu	a3,a4,7d6 <free+0x4a>
 7c6:	87ba                	mv	a5,a4
 7c8:	fed7fae3          	bgeu	a5,a3,7bc <free+0x30>
 7cc:	6398                	ld	a4,0(a5)
 7ce:	00e6e463          	bltu	a3,a4,7d6 <free+0x4a>
 7d2:	fee7eae3          	bltu	a5,a4,7c6 <free+0x3a>
 7d6:	ff852583          	lw	a1,-8(a0)
 7da:	6390                	ld	a2,0(a5)
 7dc:	02059813          	slli	a6,a1,0x20
 7e0:	01c85713          	srli	a4,a6,0x1c
 7e4:	9736                	add	a4,a4,a3
 7e6:	fae60de3          	beq	a2,a4,7a0 <free+0x14>
 7ea:	fec53823          	sd	a2,-16(a0)
 7ee:	4790                	lw	a2,8(a5)
 7f0:	02061593          	slli	a1,a2,0x20
 7f4:	01c5d713          	srli	a4,a1,0x1c
 7f8:	973e                	add	a4,a4,a5
 7fa:	fae68ae3          	beq	a3,a4,7ae <free+0x22>
 7fe:	e394                	sd	a3,0(a5)
 800:	00001717          	auipc	a4,0x1
 804:	80f73023          	sd	a5,-2048(a4) # 1000 <freep>
 808:	6422                	ld	s0,8(sp)
 80a:	0141                	addi	sp,sp,16
 80c:	8082                	ret

000000000000080e <malloc>:
 80e:	7139                	addi	sp,sp,-64
 810:	fc06                	sd	ra,56(sp)
 812:	f822                	sd	s0,48(sp)
 814:	f426                	sd	s1,40(sp)
 816:	ec4e                	sd	s3,24(sp)
 818:	0080                	addi	s0,sp,64
 81a:	02051493          	slli	s1,a0,0x20
 81e:	9081                	srli	s1,s1,0x20
 820:	04bd                	addi	s1,s1,15
 822:	8091                	srli	s1,s1,0x4
 824:	0014899b          	addiw	s3,s1,1
 828:	0485                	addi	s1,s1,1
 82a:	00000517          	auipc	a0,0x0
 82e:	7d653503          	ld	a0,2006(a0) # 1000 <freep>
 832:	c915                	beqz	a0,866 <malloc+0x58>
 834:	611c                	ld	a5,0(a0)
 836:	4798                	lw	a4,8(a5)
 838:	08977a63          	bgeu	a4,s1,8cc <malloc+0xbe>
 83c:	f04a                	sd	s2,32(sp)
 83e:	e852                	sd	s4,16(sp)
 840:	e456                	sd	s5,8(sp)
 842:	e05a                	sd	s6,0(sp)
 844:	8a4e                	mv	s4,s3
 846:	0009871b          	sext.w	a4,s3
 84a:	6685                	lui	a3,0x1
 84c:	00d77363          	bgeu	a4,a3,852 <malloc+0x44>
 850:	6a05                	lui	s4,0x1
 852:	000a0b1b          	sext.w	s6,s4
 856:	004a1a1b          	slliw	s4,s4,0x4
 85a:	00000917          	auipc	s2,0x0
 85e:	7a690913          	addi	s2,s2,1958 # 1000 <freep>
 862:	5afd                	li	s5,-1
 864:	a081                	j	8a4 <malloc+0x96>
 866:	f04a                	sd	s2,32(sp)
 868:	e852                	sd	s4,16(sp)
 86a:	e456                	sd	s5,8(sp)
 86c:	e05a                	sd	s6,0(sp)
 86e:	00000797          	auipc	a5,0x0
 872:	7a278793          	addi	a5,a5,1954 # 1010 <base>
 876:	00000717          	auipc	a4,0x0
 87a:	78f73523          	sd	a5,1930(a4) # 1000 <freep>
 87e:	e39c                	sd	a5,0(a5)
 880:	0007a423          	sw	zero,8(a5)
 884:	b7c1                	j	844 <malloc+0x36>
 886:	6398                	ld	a4,0(a5)
 888:	e118                	sd	a4,0(a0)
 88a:	a8a9                	j	8e4 <malloc+0xd6>
 88c:	01652423          	sw	s6,8(a0)
 890:	0541                	addi	a0,a0,16
 892:	efbff0ef          	jal	78c <free>
 896:	00093503          	ld	a0,0(s2)
 89a:	c12d                	beqz	a0,8fc <malloc+0xee>
 89c:	611c                	ld	a5,0(a0)
 89e:	4798                	lw	a4,8(a5)
 8a0:	02977263          	bgeu	a4,s1,8c4 <malloc+0xb6>
 8a4:	00093703          	ld	a4,0(s2)
 8a8:	853e                	mv	a0,a5
 8aa:	fef719e3          	bne	a4,a5,89c <malloc+0x8e>
 8ae:	8552                	mv	a0,s4
 8b0:	b1bff0ef          	jal	3ca <sbrk>
 8b4:	fd551ce3          	bne	a0,s5,88c <malloc+0x7e>
 8b8:	4501                	li	a0,0
 8ba:	7902                	ld	s2,32(sp)
 8bc:	6a42                	ld	s4,16(sp)
 8be:	6aa2                	ld	s5,8(sp)
 8c0:	6b02                	ld	s6,0(sp)
 8c2:	a03d                	j	8f0 <malloc+0xe2>
 8c4:	7902                	ld	s2,32(sp)
 8c6:	6a42                	ld	s4,16(sp)
 8c8:	6aa2                	ld	s5,8(sp)
 8ca:	6b02                	ld	s6,0(sp)
 8cc:	fae48de3          	beq	s1,a4,886 <malloc+0x78>
 8d0:	4137073b          	subw	a4,a4,s3
 8d4:	c798                	sw	a4,8(a5)
 8d6:	02071693          	slli	a3,a4,0x20
 8da:	01c6d713          	srli	a4,a3,0x1c
 8de:	97ba                	add	a5,a5,a4
 8e0:	0137a423          	sw	s3,8(a5)
 8e4:	00000717          	auipc	a4,0x0
 8e8:	70a73e23          	sd	a0,1820(a4) # 1000 <freep>
 8ec:	01078513          	addi	a0,a5,16
 8f0:	70e2                	ld	ra,56(sp)
 8f2:	7442                	ld	s0,48(sp)
 8f4:	74a2                	ld	s1,40(sp)
 8f6:	69e2                	ld	s3,24(sp)
 8f8:	6121                	addi	sp,sp,64
 8fa:	8082                	ret
 8fc:	7902                	ld	s2,32(sp)
 8fe:	6a42                	ld	s4,16(sp)
 900:	6aa2                	ld	s5,8(sp)
 902:	6b02                	ld	s6,0(sp)
 904:	b7f5                	j	8f0 <malloc+0xe2>
