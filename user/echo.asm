
user/_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
   0:	7139                	addi	sp,sp,-64
   2:	fc06                	sd	ra,56(sp)
   4:	f822                	sd	s0,48(sp)
   6:	f426                	sd	s1,40(sp)
   8:	f04a                	sd	s2,32(sp)
   a:	ec4e                	sd	s3,24(sp)
   c:	e852                	sd	s4,16(sp)
   e:	e456                	sd	s5,8(sp)
  10:	0080                	addi	s0,sp,64
  int i;

  for(i = 1; i < argc; i++){
  12:	4785                	li	a5,1
  14:	06a7d063          	bge	a5,a0,74 <main+0x74>
  18:	00858493          	addi	s1,a1,8
  1c:	3579                	addiw	a0,a0,-2
  1e:	02051793          	slli	a5,a0,0x20
  22:	01d7d513          	srli	a0,a5,0x1d
  26:	00a48a33          	add	s4,s1,a0
  2a:	05c1                	addi	a1,a1,16
  2c:	00a589b3          	add	s3,a1,a0
    write(1, argv[i], strlen(argv[i]));
    if(i + 1 < argc){
      write(1, " ", 1);
  30:	00001a97          	auipc	s5,0x1
  34:	880a8a93          	addi	s5,s5,-1920 # 8b0 <malloc+0x100>
  38:	a809                	j	4a <main+0x4a>
  3a:	4605                	li	a2,1
  3c:	85d6                	mv	a1,s5
  3e:	4505                	li	a0,1
  40:	2c4000ef          	jal	304 <write>
  for(i = 1; i < argc; i++){
  44:	04a1                	addi	s1,s1,8
  46:	03348763          	beq	s1,s3,74 <main+0x74>
    write(1, argv[i], strlen(argv[i]));
  4a:	0004b903          	ld	s2,0(s1)
  4e:	854a                	mv	a0,s2
  50:	084000ef          	jal	d4 <strlen>
  54:	0005061b          	sext.w	a2,a0
  58:	85ca                	mv	a1,s2
  5a:	4505                	li	a0,1
  5c:	2a8000ef          	jal	304 <write>
    if(i + 1 < argc){
  60:	fd449de3          	bne	s1,s4,3a <main+0x3a>
    } else {
      write(1, "\n", 1);
  64:	4605                	li	a2,1
  66:	00001597          	auipc	a1,0x1
  6a:	85258593          	addi	a1,a1,-1966 # 8b8 <malloc+0x108>
  6e:	4505                	li	a0,1
  70:	294000ef          	jal	304 <write>
    }
  }
  exit(0);
  74:	4501                	li	a0,0
  76:	26e000ef          	jal	2e4 <exit>

000000000000007a <start>:
  7a:	1141                	addi	sp,sp,-16
  7c:	e406                	sd	ra,8(sp)
  7e:	e022                	sd	s0,0(sp)
  80:	0800                	addi	s0,sp,16
  82:	f7fff0ef          	jal	0 <main>
  86:	4501                	li	a0,0
  88:	25c000ef          	jal	2e4 <exit>

000000000000008c <strcpy>:
  8c:	1141                	addi	sp,sp,-16
  8e:	e422                	sd	s0,8(sp)
  90:	0800                	addi	s0,sp,16
  92:	87aa                	mv	a5,a0
  94:	0585                	addi	a1,a1,1
  96:	0785                	addi	a5,a5,1
  98:	fff5c703          	lbu	a4,-1(a1)
  9c:	fee78fa3          	sb	a4,-1(a5)
  a0:	fb75                	bnez	a4,94 <strcpy+0x8>
  a2:	6422                	ld	s0,8(sp)
  a4:	0141                	addi	sp,sp,16
  a6:	8082                	ret

00000000000000a8 <strcmp>:
  a8:	1141                	addi	sp,sp,-16
  aa:	e422                	sd	s0,8(sp)
  ac:	0800                	addi	s0,sp,16
  ae:	00054783          	lbu	a5,0(a0)
  b2:	cb91                	beqz	a5,c6 <strcmp+0x1e>
  b4:	0005c703          	lbu	a4,0(a1)
  b8:	00f71763          	bne	a4,a5,c6 <strcmp+0x1e>
  bc:	0505                	addi	a0,a0,1
  be:	0585                	addi	a1,a1,1
  c0:	00054783          	lbu	a5,0(a0)
  c4:	fbe5                	bnez	a5,b4 <strcmp+0xc>
  c6:	0005c503          	lbu	a0,0(a1)
  ca:	40a7853b          	subw	a0,a5,a0
  ce:	6422                	ld	s0,8(sp)
  d0:	0141                	addi	sp,sp,16
  d2:	8082                	ret

00000000000000d4 <strlen>:
  d4:	1141                	addi	sp,sp,-16
  d6:	e422                	sd	s0,8(sp)
  d8:	0800                	addi	s0,sp,16
  da:	00054783          	lbu	a5,0(a0)
  de:	cf91                	beqz	a5,fa <strlen+0x26>
  e0:	0505                	addi	a0,a0,1
  e2:	87aa                	mv	a5,a0
  e4:	86be                	mv	a3,a5
  e6:	0785                	addi	a5,a5,1
  e8:	fff7c703          	lbu	a4,-1(a5)
  ec:	ff65                	bnez	a4,e4 <strlen+0x10>
  ee:	40a6853b          	subw	a0,a3,a0
  f2:	2505                	addiw	a0,a0,1
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret
  fa:	4501                	li	a0,0
  fc:	bfe5                	j	f4 <strlen+0x20>

00000000000000fe <memset>:
  fe:	1141                	addi	sp,sp,-16
 100:	e422                	sd	s0,8(sp)
 102:	0800                	addi	s0,sp,16
 104:	ca19                	beqz	a2,11a <memset+0x1c>
 106:	87aa                	mv	a5,a0
 108:	1602                	slli	a2,a2,0x20
 10a:	9201                	srli	a2,a2,0x20
 10c:	00a60733          	add	a4,a2,a0
 110:	00b78023          	sb	a1,0(a5)
 114:	0785                	addi	a5,a5,1
 116:	fee79de3          	bne	a5,a4,110 <memset+0x12>
 11a:	6422                	ld	s0,8(sp)
 11c:	0141                	addi	sp,sp,16
 11e:	8082                	ret

0000000000000120 <strchr>:
 120:	1141                	addi	sp,sp,-16
 122:	e422                	sd	s0,8(sp)
 124:	0800                	addi	s0,sp,16
 126:	00054783          	lbu	a5,0(a0)
 12a:	cb99                	beqz	a5,140 <strchr+0x20>
 12c:	00f58763          	beq	a1,a5,13a <strchr+0x1a>
 130:	0505                	addi	a0,a0,1
 132:	00054783          	lbu	a5,0(a0)
 136:	fbfd                	bnez	a5,12c <strchr+0xc>
 138:	4501                	li	a0,0
 13a:	6422                	ld	s0,8(sp)
 13c:	0141                	addi	sp,sp,16
 13e:	8082                	ret
 140:	4501                	li	a0,0
 142:	bfe5                	j	13a <strchr+0x1a>

0000000000000144 <gets>:
 144:	711d                	addi	sp,sp,-96
 146:	ec86                	sd	ra,88(sp)
 148:	e8a2                	sd	s0,80(sp)
 14a:	e4a6                	sd	s1,72(sp)
 14c:	e0ca                	sd	s2,64(sp)
 14e:	fc4e                	sd	s3,56(sp)
 150:	f852                	sd	s4,48(sp)
 152:	f456                	sd	s5,40(sp)
 154:	f05a                	sd	s6,32(sp)
 156:	ec5e                	sd	s7,24(sp)
 158:	1080                	addi	s0,sp,96
 15a:	8baa                	mv	s7,a0
 15c:	8a2e                	mv	s4,a1
 15e:	892a                	mv	s2,a0
 160:	4481                	li	s1,0
 162:	4aa9                	li	s5,10
 164:	4b35                	li	s6,13
 166:	89a6                	mv	s3,s1
 168:	2485                	addiw	s1,s1,1
 16a:	0344d663          	bge	s1,s4,196 <gets+0x52>
 16e:	4605                	li	a2,1
 170:	faf40593          	addi	a1,s0,-81
 174:	4501                	li	a0,0
 176:	186000ef          	jal	2fc <read>
 17a:	00a05e63          	blez	a0,196 <gets+0x52>
 17e:	faf44783          	lbu	a5,-81(s0)
 182:	00f90023          	sb	a5,0(s2)
 186:	01578763          	beq	a5,s5,194 <gets+0x50>
 18a:	0905                	addi	s2,s2,1
 18c:	fd679de3          	bne	a5,s6,166 <gets+0x22>
 190:	89a6                	mv	s3,s1
 192:	a011                	j	196 <gets+0x52>
 194:	89a6                	mv	s3,s1
 196:	99de                	add	s3,s3,s7
 198:	00098023          	sb	zero,0(s3)
 19c:	855e                	mv	a0,s7
 19e:	60e6                	ld	ra,88(sp)
 1a0:	6446                	ld	s0,80(sp)
 1a2:	64a6                	ld	s1,72(sp)
 1a4:	6906                	ld	s2,64(sp)
 1a6:	79e2                	ld	s3,56(sp)
 1a8:	7a42                	ld	s4,48(sp)
 1aa:	7aa2                	ld	s5,40(sp)
 1ac:	7b02                	ld	s6,32(sp)
 1ae:	6be2                	ld	s7,24(sp)
 1b0:	6125                	addi	sp,sp,96
 1b2:	8082                	ret

00000000000001b4 <stat>:
 1b4:	1101                	addi	sp,sp,-32
 1b6:	ec06                	sd	ra,24(sp)
 1b8:	e822                	sd	s0,16(sp)
 1ba:	e04a                	sd	s2,0(sp)
 1bc:	1000                	addi	s0,sp,32
 1be:	892e                	mv	s2,a1
 1c0:	4581                	li	a1,0
 1c2:	162000ef          	jal	324 <open>
 1c6:	02054263          	bltz	a0,1ea <stat+0x36>
 1ca:	e426                	sd	s1,8(sp)
 1cc:	84aa                	mv	s1,a0
 1ce:	85ca                	mv	a1,s2
 1d0:	16c000ef          	jal	33c <fstat>
 1d4:	892a                	mv	s2,a0
 1d6:	8526                	mv	a0,s1
 1d8:	134000ef          	jal	30c <close>
 1dc:	64a2                	ld	s1,8(sp)
 1de:	854a                	mv	a0,s2
 1e0:	60e2                	ld	ra,24(sp)
 1e2:	6442                	ld	s0,16(sp)
 1e4:	6902                	ld	s2,0(sp)
 1e6:	6105                	addi	sp,sp,32
 1e8:	8082                	ret
 1ea:	597d                	li	s2,-1
 1ec:	bfcd                	j	1de <stat+0x2a>

00000000000001ee <atoi>:
 1ee:	1141                	addi	sp,sp,-16
 1f0:	e422                	sd	s0,8(sp)
 1f2:	0800                	addi	s0,sp,16
 1f4:	00054683          	lbu	a3,0(a0)
 1f8:	fd06879b          	addiw	a5,a3,-48
 1fc:	0ff7f793          	zext.b	a5,a5
 200:	4625                	li	a2,9
 202:	02f66863          	bltu	a2,a5,232 <atoi+0x44>
 206:	872a                	mv	a4,a0
 208:	4501                	li	a0,0
 20a:	0705                	addi	a4,a4,1
 20c:	0025179b          	slliw	a5,a0,0x2
 210:	9fa9                	addw	a5,a5,a0
 212:	0017979b          	slliw	a5,a5,0x1
 216:	9fb5                	addw	a5,a5,a3
 218:	fd07851b          	addiw	a0,a5,-48
 21c:	00074683          	lbu	a3,0(a4)
 220:	fd06879b          	addiw	a5,a3,-48
 224:	0ff7f793          	zext.b	a5,a5
 228:	fef671e3          	bgeu	a2,a5,20a <atoi+0x1c>
 22c:	6422                	ld	s0,8(sp)
 22e:	0141                	addi	sp,sp,16
 230:	8082                	ret
 232:	4501                	li	a0,0
 234:	bfe5                	j	22c <atoi+0x3e>

0000000000000236 <memmove>:
 236:	1141                	addi	sp,sp,-16
 238:	e422                	sd	s0,8(sp)
 23a:	0800                	addi	s0,sp,16
 23c:	02b57463          	bgeu	a0,a1,264 <memmove+0x2e>
 240:	00c05f63          	blez	a2,25e <memmove+0x28>
 244:	1602                	slli	a2,a2,0x20
 246:	9201                	srli	a2,a2,0x20
 248:	00c507b3          	add	a5,a0,a2
 24c:	872a                	mv	a4,a0
 24e:	0585                	addi	a1,a1,1
 250:	0705                	addi	a4,a4,1
 252:	fff5c683          	lbu	a3,-1(a1)
 256:	fed70fa3          	sb	a3,-1(a4)
 25a:	fef71ae3          	bne	a4,a5,24e <memmove+0x18>
 25e:	6422                	ld	s0,8(sp)
 260:	0141                	addi	sp,sp,16
 262:	8082                	ret
 264:	00c50733          	add	a4,a0,a2
 268:	95b2                	add	a1,a1,a2
 26a:	fec05ae3          	blez	a2,25e <memmove+0x28>
 26e:	fff6079b          	addiw	a5,a2,-1
 272:	1782                	slli	a5,a5,0x20
 274:	9381                	srli	a5,a5,0x20
 276:	fff7c793          	not	a5,a5
 27a:	97ba                	add	a5,a5,a4
 27c:	15fd                	addi	a1,a1,-1
 27e:	177d                	addi	a4,a4,-1
 280:	0005c683          	lbu	a3,0(a1)
 284:	00d70023          	sb	a3,0(a4)
 288:	fee79ae3          	bne	a5,a4,27c <memmove+0x46>
 28c:	bfc9                	j	25e <memmove+0x28>

000000000000028e <memcmp>:
 28e:	1141                	addi	sp,sp,-16
 290:	e422                	sd	s0,8(sp)
 292:	0800                	addi	s0,sp,16
 294:	ca05                	beqz	a2,2c4 <memcmp+0x36>
 296:	fff6069b          	addiw	a3,a2,-1
 29a:	1682                	slli	a3,a3,0x20
 29c:	9281                	srli	a3,a3,0x20
 29e:	0685                	addi	a3,a3,1
 2a0:	96aa                	add	a3,a3,a0
 2a2:	00054783          	lbu	a5,0(a0)
 2a6:	0005c703          	lbu	a4,0(a1)
 2aa:	00e79863          	bne	a5,a4,2ba <memcmp+0x2c>
 2ae:	0505                	addi	a0,a0,1
 2b0:	0585                	addi	a1,a1,1
 2b2:	fed518e3          	bne	a0,a3,2a2 <memcmp+0x14>
 2b6:	4501                	li	a0,0
 2b8:	a019                	j	2be <memcmp+0x30>
 2ba:	40e7853b          	subw	a0,a5,a4
 2be:	6422                	ld	s0,8(sp)
 2c0:	0141                	addi	sp,sp,16
 2c2:	8082                	ret
 2c4:	4501                	li	a0,0
 2c6:	bfe5                	j	2be <memcmp+0x30>

00000000000002c8 <memcpy>:
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e406                	sd	ra,8(sp)
 2cc:	e022                	sd	s0,0(sp)
 2ce:	0800                	addi	s0,sp,16
 2d0:	f67ff0ef          	jal	236 <memmove>
 2d4:	60a2                	ld	ra,8(sp)
 2d6:	6402                	ld	s0,0(sp)
 2d8:	0141                	addi	sp,sp,16
 2da:	8082                	ret

00000000000002dc <fork>:
 2dc:	4885                	li	a7,1
 2de:	00000073          	ecall
 2e2:	8082                	ret

00000000000002e4 <exit>:
 2e4:	4889                	li	a7,2
 2e6:	00000073          	ecall
 2ea:	8082                	ret

00000000000002ec <wait>:
 2ec:	488d                	li	a7,3
 2ee:	00000073          	ecall
 2f2:	8082                	ret

00000000000002f4 <pipe>:
 2f4:	4891                	li	a7,4
 2f6:	00000073          	ecall
 2fa:	8082                	ret

00000000000002fc <read>:
 2fc:	4895                	li	a7,5
 2fe:	00000073          	ecall
 302:	8082                	ret

0000000000000304 <write>:
 304:	48c1                	li	a7,16
 306:	00000073          	ecall
 30a:	8082                	ret

000000000000030c <close>:
 30c:	48d5                	li	a7,21
 30e:	00000073          	ecall
 312:	8082                	ret

0000000000000314 <kill>:
 314:	4899                	li	a7,6
 316:	00000073          	ecall
 31a:	8082                	ret

000000000000031c <exec>:
 31c:	489d                	li	a7,7
 31e:	00000073          	ecall
 322:	8082                	ret

0000000000000324 <open>:
 324:	48bd                	li	a7,15
 326:	00000073          	ecall
 32a:	8082                	ret

000000000000032c <mknod>:
 32c:	48c5                	li	a7,17
 32e:	00000073          	ecall
 332:	8082                	ret

0000000000000334 <unlink>:
 334:	48c9                	li	a7,18
 336:	00000073          	ecall
 33a:	8082                	ret

000000000000033c <fstat>:
 33c:	48a1                	li	a7,8
 33e:	00000073          	ecall
 342:	8082                	ret

0000000000000344 <link>:
 344:	48cd                	li	a7,19
 346:	00000073          	ecall
 34a:	8082                	ret

000000000000034c <mkdir>:
 34c:	48d1                	li	a7,20
 34e:	00000073          	ecall
 352:	8082                	ret

0000000000000354 <chdir>:
 354:	48a5                	li	a7,9
 356:	00000073          	ecall
 35a:	8082                	ret

000000000000035c <dup>:
 35c:	48a9                	li	a7,10
 35e:	00000073          	ecall
 362:	8082                	ret

0000000000000364 <getpid>:
 364:	48ad                	li	a7,11
 366:	00000073          	ecall
 36a:	8082                	ret

000000000000036c <sbrk>:
 36c:	48b1                	li	a7,12
 36e:	00000073          	ecall
 372:	8082                	ret

0000000000000374 <sleep>:
 374:	48b5                	li	a7,13
 376:	00000073          	ecall
 37a:	8082                	ret

000000000000037c <uptime>:
 37c:	48b9                	li	a7,14
 37e:	00000073          	ecall
 382:	8082                	ret

0000000000000384 <putc>:
 384:	1101                	addi	sp,sp,-32
 386:	ec06                	sd	ra,24(sp)
 388:	e822                	sd	s0,16(sp)
 38a:	1000                	addi	s0,sp,32
 38c:	feb407a3          	sb	a1,-17(s0)
 390:	4605                	li	a2,1
 392:	fef40593          	addi	a1,s0,-17
 396:	f6fff0ef          	jal	304 <write>
 39a:	60e2                	ld	ra,24(sp)
 39c:	6442                	ld	s0,16(sp)
 39e:	6105                	addi	sp,sp,32
 3a0:	8082                	ret

00000000000003a2 <printint>:
 3a2:	7139                	addi	sp,sp,-64
 3a4:	fc06                	sd	ra,56(sp)
 3a6:	f822                	sd	s0,48(sp)
 3a8:	f426                	sd	s1,40(sp)
 3aa:	0080                	addi	s0,sp,64
 3ac:	84aa                	mv	s1,a0
 3ae:	c299                	beqz	a3,3b4 <printint+0x12>
 3b0:	0805c963          	bltz	a1,442 <printint+0xa0>
 3b4:	2581                	sext.w	a1,a1
 3b6:	4881                	li	a7,0
 3b8:	fc040693          	addi	a3,s0,-64
 3bc:	4701                	li	a4,0
 3be:	2601                	sext.w	a2,a2
 3c0:	00000517          	auipc	a0,0x0
 3c4:	50850513          	addi	a0,a0,1288 # 8c8 <digits>
 3c8:	883a                	mv	a6,a4
 3ca:	2705                	addiw	a4,a4,1
 3cc:	02c5f7bb          	remuw	a5,a1,a2
 3d0:	1782                	slli	a5,a5,0x20
 3d2:	9381                	srli	a5,a5,0x20
 3d4:	97aa                	add	a5,a5,a0
 3d6:	0007c783          	lbu	a5,0(a5)
 3da:	00f68023          	sb	a5,0(a3)
 3de:	0005879b          	sext.w	a5,a1
 3e2:	02c5d5bb          	divuw	a1,a1,a2
 3e6:	0685                	addi	a3,a3,1
 3e8:	fec7f0e3          	bgeu	a5,a2,3c8 <printint+0x26>
 3ec:	00088c63          	beqz	a7,404 <printint+0x62>
 3f0:	fd070793          	addi	a5,a4,-48
 3f4:	00878733          	add	a4,a5,s0
 3f8:	02d00793          	li	a5,45
 3fc:	fef70823          	sb	a5,-16(a4)
 400:	0028071b          	addiw	a4,a6,2
 404:	02e05a63          	blez	a4,438 <printint+0x96>
 408:	f04a                	sd	s2,32(sp)
 40a:	ec4e                	sd	s3,24(sp)
 40c:	fc040793          	addi	a5,s0,-64
 410:	00e78933          	add	s2,a5,a4
 414:	fff78993          	addi	s3,a5,-1
 418:	99ba                	add	s3,s3,a4
 41a:	377d                	addiw	a4,a4,-1
 41c:	1702                	slli	a4,a4,0x20
 41e:	9301                	srli	a4,a4,0x20
 420:	40e989b3          	sub	s3,s3,a4
 424:	fff94583          	lbu	a1,-1(s2)
 428:	8526                	mv	a0,s1
 42a:	f5bff0ef          	jal	384 <putc>
 42e:	197d                	addi	s2,s2,-1
 430:	ff391ae3          	bne	s2,s3,424 <printint+0x82>
 434:	7902                	ld	s2,32(sp)
 436:	69e2                	ld	s3,24(sp)
 438:	70e2                	ld	ra,56(sp)
 43a:	7442                	ld	s0,48(sp)
 43c:	74a2                	ld	s1,40(sp)
 43e:	6121                	addi	sp,sp,64
 440:	8082                	ret
 442:	40b005bb          	negw	a1,a1
 446:	4885                	li	a7,1
 448:	bf85                	j	3b8 <printint+0x16>

000000000000044a <vprintf>:
 44a:	711d                	addi	sp,sp,-96
 44c:	ec86                	sd	ra,88(sp)
 44e:	e8a2                	sd	s0,80(sp)
 450:	e0ca                	sd	s2,64(sp)
 452:	1080                	addi	s0,sp,96
 454:	0005c903          	lbu	s2,0(a1)
 458:	26090863          	beqz	s2,6c8 <vprintf+0x27e>
 45c:	e4a6                	sd	s1,72(sp)
 45e:	fc4e                	sd	s3,56(sp)
 460:	f852                	sd	s4,48(sp)
 462:	f456                	sd	s5,40(sp)
 464:	f05a                	sd	s6,32(sp)
 466:	ec5e                	sd	s7,24(sp)
 468:	e862                	sd	s8,16(sp)
 46a:	e466                	sd	s9,8(sp)
 46c:	8b2a                	mv	s6,a0
 46e:	8a2e                	mv	s4,a1
 470:	8bb2                	mv	s7,a2
 472:	4981                	li	s3,0
 474:	4481                	li	s1,0
 476:	4701                	li	a4,0
 478:	02500a93          	li	s5,37
 47c:	06400c13          	li	s8,100
 480:	06c00c93          	li	s9,108
 484:	a005                	j	4a4 <vprintf+0x5a>
 486:	85ca                	mv	a1,s2
 488:	855a                	mv	a0,s6
 48a:	efbff0ef          	jal	384 <putc>
 48e:	a019                	j	494 <vprintf+0x4a>
 490:	03598263          	beq	s3,s5,4b4 <vprintf+0x6a>
 494:	2485                	addiw	s1,s1,1
 496:	8726                	mv	a4,s1
 498:	009a07b3          	add	a5,s4,s1
 49c:	0007c903          	lbu	s2,0(a5)
 4a0:	20090c63          	beqz	s2,6b8 <vprintf+0x26e>
 4a4:	0009079b          	sext.w	a5,s2
 4a8:	fe0994e3          	bnez	s3,490 <vprintf+0x46>
 4ac:	fd579de3          	bne	a5,s5,486 <vprintf+0x3c>
 4b0:	89be                	mv	s3,a5
 4b2:	b7cd                	j	494 <vprintf+0x4a>
 4b4:	00ea06b3          	add	a3,s4,a4
 4b8:	0016c683          	lbu	a3,1(a3)
 4bc:	8636                	mv	a2,a3
 4be:	c681                	beqz	a3,4c6 <vprintf+0x7c>
 4c0:	9752                	add	a4,a4,s4
 4c2:	00274603          	lbu	a2,2(a4)
 4c6:	03878f63          	beq	a5,s8,504 <vprintf+0xba>
 4ca:	05978963          	beq	a5,s9,51c <vprintf+0xd2>
 4ce:	07500713          	li	a4,117
 4d2:	0ee78363          	beq	a5,a4,5b8 <vprintf+0x16e>
 4d6:	07800713          	li	a4,120
 4da:	12e78563          	beq	a5,a4,604 <vprintf+0x1ba>
 4de:	07000713          	li	a4,112
 4e2:	14e78a63          	beq	a5,a4,636 <vprintf+0x1ec>
 4e6:	07300713          	li	a4,115
 4ea:	18e78a63          	beq	a5,a4,67e <vprintf+0x234>
 4ee:	02500713          	li	a4,37
 4f2:	04e79563          	bne	a5,a4,53c <vprintf+0xf2>
 4f6:	02500593          	li	a1,37
 4fa:	855a                	mv	a0,s6
 4fc:	e89ff0ef          	jal	384 <putc>
 500:	4981                	li	s3,0
 502:	bf49                	j	494 <vprintf+0x4a>
 504:	008b8913          	addi	s2,s7,8
 508:	4685                	li	a3,1
 50a:	4629                	li	a2,10
 50c:	000ba583          	lw	a1,0(s7)
 510:	855a                	mv	a0,s6
 512:	e91ff0ef          	jal	3a2 <printint>
 516:	8bca                	mv	s7,s2
 518:	4981                	li	s3,0
 51a:	bfad                	j	494 <vprintf+0x4a>
 51c:	06400793          	li	a5,100
 520:	02f68963          	beq	a3,a5,552 <vprintf+0x108>
 524:	06c00793          	li	a5,108
 528:	04f68263          	beq	a3,a5,56c <vprintf+0x122>
 52c:	07500793          	li	a5,117
 530:	0af68063          	beq	a3,a5,5d0 <vprintf+0x186>
 534:	07800793          	li	a5,120
 538:	0ef68263          	beq	a3,a5,61c <vprintf+0x1d2>
 53c:	02500593          	li	a1,37
 540:	855a                	mv	a0,s6
 542:	e43ff0ef          	jal	384 <putc>
 546:	85ca                	mv	a1,s2
 548:	855a                	mv	a0,s6
 54a:	e3bff0ef          	jal	384 <putc>
 54e:	4981                	li	s3,0
 550:	b791                	j	494 <vprintf+0x4a>
 552:	008b8913          	addi	s2,s7,8
 556:	4685                	li	a3,1
 558:	4629                	li	a2,10
 55a:	000ba583          	lw	a1,0(s7)
 55e:	855a                	mv	a0,s6
 560:	e43ff0ef          	jal	3a2 <printint>
 564:	2485                	addiw	s1,s1,1
 566:	8bca                	mv	s7,s2
 568:	4981                	li	s3,0
 56a:	b72d                	j	494 <vprintf+0x4a>
 56c:	06400793          	li	a5,100
 570:	02f60763          	beq	a2,a5,59e <vprintf+0x154>
 574:	07500793          	li	a5,117
 578:	06f60963          	beq	a2,a5,5ea <vprintf+0x1a0>
 57c:	07800793          	li	a5,120
 580:	faf61ee3          	bne	a2,a5,53c <vprintf+0xf2>
 584:	008b8913          	addi	s2,s7,8
 588:	4681                	li	a3,0
 58a:	4641                	li	a2,16
 58c:	000ba583          	lw	a1,0(s7)
 590:	855a                	mv	a0,s6
 592:	e11ff0ef          	jal	3a2 <printint>
 596:	2489                	addiw	s1,s1,2
 598:	8bca                	mv	s7,s2
 59a:	4981                	li	s3,0
 59c:	bde5                	j	494 <vprintf+0x4a>
 59e:	008b8913          	addi	s2,s7,8
 5a2:	4685                	li	a3,1
 5a4:	4629                	li	a2,10
 5a6:	000ba583          	lw	a1,0(s7)
 5aa:	855a                	mv	a0,s6
 5ac:	df7ff0ef          	jal	3a2 <printint>
 5b0:	2489                	addiw	s1,s1,2
 5b2:	8bca                	mv	s7,s2
 5b4:	4981                	li	s3,0
 5b6:	bdf9                	j	494 <vprintf+0x4a>
 5b8:	008b8913          	addi	s2,s7,8
 5bc:	4681                	li	a3,0
 5be:	4629                	li	a2,10
 5c0:	000ba583          	lw	a1,0(s7)
 5c4:	855a                	mv	a0,s6
 5c6:	dddff0ef          	jal	3a2 <printint>
 5ca:	8bca                	mv	s7,s2
 5cc:	4981                	li	s3,0
 5ce:	b5d9                	j	494 <vprintf+0x4a>
 5d0:	008b8913          	addi	s2,s7,8
 5d4:	4681                	li	a3,0
 5d6:	4629                	li	a2,10
 5d8:	000ba583          	lw	a1,0(s7)
 5dc:	855a                	mv	a0,s6
 5de:	dc5ff0ef          	jal	3a2 <printint>
 5e2:	2485                	addiw	s1,s1,1
 5e4:	8bca                	mv	s7,s2
 5e6:	4981                	li	s3,0
 5e8:	b575                	j	494 <vprintf+0x4a>
 5ea:	008b8913          	addi	s2,s7,8
 5ee:	4681                	li	a3,0
 5f0:	4629                	li	a2,10
 5f2:	000ba583          	lw	a1,0(s7)
 5f6:	855a                	mv	a0,s6
 5f8:	dabff0ef          	jal	3a2 <printint>
 5fc:	2489                	addiw	s1,s1,2
 5fe:	8bca                	mv	s7,s2
 600:	4981                	li	s3,0
 602:	bd49                	j	494 <vprintf+0x4a>
 604:	008b8913          	addi	s2,s7,8
 608:	4681                	li	a3,0
 60a:	4641                	li	a2,16
 60c:	000ba583          	lw	a1,0(s7)
 610:	855a                	mv	a0,s6
 612:	d91ff0ef          	jal	3a2 <printint>
 616:	8bca                	mv	s7,s2
 618:	4981                	li	s3,0
 61a:	bdad                	j	494 <vprintf+0x4a>
 61c:	008b8913          	addi	s2,s7,8
 620:	4681                	li	a3,0
 622:	4641                	li	a2,16
 624:	000ba583          	lw	a1,0(s7)
 628:	855a                	mv	a0,s6
 62a:	d79ff0ef          	jal	3a2 <printint>
 62e:	2485                	addiw	s1,s1,1
 630:	8bca                	mv	s7,s2
 632:	4981                	li	s3,0
 634:	b585                	j	494 <vprintf+0x4a>
 636:	e06a                	sd	s10,0(sp)
 638:	008b8d13          	addi	s10,s7,8
 63c:	000bb983          	ld	s3,0(s7)
 640:	03000593          	li	a1,48
 644:	855a                	mv	a0,s6
 646:	d3fff0ef          	jal	384 <putc>
 64a:	07800593          	li	a1,120
 64e:	855a                	mv	a0,s6
 650:	d35ff0ef          	jal	384 <putc>
 654:	4941                	li	s2,16
 656:	00000b97          	auipc	s7,0x0
 65a:	272b8b93          	addi	s7,s7,626 # 8c8 <digits>
 65e:	03c9d793          	srli	a5,s3,0x3c
 662:	97de                	add	a5,a5,s7
 664:	0007c583          	lbu	a1,0(a5)
 668:	855a                	mv	a0,s6
 66a:	d1bff0ef          	jal	384 <putc>
 66e:	0992                	slli	s3,s3,0x4
 670:	397d                	addiw	s2,s2,-1
 672:	fe0916e3          	bnez	s2,65e <vprintf+0x214>
 676:	8bea                	mv	s7,s10
 678:	4981                	li	s3,0
 67a:	6d02                	ld	s10,0(sp)
 67c:	bd21                	j	494 <vprintf+0x4a>
 67e:	008b8993          	addi	s3,s7,8
 682:	000bb903          	ld	s2,0(s7)
 686:	00090f63          	beqz	s2,6a4 <vprintf+0x25a>
 68a:	00094583          	lbu	a1,0(s2)
 68e:	c195                	beqz	a1,6b2 <vprintf+0x268>
 690:	855a                	mv	a0,s6
 692:	cf3ff0ef          	jal	384 <putc>
 696:	0905                	addi	s2,s2,1
 698:	00094583          	lbu	a1,0(s2)
 69c:	f9f5                	bnez	a1,690 <vprintf+0x246>
 69e:	8bce                	mv	s7,s3
 6a0:	4981                	li	s3,0
 6a2:	bbcd                	j	494 <vprintf+0x4a>
 6a4:	00000917          	auipc	s2,0x0
 6a8:	21c90913          	addi	s2,s2,540 # 8c0 <malloc+0x110>
 6ac:	02800593          	li	a1,40
 6b0:	b7c5                	j	690 <vprintf+0x246>
 6b2:	8bce                	mv	s7,s3
 6b4:	4981                	li	s3,0
 6b6:	bbf9                	j	494 <vprintf+0x4a>
 6b8:	64a6                	ld	s1,72(sp)
 6ba:	79e2                	ld	s3,56(sp)
 6bc:	7a42                	ld	s4,48(sp)
 6be:	7aa2                	ld	s5,40(sp)
 6c0:	7b02                	ld	s6,32(sp)
 6c2:	6be2                	ld	s7,24(sp)
 6c4:	6c42                	ld	s8,16(sp)
 6c6:	6ca2                	ld	s9,8(sp)
 6c8:	60e6                	ld	ra,88(sp)
 6ca:	6446                	ld	s0,80(sp)
 6cc:	6906                	ld	s2,64(sp)
 6ce:	6125                	addi	sp,sp,96
 6d0:	8082                	ret

00000000000006d2 <fprintf>:
 6d2:	715d                	addi	sp,sp,-80
 6d4:	ec06                	sd	ra,24(sp)
 6d6:	e822                	sd	s0,16(sp)
 6d8:	1000                	addi	s0,sp,32
 6da:	e010                	sd	a2,0(s0)
 6dc:	e414                	sd	a3,8(s0)
 6de:	e818                	sd	a4,16(s0)
 6e0:	ec1c                	sd	a5,24(s0)
 6e2:	03043023          	sd	a6,32(s0)
 6e6:	03143423          	sd	a7,40(s0)
 6ea:	fe843423          	sd	s0,-24(s0)
 6ee:	8622                	mv	a2,s0
 6f0:	d5bff0ef          	jal	44a <vprintf>
 6f4:	60e2                	ld	ra,24(sp)
 6f6:	6442                	ld	s0,16(sp)
 6f8:	6161                	addi	sp,sp,80
 6fa:	8082                	ret

00000000000006fc <printf>:
 6fc:	711d                	addi	sp,sp,-96
 6fe:	ec06                	sd	ra,24(sp)
 700:	e822                	sd	s0,16(sp)
 702:	1000                	addi	s0,sp,32
 704:	e40c                	sd	a1,8(s0)
 706:	e810                	sd	a2,16(s0)
 708:	ec14                	sd	a3,24(s0)
 70a:	f018                	sd	a4,32(s0)
 70c:	f41c                	sd	a5,40(s0)
 70e:	03043823          	sd	a6,48(s0)
 712:	03143c23          	sd	a7,56(s0)
 716:	00840613          	addi	a2,s0,8
 71a:	fec43423          	sd	a2,-24(s0)
 71e:	85aa                	mv	a1,a0
 720:	4505                	li	a0,1
 722:	d29ff0ef          	jal	44a <vprintf>
 726:	60e2                	ld	ra,24(sp)
 728:	6442                	ld	s0,16(sp)
 72a:	6125                	addi	sp,sp,96
 72c:	8082                	ret

000000000000072e <free>:
 72e:	1141                	addi	sp,sp,-16
 730:	e422                	sd	s0,8(sp)
 732:	0800                	addi	s0,sp,16
 734:	ff050693          	addi	a3,a0,-16
 738:	00001797          	auipc	a5,0x1
 73c:	8c87b783          	ld	a5,-1848(a5) # 1000 <freep>
 740:	a02d                	j	76a <free+0x3c>
 742:	4618                	lw	a4,8(a2)
 744:	9f2d                	addw	a4,a4,a1
 746:	fee52c23          	sw	a4,-8(a0)
 74a:	6398                	ld	a4,0(a5)
 74c:	6310                	ld	a2,0(a4)
 74e:	a83d                	j	78c <free+0x5e>
 750:	ff852703          	lw	a4,-8(a0)
 754:	9f31                	addw	a4,a4,a2
 756:	c798                	sw	a4,8(a5)
 758:	ff053683          	ld	a3,-16(a0)
 75c:	a091                	j	7a0 <free+0x72>
 75e:	6398                	ld	a4,0(a5)
 760:	00e7e463          	bltu	a5,a4,768 <free+0x3a>
 764:	00e6ea63          	bltu	a3,a4,778 <free+0x4a>
 768:	87ba                	mv	a5,a4
 76a:	fed7fae3          	bgeu	a5,a3,75e <free+0x30>
 76e:	6398                	ld	a4,0(a5)
 770:	00e6e463          	bltu	a3,a4,778 <free+0x4a>
 774:	fee7eae3          	bltu	a5,a4,768 <free+0x3a>
 778:	ff852583          	lw	a1,-8(a0)
 77c:	6390                	ld	a2,0(a5)
 77e:	02059813          	slli	a6,a1,0x20
 782:	01c85713          	srli	a4,a6,0x1c
 786:	9736                	add	a4,a4,a3
 788:	fae60de3          	beq	a2,a4,742 <free+0x14>
 78c:	fec53823          	sd	a2,-16(a0)
 790:	4790                	lw	a2,8(a5)
 792:	02061593          	slli	a1,a2,0x20
 796:	01c5d713          	srli	a4,a1,0x1c
 79a:	973e                	add	a4,a4,a5
 79c:	fae68ae3          	beq	a3,a4,750 <free+0x22>
 7a0:	e394                	sd	a3,0(a5)
 7a2:	00001717          	auipc	a4,0x1
 7a6:	84f73f23          	sd	a5,-1954(a4) # 1000 <freep>
 7aa:	6422                	ld	s0,8(sp)
 7ac:	0141                	addi	sp,sp,16
 7ae:	8082                	ret

00000000000007b0 <malloc>:
 7b0:	7139                	addi	sp,sp,-64
 7b2:	fc06                	sd	ra,56(sp)
 7b4:	f822                	sd	s0,48(sp)
 7b6:	f426                	sd	s1,40(sp)
 7b8:	ec4e                	sd	s3,24(sp)
 7ba:	0080                	addi	s0,sp,64
 7bc:	02051493          	slli	s1,a0,0x20
 7c0:	9081                	srli	s1,s1,0x20
 7c2:	04bd                	addi	s1,s1,15
 7c4:	8091                	srli	s1,s1,0x4
 7c6:	0014899b          	addiw	s3,s1,1
 7ca:	0485                	addi	s1,s1,1
 7cc:	00001517          	auipc	a0,0x1
 7d0:	83453503          	ld	a0,-1996(a0) # 1000 <freep>
 7d4:	c915                	beqz	a0,808 <malloc+0x58>
 7d6:	611c                	ld	a5,0(a0)
 7d8:	4798                	lw	a4,8(a5)
 7da:	08977a63          	bgeu	a4,s1,86e <malloc+0xbe>
 7de:	f04a                	sd	s2,32(sp)
 7e0:	e852                	sd	s4,16(sp)
 7e2:	e456                	sd	s5,8(sp)
 7e4:	e05a                	sd	s6,0(sp)
 7e6:	8a4e                	mv	s4,s3
 7e8:	0009871b          	sext.w	a4,s3
 7ec:	6685                	lui	a3,0x1
 7ee:	00d77363          	bgeu	a4,a3,7f4 <malloc+0x44>
 7f2:	6a05                	lui	s4,0x1
 7f4:	000a0b1b          	sext.w	s6,s4
 7f8:	004a1a1b          	slliw	s4,s4,0x4
 7fc:	00001917          	auipc	s2,0x1
 800:	80490913          	addi	s2,s2,-2044 # 1000 <freep>
 804:	5afd                	li	s5,-1
 806:	a081                	j	846 <malloc+0x96>
 808:	f04a                	sd	s2,32(sp)
 80a:	e852                	sd	s4,16(sp)
 80c:	e456                	sd	s5,8(sp)
 80e:	e05a                	sd	s6,0(sp)
 810:	00001797          	auipc	a5,0x1
 814:	80078793          	addi	a5,a5,-2048 # 1010 <base>
 818:	00000717          	auipc	a4,0x0
 81c:	7ef73423          	sd	a5,2024(a4) # 1000 <freep>
 820:	e39c                	sd	a5,0(a5)
 822:	0007a423          	sw	zero,8(a5)
 826:	b7c1                	j	7e6 <malloc+0x36>
 828:	6398                	ld	a4,0(a5)
 82a:	e118                	sd	a4,0(a0)
 82c:	a8a9                	j	886 <malloc+0xd6>
 82e:	01652423          	sw	s6,8(a0)
 832:	0541                	addi	a0,a0,16
 834:	efbff0ef          	jal	72e <free>
 838:	00093503          	ld	a0,0(s2)
 83c:	c12d                	beqz	a0,89e <malloc+0xee>
 83e:	611c                	ld	a5,0(a0)
 840:	4798                	lw	a4,8(a5)
 842:	02977263          	bgeu	a4,s1,866 <malloc+0xb6>
 846:	00093703          	ld	a4,0(s2)
 84a:	853e                	mv	a0,a5
 84c:	fef719e3          	bne	a4,a5,83e <malloc+0x8e>
 850:	8552                	mv	a0,s4
 852:	b1bff0ef          	jal	36c <sbrk>
 856:	fd551ce3          	bne	a0,s5,82e <malloc+0x7e>
 85a:	4501                	li	a0,0
 85c:	7902                	ld	s2,32(sp)
 85e:	6a42                	ld	s4,16(sp)
 860:	6aa2                	ld	s5,8(sp)
 862:	6b02                	ld	s6,0(sp)
 864:	a03d                	j	892 <malloc+0xe2>
 866:	7902                	ld	s2,32(sp)
 868:	6a42                	ld	s4,16(sp)
 86a:	6aa2                	ld	s5,8(sp)
 86c:	6b02                	ld	s6,0(sp)
 86e:	fae48de3          	beq	s1,a4,828 <malloc+0x78>
 872:	4137073b          	subw	a4,a4,s3
 876:	c798                	sw	a4,8(a5)
 878:	02071693          	slli	a3,a4,0x20
 87c:	01c6d713          	srli	a4,a3,0x1c
 880:	97ba                	add	a5,a5,a4
 882:	0137a423          	sw	s3,8(a5)
 886:	00000717          	auipc	a4,0x0
 88a:	76a73d23          	sd	a0,1914(a4) # 1000 <freep>
 88e:	01078513          	addi	a0,a5,16
 892:	70e2                	ld	ra,56(sp)
 894:	7442                	ld	s0,48(sp)
 896:	74a2                	ld	s1,40(sp)
 898:	69e2                	ld	s3,24(sp)
 89a:	6121                	addi	sp,sp,64
 89c:	8082                	ret
 89e:	7902                	ld	s2,32(sp)
 8a0:	6a42                	ld	s4,16(sp)
 8a2:	6aa2                	ld	s5,8(sp)
 8a4:	6b02                	ld	s6,0(sp)
 8a6:	b7f5                	j	892 <malloc+0xe2>
