#include <stdio.h>

char* strcpy(char *strDest, const char *strSrc) {
    // Set the destination string to the pointer copied so the address is not lost
    char *copied = strDest;
    // Copies the sorce string to destination string character by chracter
    while(*strSrc != '\0')
    {
        *strDest = *strSrc;
        strDest++;
        strSrc++;
    }
    // Returns string pointing to the destination string
    return copied;
}

int main() {
    char str1[] = "String 1";
    char str2[] = "String 2";
    printf("BEFORE:\nString 1: %s\nString 2: %s\n",str1,str2);
    strcpy(str2,str1);
    printf("AFTER:\nString 1: %s\nString 2: %s",str1,str2);
    return 0;
}
