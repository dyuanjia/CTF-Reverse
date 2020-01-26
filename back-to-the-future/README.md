# Back to the Future

## Description:

> 一九八五年科學家聖豪成功在實驗室研製了軟體時光機，並將開發時光機的「核心機密」埋藏在時光機軟體中。
> 而時光機的機密因為保存技術而有半衰期會逐年衰變，逐漸變為看不懂的資訊，而時光機本身配有 Time Machine Guard 用來抵抗外來研究員嘗試分析破解時光機。
> 請嘗試在不觸發 Time Machine Guard 的情況下回到過去盜取製造時光機的機密吧！！！

## Solution:

Decompile using IDA Pro:

```cpp
int __cdecl main(int argc, const char **argv, const char **envp)
{
  HMODULE v3; // eax
  unsigned int address_PEB; // [esp+18h] [ebp-20h]
  _DWORD *date_object; // [esp+1Ch] [ebp-1Ch]
  signed int k; // [esp+24h] [ebp-14h]
  signed int j; // [esp+28h] [ebp-10h]
  size_t i; // [esp+2Ch] [ebp-Ch]

  sub_4019E0();
  v3 = GetModuleHandleA(0);
  date_object = (v3 + *(v3 + 15));
  address_PEB = __readfsdword(0x30u);
  if ( *v3 == 'ZM' && *date_object == 'EP' )
  {
    printf(
      " --------------------------- \n"
      " | B@ck t0 7he Fu7ur3...  \n"
      " | en.wikipedia.org/wiki/Back_to_the_Future\n"
      "  --------------------------- \n");
    year = sub_401600(date_object[2]);
    printf("[+] It's a time machine built in 1985, \n\tand you're in %i year now.\n");
    if ( year != 1985 )
      puts("[!] WARNING: \n\tit might be some trouble if you're not in 1985 year.");
    *(address_PEB + 2);
    printf("[!] Time Machine Guarder: %s\n");
    printf("[+] input password to launch time machine: ");
    gets(password_0);
    for ( i = 0; strlen(password_0) > i; ++i )
      password_0[i] |= 0x20u;
    printf("[!] reading ... the.... passw0r..d.....\n");
    for ( j = 0; j <= 18; ++j )
    {
      password_0[j] ^= 2 * (year + 63) + *(address_PEB + 2) + 127;
      if ( password_0[j] != byte_408008[j] )
      {
        puts("[!] oops... time machine g0t some trouble in the 0ld tim3... ");
        break;
      }
    }
    for ( k = 0; k <= 18; ++k )
      password_0[k] ^= byte_40801C[k];
    printf("[+] a flag found by time machine at %i:\n\t%s\n");
  }
  else
  {
    puts("time machine broken, oohoho. please don't patch me ;)");
  }
  return 0;
}
```

The program first check if the current date is 1985. It will print a message if it's not.

Next, the time machine guard will check if the program is being ran in a debugger. The check is done at **0x40171C**. This can be skipped by using the "Set new origin here" function in x32dbg.

Finally, the program will check the input password (length 19) as follows:

1. OR each char of the input password with 0x20
2. XOR each char of the resultant password with 4292: content at PEB address + 2 is 01
3. Check if the resultant password is the same as the content at **0x408008**
4. If they are the same, the program will XOR each char of the resultant password with the corresponding content at address **0x40801C** to print the flag.

Therefore, to get the flag, XOR the content at **0x408008** with the content at **0x40801C**.

`FLAG{PE_!S_EASY}`
