; demo for %assign directive ( redefining a constant )

section .data

; define total
%assign TOTAL 10
len equ $ - TOTAL

; redefine total
%assign TOTAL 20
len2 equ $ - TOTAL	; cant redefine the length variable so we use a new one

section .text
global _start

_start:

mov eax, 4
mov ebx, 1
mov edx, len2
mov ecx, TOTAL
int 80h

mov eax, 1
mov ebx, 0
int 80h
