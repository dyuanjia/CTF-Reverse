asm4:
	<+0>:	push   ebp
	<+1>:	mov    ebp,esp						; picoCTF_fdb55
	<+3>:	push   ebx							; value of ebx at top of stack
	<+4>:	sub    esp,0x10						; 4 local vars
	<+7>:	mov    DWORD PTR [ebp-0x10],0x260	; var4 = 0x260
	<+14>:	mov    DWORD PTR [ebp-0xc],0x0		; var3 = 0x0
	<+21>:	jmp    0x518 <asm4+27>				; jmp one line
	<+23>:	add    DWORD PTR [ebp-0xc],0x1			; var3 = 0x1	;var3 = 0xd
	<+27>:	mov    edx,DWORD PTR [ebp-0xc]		; edx = 0x0			;edx = 0xd
	<+30>:	mov    eax,DWORD PTR [ebp+0x8]		; eax = pointer to string
	<+33>:	add    eax,edx						; eax = point to the first char
	<+35>:	movzx  eax,BYTE PTR [eax]			; eax = 0x00000070
	<+38>:	test   al,al						; not zero, ZF=1
	<+40>:	jne    0x514 <asm4+23>				; jump				; not jump
	<+42>:	mov    DWORD PTR [ebp-0x8],0x1		; var2 = 0x1
	<+49>:	jmp    0x587 <asm4+138>
	<+51>:	mov    edx,DWORD PTR [ebp-0x8]		; edx = 0x1			; edx=0x2			; edx=0x3			; edx=0x4			; edx=0x5			; edx=0x6			; edx=0x7			; edx=0x8			; edx=0x8			; edx=0x9			; edx=0xa			; edx=0xb			
	<+54>:	mov    eax,DWORD PTR [ebp+0x8]		; eax = pointer to string
	<+57>:	add    eax,edx						; eax = point to i	; eax = point to c	; eax = point to o	; eax = point to C	; eax = point to T	; eax = point to F	; eax = point to _	; eax = point to f	; eax = point to d	; eax = point to b	; eax = point to 5	; eax = point to 5	
	<+59>:	movzx  eax,BYTE PTR [eax]			; eax = 0x00000069	; eax = 0x00000063	; eax = 0x0000006f	; eax = 0x00000043	; eax = 0x00000054	; eax = 0x00000046	; eax = 0x0000005f	; eax = 0x00000066	; eax = 0x00000064	; eax = 0x00000062	; eax = 0x00000035	; eax = 0x00000035
	<+62>:	movsx  edx,al						; edx = 0x00000069	; edx = 0x00000063	; edx = 0x0000006f	; edx = 0x00000043	; edx = 0x00000054	; edx = 0x00000046	; edx = 0x0000005f	; edx = 0x00000066	; edx = 0x00000064	; edx = 0x00000062	; edx = 0x00000035	; edx = 0x00000035
	<+65>:	mov    eax,DWORD PTR [ebp-0x8]		; eax = 0x1			; eax = 0x2			; eax=0x3			; eax=0x4			; eax=0x5			; eax=0x6			; eax=0x7			; eax=0x8			; eax=0x8			; eax=0x9			; eax=0xa			; eax=0xb			
	<+68>:	lea    ecx,[eax-0x1]				; ecx = 0x0			; ecx = 0x1			; ecx = 0x2			; ecx=0x3			; ecx=0x4			; ecx=0x5			; ecx=0x6			; ecx=0x7			; ecx=0x8			; ecx=0x8			; ecx=0x9			; ecx=0xa			
	<+71>:	mov    eax,DWORD PTR [ebp+0x8]		; eax = pointer to string
	<+74>:	add    eax,ecx						; eax = point to p	; eax = point to i	; eax = point to c	; eax = point to o	; eax = point to C	; eax = point to T	; eax = point to F	; eax = point to _	; eax = point to f	; eax = point to d	; eax = point to b	; eax = point to 5	
	<+76>:	movzx  eax,BYTE PTR [eax]			; eax = 0x00000070	; eax = 0x00000069	; eax = 0x00000063	; eax = 0x0000006f	; eax = 0x00000043	; eax = 0x00000054	; eax = 0x00000046	; eax = 0x0000005f	; eax = 0x00000066	; eax = 0x00000064	; eax = 0x00000062	; eax = 0x00000035	
	<+79>:	movsx  eax,al						; eax = 0x00000070	; eax = 0x00000069	; eax = 0x00000063	; eax = 0x0000006f	; eax = 0x00000043	; eax = 0x00000054	; eax = 0x00000046	; eax = 0x0000005f	; eax = 0x00000066	; eax = 0x00000064	; eax = 0x00000062	; eax = 0x00000035	
	<+82>:	sub    edx,eax						; edx = 0xffffffff	; edx = 0xfffffffa	; edx = 0x0000000c	; edx = 0xffffffd4	; edx = 0x00000011	; edx = 0xfffffff2	; edx = 0x00000019	; edx = 0x00000007	; edx = 0xfffffffe	; edx = 0xfffffffe	; edx = 0xffffffd3	; edx = 0x00000000	
	<+84>:	mov    eax,edx						; eax = 0xffffffff	; eax = 0xfffffffa	; eax = 0x0000000c	; eax = 0xffffffd4	; eax = 0x00000011	; eax = 0xfffffff2	; eax = 0x00000019	; eax = 0x00000007	; eax = 0xfffffffe	; eax = 0xfffffffe	; eax = 0xffffffd3	; eax = 0x00000000	
	<+86>:	mov    edx,eax						; edx = 0xffffffff	; edx = 0xfffffffa	; edx = 0x0000000c	; edx = 0xffffffd4	; edx = 0x00000011	; edx = 0xfffffff2	; edx = 0x00000019	; edx = 0x00000007	; edx = 0xfffffffe	; edx = 0xfffffffe	; edx = 0xffffffd3	; edx = 0x00000000	
	<+88>:	mov    eax,DWORD PTR [ebp-0x10]		; eax = 0x260		; eax = 0x253		; eax = 0x259		; eax = 0x239		; eax = 0x21e		; eax = 0x221		; eax = 0x22c		; eax = 0x24c		; eax = 0x251		; eax = 0x24d		; eax = 0x21e		
	<+91>:	lea    ebx,[edx+eax*1]				; ebx = 0x259		; ebx = 0x24d		; ebx = 0x265		; ebx = 0x20d		; ebx = 0x22f		; ebx = 0x213		; ebx = 0x245		; ebx = 0x253		; ebx = 0x24f		; ebx = 0x24b		; ebx = 0x1f1
	<+94>:	mov    eax,DWORD PTR [ebp-0x8]		; eax = 0x1			; eax = 0x2			; eax=0x3			; eax=0x4			; eax=0x5			; eax=0x6			; eax=0x7			; eax=0x8			; eax=0x8			; eax=0x9			; eax=0xa			; eax=0xb			
	<+97>:	lea    edx,[eax+0x1]				; edx = 0x2			; edx = 0x3			; edx=0x4			; edx=0x5			; edx=0x6			; edx=0x7			; edx=0x8			; edx=0x8			; edx=0x9			; edx=0xa			; edx=0xb			; edx=0xc	
	<+100>:	mov    eax,DWORD PTR [ebp+0x8]		; eax = pointer to string
	<+103>:	add    eax,edx						; eax = point to c	; eax = point to o	; eax = point to C	; eax = point to T	; eax = point to F	; eax = point to _	; eax = point to f	; eax = point to d	; eax = point to b	; eax = point to 5	; eax = point to 5	; eax = point to overflow
	<+105>:	movzx  eax,BYTE PTR [eax]			; eax = 0x00000063	; eax = 0x0000006f	; eax = 0x00000043	; eax = 0x00000054	; eax = 0x00000046	; eax = 0x0000005f	; eax = 0x00000066	; eax = 0x00000064	; eax = 0x00000062	; eax = 0x00000035	; eax = 0x00000035	; eax = 0x00000000
	<+108>:	movsx  edx,al						; edx = 0x00000063	; edx = 0x0000006f	; edx = 0x00000043	; edx = 0x00000054	; edx = 0x00000046	; edx = 0x0000005f	; edx = 0x00000066	; edx = 0x00000064	; edx = 0x00000062	; edx = 0x00000035	; edx = 0x00000035	; edx = 0x00000000
	<+111>:	mov    ecx,DWORD PTR [ebp-0x8]		; ecx = 0x1			; ecx = 0x2			; ecx=0x3			; ecx=0x4			; ecx=0x5			; ecx=0x6			; ecx=0x7			; ecx=0x8			; ecx=0x8			; ecx=0x9			; ecx=0xa			; ecx = 0xb
	<+114>:	mov    eax,DWORD PTR [ebp+0x8]		; eax = pointer to string
	<+117>:	add    eax,ecx						; eax = point to i	; eax = point to c	; eax = point to o	; eax = point to C	; eax = point to T	; eax = point to F	; eax = point to _	; eax = point to f	; eax = point to d	; eax = point to b	; eax = point to 5	; eax = point to 5	
	<+119>:	movzx  eax,BYTE PTR [eax]			; eax = 0x00000069	; eax = 0x00000063	; eax = 0x0000006f	; eax = 0x00000043	; eax = 0x00000054	; eax = 0x00000046	; eax = 0x0000005f	; eax = 0x00000066	; eax = 0x00000064	; eax = 0x00000062	; eax = 0x00000035	; eax = 0x00000035
	<+122>:	movsx  eax,al						; eax = 0x00000069	; eax = 0x00000063	; eax = 0x0000006f	; eax = 0x00000043	; eax = 0x00000054	; eax = 0x00000046	; eax = 0x0000005f	; eax = 0x00000066	; eax = 0x00000064	; eax = 0x00000062	; eax = 0x00000035	; eax = 0x00000035
	<+125>:	sub    edx,eax						; edx = 0xfffffffa	; edx = 0x0000000c	; edx = 0xffffffd4	; edx = 0x00000011	; edx = 0xfffffff2	; edx = 0x00000019	; edx = 0x00000007	; edx = 0xfffffffe	; edx = 0xfffffffe	; edx = 0xffffffd3	; edx = 0x00000000	; edx = 0x00000000
	<+127>:	mov    eax,edx						; eax = 0xfffffffa	; eax = 0x0000000c	; eax = 0xffffffd4	; eax = 0x00000011	; eax = 0xfffffff2	; eax = 0x00000019	; eax = 0x00000007	; eax = 0xfffffffe	; eax = 0xfffffffe	; eax = 0xffffffd3	; eax = 0x00000000	; eax = 0x00000000	
	<+129>:	add    eax,ebx						; eax = 0x253		; eax = 0x259		; eax = 0x239		; eax = 0x21e		; eax = 0x221		; eax = 0x22c		; eax = 0x24c		; eax = 0x251		; eax = 0x24d		; eax = 0x21e		; eax = 0x1f1		
	<+131>:	mov    DWORD PTR [ebp-0x10],eax		; var4 = 0x253		; var4 = 0x259		; var4 = 0x239		; var4 = 0x21e		; var4 = 0x221		; var4 = 0x22c		; var4 = 0x24c		; var4 = 0x251		; var4 = 0x24d		; var4 = 0x21e		
	<+134>:	add    DWORD PTR [ebp-0x8],0x1		; var2 = 0x2		; var2 = 0x3		; var2=0x4			; var2=0x5			; var2=0x6			; var2=0x7			; var2=0x8			; var2=0x8			; var2=0x9			; var2=0xa			; var2=0xb			; var2=0xc
	<+138>:	mov    eax,DWORD PTR [ebp-0xc]	; eax = 0xd
	<+141>:	sub    eax,0x1					; eax = 0xc
	<+144>:	cmp    DWORD PTR [ebp-0x8],eax	; less
	<+147>:	jl     0x530 <asm4+51>			; jmp
	<+149>:	mov    eax,DWORD PTR [ebp-0x10]
	<+152>:	add    esp,0x10
	<+155>:	pop    ebx
	<+156>:	pop    ebp
	<+157>:	ret    

