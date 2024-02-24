#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void error() {
  printf("Должны быть введены два целых положительных числа, не превосходящих 2147483647\n");
  exit(1);
}

int main(int argc, char *argv[])
{
  char s[22];
  gets(s, 22);
  int i = 0, j;
  while (i < 22 && s[i] != ' ' && s[i] != '\n') ++i;
  if (i == 22 || s[i] == '\n') error();
  for (j = 0; j < i; ++j) {
  	if (s[j] < 48 || s[j] > 57) error();
  }
  for (j = i + 1; j < 22 && s[j] != '\n'; ++j) {
  	if (s[j] < 48 || s[j] > 57) error();
  }
  if (j == 22) error();
  s[i] = '\0';
  int res = atoi(s) + atoi(s + i + 1);
  printf("%d\n", res);
  exit(0);
}