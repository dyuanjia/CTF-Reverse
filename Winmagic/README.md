# Winmagic

## Description:

> Try to debug this program.

## Solution:

Using x64dbg, first identify the address of the `get_flag()` function: `00007FF6E3051E40`. Then, step through the code right before the input check, and skip the check by setting the new origin right after the JNE instruction. Set a breakpoint at the ret instruction and continue code execution. The flag will be printed out.

`FLAG{WinDbg_is_very_important_in_windows_security}`
