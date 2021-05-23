; represent ascii characters as decimal numbers and vice versa


section	.text
   global _start

_start:
   sub     ah, ah	; empty ah register so it doesnt mess with the value in al
   mov     al, '9'	; put ascii '9' in al
   sub     al, '3'	; subtract ascii '9' in al with ascii '3'
   aas			; ascii adjust after subtraction, assumes that the operand is in al already
   or      al, 30h
   mov     [res], ax

   mov	edx,len		; print the message
   mov	ecx,msg
   mov	ebx,1
   mov	eax,4
   int	0x80

   mov	edx,1		; print the result
   mov	ecx,res
   mov	ebx,1
   mov	eax,4
   int	0x80

   mov	eax,1		; exit
   int	0x80

section	.data
msg db 'result: '
len equ $ - msg

section .bss
res resb 1
