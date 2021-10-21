#include <stdio.h>

int main()
{
    int n = 999;     // from 1 to n
    int n1 = n / 3;  // 1,2,3,..,n1 or 3,6,9,..,3n1 in 1..n
    int n2 = n / 5;  // 1,2,3,..,n2 or 5,10,15,..,5n2 in 1..n
    int n3 = n / 15; // 1,2,3,..,n3 or 15,30,45,..,15n3 in 1..n
    int sum = 3  * (n1 * (n1 + 1) / 2) + // sum of mults. of 3  in 1..n
              5  * (n2 * (n2 + 1) / 2) - // sum of mults. of 5  in 1..n
              15 * (n3 * (n3 + 1) / 2);  // sum of mults. of 15 in 1..n
    printf("%d\n", sum);
    return 0;
}
