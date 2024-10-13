
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <filter>:
#include "kernel/stat.h"
#include "user/user.h"

void
filter(int lpipe[])
{
   0:	716d                	addi	sp,sp,-272
   2:	e606                	sd	ra,264(sp)
   4:	e222                	sd	s0,256(sp)
   6:	fda6                	sd	s1,248(sp)
   8:	f9ca                	sd	s2,240(sp)
   a:	f5ce                	sd	s3,232(sp)
   c:	0a00                	addi	s0,sp,272
   e:	89aa                	mv	s3,a0
  int rpipe[2];
  pipe(rpipe);
  10:	fc840513          	addi	a0,s0,-56
  14:	37c000ef          	jal	390 <pipe>

  int primes[50];
  int cnt = 0;
  char buf[1];

  while ((read(lpipe[0], buf, sizeof(buf))) != 0) {
  18:	f0040493          	addi	s1,s0,-256
  int cnt = 0;
  1c:	4901                	li	s2,0
  while ((read(lpipe[0], buf, sizeof(buf))) != 0) {
  1e:	a031                	j	2a <filter+0x2a>
    primes[cnt++] = buf[0];
  20:	2905                	addiw	s2,s2,1
  22:	ef844783          	lbu	a5,-264(s0)
  26:	c09c                	sw	a5,0(s1)
  28:	0491                	addi	s1,s1,4
  while ((read(lpipe[0], buf, sizeof(buf))) != 0) {
  2a:	4605                	li	a2,1
  2c:	ef840593          	addi	a1,s0,-264
  30:	0009a503          	lw	a0,0(s3)
  34:	364000ef          	jal	398 <read>
  38:	f565                	bnez	a0,20 <filter+0x20>
  }
  close(lpipe[0]);
  3a:	0009a503          	lw	a0,0(s3)
  3e:	36a000ef          	jal	3a8 <close>

  if (cnt == 0) return;
  42:	00091963          	bnez	s2,54 <filter+0x54>
  int pid = fork();
  if (pid == 0) {
    //child
    filter(rpipe);
  }
}
  46:	60b2                	ld	ra,264(sp)
  48:	6412                	ld	s0,256(sp)
  4a:	74ee                	ld	s1,248(sp)
  4c:	794e                	ld	s2,240(sp)
  4e:	79ae                	ld	s3,232(sp)
  50:	6151                	addi	sp,sp,272
  52:	8082                	ret
  54:	f1d2                	sd	s4,224(sp)
  int first = primes[0];
  56:	f0042a03          	lw	s4,-256(s0)
  printf("prime %d\n", first);
  5a:	85d2                	mv	a1,s4
  5c:	00001517          	auipc	a0,0x1
  60:	8f450513          	addi	a0,a0,-1804 # 950 <malloc+0x104>
  64:	734000ef          	jal	798 <printf>
  for (int i = 1; i < cnt; i++) {
  68:	4785                	li	a5,1
  6a:	0527d063          	bge	a5,s2,aa <filter+0xaa>
  6e:	f0440993          	addi	s3,s0,-252
  72:	ffe9049b          	addiw	s1,s2,-2
  76:	02049793          	slli	a5,s1,0x20
  7a:	01e7d493          	srli	s1,a5,0x1e
  7e:	f0840793          	addi	a5,s0,-248
  82:	94be                	add	s1,s1,a5
  84:	a021                	j	8c <filter+0x8c>
  86:	0991                	addi	s3,s3,4
  88:	02998163          	beq	s3,s1,aa <filter+0xaa>
    if (primes[i] % first != 0) {
  8c:	0009a783          	lw	a5,0(s3)
  90:	0347e73b          	remw	a4,a5,s4
  94:	db6d                	beqz	a4,86 <filter+0x86>
      char p = primes[i];
  96:	eef40ba3          	sb	a5,-265(s0)
      write(rpipe[1], &p, 1);
  9a:	4605                	li	a2,1
  9c:	ef740593          	addi	a1,s0,-265
  a0:	fcc42503          	lw	a0,-52(s0)
  a4:	2fc000ef          	jal	3a0 <write>
  a8:	bff9                	j	86 <filter+0x86>
  close(rpipe[1]);
  aa:	fcc42503          	lw	a0,-52(s0)
  ae:	2fa000ef          	jal	3a8 <close>
  int pid = fork();
  b2:	2c6000ef          	jal	378 <fork>
  if (pid == 0) {
  b6:	c119                	beqz	a0,bc <filter+0xbc>
  b8:	7a0e                	ld	s4,224(sp)
  ba:	b771                	j	46 <filter+0x46>
    filter(rpipe);
  bc:	fc840513          	addi	a0,s0,-56
  c0:	f41ff0ef          	jal	0 <filter>
  c4:	7a0e                	ld	s4,224(sp)
  c6:	b741                	j	46 <filter+0x46>

00000000000000c8 <main>:

int
main()
{
  c8:	7179                	addi	sp,sp,-48
  ca:	f406                	sd	ra,40(sp)
  cc:	f022                	sd	s0,32(sp)
  ce:	ec26                	sd	s1,24(sp)
  d0:	e84a                	sd	s2,16(sp)
  d2:	1800                	addi	s0,sp,48
  int lpipe[2];

  pipe(lpipe);
  d4:	fd840513          	addi	a0,s0,-40
  d8:	2b8000ef          	jal	390 <pipe>

  for (int i = 2; i <= 35; i++) {
  dc:	4489                	li	s1,2
  de:	02400913          	li	s2,36
    char p = i;
  e2:	fc940ba3          	sb	s1,-41(s0)
    write(lpipe[1], &p, 1);
  e6:	4605                	li	a2,1
  e8:	fd740593          	addi	a1,s0,-41
  ec:	fdc42503          	lw	a0,-36(s0)
  f0:	2b0000ef          	jal	3a0 <write>
  for (int i = 2; i <= 35; i++) {
  f4:	2485                	addiw	s1,s1,1
  f6:	ff2496e3          	bne	s1,s2,e2 <main+0x1a>
  }
  close(lpipe[1]);
  fa:	fdc42503          	lw	a0,-36(s0)
  fe:	2aa000ef          	jal	3a8 <close>

  filter(lpipe);
 102:	fd840513          	addi	a0,s0,-40
 106:	efbff0ef          	jal	0 <filter>

  wait((int *) 0);
 10a:	4501                	li	a0,0
 10c:	27c000ef          	jal	388 <wait>

  exit(0);
 110:	4501                	li	a0,0
 112:	26e000ef          	jal	380 <exit>

0000000000000116 <start>:
 116:	1141                	addi	sp,sp,-16
 118:	e406                	sd	ra,8(sp)
 11a:	e022                	sd	s0,0(sp)
 11c:	0800                	addi	s0,sp,16
 11e:	fabff0ef          	jal	c8 <main>
 122:	4501                	li	a0,0
 124:	25c000ef          	jal	380 <exit>

0000000000000128 <strcpy>:
 128:	1141                	addi	sp,sp,-16
 12a:	e422                	sd	s0,8(sp)
 12c:	0800                	addi	s0,sp,16
 12e:	87aa                	mv	a5,a0
 130:	0585                	addi	a1,a1,1
 132:	0785                	addi	a5,a5,1
 134:	fff5c703          	lbu	a4,-1(a1)
 138:	fee78fa3          	sb	a4,-1(a5)
 13c:	fb75                	bnez	a4,130 <strcpy+0x8>
 13e:	6422                	ld	s0,8(sp)
 140:	0141                	addi	sp,sp,16
 142:	8082                	ret

0000000000000144 <strcmp>:
 144:	1141                	addi	sp,sp,-16
 146:	e422                	sd	s0,8(sp)
 148:	0800                	addi	s0,sp,16
 14a:	00054783          	lbu	a5,0(a0)
 14e:	cb91                	beqz	a5,162 <strcmp+0x1e>
 150:	0005c703          	lbu	a4,0(a1)
 154:	00f71763          	bne	a4,a5,162 <strcmp+0x1e>
 158:	0505                	addi	a0,a0,1
 15a:	0585                	addi	a1,a1,1
 15c:	00054783          	lbu	a5,0(a0)
 160:	fbe5                	bnez	a5,150 <strcmp+0xc>
 162:	0005c503          	lbu	a0,0(a1)
 166:	40a7853b          	subw	a0,a5,a0
 16a:	6422                	ld	s0,8(sp)
 16c:	0141                	addi	sp,sp,16
 16e:	8082                	ret

0000000000000170 <strlen>:
 170:	1141                	addi	sp,sp,-16
 172:	e422                	sd	s0,8(sp)
 174:	0800                	addi	s0,sp,16
 176:	00054783          	lbu	a5,0(a0)
 17a:	cf91                	beqz	a5,196 <strlen+0x26>
 17c:	0505                	addi	a0,a0,1
 17e:	87aa                	mv	a5,a0
 180:	86be                	mv	a3,a5
 182:	0785                	addi	a5,a5,1
 184:	fff7c703          	lbu	a4,-1(a5)
 188:	ff65                	bnez	a4,180 <strlen+0x10>
 18a:	40a6853b          	subw	a0,a3,a0
 18e:	2505                	addiw	a0,a0,1
 190:	6422                	ld	s0,8(sp)
 192:	0141                	addi	sp,sp,16
 194:	8082                	ret
 196:	4501                	li	a0,0
 198:	bfe5                	j	190 <strlen+0x20>

000000000000019a <memset>:
 19a:	1141                	addi	sp,sp,-16
 19c:	e422                	sd	s0,8(sp)
 19e:	0800                	addi	s0,sp,16
 1a0:	ca19                	beqz	a2,1b6 <memset+0x1c>
 1a2:	87aa                	mv	a5,a0
 1a4:	1602                	slli	a2,a2,0x20
 1a6:	9201                	srli	a2,a2,0x20
 1a8:	00a60733          	add	a4,a2,a0
 1ac:	00b78023          	sb	a1,0(a5)
 1b0:	0785                	addi	a5,a5,1
 1b2:	fee79de3          	bne	a5,a4,1ac <memset+0x12>
 1b6:	6422                	ld	s0,8(sp)
 1b8:	0141                	addi	sp,sp,16
 1ba:	8082                	ret

00000000000001bc <strchr>:
 1bc:	1141                	addi	sp,sp,-16
 1be:	e422                	sd	s0,8(sp)
 1c0:	0800                	addi	s0,sp,16
 1c2:	00054783          	lbu	a5,0(a0)
 1c6:	cb99                	beqz	a5,1dc <strchr+0x20>
 1c8:	00f58763          	beq	a1,a5,1d6 <strchr+0x1a>
 1cc:	0505                	addi	a0,a0,1
 1ce:	00054783          	lbu	a5,0(a0)
 1d2:	fbfd                	bnez	a5,1c8 <strchr+0xc>
 1d4:	4501                	li	a0,0
 1d6:	6422                	ld	s0,8(sp)
 1d8:	0141                	addi	sp,sp,16
 1da:	8082                	ret
 1dc:	4501                	li	a0,0
 1de:	bfe5                	j	1d6 <strchr+0x1a>

00000000000001e0 <gets>:
 1e0:	711d                	addi	sp,sp,-96
 1e2:	ec86                	sd	ra,88(sp)
 1e4:	e8a2                	sd	s0,80(sp)
 1e6:	e4a6                	sd	s1,72(sp)
 1e8:	e0ca                	sd	s2,64(sp)
 1ea:	fc4e                	sd	s3,56(sp)
 1ec:	f852                	sd	s4,48(sp)
 1ee:	f456                	sd	s5,40(sp)
 1f0:	f05a                	sd	s6,32(sp)
 1f2:	ec5e                	sd	s7,24(sp)
 1f4:	1080                	addi	s0,sp,96
 1f6:	8baa                	mv	s7,a0
 1f8:	8a2e                	mv	s4,a1
 1fa:	892a                	mv	s2,a0
 1fc:	4481                	li	s1,0
 1fe:	4aa9                	li	s5,10
 200:	4b35                	li	s6,13
 202:	89a6                	mv	s3,s1
 204:	2485                	addiw	s1,s1,1
 206:	0344d663          	bge	s1,s4,232 <gets+0x52>
 20a:	4605                	li	a2,1
 20c:	faf40593          	addi	a1,s0,-81
 210:	4501                	li	a0,0
 212:	186000ef          	jal	398 <read>
 216:	00a05e63          	blez	a0,232 <gets+0x52>
 21a:	faf44783          	lbu	a5,-81(s0)
 21e:	00f90023          	sb	a5,0(s2)
 222:	01578763          	beq	a5,s5,230 <gets+0x50>
 226:	0905                	addi	s2,s2,1
 228:	fd679de3          	bne	a5,s6,202 <gets+0x22>
 22c:	89a6                	mv	s3,s1
 22e:	a011                	j	232 <gets+0x52>
 230:	89a6                	mv	s3,s1
 232:	99de                	add	s3,s3,s7
 234:	00098023          	sb	zero,0(s3)
 238:	855e                	mv	a0,s7
 23a:	60e6                	ld	ra,88(sp)
 23c:	6446                	ld	s0,80(sp)
 23e:	64a6                	ld	s1,72(sp)
 240:	6906                	ld	s2,64(sp)
 242:	79e2                	ld	s3,56(sp)
 244:	7a42                	ld	s4,48(sp)
 246:	7aa2                	ld	s5,40(sp)
 248:	7b02                	ld	s6,32(sp)
 24a:	6be2                	ld	s7,24(sp)
 24c:	6125                	addi	sp,sp,96
 24e:	8082                	ret

0000000000000250 <stat>:
 250:	1101                	addi	sp,sp,-32
 252:	ec06                	sd	ra,24(sp)
 254:	e822                	sd	s0,16(sp)
 256:	e04a                	sd	s2,0(sp)
 258:	1000                	addi	s0,sp,32
 25a:	892e                	mv	s2,a1
 25c:	4581                	li	a1,0
 25e:	162000ef          	jal	3c0 <open>
 262:	02054263          	bltz	a0,286 <stat+0x36>
 266:	e426                	sd	s1,8(sp)
 268:	84aa                	mv	s1,a0
 26a:	85ca                	mv	a1,s2
 26c:	16c000ef          	jal	3d8 <fstat>
 270:	892a                	mv	s2,a0
 272:	8526                	mv	a0,s1
 274:	134000ef          	jal	3a8 <close>
 278:	64a2                	ld	s1,8(sp)
 27a:	854a                	mv	a0,s2
 27c:	60e2                	ld	ra,24(sp)
 27e:	6442                	ld	s0,16(sp)
 280:	6902                	ld	s2,0(sp)
 282:	6105                	addi	sp,sp,32
 284:	8082                	ret
 286:	597d                	li	s2,-1
 288:	bfcd                	j	27a <stat+0x2a>

000000000000028a <atoi>:
 28a:	1141                	addi	sp,sp,-16
 28c:	e422                	sd	s0,8(sp)
 28e:	0800                	addi	s0,sp,16
 290:	00054683          	lbu	a3,0(a0)
 294:	fd06879b          	addiw	a5,a3,-48
 298:	0ff7f793          	zext.b	a5,a5
 29c:	4625                	li	a2,9
 29e:	02f66863          	bltu	a2,a5,2ce <atoi+0x44>
 2a2:	872a                	mv	a4,a0
 2a4:	4501                	li	a0,0
 2a6:	0705                	addi	a4,a4,1
 2a8:	0025179b          	slliw	a5,a0,0x2
 2ac:	9fa9                	addw	a5,a5,a0
 2ae:	0017979b          	slliw	a5,a5,0x1
 2b2:	9fb5                	addw	a5,a5,a3
 2b4:	fd07851b          	addiw	a0,a5,-48
 2b8:	00074683          	lbu	a3,0(a4)
 2bc:	fd06879b          	addiw	a5,a3,-48
 2c0:	0ff7f793          	zext.b	a5,a5
 2c4:	fef671e3          	bgeu	a2,a5,2a6 <atoi+0x1c>
 2c8:	6422                	ld	s0,8(sp)
 2ca:	0141                	addi	sp,sp,16
 2cc:	8082                	ret
 2ce:	4501                	li	a0,0
 2d0:	bfe5                	j	2c8 <atoi+0x3e>

00000000000002d2 <memmove>:
 2d2:	1141                	addi	sp,sp,-16
 2d4:	e422                	sd	s0,8(sp)
 2d6:	0800                	addi	s0,sp,16
 2d8:	02b57463          	bgeu	a0,a1,300 <memmove+0x2e>
 2dc:	00c05f63          	blez	a2,2fa <memmove+0x28>
 2e0:	1602                	slli	a2,a2,0x20
 2e2:	9201                	srli	a2,a2,0x20
 2e4:	00c507b3          	add	a5,a0,a2
 2e8:	872a                	mv	a4,a0
 2ea:	0585                	addi	a1,a1,1
 2ec:	0705                	addi	a4,a4,1
 2ee:	fff5c683          	lbu	a3,-1(a1)
 2f2:	fed70fa3          	sb	a3,-1(a4)
 2f6:	fef71ae3          	bne	a4,a5,2ea <memmove+0x18>
 2fa:	6422                	ld	s0,8(sp)
 2fc:	0141                	addi	sp,sp,16
 2fe:	8082                	ret
 300:	00c50733          	add	a4,a0,a2
 304:	95b2                	add	a1,a1,a2
 306:	fec05ae3          	blez	a2,2fa <memmove+0x28>
 30a:	fff6079b          	addiw	a5,a2,-1
 30e:	1782                	slli	a5,a5,0x20
 310:	9381                	srli	a5,a5,0x20
 312:	fff7c793          	not	a5,a5
 316:	97ba                	add	a5,a5,a4
 318:	15fd                	addi	a1,a1,-1
 31a:	177d                	addi	a4,a4,-1
 31c:	0005c683          	lbu	a3,0(a1)
 320:	00d70023          	sb	a3,0(a4)
 324:	fee79ae3          	bne	a5,a4,318 <memmove+0x46>
 328:	bfc9                	j	2fa <memmove+0x28>

000000000000032a <memcmp>:
 32a:	1141                	addi	sp,sp,-16
 32c:	e422                	sd	s0,8(sp)
 32e:	0800                	addi	s0,sp,16
 330:	ca05                	beqz	a2,360 <memcmp+0x36>
 332:	fff6069b          	addiw	a3,a2,-1
 336:	1682                	slli	a3,a3,0x20
 338:	9281                	srli	a3,a3,0x20
 33a:	0685                	addi	a3,a3,1
 33c:	96aa                	add	a3,a3,a0
 33e:	00054783          	lbu	a5,0(a0)
 342:	0005c703          	lbu	a4,0(a1)
 346:	00e79863          	bne	a5,a4,356 <memcmp+0x2c>
 34a:	0505                	addi	a0,a0,1
 34c:	0585                	addi	a1,a1,1
 34e:	fed518e3          	bne	a0,a3,33e <memcmp+0x14>
 352:	4501                	li	a0,0
 354:	a019                	j	35a <memcmp+0x30>
 356:	40e7853b          	subw	a0,a5,a4
 35a:	6422                	ld	s0,8(sp)
 35c:	0141                	addi	sp,sp,16
 35e:	8082                	ret
 360:	4501                	li	a0,0
 362:	bfe5                	j	35a <memcmp+0x30>

0000000000000364 <memcpy>:
 364:	1141                	addi	sp,sp,-16
 366:	e406                	sd	ra,8(sp)
 368:	e022                	sd	s0,0(sp)
 36a:	0800                	addi	s0,sp,16
 36c:	f67ff0ef          	jal	2d2 <memmove>
 370:	60a2                	ld	ra,8(sp)
 372:	6402                	ld	s0,0(sp)
 374:	0141                	addi	sp,sp,16
 376:	8082                	ret

0000000000000378 <fork>:
 378:	4885                	li	a7,1
 37a:	00000073          	ecall
 37e:	8082                	ret

0000000000000380 <exit>:
 380:	4889                	li	a7,2
 382:	00000073          	ecall
 386:	8082                	ret

0000000000000388 <wait>:
 388:	488d                	li	a7,3
 38a:	00000073          	ecall
 38e:	8082                	ret

0000000000000390 <pipe>:
 390:	4891                	li	a7,4
 392:	00000073          	ecall
 396:	8082                	ret

0000000000000398 <read>:
 398:	4895                	li	a7,5
 39a:	00000073          	ecall
 39e:	8082                	ret

00000000000003a0 <write>:
 3a0:	48c1                	li	a7,16
 3a2:	00000073          	ecall
 3a6:	8082                	ret

00000000000003a8 <close>:
 3a8:	48d5                	li	a7,21
 3aa:	00000073          	ecall
 3ae:	8082                	ret

00000000000003b0 <kill>:
 3b0:	4899                	li	a7,6
 3b2:	00000073          	ecall
 3b6:	8082                	ret

00000000000003b8 <exec>:
 3b8:	489d                	li	a7,7
 3ba:	00000073          	ecall
 3be:	8082                	ret

00000000000003c0 <open>:
 3c0:	48bd                	li	a7,15
 3c2:	00000073          	ecall
 3c6:	8082                	ret

00000000000003c8 <mknod>:
 3c8:	48c5                	li	a7,17
 3ca:	00000073          	ecall
 3ce:	8082                	ret

00000000000003d0 <unlink>:
 3d0:	48c9                	li	a7,18
 3d2:	00000073          	ecall
 3d6:	8082                	ret

00000000000003d8 <fstat>:
 3d8:	48a1                	li	a7,8
 3da:	00000073          	ecall
 3de:	8082                	ret

00000000000003e0 <link>:
 3e0:	48cd                	li	a7,19
 3e2:	00000073          	ecall
 3e6:	8082                	ret

00000000000003e8 <mkdir>:
 3e8:	48d1                	li	a7,20
 3ea:	00000073          	ecall
 3ee:	8082                	ret

00000000000003f0 <chdir>:
 3f0:	48a5                	li	a7,9
 3f2:	00000073          	ecall
 3f6:	8082                	ret

00000000000003f8 <dup>:
 3f8:	48a9                	li	a7,10
 3fa:	00000073          	ecall
 3fe:	8082                	ret

0000000000000400 <getpid>:
 400:	48ad                	li	a7,11
 402:	00000073          	ecall
 406:	8082                	ret

0000000000000408 <sbrk>:
 408:	48b1                	li	a7,12
 40a:	00000073          	ecall
 40e:	8082                	ret

0000000000000410 <sleep>:
 410:	48b5                	li	a7,13
 412:	00000073          	ecall
 416:	8082                	ret

0000000000000418 <uptime>:
 418:	48b9                	li	a7,14
 41a:	00000073          	ecall
 41e:	8082                	ret

0000000000000420 <putc>:
 420:	1101                	addi	sp,sp,-32
 422:	ec06                	sd	ra,24(sp)
 424:	e822                	sd	s0,16(sp)
 426:	1000                	addi	s0,sp,32
 428:	feb407a3          	sb	a1,-17(s0)
 42c:	4605                	li	a2,1
 42e:	fef40593          	addi	a1,s0,-17
 432:	f6fff0ef          	jal	3a0 <write>
 436:	60e2                	ld	ra,24(sp)
 438:	6442                	ld	s0,16(sp)
 43a:	6105                	addi	sp,sp,32
 43c:	8082                	ret

000000000000043e <printint>:
 43e:	7139                	addi	sp,sp,-64
 440:	fc06                	sd	ra,56(sp)
 442:	f822                	sd	s0,48(sp)
 444:	f426                	sd	s1,40(sp)
 446:	0080                	addi	s0,sp,64
 448:	84aa                	mv	s1,a0
 44a:	c299                	beqz	a3,450 <printint+0x12>
 44c:	0805c963          	bltz	a1,4de <printint+0xa0>
 450:	2581                	sext.w	a1,a1
 452:	4881                	li	a7,0
 454:	fc040693          	addi	a3,s0,-64
 458:	4701                	li	a4,0
 45a:	2601                	sext.w	a2,a2
 45c:	00000517          	auipc	a0,0x0
 460:	50c50513          	addi	a0,a0,1292 # 968 <digits>
 464:	883a                	mv	a6,a4
 466:	2705                	addiw	a4,a4,1
 468:	02c5f7bb          	remuw	a5,a1,a2
 46c:	1782                	slli	a5,a5,0x20
 46e:	9381                	srli	a5,a5,0x20
 470:	97aa                	add	a5,a5,a0
 472:	0007c783          	lbu	a5,0(a5)
 476:	00f68023          	sb	a5,0(a3)
 47a:	0005879b          	sext.w	a5,a1
 47e:	02c5d5bb          	divuw	a1,a1,a2
 482:	0685                	addi	a3,a3,1
 484:	fec7f0e3          	bgeu	a5,a2,464 <printint+0x26>
 488:	00088c63          	beqz	a7,4a0 <printint+0x62>
 48c:	fd070793          	addi	a5,a4,-48
 490:	00878733          	add	a4,a5,s0
 494:	02d00793          	li	a5,45
 498:	fef70823          	sb	a5,-16(a4)
 49c:	0028071b          	addiw	a4,a6,2
 4a0:	02e05a63          	blez	a4,4d4 <printint+0x96>
 4a4:	f04a                	sd	s2,32(sp)
 4a6:	ec4e                	sd	s3,24(sp)
 4a8:	fc040793          	addi	a5,s0,-64
 4ac:	00e78933          	add	s2,a5,a4
 4b0:	fff78993          	addi	s3,a5,-1
 4b4:	99ba                	add	s3,s3,a4
 4b6:	377d                	addiw	a4,a4,-1
 4b8:	1702                	slli	a4,a4,0x20
 4ba:	9301                	srli	a4,a4,0x20
 4bc:	40e989b3          	sub	s3,s3,a4
 4c0:	fff94583          	lbu	a1,-1(s2)
 4c4:	8526                	mv	a0,s1
 4c6:	f5bff0ef          	jal	420 <putc>
 4ca:	197d                	addi	s2,s2,-1
 4cc:	ff391ae3          	bne	s2,s3,4c0 <printint+0x82>
 4d0:	7902                	ld	s2,32(sp)
 4d2:	69e2                	ld	s3,24(sp)
 4d4:	70e2                	ld	ra,56(sp)
 4d6:	7442                	ld	s0,48(sp)
 4d8:	74a2                	ld	s1,40(sp)
 4da:	6121                	addi	sp,sp,64
 4dc:	8082                	ret
 4de:	40b005bb          	negw	a1,a1
 4e2:	4885                	li	a7,1
 4e4:	bf85                	j	454 <printint+0x16>

00000000000004e6 <vprintf>:
 4e6:	711d                	addi	sp,sp,-96
 4e8:	ec86                	sd	ra,88(sp)
 4ea:	e8a2                	sd	s0,80(sp)
 4ec:	e0ca                	sd	s2,64(sp)
 4ee:	1080                	addi	s0,sp,96
 4f0:	0005c903          	lbu	s2,0(a1)
 4f4:	26090863          	beqz	s2,764 <vprintf+0x27e>
 4f8:	e4a6                	sd	s1,72(sp)
 4fa:	fc4e                	sd	s3,56(sp)
 4fc:	f852                	sd	s4,48(sp)
 4fe:	f456                	sd	s5,40(sp)
 500:	f05a                	sd	s6,32(sp)
 502:	ec5e                	sd	s7,24(sp)
 504:	e862                	sd	s8,16(sp)
 506:	e466                	sd	s9,8(sp)
 508:	8b2a                	mv	s6,a0
 50a:	8a2e                	mv	s4,a1
 50c:	8bb2                	mv	s7,a2
 50e:	4981                	li	s3,0
 510:	4481                	li	s1,0
 512:	4701                	li	a4,0
 514:	02500a93          	li	s5,37
 518:	06400c13          	li	s8,100
 51c:	06c00c93          	li	s9,108
 520:	a005                	j	540 <vprintf+0x5a>
 522:	85ca                	mv	a1,s2
 524:	855a                	mv	a0,s6
 526:	efbff0ef          	jal	420 <putc>
 52a:	a019                	j	530 <vprintf+0x4a>
 52c:	03598263          	beq	s3,s5,550 <vprintf+0x6a>
 530:	2485                	addiw	s1,s1,1
 532:	8726                	mv	a4,s1
 534:	009a07b3          	add	a5,s4,s1
 538:	0007c903          	lbu	s2,0(a5)
 53c:	20090c63          	beqz	s2,754 <vprintf+0x26e>
 540:	0009079b          	sext.w	a5,s2
 544:	fe0994e3          	bnez	s3,52c <vprintf+0x46>
 548:	fd579de3          	bne	a5,s5,522 <vprintf+0x3c>
 54c:	89be                	mv	s3,a5
 54e:	b7cd                	j	530 <vprintf+0x4a>
 550:	00ea06b3          	add	a3,s4,a4
 554:	0016c683          	lbu	a3,1(a3)
 558:	8636                	mv	a2,a3
 55a:	c681                	beqz	a3,562 <vprintf+0x7c>
 55c:	9752                	add	a4,a4,s4
 55e:	00274603          	lbu	a2,2(a4)
 562:	03878f63          	beq	a5,s8,5a0 <vprintf+0xba>
 566:	05978963          	beq	a5,s9,5b8 <vprintf+0xd2>
 56a:	07500713          	li	a4,117
 56e:	0ee78363          	beq	a5,a4,654 <vprintf+0x16e>
 572:	07800713          	li	a4,120
 576:	12e78563          	beq	a5,a4,6a0 <vprintf+0x1ba>
 57a:	07000713          	li	a4,112
 57e:	14e78a63          	beq	a5,a4,6d2 <vprintf+0x1ec>
 582:	07300713          	li	a4,115
 586:	18e78a63          	beq	a5,a4,71a <vprintf+0x234>
 58a:	02500713          	li	a4,37
 58e:	04e79563          	bne	a5,a4,5d8 <vprintf+0xf2>
 592:	02500593          	li	a1,37
 596:	855a                	mv	a0,s6
 598:	e89ff0ef          	jal	420 <putc>
 59c:	4981                	li	s3,0
 59e:	bf49                	j	530 <vprintf+0x4a>
 5a0:	008b8913          	addi	s2,s7,8
 5a4:	4685                	li	a3,1
 5a6:	4629                	li	a2,10
 5a8:	000ba583          	lw	a1,0(s7)
 5ac:	855a                	mv	a0,s6
 5ae:	e91ff0ef          	jal	43e <printint>
 5b2:	8bca                	mv	s7,s2
 5b4:	4981                	li	s3,0
 5b6:	bfad                	j	530 <vprintf+0x4a>
 5b8:	06400793          	li	a5,100
 5bc:	02f68963          	beq	a3,a5,5ee <vprintf+0x108>
 5c0:	06c00793          	li	a5,108
 5c4:	04f68263          	beq	a3,a5,608 <vprintf+0x122>
 5c8:	07500793          	li	a5,117
 5cc:	0af68063          	beq	a3,a5,66c <vprintf+0x186>
 5d0:	07800793          	li	a5,120
 5d4:	0ef68263          	beq	a3,a5,6b8 <vprintf+0x1d2>
 5d8:	02500593          	li	a1,37
 5dc:	855a                	mv	a0,s6
 5de:	e43ff0ef          	jal	420 <putc>
 5e2:	85ca                	mv	a1,s2
 5e4:	855a                	mv	a0,s6
 5e6:	e3bff0ef          	jal	420 <putc>
 5ea:	4981                	li	s3,0
 5ec:	b791                	j	530 <vprintf+0x4a>
 5ee:	008b8913          	addi	s2,s7,8
 5f2:	4685                	li	a3,1
 5f4:	4629                	li	a2,10
 5f6:	000ba583          	lw	a1,0(s7)
 5fa:	855a                	mv	a0,s6
 5fc:	e43ff0ef          	jal	43e <printint>
 600:	2485                	addiw	s1,s1,1
 602:	8bca                	mv	s7,s2
 604:	4981                	li	s3,0
 606:	b72d                	j	530 <vprintf+0x4a>
 608:	06400793          	li	a5,100
 60c:	02f60763          	beq	a2,a5,63a <vprintf+0x154>
 610:	07500793          	li	a5,117
 614:	06f60963          	beq	a2,a5,686 <vprintf+0x1a0>
 618:	07800793          	li	a5,120
 61c:	faf61ee3          	bne	a2,a5,5d8 <vprintf+0xf2>
 620:	008b8913          	addi	s2,s7,8
 624:	4681                	li	a3,0
 626:	4641                	li	a2,16
 628:	000ba583          	lw	a1,0(s7)
 62c:	855a                	mv	a0,s6
 62e:	e11ff0ef          	jal	43e <printint>
 632:	2489                	addiw	s1,s1,2
 634:	8bca                	mv	s7,s2
 636:	4981                	li	s3,0
 638:	bde5                	j	530 <vprintf+0x4a>
 63a:	008b8913          	addi	s2,s7,8
 63e:	4685                	li	a3,1
 640:	4629                	li	a2,10
 642:	000ba583          	lw	a1,0(s7)
 646:	855a                	mv	a0,s6
 648:	df7ff0ef          	jal	43e <printint>
 64c:	2489                	addiw	s1,s1,2
 64e:	8bca                	mv	s7,s2
 650:	4981                	li	s3,0
 652:	bdf9                	j	530 <vprintf+0x4a>
 654:	008b8913          	addi	s2,s7,8
 658:	4681                	li	a3,0
 65a:	4629                	li	a2,10
 65c:	000ba583          	lw	a1,0(s7)
 660:	855a                	mv	a0,s6
 662:	dddff0ef          	jal	43e <printint>
 666:	8bca                	mv	s7,s2
 668:	4981                	li	s3,0
 66a:	b5d9                	j	530 <vprintf+0x4a>
 66c:	008b8913          	addi	s2,s7,8
 670:	4681                	li	a3,0
 672:	4629                	li	a2,10
 674:	000ba583          	lw	a1,0(s7)
 678:	855a                	mv	a0,s6
 67a:	dc5ff0ef          	jal	43e <printint>
 67e:	2485                	addiw	s1,s1,1
 680:	8bca                	mv	s7,s2
 682:	4981                	li	s3,0
 684:	b575                	j	530 <vprintf+0x4a>
 686:	008b8913          	addi	s2,s7,8
 68a:	4681                	li	a3,0
 68c:	4629                	li	a2,10
 68e:	000ba583          	lw	a1,0(s7)
 692:	855a                	mv	a0,s6
 694:	dabff0ef          	jal	43e <printint>
 698:	2489                	addiw	s1,s1,2
 69a:	8bca                	mv	s7,s2
 69c:	4981                	li	s3,0
 69e:	bd49                	j	530 <vprintf+0x4a>
 6a0:	008b8913          	addi	s2,s7,8
 6a4:	4681                	li	a3,0
 6a6:	4641                	li	a2,16
 6a8:	000ba583          	lw	a1,0(s7)
 6ac:	855a                	mv	a0,s6
 6ae:	d91ff0ef          	jal	43e <printint>
 6b2:	8bca                	mv	s7,s2
 6b4:	4981                	li	s3,0
 6b6:	bdad                	j	530 <vprintf+0x4a>
 6b8:	008b8913          	addi	s2,s7,8
 6bc:	4681                	li	a3,0
 6be:	4641                	li	a2,16
 6c0:	000ba583          	lw	a1,0(s7)
 6c4:	855a                	mv	a0,s6
 6c6:	d79ff0ef          	jal	43e <printint>
 6ca:	2485                	addiw	s1,s1,1
 6cc:	8bca                	mv	s7,s2
 6ce:	4981                	li	s3,0
 6d0:	b585                	j	530 <vprintf+0x4a>
 6d2:	e06a                	sd	s10,0(sp)
 6d4:	008b8d13          	addi	s10,s7,8
 6d8:	000bb983          	ld	s3,0(s7)
 6dc:	03000593          	li	a1,48
 6e0:	855a                	mv	a0,s6
 6e2:	d3fff0ef          	jal	420 <putc>
 6e6:	07800593          	li	a1,120
 6ea:	855a                	mv	a0,s6
 6ec:	d35ff0ef          	jal	420 <putc>
 6f0:	4941                	li	s2,16
 6f2:	00000b97          	auipc	s7,0x0
 6f6:	276b8b93          	addi	s7,s7,630 # 968 <digits>
 6fa:	03c9d793          	srli	a5,s3,0x3c
 6fe:	97de                	add	a5,a5,s7
 700:	0007c583          	lbu	a1,0(a5)
 704:	855a                	mv	a0,s6
 706:	d1bff0ef          	jal	420 <putc>
 70a:	0992                	slli	s3,s3,0x4
 70c:	397d                	addiw	s2,s2,-1
 70e:	fe0916e3          	bnez	s2,6fa <vprintf+0x214>
 712:	8bea                	mv	s7,s10
 714:	4981                	li	s3,0
 716:	6d02                	ld	s10,0(sp)
 718:	bd21                	j	530 <vprintf+0x4a>
 71a:	008b8993          	addi	s3,s7,8
 71e:	000bb903          	ld	s2,0(s7)
 722:	00090f63          	beqz	s2,740 <vprintf+0x25a>
 726:	00094583          	lbu	a1,0(s2)
 72a:	c195                	beqz	a1,74e <vprintf+0x268>
 72c:	855a                	mv	a0,s6
 72e:	cf3ff0ef          	jal	420 <putc>
 732:	0905                	addi	s2,s2,1
 734:	00094583          	lbu	a1,0(s2)
 738:	f9f5                	bnez	a1,72c <vprintf+0x246>
 73a:	8bce                	mv	s7,s3
 73c:	4981                	li	s3,0
 73e:	bbcd                	j	530 <vprintf+0x4a>
 740:	00000917          	auipc	s2,0x0
 744:	22090913          	addi	s2,s2,544 # 960 <malloc+0x114>
 748:	02800593          	li	a1,40
 74c:	b7c5                	j	72c <vprintf+0x246>
 74e:	8bce                	mv	s7,s3
 750:	4981                	li	s3,0
 752:	bbf9                	j	530 <vprintf+0x4a>
 754:	64a6                	ld	s1,72(sp)
 756:	79e2                	ld	s3,56(sp)
 758:	7a42                	ld	s4,48(sp)
 75a:	7aa2                	ld	s5,40(sp)
 75c:	7b02                	ld	s6,32(sp)
 75e:	6be2                	ld	s7,24(sp)
 760:	6c42                	ld	s8,16(sp)
 762:	6ca2                	ld	s9,8(sp)
 764:	60e6                	ld	ra,88(sp)
 766:	6446                	ld	s0,80(sp)
 768:	6906                	ld	s2,64(sp)
 76a:	6125                	addi	sp,sp,96
 76c:	8082                	ret

000000000000076e <fprintf>:
 76e:	715d                	addi	sp,sp,-80
 770:	ec06                	sd	ra,24(sp)
 772:	e822                	sd	s0,16(sp)
 774:	1000                	addi	s0,sp,32
 776:	e010                	sd	a2,0(s0)
 778:	e414                	sd	a3,8(s0)
 77a:	e818                	sd	a4,16(s0)
 77c:	ec1c                	sd	a5,24(s0)
 77e:	03043023          	sd	a6,32(s0)
 782:	03143423          	sd	a7,40(s0)
 786:	fe843423          	sd	s0,-24(s0)
 78a:	8622                	mv	a2,s0
 78c:	d5bff0ef          	jal	4e6 <vprintf>
 790:	60e2                	ld	ra,24(sp)
 792:	6442                	ld	s0,16(sp)
 794:	6161                	addi	sp,sp,80
 796:	8082                	ret

0000000000000798 <printf>:
 798:	711d                	addi	sp,sp,-96
 79a:	ec06                	sd	ra,24(sp)
 79c:	e822                	sd	s0,16(sp)
 79e:	1000                	addi	s0,sp,32
 7a0:	e40c                	sd	a1,8(s0)
 7a2:	e810                	sd	a2,16(s0)
 7a4:	ec14                	sd	a3,24(s0)
 7a6:	f018                	sd	a4,32(s0)
 7a8:	f41c                	sd	a5,40(s0)
 7aa:	03043823          	sd	a6,48(s0)
 7ae:	03143c23          	sd	a7,56(s0)
 7b2:	00840613          	addi	a2,s0,8
 7b6:	fec43423          	sd	a2,-24(s0)
 7ba:	85aa                	mv	a1,a0
 7bc:	4505                	li	a0,1
 7be:	d29ff0ef          	jal	4e6 <vprintf>
 7c2:	60e2                	ld	ra,24(sp)
 7c4:	6442                	ld	s0,16(sp)
 7c6:	6125                	addi	sp,sp,96
 7c8:	8082                	ret

00000000000007ca <free>:
 7ca:	1141                	addi	sp,sp,-16
 7cc:	e422                	sd	s0,8(sp)
 7ce:	0800                	addi	s0,sp,16
 7d0:	ff050693          	addi	a3,a0,-16
 7d4:	00001797          	auipc	a5,0x1
 7d8:	82c7b783          	ld	a5,-2004(a5) # 1000 <freep>
 7dc:	a02d                	j	806 <free+0x3c>
 7de:	4618                	lw	a4,8(a2)
 7e0:	9f2d                	addw	a4,a4,a1
 7e2:	fee52c23          	sw	a4,-8(a0)
 7e6:	6398                	ld	a4,0(a5)
 7e8:	6310                	ld	a2,0(a4)
 7ea:	a83d                	j	828 <free+0x5e>
 7ec:	ff852703          	lw	a4,-8(a0)
 7f0:	9f31                	addw	a4,a4,a2
 7f2:	c798                	sw	a4,8(a5)
 7f4:	ff053683          	ld	a3,-16(a0)
 7f8:	a091                	j	83c <free+0x72>
 7fa:	6398                	ld	a4,0(a5)
 7fc:	00e7e463          	bltu	a5,a4,804 <free+0x3a>
 800:	00e6ea63          	bltu	a3,a4,814 <free+0x4a>
 804:	87ba                	mv	a5,a4
 806:	fed7fae3          	bgeu	a5,a3,7fa <free+0x30>
 80a:	6398                	ld	a4,0(a5)
 80c:	00e6e463          	bltu	a3,a4,814 <free+0x4a>
 810:	fee7eae3          	bltu	a5,a4,804 <free+0x3a>
 814:	ff852583          	lw	a1,-8(a0)
 818:	6390                	ld	a2,0(a5)
 81a:	02059813          	slli	a6,a1,0x20
 81e:	01c85713          	srli	a4,a6,0x1c
 822:	9736                	add	a4,a4,a3
 824:	fae60de3          	beq	a2,a4,7de <free+0x14>
 828:	fec53823          	sd	a2,-16(a0)
 82c:	4790                	lw	a2,8(a5)
 82e:	02061593          	slli	a1,a2,0x20
 832:	01c5d713          	srli	a4,a1,0x1c
 836:	973e                	add	a4,a4,a5
 838:	fae68ae3          	beq	a3,a4,7ec <free+0x22>
 83c:	e394                	sd	a3,0(a5)
 83e:	00000717          	auipc	a4,0x0
 842:	7cf73123          	sd	a5,1986(a4) # 1000 <freep>
 846:	6422                	ld	s0,8(sp)
 848:	0141                	addi	sp,sp,16
 84a:	8082                	ret

000000000000084c <malloc>:
 84c:	7139                	addi	sp,sp,-64
 84e:	fc06                	sd	ra,56(sp)
 850:	f822                	sd	s0,48(sp)
 852:	f426                	sd	s1,40(sp)
 854:	ec4e                	sd	s3,24(sp)
 856:	0080                	addi	s0,sp,64
 858:	02051493          	slli	s1,a0,0x20
 85c:	9081                	srli	s1,s1,0x20
 85e:	04bd                	addi	s1,s1,15
 860:	8091                	srli	s1,s1,0x4
 862:	0014899b          	addiw	s3,s1,1
 866:	0485                	addi	s1,s1,1
 868:	00000517          	auipc	a0,0x0
 86c:	79853503          	ld	a0,1944(a0) # 1000 <freep>
 870:	c915                	beqz	a0,8a4 <malloc+0x58>
 872:	611c                	ld	a5,0(a0)
 874:	4798                	lw	a4,8(a5)
 876:	08977a63          	bgeu	a4,s1,90a <malloc+0xbe>
 87a:	f04a                	sd	s2,32(sp)
 87c:	e852                	sd	s4,16(sp)
 87e:	e456                	sd	s5,8(sp)
 880:	e05a                	sd	s6,0(sp)
 882:	8a4e                	mv	s4,s3
 884:	0009871b          	sext.w	a4,s3
 888:	6685                	lui	a3,0x1
 88a:	00d77363          	bgeu	a4,a3,890 <malloc+0x44>
 88e:	6a05                	lui	s4,0x1
 890:	000a0b1b          	sext.w	s6,s4
 894:	004a1a1b          	slliw	s4,s4,0x4
 898:	00000917          	auipc	s2,0x0
 89c:	76890913          	addi	s2,s2,1896 # 1000 <freep>
 8a0:	5afd                	li	s5,-1
 8a2:	a081                	j	8e2 <malloc+0x96>
 8a4:	f04a                	sd	s2,32(sp)
 8a6:	e852                	sd	s4,16(sp)
 8a8:	e456                	sd	s5,8(sp)
 8aa:	e05a                	sd	s6,0(sp)
 8ac:	00000797          	auipc	a5,0x0
 8b0:	76478793          	addi	a5,a5,1892 # 1010 <base>
 8b4:	00000717          	auipc	a4,0x0
 8b8:	74f73623          	sd	a5,1868(a4) # 1000 <freep>
 8bc:	e39c                	sd	a5,0(a5)
 8be:	0007a423          	sw	zero,8(a5)
 8c2:	b7c1                	j	882 <malloc+0x36>
 8c4:	6398                	ld	a4,0(a5)
 8c6:	e118                	sd	a4,0(a0)
 8c8:	a8a9                	j	922 <malloc+0xd6>
 8ca:	01652423          	sw	s6,8(a0)
 8ce:	0541                	addi	a0,a0,16
 8d0:	efbff0ef          	jal	7ca <free>
 8d4:	00093503          	ld	a0,0(s2)
 8d8:	c12d                	beqz	a0,93a <malloc+0xee>
 8da:	611c                	ld	a5,0(a0)
 8dc:	4798                	lw	a4,8(a5)
 8de:	02977263          	bgeu	a4,s1,902 <malloc+0xb6>
 8e2:	00093703          	ld	a4,0(s2)
 8e6:	853e                	mv	a0,a5
 8e8:	fef719e3          	bne	a4,a5,8da <malloc+0x8e>
 8ec:	8552                	mv	a0,s4
 8ee:	b1bff0ef          	jal	408 <sbrk>
 8f2:	fd551ce3          	bne	a0,s5,8ca <malloc+0x7e>
 8f6:	4501                	li	a0,0
 8f8:	7902                	ld	s2,32(sp)
 8fa:	6a42                	ld	s4,16(sp)
 8fc:	6aa2                	ld	s5,8(sp)
 8fe:	6b02                	ld	s6,0(sp)
 900:	a03d                	j	92e <malloc+0xe2>
 902:	7902                	ld	s2,32(sp)
 904:	6a42                	ld	s4,16(sp)
 906:	6aa2                	ld	s5,8(sp)
 908:	6b02                	ld	s6,0(sp)
 90a:	fae48de3          	beq	s1,a4,8c4 <malloc+0x78>
 90e:	4137073b          	subw	a4,a4,s3
 912:	c798                	sw	a4,8(a5)
 914:	02071693          	slli	a3,a4,0x20
 918:	01c6d713          	srli	a4,a3,0x1c
 91c:	97ba                	add	a5,a5,a4
 91e:	0137a423          	sw	s3,8(a5)
 922:	00000717          	auipc	a4,0x0
 926:	6ca73f23          	sd	a0,1758(a4) # 1000 <freep>
 92a:	01078513          	addi	a0,a5,16
 92e:	70e2                	ld	ra,56(sp)
 930:	7442                	ld	s0,48(sp)
 932:	74a2                	ld	s1,40(sp)
 934:	69e2                	ld	s3,24(sp)
 936:	6121                	addi	sp,sp,64
 938:	8082                	ret
 93a:	7902                	ld	s2,32(sp)
 93c:	6a42                	ld	s4,16(sp)
 93e:	6aa2                	ld	s5,8(sp)
 940:	6b02                	ld	s6,0(sp)
 942:	b7f5                	j	92e <malloc+0xe2>
