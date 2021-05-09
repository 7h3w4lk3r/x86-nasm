; demo for %assign directive ( redefining a constant )

section .data

%define TOTAL 20
len equ $ - TOTAL

section .text
global _start

_start:

mov eax, 4
mov ebx, 1
mov edx, len
mov ecx, TOTAL
int 80h

mov eax, 1
mov ebx, 0
int 80h

