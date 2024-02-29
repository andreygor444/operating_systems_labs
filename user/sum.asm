
user/_sum:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <error>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void error() {
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  printf("Должны быть введены два целых положительных числа, не превосходящих 2147483647\n");
   8:	00001517          	auipc	a0,0x1
   c:	90850513          	addi	a0,a0,-1784 # 910 <malloc+0xea>
  10:	00000097          	auipc	ra,0x0
  14:	75e080e7          	jalr	1886(ra) # 76e <printf>
  exit(1);
  18:	4505                	li	a0,1
  1a:	00000097          	auipc	ra,0x0
  1e:	3d2080e7          	jalr	978(ra) # 3ec <exit>

0000000000000022 <main>:
}  

int main(int argc, char *argv[])
{
  22:	715d                	addi	sp,sp,-80
  24:	e486                	sd	ra,72(sp)
  26:	e0a2                	sd	s0,64(sp)
  28:	fc26                	sd	s1,56(sp)
  2a:	f84a                	sd	s2,48(sp)
  2c:	f44e                	sd	s3,40(sp)
  2e:	f052                	sd	s4,32(sp)
  30:	0880                	addi	s0,sp,80
  char s[22];
  int n = 0;
  while(n < 22 && read(0, s + (n++), 1) > 0) { // Читаем по одному байту
  32:	fb840913          	addi	s2,s0,-72
  36:	fce40a13          	addi	s4,s0,-50
{
  3a:	84ca                	mv	s1,s2
  	if (s[n - 1] == '\n') break;
  3c:	49a9                	li	s3,10
  while(n < 22 && read(0, s + (n++), 1) > 0) { // Читаем по одному байту
  3e:	4605                	li	a2,1
  40:	85a6                	mv	a1,s1
  42:	4501                	li	a0,0
  44:	00000097          	auipc	ra,0x0
  48:	3c0080e7          	jalr	960(ra) # 404 <read>
  4c:	02a05d63          	blez	a0,86 <main+0x64>
  	if (s[n - 1] == '\n') break;
  50:	0004c783          	lbu	a5,0(s1)
  54:	03378c63          	beq	a5,s3,8c <main+0x6a>
  while(n < 22 && read(0, s + (n++), 1) > 0) { // Читаем по одному байту
  58:	0485                	addi	s1,s1,1
  5a:	ff4492e3          	bne	s1,s4,3e <main+0x1c>
  5e:	87ca                	mv	a5,s2
  60:	4481                	li	s1,0
  }
  int i = 0, j;
  while (i < 22 && s[i] != ' ' && s[i] != '\n') ++i;
  62:	02000693          	li	a3,32
  66:	4629                	li	a2,10
  68:	45d9                	li	a1,22
  6a:	0007c703          	lbu	a4,0(a5)
  6e:	08d70663          	beq	a4,a3,fa <main+0xd8>
  72:	00c70663          	beq	a4,a2,7e <main+0x5c>
  76:	2485                	addiw	s1,s1,1
  78:	0785                	addi	a5,a5,1
  7a:	feb498e3          	bne	s1,a1,6a <main+0x48>
  if (i == 22 || s[i] == '\n') error();
  7e:	00000097          	auipc	ra,0x0
  82:	f82080e7          	jalr	-126(ra) # 0 <error>
  86:	87ca                	mv	a5,s2
  88:	4481                	li	s1,0
  8a:	bfe1                	j	62 <main+0x40>
  8c:	87ca                	mv	a5,s2
  8e:	4481                	li	s1,0
  90:	bfc9                	j	62 <main+0x40>
  for (j = 0; j < i; ++j) {
  	if (s[j] < 48 || s[j] > 57) error();
  92:	00000097          	auipc	ra,0x0
  96:	f6e080e7          	jalr	-146(ra) # 0 <error>
  }
  for (j = i + 1; j < 22 && s[j] != '\n'; ++j) {
  	if (s[j] < 48 || s[j] > 57) error();
  9a:	00000097          	auipc	ra,0x0
  9e:	f66080e7          	jalr	-154(ra) # 0 <error>
  }
  if (j == 22) error();
  a2:	47d9                	li	a5,22
  a4:	0af68d63          	beq	a3,a5,15e <main+0x13c>
  s[i] = '\0';
  a8:	fd048793          	addi	a5,s1,-48
  ac:	97a2                	add	a5,a5,s0
  ae:	fe078423          	sb	zero,-24(a5)
  int res = add(atoi(s), atoi(s + i + 1));
  b2:	fb840513          	addi	a0,s0,-72
  b6:	00000097          	auipc	ra,0x0
  ba:	23c080e7          	jalr	572(ra) # 2f2 <atoi>
  be:	892a                	mv	s2,a0
  c0:	00148513          	addi	a0,s1,1
  c4:	fb840793          	addi	a5,s0,-72
  c8:	953e                	add	a0,a0,a5
  ca:	00000097          	auipc	ra,0x0
  ce:	228080e7          	jalr	552(ra) # 2f2 <atoi>
  d2:	85aa                	mv	a1,a0
  d4:	854a                	mv	a0,s2
  d6:	00000097          	auipc	ra,0x0
  da:	3b6080e7          	jalr	950(ra) # 48c <add>
  de:	85aa                	mv	a1,a0
  printf("%d\n", res);
  e0:	00001517          	auipc	a0,0x1
  e4:	8c050513          	addi	a0,a0,-1856 # 9a0 <malloc+0x17a>
  e8:	00000097          	auipc	ra,0x0
  ec:	686080e7          	jalr	1670(ra) # 76e <printf>
  exit(0);
  f0:	4501                	li	a0,0
  f2:	00000097          	auipc	ra,0x0
  f6:	2fa080e7          	jalr	762(ra) # 3ec <exit>
  if (i == 22 || s[i] == '\n') error();
  fa:	47d9                	li	a5,22
  fc:	f8f481e3          	beq	s1,a5,7e <main+0x5c>
  for (j = 0; j < i; ++j) {
 100:	02905563          	blez	s1,12a <main+0x108>
 104:	00190713          	addi	a4,s2,1
 108:	fff4879b          	addiw	a5,s1,-1
 10c:	1782                	slli	a5,a5,0x20
 10e:	9381                	srli	a5,a5,0x20
 110:	973e                	add	a4,a4,a5
  	if (s[j] < 48 || s[j] > 57) error();
 112:	46a5                	li	a3,9
 114:	00094783          	lbu	a5,0(s2)
 118:	fd07879b          	addiw	a5,a5,-48
 11c:	0ff7f793          	zext.b	a5,a5
 120:	f6f6e9e3          	bltu	a3,a5,92 <main+0x70>
  for (j = 0; j < i; ++j) {
 124:	0905                	addi	s2,s2,1
 126:	fee917e3          	bne	s2,a4,114 <main+0xf2>
  for (j = i + 1; j < 22 && s[j] != '\n'; ++j) {
 12a:	0014869b          	addiw	a3,s1,1
 12e:	47d5                	li	a5,21
 130:	f6d7c9e3          	blt	a5,a3,a2 <main+0x80>
 134:	fb840793          	addi	a5,s0,-72
 138:	00978733          	add	a4,a5,s1
 13c:	4629                	li	a2,10
  	if (s[j] < 48 || s[j] > 57) error();
 13e:	45a5                	li	a1,9
  for (j = i + 1; j < 22 && s[j] != '\n'; ++j) {
 140:	4559                	li	a0,22
 142:	00174783          	lbu	a5,1(a4)
 146:	f4c78ee3          	beq	a5,a2,a2 <main+0x80>
  	if (s[j] < 48 || s[j] > 57) error();
 14a:	fd07879b          	addiw	a5,a5,-48
 14e:	0ff7f793          	zext.b	a5,a5
 152:	f4f5e4e3          	bltu	a1,a5,9a <main+0x78>
  for (j = i + 1; j < 22 && s[j] != '\n'; ++j) {
 156:	2685                	addiw	a3,a3,1
 158:	0705                	addi	a4,a4,1
 15a:	fea694e3          	bne	a3,a0,142 <main+0x120>
  if (j == 22) error();
 15e:	00000097          	auipc	ra,0x0
 162:	ea2080e7          	jalr	-350(ra) # 0 <error>

0000000000000166 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 166:	1141                	addi	sp,sp,-16
 168:	e406                	sd	ra,8(sp)
 16a:	e022                	sd	s0,0(sp)
 16c:	0800                	addi	s0,sp,16
  extern int main();
  main();
 16e:	00000097          	auipc	ra,0x0
 172:	eb4080e7          	jalr	-332(ra) # 22 <main>
  exit(0);
 176:	4501                	li	a0,0
 178:	00000097          	auipc	ra,0x0
 17c:	274080e7          	jalr	628(ra) # 3ec <exit>

0000000000000180 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 180:	1141                	addi	sp,sp,-16
 182:	e422                	sd	s0,8(sp)
 184:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 186:	87aa                	mv	a5,a0
 188:	0585                	addi	a1,a1,1
 18a:	0785                	addi	a5,a5,1
 18c:	fff5c703          	lbu	a4,-1(a1)
 190:	fee78fa3          	sb	a4,-1(a5)
 194:	fb75                	bnez	a4,188 <strcpy+0x8>
    ;
  return os;
}
 196:	6422                	ld	s0,8(sp)
 198:	0141                	addi	sp,sp,16
 19a:	8082                	ret

000000000000019c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 19c:	1141                	addi	sp,sp,-16
 19e:	e422                	sd	s0,8(sp)
 1a0:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1a2:	00054783          	lbu	a5,0(a0)
 1a6:	cb91                	beqz	a5,1ba <strcmp+0x1e>
 1a8:	0005c703          	lbu	a4,0(a1)
 1ac:	00f71763          	bne	a4,a5,1ba <strcmp+0x1e>
    p++, q++;
 1b0:	0505                	addi	a0,a0,1
 1b2:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1b4:	00054783          	lbu	a5,0(a0)
 1b8:	fbe5                	bnez	a5,1a8 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1ba:	0005c503          	lbu	a0,0(a1)
}
 1be:	40a7853b          	subw	a0,a5,a0
 1c2:	6422                	ld	s0,8(sp)
 1c4:	0141                	addi	sp,sp,16
 1c6:	8082                	ret

00000000000001c8 <strlen>:

uint
strlen(const char *s)
{
 1c8:	1141                	addi	sp,sp,-16
 1ca:	e422                	sd	s0,8(sp)
 1cc:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1ce:	00054783          	lbu	a5,0(a0)
 1d2:	cf91                	beqz	a5,1ee <strlen+0x26>
 1d4:	0505                	addi	a0,a0,1
 1d6:	87aa                	mv	a5,a0
 1d8:	4685                	li	a3,1
 1da:	9e89                	subw	a3,a3,a0
 1dc:	00f6853b          	addw	a0,a3,a5
 1e0:	0785                	addi	a5,a5,1
 1e2:	fff7c703          	lbu	a4,-1(a5)
 1e6:	fb7d                	bnez	a4,1dc <strlen+0x14>
    ;
  return n;
}
 1e8:	6422                	ld	s0,8(sp)
 1ea:	0141                	addi	sp,sp,16
 1ec:	8082                	ret
  for(n = 0; s[n]; n++)
 1ee:	4501                	li	a0,0
 1f0:	bfe5                	j	1e8 <strlen+0x20>

00000000000001f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e422                	sd	s0,8(sp)
 1f6:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 1f8:	ca19                	beqz	a2,20e <memset+0x1c>
 1fa:	87aa                	mv	a5,a0
 1fc:	1602                	slli	a2,a2,0x20
 1fe:	9201                	srli	a2,a2,0x20
 200:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 204:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 208:	0785                	addi	a5,a5,1
 20a:	fee79de3          	bne	a5,a4,204 <memset+0x12>
  }
  return dst;
}
 20e:	6422                	ld	s0,8(sp)
 210:	0141                	addi	sp,sp,16
 212:	8082                	ret

0000000000000214 <strchr>:

char*
strchr(const char *s, char c)
{
 214:	1141                	addi	sp,sp,-16
 216:	e422                	sd	s0,8(sp)
 218:	0800                	addi	s0,sp,16
  for(; *s; s++)
 21a:	00054783          	lbu	a5,0(a0)
 21e:	cb99                	beqz	a5,234 <strchr+0x20>
    if(*s == c)
 220:	00f58763          	beq	a1,a5,22e <strchr+0x1a>
  for(; *s; s++)
 224:	0505                	addi	a0,a0,1
 226:	00054783          	lbu	a5,0(a0)
 22a:	fbfd                	bnez	a5,220 <strchr+0xc>
      return (char*)s;
  return 0;
 22c:	4501                	li	a0,0
}
 22e:	6422                	ld	s0,8(sp)
 230:	0141                	addi	sp,sp,16
 232:	8082                	ret
  return 0;
 234:	4501                	li	a0,0
 236:	bfe5                	j	22e <strchr+0x1a>

0000000000000238 <gets>:

char*
gets(char *buf, int max)
{
 238:	711d                	addi	sp,sp,-96
 23a:	ec86                	sd	ra,88(sp)
 23c:	e8a2                	sd	s0,80(sp)
 23e:	e4a6                	sd	s1,72(sp)
 240:	e0ca                	sd	s2,64(sp)
 242:	fc4e                	sd	s3,56(sp)
 244:	f852                	sd	s4,48(sp)
 246:	f456                	sd	s5,40(sp)
 248:	f05a                	sd	s6,32(sp)
 24a:	ec5e                	sd	s7,24(sp)
 24c:	1080                	addi	s0,sp,96
 24e:	8baa                	mv	s7,a0
 250:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 252:	892a                	mv	s2,a0
 254:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 256:	4aa9                	li	s5,10
 258:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 25a:	89a6                	mv	s3,s1
 25c:	2485                	addiw	s1,s1,1
 25e:	0344d863          	bge	s1,s4,28e <gets+0x56>
    cc = read(0, &c, 1);
 262:	4605                	li	a2,1
 264:	faf40593          	addi	a1,s0,-81
 268:	4501                	li	a0,0
 26a:	00000097          	auipc	ra,0x0
 26e:	19a080e7          	jalr	410(ra) # 404 <read>
    if(cc < 1)
 272:	00a05e63          	blez	a0,28e <gets+0x56>
    buf[i++] = c;
 276:	faf44783          	lbu	a5,-81(s0)
 27a:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 27e:	01578763          	beq	a5,s5,28c <gets+0x54>
 282:	0905                	addi	s2,s2,1
 284:	fd679be3          	bne	a5,s6,25a <gets+0x22>
  for(i=0; i+1 < max; ){
 288:	89a6                	mv	s3,s1
 28a:	a011                	j	28e <gets+0x56>
 28c:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 28e:	99de                	add	s3,s3,s7
 290:	00098023          	sb	zero,0(s3)
  return buf;
}
 294:	855e                	mv	a0,s7
 296:	60e6                	ld	ra,88(sp)
 298:	6446                	ld	s0,80(sp)
 29a:	64a6                	ld	s1,72(sp)
 29c:	6906                	ld	s2,64(sp)
 29e:	79e2                	ld	s3,56(sp)
 2a0:	7a42                	ld	s4,48(sp)
 2a2:	7aa2                	ld	s5,40(sp)
 2a4:	7b02                	ld	s6,32(sp)
 2a6:	6be2                	ld	s7,24(sp)
 2a8:	6125                	addi	sp,sp,96
 2aa:	8082                	ret

00000000000002ac <stat>:

int
stat(const char *n, struct stat *st)
{
 2ac:	1101                	addi	sp,sp,-32
 2ae:	ec06                	sd	ra,24(sp)
 2b0:	e822                	sd	s0,16(sp)
 2b2:	e426                	sd	s1,8(sp)
 2b4:	e04a                	sd	s2,0(sp)
 2b6:	1000                	addi	s0,sp,32
 2b8:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ba:	4581                	li	a1,0
 2bc:	00000097          	auipc	ra,0x0
 2c0:	170080e7          	jalr	368(ra) # 42c <open>
  if(fd < 0)
 2c4:	02054563          	bltz	a0,2ee <stat+0x42>
 2c8:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2ca:	85ca                	mv	a1,s2
 2cc:	00000097          	auipc	ra,0x0
 2d0:	178080e7          	jalr	376(ra) # 444 <fstat>
 2d4:	892a                	mv	s2,a0
  close(fd);
 2d6:	8526                	mv	a0,s1
 2d8:	00000097          	auipc	ra,0x0
 2dc:	13c080e7          	jalr	316(ra) # 414 <close>
  return r;
}
 2e0:	854a                	mv	a0,s2
 2e2:	60e2                	ld	ra,24(sp)
 2e4:	6442                	ld	s0,16(sp)
 2e6:	64a2                	ld	s1,8(sp)
 2e8:	6902                	ld	s2,0(sp)
 2ea:	6105                	addi	sp,sp,32
 2ec:	8082                	ret
    return -1;
 2ee:	597d                	li	s2,-1
 2f0:	bfc5                	j	2e0 <stat+0x34>

00000000000002f2 <atoi>:

int
atoi(const char *s)
{
 2f2:	1141                	addi	sp,sp,-16
 2f4:	e422                	sd	s0,8(sp)
 2f6:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f8:	00054683          	lbu	a3,0(a0)
 2fc:	fd06879b          	addiw	a5,a3,-48
 300:	0ff7f793          	zext.b	a5,a5
 304:	4625                	li	a2,9
 306:	02f66863          	bltu	a2,a5,336 <atoi+0x44>
 30a:	872a                	mv	a4,a0
  n = 0;
 30c:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 30e:	0705                	addi	a4,a4,1
 310:	0025179b          	slliw	a5,a0,0x2
 314:	9fa9                	addw	a5,a5,a0
 316:	0017979b          	slliw	a5,a5,0x1
 31a:	9fb5                	addw	a5,a5,a3
 31c:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 320:	00074683          	lbu	a3,0(a4)
 324:	fd06879b          	addiw	a5,a3,-48
 328:	0ff7f793          	zext.b	a5,a5
 32c:	fef671e3          	bgeu	a2,a5,30e <atoi+0x1c>
  return n;
}
 330:	6422                	ld	s0,8(sp)
 332:	0141                	addi	sp,sp,16
 334:	8082                	ret
  n = 0;
 336:	4501                	li	a0,0
 338:	bfe5                	j	330 <atoi+0x3e>

000000000000033a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 33a:	1141                	addi	sp,sp,-16
 33c:	e422                	sd	s0,8(sp)
 33e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 340:	02b57463          	bgeu	a0,a1,368 <memmove+0x2e>
    while(n-- > 0)
 344:	00c05f63          	blez	a2,362 <memmove+0x28>
 348:	1602                	slli	a2,a2,0x20
 34a:	9201                	srli	a2,a2,0x20
 34c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 350:	872a                	mv	a4,a0
      *dst++ = *src++;
 352:	0585                	addi	a1,a1,1
 354:	0705                	addi	a4,a4,1
 356:	fff5c683          	lbu	a3,-1(a1)
 35a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 35e:	fee79ae3          	bne	a5,a4,352 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 362:	6422                	ld	s0,8(sp)
 364:	0141                	addi	sp,sp,16
 366:	8082                	ret
    dst += n;
 368:	00c50733          	add	a4,a0,a2
    src += n;
 36c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 36e:	fec05ae3          	blez	a2,362 <memmove+0x28>
 372:	fff6079b          	addiw	a5,a2,-1
 376:	1782                	slli	a5,a5,0x20
 378:	9381                	srli	a5,a5,0x20
 37a:	fff7c793          	not	a5,a5
 37e:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 380:	15fd                	addi	a1,a1,-1
 382:	177d                	addi	a4,a4,-1
 384:	0005c683          	lbu	a3,0(a1)
 388:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 38c:	fee79ae3          	bne	a5,a4,380 <memmove+0x46>
 390:	bfc9                	j	362 <memmove+0x28>

0000000000000392 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 392:	1141                	addi	sp,sp,-16
 394:	e422                	sd	s0,8(sp)
 396:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 398:	ca05                	beqz	a2,3c8 <memcmp+0x36>
 39a:	fff6069b          	addiw	a3,a2,-1
 39e:	1682                	slli	a3,a3,0x20
 3a0:	9281                	srli	a3,a3,0x20
 3a2:	0685                	addi	a3,a3,1
 3a4:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3a6:	00054783          	lbu	a5,0(a0)
 3aa:	0005c703          	lbu	a4,0(a1)
 3ae:	00e79863          	bne	a5,a4,3be <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3b2:	0505                	addi	a0,a0,1
    p2++;
 3b4:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3b6:	fed518e3          	bne	a0,a3,3a6 <memcmp+0x14>
  }
  return 0;
 3ba:	4501                	li	a0,0
 3bc:	a019                	j	3c2 <memcmp+0x30>
      return *p1 - *p2;
 3be:	40e7853b          	subw	a0,a5,a4
}
 3c2:	6422                	ld	s0,8(sp)
 3c4:	0141                	addi	sp,sp,16
 3c6:	8082                	ret
  return 0;
 3c8:	4501                	li	a0,0
 3ca:	bfe5                	j	3c2 <memcmp+0x30>

00000000000003cc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3cc:	1141                	addi	sp,sp,-16
 3ce:	e406                	sd	ra,8(sp)
 3d0:	e022                	sd	s0,0(sp)
 3d2:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3d4:	00000097          	auipc	ra,0x0
 3d8:	f66080e7          	jalr	-154(ra) # 33a <memmove>
}
 3dc:	60a2                	ld	ra,8(sp)
 3de:	6402                	ld	s0,0(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret

00000000000003e4 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 3e4:	4885                	li	a7,1
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <exit>:
.global exit
exit:
 li a7, SYS_exit
 3ec:	4889                	li	a7,2
 ecall
 3ee:	00000073          	ecall
 ret
 3f2:	8082                	ret

00000000000003f4 <wait>:
.global wait
wait:
 li a7, SYS_wait
 3f4:	488d                	li	a7,3
 ecall
 3f6:	00000073          	ecall
 ret
 3fa:	8082                	ret

00000000000003fc <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 3fc:	4891                	li	a7,4
 ecall
 3fe:	00000073          	ecall
 ret
 402:	8082                	ret

0000000000000404 <read>:
.global read
read:
 li a7, SYS_read
 404:	4895                	li	a7,5
 ecall
 406:	00000073          	ecall
 ret
 40a:	8082                	ret

000000000000040c <write>:
.global write
write:
 li a7, SYS_write
 40c:	48c1                	li	a7,16
 ecall
 40e:	00000073          	ecall
 ret
 412:	8082                	ret

0000000000000414 <close>:
.global close
close:
 li a7, SYS_close
 414:	48d5                	li	a7,21
 ecall
 416:	00000073          	ecall
 ret
 41a:	8082                	ret

000000000000041c <kill>:
.global kill
kill:
 li a7, SYS_kill
 41c:	4899                	li	a7,6
 ecall
 41e:	00000073          	ecall
 ret
 422:	8082                	ret

0000000000000424 <exec>:
.global exec
exec:
 li a7, SYS_exec
 424:	489d                	li	a7,7
 ecall
 426:	00000073          	ecall
 ret
 42a:	8082                	ret

000000000000042c <open>:
.global open
open:
 li a7, SYS_open
 42c:	48bd                	li	a7,15
 ecall
 42e:	00000073          	ecall
 ret
 432:	8082                	ret

0000000000000434 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 434:	48c5                	li	a7,17
 ecall
 436:	00000073          	ecall
 ret
 43a:	8082                	ret

000000000000043c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 43c:	48c9                	li	a7,18
 ecall
 43e:	00000073          	ecall
 ret
 442:	8082                	ret

0000000000000444 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 444:	48a1                	li	a7,8
 ecall
 446:	00000073          	ecall
 ret
 44a:	8082                	ret

000000000000044c <link>:
.global link
link:
 li a7, SYS_link
 44c:	48cd                	li	a7,19
 ecall
 44e:	00000073          	ecall
 ret
 452:	8082                	ret

0000000000000454 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 454:	48d1                	li	a7,20
 ecall
 456:	00000073          	ecall
 ret
 45a:	8082                	ret

000000000000045c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 45c:	48a5                	li	a7,9
 ecall
 45e:	00000073          	ecall
 ret
 462:	8082                	ret

0000000000000464 <dup>:
.global dup
dup:
 li a7, SYS_dup
 464:	48a9                	li	a7,10
 ecall
 466:	00000073          	ecall
 ret
 46a:	8082                	ret

000000000000046c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 46c:	48ad                	li	a7,11
 ecall
 46e:	00000073          	ecall
 ret
 472:	8082                	ret

0000000000000474 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 474:	48b1                	li	a7,12
 ecall
 476:	00000073          	ecall
 ret
 47a:	8082                	ret

000000000000047c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 47c:	48b5                	li	a7,13
 ecall
 47e:	00000073          	ecall
 ret
 482:	8082                	ret

0000000000000484 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 484:	48b9                	li	a7,14
 ecall
 486:	00000073          	ecall
 ret
 48a:	8082                	ret

000000000000048c <add>:
.global add
add:
 li a7, SYS_add
 48c:	48d9                	li	a7,22
 ecall
 48e:	00000073          	ecall
 ret
 492:	8082                	ret

0000000000000494 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 494:	1101                	addi	sp,sp,-32
 496:	ec06                	sd	ra,24(sp)
 498:	e822                	sd	s0,16(sp)
 49a:	1000                	addi	s0,sp,32
 49c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4a0:	4605                	li	a2,1
 4a2:	fef40593          	addi	a1,s0,-17
 4a6:	00000097          	auipc	ra,0x0
 4aa:	f66080e7          	jalr	-154(ra) # 40c <write>
}
 4ae:	60e2                	ld	ra,24(sp)
 4b0:	6442                	ld	s0,16(sp)
 4b2:	6105                	addi	sp,sp,32
 4b4:	8082                	ret

00000000000004b6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b6:	7139                	addi	sp,sp,-64
 4b8:	fc06                	sd	ra,56(sp)
 4ba:	f822                	sd	s0,48(sp)
 4bc:	f426                	sd	s1,40(sp)
 4be:	f04a                	sd	s2,32(sp)
 4c0:	ec4e                	sd	s3,24(sp)
 4c2:	0080                	addi	s0,sp,64
 4c4:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4c6:	c299                	beqz	a3,4cc <printint+0x16>
 4c8:	0805c963          	bltz	a1,55a <printint+0xa4>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4cc:	2581                	sext.w	a1,a1
  neg = 0;
 4ce:	4881                	li	a7,0
 4d0:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4d4:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4d6:	2601                	sext.w	a2,a2
 4d8:	00000517          	auipc	a0,0x0
 4dc:	53050513          	addi	a0,a0,1328 # a08 <digits>
 4e0:	883a                	mv	a6,a4
 4e2:	2705                	addiw	a4,a4,1
 4e4:	02c5f7bb          	remuw	a5,a1,a2
 4e8:	1782                	slli	a5,a5,0x20
 4ea:	9381                	srli	a5,a5,0x20
 4ec:	97aa                	add	a5,a5,a0
 4ee:	0007c783          	lbu	a5,0(a5)
 4f2:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4f6:	0005879b          	sext.w	a5,a1
 4fa:	02c5d5bb          	divuw	a1,a1,a2
 4fe:	0685                	addi	a3,a3,1
 500:	fec7f0e3          	bgeu	a5,a2,4e0 <printint+0x2a>
  if(neg)
 504:	00088c63          	beqz	a7,51c <printint+0x66>
    buf[i++] = '-';
 508:	fd070793          	addi	a5,a4,-48
 50c:	00878733          	add	a4,a5,s0
 510:	02d00793          	li	a5,45
 514:	fef70823          	sb	a5,-16(a4)
 518:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 51c:	02e05863          	blez	a4,54c <printint+0x96>
 520:	fc040793          	addi	a5,s0,-64
 524:	00e78933          	add	s2,a5,a4
 528:	fff78993          	addi	s3,a5,-1
 52c:	99ba                	add	s3,s3,a4
 52e:	377d                	addiw	a4,a4,-1
 530:	1702                	slli	a4,a4,0x20
 532:	9301                	srli	a4,a4,0x20
 534:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 538:	fff94583          	lbu	a1,-1(s2)
 53c:	8526                	mv	a0,s1
 53e:	00000097          	auipc	ra,0x0
 542:	f56080e7          	jalr	-170(ra) # 494 <putc>
  while(--i >= 0)
 546:	197d                	addi	s2,s2,-1
 548:	ff3918e3          	bne	s2,s3,538 <printint+0x82>
}
 54c:	70e2                	ld	ra,56(sp)
 54e:	7442                	ld	s0,48(sp)
 550:	74a2                	ld	s1,40(sp)
 552:	7902                	ld	s2,32(sp)
 554:	69e2                	ld	s3,24(sp)
 556:	6121                	addi	sp,sp,64
 558:	8082                	ret
    x = -xx;
 55a:	40b005bb          	negw	a1,a1
    neg = 1;
 55e:	4885                	li	a7,1
    x = -xx;
 560:	bf85                	j	4d0 <printint+0x1a>

0000000000000562 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 562:	7119                	addi	sp,sp,-128
 564:	fc86                	sd	ra,120(sp)
 566:	f8a2                	sd	s0,112(sp)
 568:	f4a6                	sd	s1,104(sp)
 56a:	f0ca                	sd	s2,96(sp)
 56c:	ecce                	sd	s3,88(sp)
 56e:	e8d2                	sd	s4,80(sp)
 570:	e4d6                	sd	s5,72(sp)
 572:	e0da                	sd	s6,64(sp)
 574:	fc5e                	sd	s7,56(sp)
 576:	f862                	sd	s8,48(sp)
 578:	f466                	sd	s9,40(sp)
 57a:	f06a                	sd	s10,32(sp)
 57c:	ec6e                	sd	s11,24(sp)
 57e:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 580:	0005c903          	lbu	s2,0(a1)
 584:	18090f63          	beqz	s2,722 <vprintf+0x1c0>
 588:	8aaa                	mv	s5,a0
 58a:	8b32                	mv	s6,a2
 58c:	00158493          	addi	s1,a1,1
  state = 0;
 590:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 592:	02500a13          	li	s4,37
 596:	4c55                	li	s8,21
 598:	00000c97          	auipc	s9,0x0
 59c:	418c8c93          	addi	s9,s9,1048 # 9b0 <malloc+0x18a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5a0:	02800d93          	li	s11,40
  putc(fd, 'x');
 5a4:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5a6:	00000b97          	auipc	s7,0x0
 5aa:	462b8b93          	addi	s7,s7,1122 # a08 <digits>
 5ae:	a839                	j	5cc <vprintf+0x6a>
        putc(fd, c);
 5b0:	85ca                	mv	a1,s2
 5b2:	8556                	mv	a0,s5
 5b4:	00000097          	auipc	ra,0x0
 5b8:	ee0080e7          	jalr	-288(ra) # 494 <putc>
 5bc:	a019                	j	5c2 <vprintf+0x60>
    } else if(state == '%'){
 5be:	01498d63          	beq	s3,s4,5d8 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 5c2:	0485                	addi	s1,s1,1
 5c4:	fff4c903          	lbu	s2,-1(s1)
 5c8:	14090d63          	beqz	s2,722 <vprintf+0x1c0>
    if(state == 0){
 5cc:	fe0999e3          	bnez	s3,5be <vprintf+0x5c>
      if(c == '%'){
 5d0:	ff4910e3          	bne	s2,s4,5b0 <vprintf+0x4e>
        state = '%';
 5d4:	89d2                	mv	s3,s4
 5d6:	b7f5                	j	5c2 <vprintf+0x60>
      if(c == 'd'){
 5d8:	11490c63          	beq	s2,s4,6f0 <vprintf+0x18e>
 5dc:	f9d9079b          	addiw	a5,s2,-99
 5e0:	0ff7f793          	zext.b	a5,a5
 5e4:	10fc6e63          	bltu	s8,a5,700 <vprintf+0x19e>
 5e8:	f9d9079b          	addiw	a5,s2,-99
 5ec:	0ff7f713          	zext.b	a4,a5
 5f0:	10ec6863          	bltu	s8,a4,700 <vprintf+0x19e>
 5f4:	00271793          	slli	a5,a4,0x2
 5f8:	97e6                	add	a5,a5,s9
 5fa:	439c                	lw	a5,0(a5)
 5fc:	97e6                	add	a5,a5,s9
 5fe:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 600:	008b0913          	addi	s2,s6,8
 604:	4685                	li	a3,1
 606:	4629                	li	a2,10
 608:	000b2583          	lw	a1,0(s6)
 60c:	8556                	mv	a0,s5
 60e:	00000097          	auipc	ra,0x0
 612:	ea8080e7          	jalr	-344(ra) # 4b6 <printint>
 616:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 618:	4981                	li	s3,0
 61a:	b765                	j	5c2 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 61c:	008b0913          	addi	s2,s6,8
 620:	4681                	li	a3,0
 622:	4629                	li	a2,10
 624:	000b2583          	lw	a1,0(s6)
 628:	8556                	mv	a0,s5
 62a:	00000097          	auipc	ra,0x0
 62e:	e8c080e7          	jalr	-372(ra) # 4b6 <printint>
 632:	8b4a                	mv	s6,s2
      state = 0;
 634:	4981                	li	s3,0
 636:	b771                	j	5c2 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 638:	008b0913          	addi	s2,s6,8
 63c:	4681                	li	a3,0
 63e:	866a                	mv	a2,s10
 640:	000b2583          	lw	a1,0(s6)
 644:	8556                	mv	a0,s5
 646:	00000097          	auipc	ra,0x0
 64a:	e70080e7          	jalr	-400(ra) # 4b6 <printint>
 64e:	8b4a                	mv	s6,s2
      state = 0;
 650:	4981                	li	s3,0
 652:	bf85                	j	5c2 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 654:	008b0793          	addi	a5,s6,8
 658:	f8f43423          	sd	a5,-120(s0)
 65c:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 660:	03000593          	li	a1,48
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	e2e080e7          	jalr	-466(ra) # 494 <putc>
  putc(fd, 'x');
 66e:	07800593          	li	a1,120
 672:	8556                	mv	a0,s5
 674:	00000097          	auipc	ra,0x0
 678:	e20080e7          	jalr	-480(ra) # 494 <putc>
 67c:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 67e:	03c9d793          	srli	a5,s3,0x3c
 682:	97de                	add	a5,a5,s7
 684:	0007c583          	lbu	a1,0(a5)
 688:	8556                	mv	a0,s5
 68a:	00000097          	auipc	ra,0x0
 68e:	e0a080e7          	jalr	-502(ra) # 494 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 692:	0992                	slli	s3,s3,0x4
 694:	397d                	addiw	s2,s2,-1
 696:	fe0914e3          	bnez	s2,67e <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 69a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 69e:	4981                	li	s3,0
 6a0:	b70d                	j	5c2 <vprintf+0x60>
        s = va_arg(ap, char*);
 6a2:	008b0913          	addi	s2,s6,8
 6a6:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6aa:	02098163          	beqz	s3,6cc <vprintf+0x16a>
        while(*s != 0){
 6ae:	0009c583          	lbu	a1,0(s3)
 6b2:	c5ad                	beqz	a1,71c <vprintf+0x1ba>
          putc(fd, *s);
 6b4:	8556                	mv	a0,s5
 6b6:	00000097          	auipc	ra,0x0
 6ba:	dde080e7          	jalr	-546(ra) # 494 <putc>
          s++;
 6be:	0985                	addi	s3,s3,1
        while(*s != 0){
 6c0:	0009c583          	lbu	a1,0(s3)
 6c4:	f9e5                	bnez	a1,6b4 <vprintf+0x152>
        s = va_arg(ap, char*);
 6c6:	8b4a                	mv	s6,s2
      state = 0;
 6c8:	4981                	li	s3,0
 6ca:	bde5                	j	5c2 <vprintf+0x60>
          s = "(null)";
 6cc:	00000997          	auipc	s3,0x0
 6d0:	2dc98993          	addi	s3,s3,732 # 9a8 <malloc+0x182>
        while(*s != 0){
 6d4:	85ee                	mv	a1,s11
 6d6:	bff9                	j	6b4 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 6d8:	008b0913          	addi	s2,s6,8
 6dc:	000b4583          	lbu	a1,0(s6)
 6e0:	8556                	mv	a0,s5
 6e2:	00000097          	auipc	ra,0x0
 6e6:	db2080e7          	jalr	-590(ra) # 494 <putc>
 6ea:	8b4a                	mv	s6,s2
      state = 0;
 6ec:	4981                	li	s3,0
 6ee:	bdd1                	j	5c2 <vprintf+0x60>
        putc(fd, c);
 6f0:	85d2                	mv	a1,s4
 6f2:	8556                	mv	a0,s5
 6f4:	00000097          	auipc	ra,0x0
 6f8:	da0080e7          	jalr	-608(ra) # 494 <putc>
      state = 0;
 6fc:	4981                	li	s3,0
 6fe:	b5d1                	j	5c2 <vprintf+0x60>
        putc(fd, '%');
 700:	85d2                	mv	a1,s4
 702:	8556                	mv	a0,s5
 704:	00000097          	auipc	ra,0x0
 708:	d90080e7          	jalr	-624(ra) # 494 <putc>
        putc(fd, c);
 70c:	85ca                	mv	a1,s2
 70e:	8556                	mv	a0,s5
 710:	00000097          	auipc	ra,0x0
 714:	d84080e7          	jalr	-636(ra) # 494 <putc>
      state = 0;
 718:	4981                	li	s3,0
 71a:	b565                	j	5c2 <vprintf+0x60>
        s = va_arg(ap, char*);
 71c:	8b4a                	mv	s6,s2
      state = 0;
 71e:	4981                	li	s3,0
 720:	b54d                	j	5c2 <vprintf+0x60>
    }
  }
}
 722:	70e6                	ld	ra,120(sp)
 724:	7446                	ld	s0,112(sp)
 726:	74a6                	ld	s1,104(sp)
 728:	7906                	ld	s2,96(sp)
 72a:	69e6                	ld	s3,88(sp)
 72c:	6a46                	ld	s4,80(sp)
 72e:	6aa6                	ld	s5,72(sp)
 730:	6b06                	ld	s6,64(sp)
 732:	7be2                	ld	s7,56(sp)
 734:	7c42                	ld	s8,48(sp)
 736:	7ca2                	ld	s9,40(sp)
 738:	7d02                	ld	s10,32(sp)
 73a:	6de2                	ld	s11,24(sp)
 73c:	6109                	addi	sp,sp,128
 73e:	8082                	ret

0000000000000740 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 740:	715d                	addi	sp,sp,-80
 742:	ec06                	sd	ra,24(sp)
 744:	e822                	sd	s0,16(sp)
 746:	1000                	addi	s0,sp,32
 748:	e010                	sd	a2,0(s0)
 74a:	e414                	sd	a3,8(s0)
 74c:	e818                	sd	a4,16(s0)
 74e:	ec1c                	sd	a5,24(s0)
 750:	03043023          	sd	a6,32(s0)
 754:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 758:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 75c:	8622                	mv	a2,s0
 75e:	00000097          	auipc	ra,0x0
 762:	e04080e7          	jalr	-508(ra) # 562 <vprintf>
}
 766:	60e2                	ld	ra,24(sp)
 768:	6442                	ld	s0,16(sp)
 76a:	6161                	addi	sp,sp,80
 76c:	8082                	ret

000000000000076e <printf>:

void
printf(const char *fmt, ...)
{
 76e:	711d                	addi	sp,sp,-96
 770:	ec06                	sd	ra,24(sp)
 772:	e822                	sd	s0,16(sp)
 774:	1000                	addi	s0,sp,32
 776:	e40c                	sd	a1,8(s0)
 778:	e810                	sd	a2,16(s0)
 77a:	ec14                	sd	a3,24(s0)
 77c:	f018                	sd	a4,32(s0)
 77e:	f41c                	sd	a5,40(s0)
 780:	03043823          	sd	a6,48(s0)
 784:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 788:	00840613          	addi	a2,s0,8
 78c:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 790:	85aa                	mv	a1,a0
 792:	4505                	li	a0,1
 794:	00000097          	auipc	ra,0x0
 798:	dce080e7          	jalr	-562(ra) # 562 <vprintf>
}
 79c:	60e2                	ld	ra,24(sp)
 79e:	6442                	ld	s0,16(sp)
 7a0:	6125                	addi	sp,sp,96
 7a2:	8082                	ret

00000000000007a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a4:	1141                	addi	sp,sp,-16
 7a6:	e422                	sd	s0,8(sp)
 7a8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7aa:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ae:	00001797          	auipc	a5,0x1
 7b2:	8527b783          	ld	a5,-1966(a5) # 1000 <freep>
 7b6:	a02d                	j	7e0 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7b8:	4618                	lw	a4,8(a2)
 7ba:	9f2d                	addw	a4,a4,a1
 7bc:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c0:	6398                	ld	a4,0(a5)
 7c2:	6310                	ld	a2,0(a4)
 7c4:	a83d                	j	802 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7c6:	ff852703          	lw	a4,-8(a0)
 7ca:	9f31                	addw	a4,a4,a2
 7cc:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 7ce:	ff053683          	ld	a3,-16(a0)
 7d2:	a091                	j	816 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d4:	6398                	ld	a4,0(a5)
 7d6:	00e7e463          	bltu	a5,a4,7de <free+0x3a>
 7da:	00e6ea63          	bltu	a3,a4,7ee <free+0x4a>
{
 7de:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e0:	fed7fae3          	bgeu	a5,a3,7d4 <free+0x30>
 7e4:	6398                	ld	a4,0(a5)
 7e6:	00e6e463          	bltu	a3,a4,7ee <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ea:	fee7eae3          	bltu	a5,a4,7de <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 7ee:	ff852583          	lw	a1,-8(a0)
 7f2:	6390                	ld	a2,0(a5)
 7f4:	02059813          	slli	a6,a1,0x20
 7f8:	01c85713          	srli	a4,a6,0x1c
 7fc:	9736                	add	a4,a4,a3
 7fe:	fae60de3          	beq	a2,a4,7b8 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 802:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 806:	4790                	lw	a2,8(a5)
 808:	02061593          	slli	a1,a2,0x20
 80c:	01c5d713          	srli	a4,a1,0x1c
 810:	973e                	add	a4,a4,a5
 812:	fae68ae3          	beq	a3,a4,7c6 <free+0x22>
    p->s.ptr = bp->s.ptr;
 816:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 818:	00000717          	auipc	a4,0x0
 81c:	7ef73423          	sd	a5,2024(a4) # 1000 <freep>
}
 820:	6422                	ld	s0,8(sp)
 822:	0141                	addi	sp,sp,16
 824:	8082                	ret

0000000000000826 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 826:	7139                	addi	sp,sp,-64
 828:	fc06                	sd	ra,56(sp)
 82a:	f822                	sd	s0,48(sp)
 82c:	f426                	sd	s1,40(sp)
 82e:	f04a                	sd	s2,32(sp)
 830:	ec4e                	sd	s3,24(sp)
 832:	e852                	sd	s4,16(sp)
 834:	e456                	sd	s5,8(sp)
 836:	e05a                	sd	s6,0(sp)
 838:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 83a:	02051493          	slli	s1,a0,0x20
 83e:	9081                	srli	s1,s1,0x20
 840:	04bd                	addi	s1,s1,15
 842:	8091                	srli	s1,s1,0x4
 844:	0014899b          	addiw	s3,s1,1
 848:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 84a:	00000517          	auipc	a0,0x0
 84e:	7b653503          	ld	a0,1974(a0) # 1000 <freep>
 852:	c515                	beqz	a0,87e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 854:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 856:	4798                	lw	a4,8(a5)
 858:	02977f63          	bgeu	a4,s1,896 <malloc+0x70>
 85c:	8a4e                	mv	s4,s3
 85e:	0009871b          	sext.w	a4,s3
 862:	6685                	lui	a3,0x1
 864:	00d77363          	bgeu	a4,a3,86a <malloc+0x44>
 868:	6a05                	lui	s4,0x1
 86a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 86e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 872:	00000917          	auipc	s2,0x0
 876:	78e90913          	addi	s2,s2,1934 # 1000 <freep>
  if(p == (char*)-1)
 87a:	5afd                	li	s5,-1
 87c:	a895                	j	8f0 <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 87e:	00000797          	auipc	a5,0x0
 882:	79278793          	addi	a5,a5,1938 # 1010 <base>
 886:	00000717          	auipc	a4,0x0
 88a:	76f73d23          	sd	a5,1914(a4) # 1000 <freep>
 88e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 890:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 894:	b7e1                	j	85c <malloc+0x36>
      if(p->s.size == nunits)
 896:	02e48c63          	beq	s1,a4,8ce <malloc+0xa8>
        p->s.size -= nunits;
 89a:	4137073b          	subw	a4,a4,s3
 89e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8a0:	02071693          	slli	a3,a4,0x20
 8a4:	01c6d713          	srli	a4,a3,0x1c
 8a8:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8aa:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8ae:	00000717          	auipc	a4,0x0
 8b2:	74a73923          	sd	a0,1874(a4) # 1000 <freep>
      return (void*)(p + 1);
 8b6:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8ba:	70e2                	ld	ra,56(sp)
 8bc:	7442                	ld	s0,48(sp)
 8be:	74a2                	ld	s1,40(sp)
 8c0:	7902                	ld	s2,32(sp)
 8c2:	69e2                	ld	s3,24(sp)
 8c4:	6a42                	ld	s4,16(sp)
 8c6:	6aa2                	ld	s5,8(sp)
 8c8:	6b02                	ld	s6,0(sp)
 8ca:	6121                	addi	sp,sp,64
 8cc:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8ce:	6398                	ld	a4,0(a5)
 8d0:	e118                	sd	a4,0(a0)
 8d2:	bff1                	j	8ae <malloc+0x88>
  hp->s.size = nu;
 8d4:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8d8:	0541                	addi	a0,a0,16
 8da:	00000097          	auipc	ra,0x0
 8de:	eca080e7          	jalr	-310(ra) # 7a4 <free>
  return freep;
 8e2:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8e6:	d971                	beqz	a0,8ba <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8ea:	4798                	lw	a4,8(a5)
 8ec:	fa9775e3          	bgeu	a4,s1,896 <malloc+0x70>
    if(p == freep)
 8f0:	00093703          	ld	a4,0(s2)
 8f4:	853e                	mv	a0,a5
 8f6:	fef719e3          	bne	a4,a5,8e8 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 8fa:	8552                	mv	a0,s4
 8fc:	00000097          	auipc	ra,0x0
 900:	b78080e7          	jalr	-1160(ra) # 474 <sbrk>
  if(p == (char*)-1)
 904:	fd5518e3          	bne	a0,s5,8d4 <malloc+0xae>
        return 0;
 908:	4501                	li	a0,0
 90a:	bf45                	j	8ba <malloc+0x94>
