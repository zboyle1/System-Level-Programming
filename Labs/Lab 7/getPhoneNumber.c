#include <stdio.h>

int x, y, z = 0;

int main()
{
    
    printf("Enter phone number [(999) 999-9999]:");
    scanf("(%d) %d-%d", &x, &y, &z);
    printf("You Entered: %d-%d-%d", x, y, z);

    return 0;
}
