#include <stdio.h>
#define N 100

int
main()
{
    int sum1, // 1^2 + 2^2 + 3^2 +...+ N^2
        sum2; // 1 + 2 + 3 + ... + N
    
    sum1 = N*(N+1)*(2*N+1)/6;
    sum2 = N*(N+1)/2;

    printf("%d\n", sum2*sum2-sum1);

    return 0;
}