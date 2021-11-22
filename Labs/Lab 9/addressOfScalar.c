#include <stdio.h>

int main() {
  // initialize char variable, print address and the addresses next to it
  char charvar = '\0';
  printf("address of charvar = %p\n", (void *)(&charvar));
  printf("address of charvar - 1 = %p\n", (void *)(&charvar - 1));
  printf("address of charvar + 1 = %p\n", (void *)(&charvar + 1));
  // initialize int variable, print address and the addresses next to it
  int intvar = '\0';
  printf("address of intvar = %p\n", (void *)(&intvar));
  printf("address of intvar - 1 = %p\n", (void *)(&intvar - 1));
  printf("address of intvar + 1 = %p\n", (void *)(&intvar + 1));
  return 0;
}