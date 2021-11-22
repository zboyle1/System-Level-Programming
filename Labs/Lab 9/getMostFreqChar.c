#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  //Stores the frequency of each character
  int frequency[255] = {0}; // initialize all elements to 0
  FILE *file;
  char string[100];
  file = fopen(argv[1], "r");
  fgets(string,100,file);
  int i, max, index;
  for(i = 0; string[i] != 0; i++) {
     ++frequency[string[i]];
  }
  // Find the letter that was used the most
  max = frequency[0];
  index = 0;
  for(i = 0; string[i] != 0; i++) {
     if( frequency[string[i]] > max) {
       max = frequency[string[i]];
       index = i;
     }
  }
  printf("The max character is: %c \n", string[index]);
  return 0;
}
