; use TIMES directive to create a variable

section .data
stars times 10 db '*'		; variable 'stars' now contains 10 '*' signs

section .text
global _start
_start:
; print stars
mov	eax, 4
mov	ebx, 1
mov	edx, 10
mov	ecx, stars
int	80h

; exit
mov	eax, 1
mov	ebx, 0
int	80h
