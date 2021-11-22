#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* This program checks if a string is a palindrome */

// Remove spaces and special characters from string
// and makes all characters lowercase
char* stripstring(char *str) {
    static char strStripped[100];
    // i is the index for the original string
    // j is the index for the new string
    int i = 0;
    int j = 0;
    // While loops runs until the NULL character at the end of the string
    while (!(str[i] == '\0')) {
        // If character is not a space or special character, add it to new string
        if(isalnum(str[i]) && !(str[i]==' ')) {
            // If the character is uppercase, make it lowercase
            if(isupper(str[i])) {
                str[i] = tolower(str[i]);
            }
            strStripped[j]=str[i];
            j++;
        }
        i++;
    }
    return strStripped;
}
// Determine if string is a palindrome
int ispalindrome(char *str) {
    // Strip the string of spaces and special characters
    char *p = stripstring(str);
    str = p;
    // Compare the first half of string to the second half
    // if they are the same return true, if not return false
    int firstHalf = 0;
    int secondHalf = strlen(str)-1;
    // While the first half of indexes are less than the second half
    while (firstHalf < secondHalf) {
        if(str[firstHalf] != str[secondHalf]) {
            // false
            return 0;
        }
        // Go to the next index for the first half
        // Go to the previous index for the second half
        firstHalf ++;
        secondHalf --;
    }
    // true
    return 1;
}
/* Main */
int main () {
    char str[100];
    printf("Enter the word or sentence to be tested: ");
    fgets(str, 100, stdin);
    if (ispalindrome(str)){
        printf("This is a palindrome");
    }
    else {
        printf("This is not a palindrome");
    }
    return 0;
}
