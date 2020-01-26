# YugiMuto

## Description:

> 你好啊修課生，真沒想到你可以到這層來呢，不過就到這裡為止了，接下來由我 遊戲 BOY 來做你的對手！

## Solution:

Using a [debugger](http://bgb.bircd.org/) (32 bits version), I opened the ROM. The program asks for an input, and will show a "NO NO NO" message if the input is wrong. In the debugger's VRAM viewer, I found out that all the letters are actually tile images, therefore I can't use radare2 to search for string references.

The input function is located at 0x1357. Using radare2's function xreference, the related functions are as follows:

```
fuc.0x1285 -> fuc.0x0200 -> fuc.0x1357
       -----> fuc.0x1574 -> fuc.0x1619
       -----> fuc.0x0e61
```

Looking through all these functions, I found out that fuc.0x0e61 is doing string comparison. The gameboy instructions can be found [here](http://marc.rawer.de/Gameboy/Docs/GBCPUman.pdf).

Thus, I jump to fuc.0x0e61. The main logic is from `0x00000f77` to `0x00000fb3`, and the compare instruction is at 0xf9c. The input is used as index, and the flag can be obtained by following the main logic.

`FLAG{OHMYGODY0UAREGAM3B0Y}`
