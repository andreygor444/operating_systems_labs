
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
   c:	91850513          	addi	a0,a0,-1768 # 920 <malloc+0xf0>
  10:	00000097          	auipc	ra,0x0
  14:	768080e7          	jalr	1896(ra) # 778 <printf>
  exit(1);
  18:	4505                	li	a0,1
  1a:	00000097          	auipc	ra,0x0
  1e:	3dc080e7          	jalr	988(ra) # 3f6 <exit>

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
  	if (s[n - 1] == '\n' || s[n - 1] == '\0') break;
  3c:	49a9                	li	s3,10
  while(n < 22 && read(0, s + (n++), 1) > 0) { // Читаем по одному байту
  3e:	4605                	li	a2,1
  40:	85a6                	mv	a1,s1
  42:	4501                	li	a0,0
  44:	00000097          	auipc	ra,0x0
  48:	3ca080e7          	jalr	970(ra) # 40e <read>
  4c:	02a05e63          	blez	a0,88 <main+0x66>
  	if (s[n - 1] == '\n' || s[n - 1] == '\0') break;
  50:	0004c783          	lbu	a5,0(s1)
  54:	03378d63          	beq	a5,s3,8e <main+0x6c>
  58:	cf95                	beqz	a5,94 <main+0x72>
  while(n < 22 && read(0, s + (n++), 1) > 0) { // Читаем по одному байту
  5a:	0485                	addi	s1,s1,1
  5c:	ff4491e3          	bne	s1,s4,3e <main+0x1c>
  60:	87ca                	mv	a5,s2
  62:	4481                	li	s1,0
  }
  int i = 0, j;
  while (i < 22 && s[i] != ' ' && s[i] != '\n') ++i;
  64:	02000693          	li	a3,32
  68:	4629                	li	a2,10
  6a:	45d9                	li	a1,22
  6c:	0007c703          	lbu	a4,0(a5)
  70:	08d70963          	beq	a4,a3,102 <main+0xe0>
  74:	00c70663          	beq	a4,a2,80 <main+0x5e>
  78:	2485                	addiw	s1,s1,1
  7a:	0785                	addi	a5,a5,1
  7c:	feb498e3          	bne	s1,a1,6c <main+0x4a>
  if (i == 22 || s[i] == '\n') error();
  80:	00000097          	auipc	ra,0x0
  84:	f80080e7          	jalr	-128(ra) # 0 <error>
  88:	87ca                	mv	a5,s2
  8a:	4481                	li	s1,0
  8c:	bfe1                	j	64 <main+0x42>
  8e:	87ca                	mv	a5,s2
  90:	4481                	li	s1,0
  92:	bfc9                	j	64 <main+0x42>
  94:	87ca                	mv	a5,s2
  96:	4481                	li	s1,0
  98:	b7f1                	j	64 <main+0x42>
  for (j = 0; j < i; ++j) {
  	if (s[j] < 48 || s[j] > 57) error();
  9a:	00000097          	auipc	ra,0x0
  9e:	f66080e7          	jalr	-154(ra) # 0 <error>
  }
  for (j = i + 1; j < 22 && (s[j] != '\n' && s[j] != '\0'); ++j) {
  	if (s[j] < 48 || s[j] > 57) error();
  a2:	00000097          	auipc	ra,0x0
  a6:	f5e080e7          	jalr	-162(ra) # 0 <error>
  }
  if (j == 22) error();
  aa:	47d9                	li	a5,22
  ac:	0af68e63          	beq	a3,a5,168 <main+0x146>
  s[i] = '\0';
  b0:	fd048793          	addi	a5,s1,-48
  b4:	97a2                	add	a5,a5,s0
  b6:	fe078423          	sb	zero,-24(a5)
  int res = add(atoi(s), atoi(s + i + 1));
  ba:	fb840513          	addi	a0,s0,-72
  be:	00000097          	auipc	ra,0x0
  c2:	23e080e7          	jalr	574(ra) # 2fc <atoi>
  c6:	892a                	mv	s2,a0
  c8:	00148513          	addi	a0,s1,1
  cc:	fb840793          	addi	a5,s0,-72
  d0:	953e                	add	a0,a0,a5
  d2:	00000097          	auipc	ra,0x0
  d6:	22a080e7          	jalr	554(ra) # 2fc <atoi>
  da:	85aa                	mv	a1,a0
  dc:	854a                	mv	a0,s2
  de:	00000097          	auipc	ra,0x0
  e2:	3b8080e7          	jalr	952(ra) # 496 <add>
  e6:	85aa                	mv	a1,a0
  printf("%d\n", res);
  e8:	00001517          	auipc	a0,0x1
  ec:	8c850513          	addi	a0,a0,-1848 # 9b0 <malloc+0x180>
  f0:	00000097          	auipc	ra,0x0
  f4:	688080e7          	jalr	1672(ra) # 778 <printf>
  exit(0);
  f8:	4501                	li	a0,0
  fa:	00000097          	auipc	ra,0x0
  fe:	2fc080e7          	jalr	764(ra) # 3f6 <exit>
  if (i == 22 || s[i] == '\n') error();
 102:	47d9                	li	a5,22
 104:	f6f48ee3          	beq	s1,a5,80 <main+0x5e>
  for (j = 0; j < i; ++j) {
 108:	02905563          	blez	s1,132 <main+0x110>
 10c:	00190713          	addi	a4,s2,1
 110:	fff4879b          	addiw	a5,s1,-1
 114:	1782                	slli	a5,a5,0x20
 116:	9381                	srli	a5,a5,0x20
 118:	973e                	add	a4,a4,a5
  	if (s[j] < 48 || s[j] > 57) error();
 11a:	46a5                	li	a3,9
 11c:	00094783          	lbu	a5,0(s2)
 120:	fd07879b          	addiw	a5,a5,-48
 124:	0ff7f793          	zext.b	a5,a5
 128:	f6f6e9e3          	bltu	a3,a5,9a <main+0x78>
  for (j = 0; j < i; ++j) {
 12c:	0905                	addi	s2,s2,1
 12e:	fee917e3          	bne	s2,a4,11c <main+0xfa>
  for (j = i + 1; j < 22 && (s[j] != '\n' && s[j] != '\0'); ++j) {
 132:	0014869b          	addiw	a3,s1,1
 136:	47d5                	li	a5,21
 138:	f6d7c9e3          	blt	a5,a3,aa <main+0x88>
 13c:	fb840793          	addi	a5,s0,-72
 140:	00978733          	add	a4,a5,s1
 144:	4629                	li	a2,10
  	if (s[j] < 48 || s[j] > 57) error();
 146:	45a5                	li	a1,9
  for (j = i + 1; j < 22 && (s[j] != '\n' && s[j] != '\0'); ++j) {
 148:	4559                	li	a0,22
 14a:	00174783          	lbu	a5,1(a4)
 14e:	f4c78ee3          	beq	a5,a2,aa <main+0x88>
 152:	dfa1                	beqz	a5,aa <main+0x88>
  	if (s[j] < 48 || s[j] > 57) error();
 154:	fd07879b          	addiw	a5,a5,-48
 158:	0ff7f793          	zext.b	a5,a5
 15c:	f4f5e3e3          	bltu	a1,a5,a2 <main+0x80>
  for (j = i + 1; j < 22 && (s[j] != '\n' && s[j] != '\0'); ++j) {
 160:	2685                	addiw	a3,a3,1
 162:	0705                	addi	a4,a4,1
 164:	fea693e3          	bne	a3,a0,14a <main+0x128>
  if (j == 22) error();
 168:	00000097          	auipc	ra,0x0
 16c:	e98080e7          	jalr	-360(ra) # 0 <error>

0000000000000170 <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 170:	1141                	addi	sp,sp,-16
 172:	e406                	sd	ra,8(sp)
 174:	e022                	sd	s0,0(sp)
 176:	0800                	addi	s0,sp,16
  extern int main();
  main();
 178:	00000097          	auipc	ra,0x0
 17c:	eaa080e7          	jalr	-342(ra) # 22 <main>
  exit(0);
 180:	4501                	li	a0,0
 182:	00000097          	auipc	ra,0x0
 186:	274080e7          	jalr	628(ra) # 3f6 <exit>

000000000000018a <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 18a:	1141                	addi	sp,sp,-16
 18c:	e422                	sd	s0,8(sp)
 18e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 190:	87aa                	mv	a5,a0
 192:	0585                	addi	a1,a1,1
 194:	0785                	addi	a5,a5,1
 196:	fff5c703          	lbu	a4,-1(a1)
 19a:	fee78fa3          	sb	a4,-1(a5)
 19e:	fb75                	bnez	a4,192 <strcpy+0x8>
    ;
  return os;
}
 1a0:	6422                	ld	s0,8(sp)
 1a2:	0141                	addi	sp,sp,16
 1a4:	8082                	ret

00000000000001a6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a6:	1141                	addi	sp,sp,-16
 1a8:	e422                	sd	s0,8(sp)
 1aa:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1ac:	00054783          	lbu	a5,0(a0)
 1b0:	cb91                	beqz	a5,1c4 <strcmp+0x1e>
 1b2:	0005c703          	lbu	a4,0(a1)
 1b6:	00f71763          	bne	a4,a5,1c4 <strcmp+0x1e>
    p++, q++;
 1ba:	0505                	addi	a0,a0,1
 1bc:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1be:	00054783          	lbu	a5,0(a0)
 1c2:	fbe5                	bnez	a5,1b2 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 1c4:	0005c503          	lbu	a0,0(a1)
}
 1c8:	40a7853b          	subw	a0,a5,a0
 1cc:	6422                	ld	s0,8(sp)
 1ce:	0141                	addi	sp,sp,16
 1d0:	8082                	ret

00000000000001d2 <strlen>:

uint
strlen(const char *s)
{
 1d2:	1141                	addi	sp,sp,-16
 1d4:	e422                	sd	s0,8(sp)
 1d6:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 1d8:	00054783          	lbu	a5,0(a0)
 1dc:	cf91                	beqz	a5,1f8 <strlen+0x26>
 1de:	0505                	addi	a0,a0,1
 1e0:	87aa                	mv	a5,a0
 1e2:	4685                	li	a3,1
 1e4:	9e89                	subw	a3,a3,a0
 1e6:	00f6853b          	addw	a0,a3,a5
 1ea:	0785                	addi	a5,a5,1
 1ec:	fff7c703          	lbu	a4,-1(a5)
 1f0:	fb7d                	bnez	a4,1e6 <strlen+0x14>
    ;
  return n;
}
 1f2:	6422                	ld	s0,8(sp)
 1f4:	0141                	addi	sp,sp,16
 1f6:	8082                	ret
  for(n = 0; s[n]; n++)
 1f8:	4501                	li	a0,0
 1fa:	bfe5                	j	1f2 <strlen+0x20>

00000000000001fc <memset>:

void*
memset(void *dst, int c, uint n)
{
 1fc:	1141                	addi	sp,sp,-16
 1fe:	e422                	sd	s0,8(sp)
 200:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 202:	ca19                	beqz	a2,218 <memset+0x1c>
 204:	87aa                	mv	a5,a0
 206:	1602                	slli	a2,a2,0x20
 208:	9201                	srli	a2,a2,0x20
 20a:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 20e:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 212:	0785                	addi	a5,a5,1
 214:	fee79de3          	bne	a5,a4,20e <memset+0x12>
  }
  return dst;
}
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret

000000000000021e <strchr>:

char*
strchr(const char *s, char c)
{
 21e:	1141                	addi	sp,sp,-16
 220:	e422                	sd	s0,8(sp)
 222:	0800                	addi	s0,sp,16
  for(; *s; s++)
 224:	00054783          	lbu	a5,0(a0)
 228:	cb99                	beqz	a5,23e <strchr+0x20>
    if(*s == c)
 22a:	00f58763          	beq	a1,a5,238 <strchr+0x1a>
  for(; *s; s++)
 22e:	0505                	addi	a0,a0,1
 230:	00054783          	lbu	a5,0(a0)
 234:	fbfd                	bnez	a5,22a <strchr+0xc>
      return (char*)s;
  return 0;
 236:	4501                	li	a0,0
}
 238:	6422                	ld	s0,8(sp)
 23a:	0141                	addi	sp,sp,16
 23c:	8082                	ret
  return 0;
 23e:	4501                	li	a0,0
 240:	bfe5                	j	238 <strchr+0x1a>

0000000000000242 <gets>:

char*
gets(char *buf, int max)
{
 242:	711d                	addi	sp,sp,-96
 244:	ec86                	sd	ra,88(sp)
 246:	e8a2                	sd	s0,80(sp)
 248:	e4a6                	sd	s1,72(sp)
 24a:	e0ca                	sd	s2,64(sp)
 24c:	fc4e                	sd	s3,56(sp)
 24e:	f852                	sd	s4,48(sp)
 250:	f456                	sd	s5,40(sp)
 252:	f05a                	sd	s6,32(sp)
 254:	ec5e                	sd	s7,24(sp)
 256:	1080                	addi	s0,sp,96
 258:	8baa                	mv	s7,a0
 25a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25c:	892a                	mv	s2,a0
 25e:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 260:	4aa9                	li	s5,10
 262:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 264:	89a6                	mv	s3,s1
 266:	2485                	addiw	s1,s1,1
 268:	0344d863          	bge	s1,s4,298 <gets+0x56>
    cc = read(0, &c, 1);
 26c:	4605                	li	a2,1
 26e:	faf40593          	addi	a1,s0,-81
 272:	4501                	li	a0,0
 274:	00000097          	auipc	ra,0x0
 278:	19a080e7          	jalr	410(ra) # 40e <read>
    if(cc < 1)
 27c:	00a05e63          	blez	a0,298 <gets+0x56>
    buf[i++] = c;
 280:	faf44783          	lbu	a5,-81(s0)
 284:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 288:	01578763          	beq	a5,s5,296 <gets+0x54>
 28c:	0905                	addi	s2,s2,1
 28e:	fd679be3          	bne	a5,s6,264 <gets+0x22>
  for(i=0; i+1 < max; ){
 292:	89a6                	mv	s3,s1
 294:	a011                	j	298 <gets+0x56>
 296:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 298:	99de                	add	s3,s3,s7
 29a:	00098023          	sb	zero,0(s3)
  return buf;
}
 29e:	855e                	mv	a0,s7
 2a0:	60e6                	ld	ra,88(sp)
 2a2:	6446                	ld	s0,80(sp)
 2a4:	64a6                	ld	s1,72(sp)
 2a6:	6906                	ld	s2,64(sp)
 2a8:	79e2                	ld	s3,56(sp)
 2aa:	7a42                	ld	s4,48(sp)
 2ac:	7aa2                	ld	s5,40(sp)
 2ae:	7b02                	ld	s6,32(sp)
 2b0:	6be2                	ld	s7,24(sp)
 2b2:	6125                	addi	sp,sp,96
 2b4:	8082                	ret

00000000000002b6 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b6:	1101                	addi	sp,sp,-32
 2b8:	ec06                	sd	ra,24(sp)
 2ba:	e822                	sd	s0,16(sp)
 2bc:	e426                	sd	s1,8(sp)
 2be:	e04a                	sd	s2,0(sp)
 2c0:	1000                	addi	s0,sp,32
 2c2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c4:	4581                	li	a1,0
 2c6:	00000097          	auipc	ra,0x0
 2ca:	170080e7          	jalr	368(ra) # 436 <open>
  if(fd < 0)
 2ce:	02054563          	bltz	a0,2f8 <stat+0x42>
 2d2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 2d4:	85ca                	mv	a1,s2
 2d6:	00000097          	auipc	ra,0x0
 2da:	178080e7          	jalr	376(ra) # 44e <fstat>
 2de:	892a                	mv	s2,a0
  close(fd);
 2e0:	8526                	mv	a0,s1
 2e2:	00000097          	auipc	ra,0x0
 2e6:	13c080e7          	jalr	316(ra) # 41e <close>
  return r;
}
 2ea:	854a                	mv	a0,s2
 2ec:	60e2                	ld	ra,24(sp)
 2ee:	6442                	ld	s0,16(sp)
 2f0:	64a2                	ld	s1,8(sp)
 2f2:	6902                	ld	s2,0(sp)
 2f4:	6105                	addi	sp,sp,32
 2f6:	8082                	ret
    return -1;
 2f8:	597d                	li	s2,-1
 2fa:	bfc5                	j	2ea <stat+0x34>

00000000000002fc <atoi>:

int
atoi(const char *s)
{
 2fc:	1141                	addi	sp,sp,-16
 2fe:	e422                	sd	s0,8(sp)
 300:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 302:	00054683          	lbu	a3,0(a0)
 306:	fd06879b          	addiw	a5,a3,-48
 30a:	0ff7f793          	zext.b	a5,a5
 30e:	4625                	li	a2,9
 310:	02f66863          	bltu	a2,a5,340 <atoi+0x44>
 314:	872a                	mv	a4,a0
  n = 0;
 316:	4501                	li	a0,0
    n = n*10 + *s++ - '0';
 318:	0705                	addi	a4,a4,1
 31a:	0025179b          	slliw	a5,a0,0x2
 31e:	9fa9                	addw	a5,a5,a0
 320:	0017979b          	slliw	a5,a5,0x1
 324:	9fb5                	addw	a5,a5,a3
 326:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 32a:	00074683          	lbu	a3,0(a4)
 32e:	fd06879b          	addiw	a5,a3,-48
 332:	0ff7f793          	zext.b	a5,a5
 336:	fef671e3          	bgeu	a2,a5,318 <atoi+0x1c>
  return n;
}
 33a:	6422                	ld	s0,8(sp)
 33c:	0141                	addi	sp,sp,16
 33e:	8082                	ret
  n = 0;
 340:	4501                	li	a0,0
 342:	bfe5                	j	33a <atoi+0x3e>

0000000000000344 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 344:	1141                	addi	sp,sp,-16
 346:	e422                	sd	s0,8(sp)
 348:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 34a:	02b57463          	bgeu	a0,a1,372 <memmove+0x2e>
    while(n-- > 0)
 34e:	00c05f63          	blez	a2,36c <memmove+0x28>
 352:	1602                	slli	a2,a2,0x20
 354:	9201                	srli	a2,a2,0x20
 356:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 35a:	872a                	mv	a4,a0
      *dst++ = *src++;
 35c:	0585                	addi	a1,a1,1
 35e:	0705                	addi	a4,a4,1
 360:	fff5c683          	lbu	a3,-1(a1)
 364:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 368:	fee79ae3          	bne	a5,a4,35c <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 36c:	6422                	ld	s0,8(sp)
 36e:	0141                	addi	sp,sp,16
 370:	8082                	ret
    dst += n;
 372:	00c50733          	add	a4,a0,a2
    src += n;
 376:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 378:	fec05ae3          	blez	a2,36c <memmove+0x28>
 37c:	fff6079b          	addiw	a5,a2,-1
 380:	1782                	slli	a5,a5,0x20
 382:	9381                	srli	a5,a5,0x20
 384:	fff7c793          	not	a5,a5
 388:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 38a:	15fd                	addi	a1,a1,-1
 38c:	177d                	addi	a4,a4,-1
 38e:	0005c683          	lbu	a3,0(a1)
 392:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 396:	fee79ae3          	bne	a5,a4,38a <memmove+0x46>
 39a:	bfc9                	j	36c <memmove+0x28>

000000000000039c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 39c:	1141                	addi	sp,sp,-16
 39e:	e422                	sd	s0,8(sp)
 3a0:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3a2:	ca05                	beqz	a2,3d2 <memcmp+0x36>
 3a4:	fff6069b          	addiw	a3,a2,-1
 3a8:	1682                	slli	a3,a3,0x20
 3aa:	9281                	srli	a3,a3,0x20
 3ac:	0685                	addi	a3,a3,1
 3ae:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3b0:	00054783          	lbu	a5,0(a0)
 3b4:	0005c703          	lbu	a4,0(a1)
 3b8:	00e79863          	bne	a5,a4,3c8 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 3bc:	0505                	addi	a0,a0,1
    p2++;
 3be:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 3c0:	fed518e3          	bne	a0,a3,3b0 <memcmp+0x14>
  }
  return 0;
 3c4:	4501                	li	a0,0
 3c6:	a019                	j	3cc <memcmp+0x30>
      return *p1 - *p2;
 3c8:	40e7853b          	subw	a0,a5,a4
}
 3cc:	6422                	ld	s0,8(sp)
 3ce:	0141                	addi	sp,sp,16
 3d0:	8082                	ret
  return 0;
 3d2:	4501                	li	a0,0
 3d4:	bfe5                	j	3cc <memcmp+0x30>

00000000000003d6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 3d6:	1141                	addi	sp,sp,-16
 3d8:	e406                	sd	ra,8(sp)
 3da:	e022                	sd	s0,0(sp)
 3dc:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 3de:	00000097          	auipc	ra,0x0
 3e2:	f66080e7          	jalr	-154(ra) # 344 <memmove>
}
 3e6:	60a2                	ld	ra,8(sp)
 3e8:	6402                	ld	s0,0(sp)
 3ea:	0141                	addi	sp,sp,16
 3ec:	8082                	ret

