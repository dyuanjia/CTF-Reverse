# m4chine

## Description:

> This is nini's machine.

## Solution:

A pre-compiled python file was given, so I decompiled it first with uncompyle6. This is a stack-based virtual machine, but the decompiled code needs to be fixed:

```python
# byte string syntax for python 3
emu.e_start(b'...')

# change assert len(...) '<' to '>='
```

Looking through the decompiled code, the input flag will be initialized as self.context, and the given byte code represents a set of operations that will be done on the flag. The real check is done in the terminal function, which will terminate the program if part of the flag is wrong. For example, the result of the first operations, sub, push, add, will be compared with 100 at the fourth operation. Reverse engineering from here, it means that $$(n-1) - (n-2) + 8 = 100$$. Since the last element of the flag is `}` (125), the second last element must be `!` (33). The rest of the flag can be obtained using similar method.

For the last part, the first 6 elements of the flag and 19 are added together. Since the first 5 elements are `FLAG{`, the 6th element can be easily obtained.

`FLAG{X0w_BiiiiiiiiG_SiZe3e3!}`
