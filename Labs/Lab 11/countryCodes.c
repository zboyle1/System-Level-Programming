#include <stdio.h>
#include <string.h>

// Dialing Code Structure
// Holds country name and dialing code
struct dialing_code {
    char *country;
    int code;
};

int main() {
    // Array of struct dialing_code
    const struct dialing_code country_codes[] = 
       {{"Argentina",             54}, {"Bangladesh",      880},
        {"Brazil",                55}, {"Burma (Myanmar)",  95},
        {"China",                 86}, {"Colombia",         57},
        {"Congo, Dem. Rep. of",  243}, {"Egypt",            20},
        {"Ethiopia",             251}, {"France",           33},
        {"Germany",               49}, {"India",            91},
        {"Indonesia",             62}, {"Iran",             98},
        {"Italy",                 39}, {"Japan",            81},
        {"Mexico",                52}, {"Nigeria",         234},
        {"Pakistan",              92}, {"Philippines",      63},
        {"Poland",                48}, {"Russsia",           7},
        {"South Africa",          27}, {"South Korea",      82},
        {"Spain",                 34}, {"Sudan",           249},
        {"Thailand",              66}, {"Turkey",           90},
        {"Ukraine",              380}, {"United Kingdom",   44},
        {"United States",          1}, {"Vietnam",          84}};
    // Finding how many elements are in the array
    int arrsize = sizeof(country_codes) / sizeof(country_codes[0]);
    // Country code to find
    int find;
    printf("Enter country code: ");
    scanf("%d", &find);
    // For loop to iterate through array
    for(int i = 0; i < arrsize; i++) {
        // Compares the entered name to the name of the structure in the current array element
        if (find == country_codes[i].code) {
            // Prints country code if found
            printf("Country: %s", country_codes[i].country);
            break;
        }
        // If the name was not found, then print "not found"
        else if (i == arrsize-1) {
            printf("Error: country for code %d was not found", find);
        }
    }
    
    return 0;
}