00000000000003ee <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 3ee:	4885                	li	a7,1
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <exit>:
.global exit
exit:
 li a7, SYS_exit
 3f6:	4889                	li	a7,2
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <wait>:
.global wait
wait:
 li a7, SYS_wait
 3fe:	488d                	li	a7,3
 ecall
 400:	00000073          	ecall
 ret
 404:	8082                	ret

0000000000000406 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 406:	4891                	li	a7,4
 ecall
 408:	00000073          	ecall
 ret
 40c:	8082                	ret

000000000000040e <read>:
.global read
read:
 li a7, SYS_read
 40e:	4895                	li	a7,5
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <write>:
.global write
write:
 li a7, SYS_write
 416:	48c1                	li	a7,16
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <close>:
.global close
close:
 li a7, SYS_close
 41e:	48d5                	li	a7,21
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <kill>:
.global kill
kill:
 li a7, SYS_kill
 426:	4899                	li	a7,6
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <exec>:
.global exec
exec:
 li a7, SYS_exec
 42e:	489d                	li	a7,7
 ecall
 430:	00000073          	ecall
 ret
 434:	8082                	ret

0000000000000436 <open>:
.global open
open:
 li a7, SYS_open
 436:	48bd                	li	a7,15
 ecall
 438:	00000073          	ecall
 ret
 43c:	8082                	ret

