#include <stdio.h>

int item, quant, m, d, y = 0;
float price = 0;

int main()
{
    
    printf("Enter item number: ");
    scanf("%d", &item);
    printf("Enter unit price: ");
    scanf("%f", &price);
    printf("Enter Quantity: ");
    scanf("%d", &quant);
    printf("Enter purchase date (mm/dd/yy): ");
    scanf("%d/%d/%d", &m, &d, &y);
    printf("Item    Unit Price  QTY   Purchse Date   Total Amount\n");
    printf("%d      $   %.2f   %d     %d/%d/%d      $%.2f", item, price, quant, m, d, y, price*quant);
    return 0;
}
