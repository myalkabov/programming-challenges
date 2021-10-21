#include <stdio.h>
#include <ctype.h>

#include "../libcs50/cs50.h"

bool isvalid(string arg);

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./substitution key\n");
        return 1;
    }
    else if (!isvalid(argv[1]))
    {
        printf("Key must contain 26, alphabetical, case-insensitive, unique characters.\n");
        return 1;
    }

    string plain = get_string("plaintext:  ");

    printf("ciphertext: ");
    // argv[1] is a 26-character string, a key.
    for (int i = 0; plain[i] != '\0'; i++)
    {
        char p = plain[i];
        if (isalpha(p))
        {
            char c;
            if (isupper(p))
            {
                c = toupper(argv[1][(int)(p - 'A')]);  // (int) (p - 'A') gives index range of 0-25
            }
            else
            {
                c = tolower(argv[1][(int)(p - 'a')]);  // (int) (p - 'a') gives index range of 0-25
            }
            printf("%c", c);
        }
        else
        {
            printf("%c", p);
        }
    }

    printf("\n");

    return 0;
}

bool isvalid(string arg)
{
    int len = 0;
    int unique[26] = {0};
    for (int i = 0; arg[i] != '\0'; i++)
    {
        if (!isalpha(arg[i]))
        {
            return false;
        }

        char c = tolower(arg[i]);
        if (++unique[(int)(c - 'a')] > 1)
        {
            return false;
        }

        if (++len > 26)
        {
            return false;
        }
    }

    if (len != 26)
    {
        return false;
    }

    return true;
}