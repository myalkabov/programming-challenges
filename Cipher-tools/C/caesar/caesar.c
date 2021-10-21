#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "../libcs50/cs50.h"

bool isvalid(string arg);

int main(int argc, string argv[])
{
    if (argc != 2 || !isvalid(argv[1]))
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    string plain = get_string("plaintext:  ");
    int k = atoi(argv[1]); // secret key

    printf("ciphertext: ");
    for (int i = 0; plain[i] != '\0'; i++)
    {
        if (isalpha(plain[i]))
        {
            char first = isupper(plain[i]) ? 'A' : 'a';
            char c = first + (plain[i] - first + k) % 26;
            printf("%c", c);
        }
        else
        {
            printf("%c", plain[i]);
        }
    }

    printf("\n");

    return 0;
}

bool isvalid(string arg)
{
    for (int i = 0; arg[i] != '\0'; i++)
    {
        if (!(arg[i] >= '0' && arg[i] <= '9'))
        {
            return false;
        }
    }

    return true;
}