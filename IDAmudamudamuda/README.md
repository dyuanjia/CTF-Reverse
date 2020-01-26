# IDAmudamudamuda

## Description:

> ShengHao's HW1 was too kind, try this.

## Solution:

The first input is a value (seed), which is added to each element after the address **0x002D4058** (81 bytes).

The second input is checked if it's 32 bytes long, then a virtual memory of 200 bytes is allocated. The resultant values at **0x002D4058** (after the first input) is copied to the virtual address, and executed as a function, with the second input as one of the arguments.

Therefore, the first input is likely an offset that will make the bytes at **0x002D4058** an valid function. Since a function starts with push ebp (0x55), and the original value at **0x002D4058** is 0x45, the offset is then 16.

Looking through the resultant function, each char of the second input (flag) is added with 0x23, xor-ed with 0x66, and compared with values starting at **0x002D4018**. Knowing the flag length is 32, the flag can be obtained with a simple script.

`FLAG{y3s!!y3s!!y3s!!0h_my_g0d!!}`