000000000000043e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 43e:	48c5                	li	a7,17
 ecall
 440:	00000073          	ecall
 ret
 444:	8082                	ret

0000000000000446 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 446:	48c9                	li	a7,18
 ecall
 448:	00000073          	ecall
 ret
 44c:	8082                	ret

000000000000044e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 44e:	48a1                	li	a7,8
 ecall
 450:	00000073          	ecall
 ret
 454:	8082                	ret

0000000000000456 <link>:
.global link
link:
 li a7, SYS_link
 456:	48cd                	li	a7,19
 ecall
 458:	00000073          	ecall
 ret
 45c:	8082                	ret

000000000000045e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 45e:	48d1                	li	a7,20
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 466:	48a5                	li	a7,9
 ecall
 468:	00000073          	ecall
 ret
 46c:	8082                	ret

000000000000046e <dup>:
.global dup
dup:
 li a7, SYS_dup
 46e:	48a9                	li	a7,10
 ecall
 470:	00000073          	ecall
 ret
 474:	8082                	ret

0000000000000476 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 476:	48ad                	li	a7,11
 ecall
 478:	00000073          	ecall
 ret
 47c:	8082                	ret

000000000000047e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 47e:	48b1                	li	a7,12
 ecall
 480:	00000073          	ecall
 ret
 484:	8082                	ret

