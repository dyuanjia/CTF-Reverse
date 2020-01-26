#include <stdio.h>
#include <time.h>
#include <fcntl.h>

#define INT_SIZE sizeof(int) // Size of int in bytes
#define INT_BITS INT_SIZE * 8 - 1

int rotateLeft(int num, unsigned int rotation)
{
    int DROPPED_MSB;
    rotation %= INT_BITS;
    while (rotation--)
    {
        // Get MSB of num before it gets dropped
        DROPPED_MSB = (num >> INT_BITS) & 1;
        // Left rotate num by 1 and
        // Set its dropped MSB as new LSB
        num = (num << 1) | DROPPED_MSB;
    }

    return num;
}

int rotateRight(int num, unsigned int rotation)
{
    int DROPPED_LSB;
    rotation %= INT_BITS;
    while (rotation--)
    {
        // Get LSB of num before it gets dropped
        DROPPED_LSB = num & 1;
        // Right shift num by 1 and
        // Clear its MSB
        num = (num >> 1) & (~(1 << INT_BITS));
        // Set its dropped LSB as new MSB
        num = num | (DROPPED_LSB << INT_BITS);
    }

    return num;
}

int inv_ichinokata(int a1)
{
    return a1 ^ 0xFACEB00C;
}

int ninokata(int a1)
{
    return (unsigned int)(a1 + 74628);
}

int inv_ninokata(int a1)
{
    return (unsigned int)(a1 - 74628);
}

int sannokata(int a1)
{
    return (unsigned int)(rotateLeft(a1 & 0xAAAAAAAA, 2) | rotateRight(a1 & 0x55555555, 4));
}

int inv_sannokata(int a1)
{
    return (unsigned int)(rotateRight(a1 & 0xAAAAAAAA, 2) | rotateLeft(a1 & 0x55555555, 4));
}

int yonnokata(int a1)
{
    int v1 = inv_ichinokata(a1);
    int v2 = ninokata(v1);

    return sannokata(v2);
}

int inv_yonnokata(int a1)
{
    int v1 = inv_sannokata(a1);
    int v2 = inv_ninokata(v1);

    return inv_ichinokata(v2);
}

int byteArr2int(unsigned char *buf)
{
    int out = buf[0] | ((int)buf[1] << 8) | ((int)buf[2] << 16) | ((int)buf[3] << 24);
    return out;
}

int main()
{
    FILE *input;
    int retval;
    unsigned char buf[4] = {0};
    if ((input = open("output.txt", O_RDONLY)) < 0)
    {
        printf("Could not open file\n");
        return 2;
    }

    FILE *output;
    // 2 0 1 9 0 8 0 3 0 5 2 5 1 4
    unsigned int seed = 1568179514;
    int rand_int;

    /* Initialize Random Seed */
    srand(seed);
    // time_t rawtime = 1568179514;
    // struct tm *v0;
    // v0 = gmtime(&rawtime);
    // int v1 = v0->tm_sec;
    // printf("%d%02d%02d%02d%02d%02d\n",
    //        (unsigned int)(v0->tm_year + 1900),
    //        (unsigned int)v0->tm_mon,
    //        (unsigned int)v0->tm_wday,
    //        (unsigned int)v0->tm_hour,
    //        (unsigned int)v0->tm_min,
    //        v1);

    /* Open Files for RW */
    output = fopen("flag.txt", "w");

    int num;
    int result;

    while ((retval = read(input, &buf, 4)) > 0)
    { //read until end of file
        if (retval == 4)
        {
            // convert bytes to int
            num = byteArr2int(buf);
            rand_int = rand();
            // printf("%d", rand_int % 4);
            switch (rand_int % 4)
            {
            case 0:
                result = inv_ichinokata(num);
                break;
            case 1:
                result = inv_ninokata(num);
                break;
            case 2:
                result = inv_sannokata(num);
                break;
            case 3:
                result = inv_yonnokata(num);
                break;
            default:
                break;
            }
            fwrite(&result, 1uLL, 4uLL, output);
        }
    }

    fclose(output);
    return (0);
}