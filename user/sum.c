#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void format_error() {
  fprintf(2, "Должны быть введены два целых положительных числа, не превосходящих 2147483647\n");
  exit(1);
}

void read_error() {
  fprintf(2, "Ошибка чтения ввода\n");
  exit(2);
}

int main(int argc, char *argv[])
{
  char s[22];
  int n = 0, rc;
  while(n < 22 && (rc = read(0, s + (n++), 1)) > 0) { // Читаем по одному байту
  	if (s[n - 1] == '\n' || s[n - 1] == '\0') break;
  }
  if (rc < 0)
  	read_error();
  int i = 0, j;
  while (i < 22 && s[i] != ' ' && s[i] != '\n') ++i;
  if (i == 22 || s[i] == '\n') format_error();
  for (j = 0; j < i; ++j) {
  	if (s[j] < 48 || s[j] > 57) format_error();
  }
  for (j = i + 1; j < 22 && (s[j] != '\n' && s[j] != '\0'); ++j) {
  	if (s[j] < 48 || s[j] > 57) format_error();
  }
  if (j == 22) format_error();
  s[i] = '\0';
  int res = add(atoi(s), atoi(s + i + 1));
  printf("%d\n", res);
  exit(0);
}