0000000000000486 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 486:	48b5                	li	a7,13
 ecall
 488:	00000073          	ecall
 ret
 48c:	8082                	ret

000000000000048e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 48e:	48b9                	li	a7,14
 ecall
 490:	00000073          	ecall
 ret
 494:	8082                	ret

0000000000000496 <add>:
.global add
add:
 li a7, SYS_add
 496:	48d9                	li	a7,22
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 49e:	1101                	addi	sp,sp,-32
 4a0:	ec06                	sd	ra,24(sp)
 4a2:	e822                	sd	s0,16(sp)
 4a4:	1000                	addi	s0,sp,32
 4a6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4aa:	4605                	li	a2,1
 4ac:	fef40593          	addi	a1,s0,-17
 4b0:	00000097          	auipc	ra,0x0
 4b4:	f66080e7          	jalr	-154(ra) # 416 <write>
}
 4b8:	60e2                	ld	ra,24(sp)
 4ba:	6442                	ld	s0,16(sp)
 4bc:	6105                	addi	sp,sp,32
 4be:	8082                	ret

00000000000004c0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	7139                	addi	sp,sp,-64
 4c2:	fc06                	sd	ra,56(sp)
 4c4:	f822                	sd	s0,48(sp)
 4c6:	f426                	sd	s1,40(sp)
 4c8:	f04a                	sd	s2,32(sp)
 4ca:	ec4e                	sd	s3,24(sp)
 4cc:	0080                	addi	s0,sp,64
 4ce:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d0:	c299                	beqz	a3,4d6 <printint+0x16>
 4d2:	0805c963          	bltz	a1,564 <printint+0xa4>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4d6:	2581                	sext.w	a1,a1
  neg = 0;
 4d8:	4881                	li	a7,0
 4da:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 4de:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 4e0:	2601                	sext.w	a2,a2
 4e2:	00000517          	auipc	a0,0x0
 4e6:	53650513          	addi	a0,a0,1334 # a18 <digits>
 4ea:	883a                	mv	a6,a4
 4ec:	2705                	addiw	a4,a4,1
 4ee:	02c5f7bb          	remuw	a5,a1,a2
 4f2:	1782                	slli	a5,a5,0x20
 4f4:	9381                	srli	a5,a5,0x20
 4f6:	97aa                	add	a5,a5,a0
 4f8:	0007c783          	lbu	a5,0(a5)
 4fc:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 500:	0005879b          	sext.w	a5,a1
 504:	02c5d5bb          	divuw	a1,a1,a2
 508:	0685                	addi	a3,a3,1
 50a:	fec7f0e3          	bgeu	a5,a2,4ea <printint+0x2a>
  if(neg)
 50e:	00088c63          	beqz	a7,526 <printint+0x66>
    buf[i++] = '-';
 512:	fd070793          	addi	a5,a4,-48
 516:	00878733          	add	a4,a5,s0
 51a:	02d00793          	li	a5,45
 51e:	fef70823          	sb	a5,-16(a4)
 522:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 526:	02e05863          	blez	a4,556 <printint+0x96>
 52a:	fc040793          	addi	a5,s0,-64
 52e:	00e78933          	add	s2,a5,a4
 532:	fff78993          	addi	s3,a5,-1
 536:	99ba                	add	s3,s3,a4
 538:	377d                	addiw	a4,a4,-1
 53a:	1702                	slli	a4,a4,0x20
 53c:	9301                	srli	a4,a4,0x20
 53e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 542:	fff94583          	lbu	a1,-1(s2)
 546:	8526                	mv	a0,s1
 548:	00000097          	auipc	ra,0x0
 54c:	f56080e7          	jalr	-170(ra) # 49e <putc>
  while(--i >= 0)
 550:	197d                	addi	s2,s2,-1
 552:	ff3918e3          	bne	s2,s3,542 <printint+0x82>
}
 556:	70e2                	ld	ra,56(sp)
 558:	7442                	ld	s0,48(sp)
 55a:	74a2                	ld	s1,40(sp)
 55c:	7902                	ld	s2,32(sp)
 55e:	69e2                	ld	s3,24(sp)
 560:	6121                	addi	sp,sp,64
 562:	8082                	ret
    x = -xx;
 564:	40b005bb          	negw	a1,a1
    neg = 1;
 568:	4885                	li	a7,1
    x = -xx;
 56a:	bf85                	j	4da <printint+0x1a>

