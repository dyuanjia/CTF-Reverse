# Time's Up, For the Last Time!

## Description:

> You've solved things fast. You've solved things faster! Now do the impossible.

## Solution:

The time frame is shortened to 10 uS. There is no way evaluate the expression within this short period of time. Thus, a workaround is needed.

Since the alarm signal is used to trigger the exit condition, the solution C program would block the signal, and then execve the vulnerable application.

Child processes inhert from parent processes, so this causes the ALARM to never fire.
