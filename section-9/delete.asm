; remove a file

section .data
filename db "test.txt",0h

section .text
global _start

_start:

mov	ebx, filename
mov	eax, 10			; sys_unlink (opcode 10), remove the file
int	80h

mov	eax, 1
mov	ebx, 0
int	80
