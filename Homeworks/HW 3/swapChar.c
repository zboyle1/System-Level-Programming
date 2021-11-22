#include <stdio.h>
#include <string.h>
#include <ctype.h>

// Swap method takes in 2 string pointers
void swap(char *str1, char *str2) {
    // j initialized outside loop
    // this way the while loop does not need to
    // keep going through string 2
    // saves some time for worst case senario
    int j = 0;
    // for loop to iterate through the first string
    for (int i = 0; i < strlen(str1); i++) {
        // finds a number in string 1
        if (isdigit(str1[i])) {
            // Iterates through string 2
            // Stops once a letter is found
            while(isdigit(str2[j])) {
                j++;
            }
            // Swaps with xor operation
            // because xor flips the bits of the binary 
            // when both bits in the characters are 0 or 1
            str1[i] = str1[i] ^ str2[j];
            str2[j]= str1[i] ^ str2[j];
            str1[i] = str1[i] ^ str2[j];
            j++;
        }
    }
}
int main()
{
    char str1[11] = "ad6hj865r";
    char str2[11] = "17u96ytf0";
    printf("Before swap:\nString 1: %s\nString 2: %s\n",str1,str2);
    swap(str1,str2);
    printf("-------\nAfter swap:\nString 1: %s\nString 2: %s",str1,str2);
    return 0;
}