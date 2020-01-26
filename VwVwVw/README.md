# VwVwVw

## Description:

> 希望大家笑得像個玩向量的孩子

![Description](./desc.jpg)

## Solution:

**NOT SOLVED**

I first decompiled the verify file into a .c file. Then, I traced the execution flow of verify in gdb while referring to the .c file, and came up with the execution flow of the program in python.

The output before xor-ing with the path looks like base64, but I couldn't find a correct path to xor with the final check byte string to get a valid base64 encoded output.
