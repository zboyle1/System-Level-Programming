#include <stdio.h>
#include <string.h>

/* check_password first version
Takes in string and checks the size. */
void check_password(char* pw)
{
    // Points used to determine if password is safe
    int points = 0;
    //Checks the length of the password
    if (strlen(pw) < 10) {
        // A password under 10 characters may be unsafe
        // for every character under 10, 5 points are removed
        points = (10-strlen(pw))*5;
        if(points > 30) {
            printf("The password is unsafe! Please reset.");
        }
    }
    else {
        // if the password is 10 characters it is considered safe
       printf("The password is safe.");
    }
    
}
/* Main */
int main()
{
    char pw[11];
    // Prompt user for input
    printf("Enter 10 character password:");
    // fgets used to safetly get input from user
    fgets(pw,11,stdin);
    check_password(pw);
    return 0;
}