000000000000056c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 56c:	7119                	addi	sp,sp,-128
 56e:	fc86                	sd	ra,120(sp)
 570:	f8a2                	sd	s0,112(sp)
 572:	f4a6                	sd	s1,104(sp)
 574:	f0ca                	sd	s2,96(sp)
 576:	ecce                	sd	s3,88(sp)
 578:	e8d2                	sd	s4,80(sp)
 57a:	e4d6                	sd	s5,72(sp)
 57c:	e0da                	sd	s6,64(sp)
 57e:	fc5e                	sd	s7,56(sp)
 580:	f862                	sd	s8,48(sp)
 582:	f466                	sd	s9,40(sp)
 584:	f06a                	sd	s10,32(sp)
 586:	ec6e                	sd	s11,24(sp)
 588:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 58a:	0005c903          	lbu	s2,0(a1)
 58e:	18090f63          	beqz	s2,72c <vprintf+0x1c0>
 592:	8aaa                	mv	s5,a0
 594:	8b32                	mv	s6,a2
 596:	00158493          	addi	s1,a1,1
  state = 0;
 59a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 59c:	02500a13          	li	s4,37
 5a0:	4c55                	li	s8,21
 5a2:	00000c97          	auipc	s9,0x0
 5a6:	41ec8c93          	addi	s9,s9,1054 # 9c0 <malloc+0x190>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5aa:	02800d93          	li	s11,40
  putc(fd, 'x');
 5ae:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5b0:	00000b97          	auipc	s7,0x0
 5b4:	468b8b93          	addi	s7,s7,1128 # a18 <digits>
 5b8:	a839                	j	5d6 <vprintf+0x6a>
        putc(fd, c);
 5ba:	85ca                	mv	a1,s2
 5bc:	8556                	mv	a0,s5
 5be:	00000097          	auipc	ra,0x0
 5c2:	ee0080e7          	jalr	-288(ra) # 49e <putc>
 5c6:	a019                	j	5cc <vprintf+0x60>
    } else if(state == '%'){
 5c8:	01498d63          	beq	s3,s4,5e2 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 5cc:	0485                	addi	s1,s1,1
 5ce:	fff4c903          	lbu	s2,-1(s1)
 5d2:	14090d63          	beqz	s2,72c <vprintf+0x1c0>
    if(state == 0){
 5d6:	fe0999e3          	bnez	s3,5c8 <vprintf+0x5c>
      if(c == '%'){
 5da:	ff4910e3          	bne	s2,s4,5ba <vprintf+0x4e>
        state = '%';
 5de:	89d2                	mv	s3,s4
 5e0:	b7f5                	j	5cc <vprintf+0x60>
      if(c == 'd'){
 5e2:	11490c63          	beq	s2,s4,6fa <vprintf+0x18e>
 5e6:	f9d9079b          	addiw	a5,s2,-99
 5ea:	0ff7f793          	zext.b	a5,a5
 5ee:	10fc6e63          	bltu	s8,a5,70a <vprintf+0x19e>
 5f2:	f9d9079b          	addiw	a5,s2,-99
 5f6:	0ff7f713          	zext.b	a4,a5
 5fa:	10ec6863          	bltu	s8,a4,70a <vprintf+0x19e>
 5fe:	00271793          	slli	a5,a4,0x2
 602:	97e6                	add	a5,a5,s9
 604:	439c                	lw	a5,0(a5)
 606:	97e6                	add	a5,a5,s9
 608:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 60a:	008b0913          	addi	s2,s6,8
 60e:	4685                	li	a3,1
 610:	4629                	li	a2,10
 612:	000b2583          	lw	a1,0(s6)
 616:	8556                	mv	a0,s5
 618:	00000097          	auipc	ra,0x0
 61c:	ea8080e7          	jalr	-344(ra) # 4c0 <printint>
 620:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 622:	4981                	li	s3,0
 624:	b765                	j	5cc <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 626:	008b0913          	addi	s2,s6,8
 62a:	4681                	li	a3,0
 62c:	4629                	li	a2,10
 62e:	000b2583          	lw	a1,0(s6)
 632:	8556                	mv	a0,s5
 634:	00000097          	auipc	ra,0x0
 638:	e8c080e7          	jalr	-372(ra) # 4c0 <printint>
 63c:	8b4a                	mv	s6,s2
      state = 0;
 63e:	4981                	li	s3,0
 640:	b771                	j	5cc <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 642:	008b0913          	addi	s2,s6,8
 646:	4681                	li	a3,0
 648:	866a                	mv	a2,s10
 64a:	000b2583          	lw	a1,0(s6)
 64e:	8556                	mv	a0,s5
 650:	00000097          	auipc	ra,0x0
 654:	e70080e7          	jalr	-400(ra) # 4c0 <printint>
 658:	8b4a                	mv	s6,s2
      state = 0;
 65a:	4981                	li	s3,0
 65c:	bf85                	j	5cc <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 65e:	008b0793          	addi	a5,s6,8
 662:	f8f43423          	sd	a5,-120(s0)
 666:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 66a:	03000593          	li	a1,48
 66e:	8556                	mv	a0,s5
 670:	00000097          	auipc	ra,0x0
 674:	e2e080e7          	jalr	-466(ra) # 49e <putc>
  putc(fd, 'x');
 678:	07800593          	li	a1,120
 67c:	8556                	mv	a0,s5
 67e:	00000097          	auipc	ra,0x0
 682:	e20080e7          	jalr	-480(ra) # 49e <putc>
 686:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 688:	03c9d793          	srli	a5,s3,0x3c
 68c:	97de                	add	a5,a5,s7
 68e:	0007c583          	lbu	a1,0(a5)
 692:	8556                	mv	a0,s5
 694:	00000097          	auipc	ra,0x0
 698:	e0a080e7          	jalr	-502(ra) # 49e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 69c:	0992                	slli	s3,s3,0x4
 69e:	397d                	addiw	s2,s2,-1
 6a0:	fe0914e3          	bnez	s2,688 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 6a4:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6a8:	4981                	li	s3,0
 6aa:	b70d                	j	5cc <vprintf+0x60>
        s = va_arg(ap, char*);
 6ac:	008b0913          	addi	s2,s6,8
 6b0:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 6b4:	02098163          	beqz	s3,6d6 <vprintf+0x16a>
        while(*s != 0){
 6b8:	0009c583          	lbu	a1,0(s3)
 6bc:	c5ad                	beqz	a1,726 <vprintf+0x1ba>
          putc(fd, *s);
 6be:	8556                	mv	a0,s5
 6c0:	00000097          	auipc	ra,0x0
 6c4:	dde080e7          	jalr	-546(ra) # 49e <putc>
          s++;
 6c8:	0985                	addi	s3,s3,1
        while(*s != 0){
 6ca:	0009c583          	lbu	a1,0(s3)
 6ce:	f9e5                	bnez	a1,6be <vprintf+0x152>
        s = va_arg(ap, char*);
 6d0:	8b4a                	mv	s6,s2
      state = 0;
 6d2:	4981                	li	s3,0
 6d4:	bde5                	j	5cc <vprintf+0x60>
          s = "(null)";
 6d6:	00000997          	auipc	s3,0x0
 6da:	2e298993          	addi	s3,s3,738 # 9b8 <malloc+0x188>
        while(*s != 0){
 6de:	85ee                	mv	a1,s11
 6e0:	bff9                	j	6be <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 6e2:	008b0913          	addi	s2,s6,8
 6e6:	000b4583          	lbu	a1,0(s6)
 6ea:	8556                	mv	a0,s5
 6ec:	00000097          	auipc	ra,0x0
 6f0:	db2080e7          	jalr	-590(ra) # 49e <putc>
 6f4:	8b4a                	mv	s6,s2
      state = 0;
 6f6:	4981                	li	s3,0
 6f8:	bdd1                	j	5cc <vprintf+0x60>
        putc(fd, c);
 6fa:	85d2                	mv	a1,s4
 6fc:	8556                	mv	a0,s5
 6fe:	00000097          	auipc	ra,0x0
 702:	da0080e7          	jalr	-608(ra) # 49e <putc>
      state = 0;
 706:	4981                	li	s3,0
 708:	b5d1                	j	5cc <vprintf+0x60>
        putc(fd, '%');
 70a:	85d2                	mv	a1,s4
 70c:	8556                	mv	a0,s5
 70e:	00000097          	auipc	ra,0x0
 712:	d90080e7          	jalr	-624(ra) # 49e <putc>
        putc(fd, c);
 716:	85ca                	mv	a1,s2
 718:	8556                	mv	a0,s5
 71a:	00000097          	auipc	ra,0x0
 71e:	d84080e7          	jalr	-636(ra) # 49e <putc>
      state = 0;
 722:	4981                	li	s3,0
 724:	b565                	j	5cc <vprintf+0x60>
        s = va_arg(ap, char*);
 726:	8b4a                	mv	s6,s2
      state = 0;
 728:	4981                	li	s3,0
 72a:	b54d                	j	5cc <vprintf+0x60>
    }
  }
}
 72c:	70e6                	ld	ra,120(sp)
 72e:	7446                	ld	s0,112(sp)
 730:	74a6                	ld	s1,104(sp)
 732:	7906                	ld	s2,96(sp)
 734:	69e6                	ld	s3,88(sp)
 736:	6a46                	ld	s4,80(sp)
 738:	6aa6                	ld	s5,72(sp)
 73a:	6b06                	ld	s6,64(sp)
 73c:	7be2                	ld	s7,56(sp)
 73e:	7c42                	ld	s8,48(sp)
 740:	7ca2                	ld	s9,40(sp)
 742:	7d02                	ld	s10,32(sp)
 744:	6de2                	ld	s11,24(sp)
 746:	6109                	addi	sp,sp,128
 748:	8082                	ret

000000000000074a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 74a:	715d                	addi	sp,sp,-80
 74c:	ec06                	sd	ra,24(sp)
 74e:	e822                	sd	s0,16(sp)
 750:	1000                	addi	s0,sp,32
 752:	e010                	sd	a2,0(s0)
 754:	e414                	sd	a3,8(s0)
 756:	e818                	sd	a4,16(s0)
 758:	ec1c                	sd	a5,24(s0)
 75a:	03043023          	sd	a6,32(s0)
 75e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 762:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 766:	8622                	mv	a2,s0
 768:	00000097          	auipc	ra,0x0
 76c:	e04080e7          	jalr	-508(ra) # 56c <vprintf>
}
 770:	60e2                	ld	ra,24(sp)
 772:	6442                	ld	s0,16(sp)
 774:	6161                	addi	sp,sp,80
 776:	8082                	ret

0000000000000778 <printf>:

void
printf(const char *fmt, ...)
{
 778:	711d                	addi	sp,sp,-96
 77a:	ec06                	sd	ra,24(sp)
 77c:	e822                	sd	s0,16(sp)
 77e:	1000                	addi	s0,sp,32
 780:	e40c                	sd	a1,8(s0)
 782:	e810                	sd	a2,16(s0)
 784:	ec14                	sd	a3,24(s0)
 786:	f018                	sd	a4,32(s0)
 788:	f41c                	sd	a5,40(s0)
 78a:	03043823          	sd	a6,48(s0)
 78e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 792:	00840613          	addi	a2,s0,8
 796:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 79a:	85aa                	mv	a1,a0
 79c:	4505                	li	a0,1
 79e:	00000097          	auipc	ra,0x0
 7a2:	dce080e7          	jalr	-562(ra) # 56c <vprintf>
}
 7a6:	60e2                	ld	ra,24(sp)
 7a8:	6442                	ld	s0,16(sp)
 7aa:	6125                	addi	sp,sp,96
 7ac:	8082                	ret

00000000000007ae <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ae:	1141                	addi	sp,sp,-16
 7b0:	e422                	sd	s0,8(sp)
 7b2:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b4:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b8:	00001797          	auipc	a5,0x1
 7bc:	8487b783          	ld	a5,-1976(a5) # 1000 <freep>
 7c0:	a02d                	j	7ea <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7c2:	4618                	lw	a4,8(a2)
 7c4:	9f2d                	addw	a4,a4,a1
 7c6:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ca:	6398                	ld	a4,0(a5)
 7cc:	6310                	ld	a2,0(a4)
 7ce:	a83d                	j	80c <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 7d0:	ff852703          	lw	a4,-8(a0)
 7d4:	9f31                	addw	a4,a4,a2
 7d6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 7d8:	ff053683          	ld	a3,-16(a0)
 7dc:	a091                	j	820 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7de:	6398                	ld	a4,0(a5)
 7e0:	00e7e463          	bltu	a5,a4,7e8 <free+0x3a>
 7e4:	00e6ea63          	bltu	a3,a4,7f8 <free+0x4a>
{
 7e8:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ea:	fed7fae3          	bgeu	a5,a3,7de <free+0x30>
 7ee:	6398                	ld	a4,0(a5)
 7f0:	00e6e463          	bltu	a3,a4,7f8 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f4:	fee7eae3          	bltu	a5,a4,7e8 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 7f8:	ff852583          	lw	a1,-8(a0)
 7fc:	6390                	ld	a2,0(a5)
 7fe:	02059813          	slli	a6,a1,0x20
 802:	01c85713          	srli	a4,a6,0x1c
 806:	9736                	add	a4,a4,a3
 808:	fae60de3          	beq	a2,a4,7c2 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 80c:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 810:	4790                	lw	a2,8(a5)
 812:	02061593          	slli	a1,a2,0x20
 816:	01c5d713          	srli	a4,a1,0x1c
 81a:	973e                	add	a4,a4,a5
 81c:	fae68ae3          	beq	a3,a4,7d0 <free+0x22>
    p->s.ptr = bp->s.ptr;
 820:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 822:	00000717          	auipc	a4,0x0
 826:	7cf73f23          	sd	a5,2014(a4) # 1000 <freep>
}
 82a:	6422                	ld	s0,8(sp)
 82c:	0141                	addi	sp,sp,16
 82e:	8082                	ret

0000000000000830 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 830:	7139                	addi	sp,sp,-64
 832:	fc06                	sd	ra,56(sp)
 834:	f822                	sd	s0,48(sp)
 836:	f426                	sd	s1,40(sp)
 838:	f04a                	sd	s2,32(sp)
 83a:	ec4e                	sd	s3,24(sp)
 83c:	e852                	sd	s4,16(sp)
 83e:	e456                	sd	s5,8(sp)
 840:	e05a                	sd	s6,0(sp)
 842:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 844:	02051493          	slli	s1,a0,0x20
 848:	9081                	srli	s1,s1,0x20
 84a:	04bd                	addi	s1,s1,15
 84c:	8091                	srli	s1,s1,0x4
 84e:	0014899b          	addiw	s3,s1,1
 852:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 854:	00000517          	auipc	a0,0x0
 858:	7ac53503          	ld	a0,1964(a0) # 1000 <freep>
 85c:	c515                	beqz	a0,888 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 860:	4798                	lw	a4,8(a5)
 862:	02977f63          	bgeu	a4,s1,8a0 <malloc+0x70>
 866:	8a4e                	mv	s4,s3
 868:	0009871b          	sext.w	a4,s3
 86c:	6685                	lui	a3,0x1
 86e:	00d77363          	bgeu	a4,a3,874 <malloc+0x44>
 872:	6a05                	lui	s4,0x1
 874:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 878:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 87c:	00000917          	auipc	s2,0x0
 880:	78490913          	addi	s2,s2,1924 # 1000 <freep>
  if(p == (char*)-1)
 884:	5afd                	li	s5,-1
 886:	a895                	j	8fa <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 888:	00000797          	auipc	a5,0x0
 88c:	78878793          	addi	a5,a5,1928 # 1010 <base>
 890:	00000717          	auipc	a4,0x0
 894:	76f73823          	sd	a5,1904(a4) # 1000 <freep>
 898:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 89a:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 89e:	b7e1                	j	866 <malloc+0x36>
      if(p->s.size == nunits)
 8a0:	02e48c63          	beq	s1,a4,8d8 <malloc+0xa8>
        p->s.size -= nunits;
 8a4:	4137073b          	subw	a4,a4,s3
 8a8:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8aa:	02071693          	slli	a3,a4,0x20
 8ae:	01c6d713          	srli	a4,a3,0x1c
 8b2:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8b4:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8b8:	00000717          	auipc	a4,0x0
 8bc:	74a73423          	sd	a0,1864(a4) # 1000 <freep>
      return (void*)(p + 1);
 8c0:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8c4:	70e2                	ld	ra,56(sp)
 8c6:	7442                	ld	s0,48(sp)
 8c8:	74a2                	ld	s1,40(sp)
 8ca:	7902                	ld	s2,32(sp)
 8cc:	69e2                	ld	s3,24(sp)
 8ce:	6a42                	ld	s4,16(sp)
 8d0:	6aa2                	ld	s5,8(sp)
 8d2:	6b02                	ld	s6,0(sp)
 8d4:	6121                	addi	sp,sp,64
 8d6:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 8d8:	6398                	ld	a4,0(a5)
 8da:	e118                	sd	a4,0(a0)
 8dc:	bff1                	j	8b8 <malloc+0x88>
  hp->s.size = nu;
 8de:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 8e2:	0541                	addi	a0,a0,16
 8e4:	00000097          	auipc	ra,0x0
 8e8:	eca080e7          	jalr	-310(ra) # 7ae <free>
  return freep;
 8ec:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 8f0:	d971                	beqz	a0,8c4 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8f4:	4798                	lw	a4,8(a5)
 8f6:	fa9775e3          	bgeu	a4,s1,8a0 <malloc+0x70>
    if(p == freep)
 8fa:	00093703          	ld	a4,0(s2)
 8fe:	853e                	mv	a0,a5
 900:	fef719e3          	bne	a4,a5,8f2 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 904:	8552                	mv	a0,s4
 906:	00000097          	auipc	ra,0x0
 90a:	b78080e7          	jalr	-1160(ra) # 47e <sbrk>
  if(p == (char*)-1)
 90e:	fd5518e3          	bne	a0,s5,8de <malloc+0xae>
        return 0;
 912:	4501                	li	a0,0
 914:	bf45                	j	8c4 <malloc+0x94>
