# H0W

## Description:

> 恩對 這題本來是 HW0
> tested on Ubuntu 18.04

## Solution:

First, I decompiled the pyc file with uncompyle6. It takes in an input file, presumably the flag, and modifies it 4 bytes by 4 bytes with some unknown function within the .so file. Thus, I opened the .so file in IDA Pro, and looked through the functions.

The file is stripped. However, I noticed the following interesting functions:

1. One which takes the current time and save it.
2. One which use the above time value to seed srand().
3. One which prints out the time value in a format string
4. One which opens ``output.txt" for writing.
5. One which calls fwrite() to write to ``output.txt"
6. One which generates a random value and calls one of the following functions: ichinokata, ninokata, sannokata, yonnokata.

Next, I printed out the return value of nini1() to nini6(), and found out that nini2() returns a format string. Looking at the given output.txt, there's a timestamp appended at the end, which must be the value that's used to seed srand(). This also implies that nini6() is the one that calls fwrite().

Since nini5() is the one that takes the bytes from the input file first, before sending it to nini6() to write, it must be number 6 in the list.

Now to reverse, I seed srand() with the timestamp (converted to epoch time), and takes in 4 bytes at a time from output.txt, generates a number with rand(), and apply one of the corresponding reverse version of the 4 functions.

The resultant txt file has bytes 1 to 3 as ``PNG", so I changed the extension to .png and got the flag.

`FLAG{H3Y_U_C4NT_CHiLL_H3R3}`
