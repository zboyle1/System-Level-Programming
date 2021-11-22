#include <stdio.h>
void split_time(long total_sec, int *hr, int *min, int *sec)
{
    int h,m,s;
    s = (int) total_sec % 60;
    m = (int) total_sec / 60;
    h = m / 60;
    *hr = h;
    *min = m;
    *sec = s;
}
int main()
{
    int n,hr,min,sec;
    printf("Enter seconds:");
    scanf("%d",&n);
    split_time(n, &hr, &min, &sec);
    printf("Converted format: %d hour %d mins %d secs",hr,min,sec);
    return 0;
}