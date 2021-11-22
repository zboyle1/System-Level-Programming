#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* check_password second version
Takes in string and checks that it meets the requirements.
Checks for numbers, uppercase letters and lowercase letters
Checks for consecutive characters */
void
check_password (char *pw) {
    // Points used to determine if password is safe
    int points = 0;
    // Checks for lowercase, uppercase, and numbers
    int upper = 0;
    int lower = 0;
    int nums = 0;
    // Loop through the string
    for (int i = 0; i < strlen(pw); i++) {
        // Find if the character is uppercase, lowercase or a number
        if (isupper(pw[i])) upper++;
        else if (islower(pw[i])) lower++;
        else if (isdigit(pw[i])) nums++;
        if (upper > 0 && lower > 0 && nums > 0) break;
    }
    // If no uppercase, lowercase, or numbers are found deduct points accordingly
    if (nums == 0) points = points + 20;
    if (upper == 0) points = points + 20;
    if (lower == 0) points = points + 20;
    // Checks for more than 2 consecutive character types
    // Iterate through string
    for (int i = 0; i < strlen(pw)-2; i++) {
        // Compare the character to the next two
        // If a consecutive character is found, add points and break loop
        if(islower(pw[i]) && islower(pw[i+1]) && islower(pw[i+2])) {
            points = points + 20;
            break;
        }
        else if (isupper(pw[i]) && isupper(pw[i+1]) && isupper(pw[i+2])) {
            points = points + 20;
            break;
        }
        else if (isdigit(pw[i]) && isdigit(pw[i+1]) && isdigit(pw[i+2])) {
            points = points + 20;
            break;
        }
    }
    // When points are above 30, the password is unsafe
    if (points > 30) {
        printf ("The password is unsafe! Please reset.");
    }
    // If it is less than 30 points the password is safe
    else {
        printf ("The password is safe.");
    }
}

/* Main */
int main () {
    char pw[100];
    // Prompt user for input
    printf ("Enter password: ");
    // fgets used to safetly get input from user
    fgets (pw, 100, stdin);
    check_password (pw);
    return 0;
}