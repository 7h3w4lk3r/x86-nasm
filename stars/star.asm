
; print 2 strings

section .text
global _start

_start:

mov edx, len
mov ecx, msg
mov ebx, 1
mov eax, 4
int 0x80

mov edx, len2
mov ecx, msg2
mov ebx, 1
mov eax, 4
int 0x80

mov eax, 1
int 0x80



section .data

msg db 'this is a test', 0xa 	;0xa is line feed ( go to new line )
len equ $ - msg

msg2 times 9 db '*'		;msg2 = '*' times 9 = '*********'
len2 equ $ - msg2

