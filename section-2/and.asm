; demo for and instruction

section .data
even_msg db 'Even Number!'
len1 equ $ - even_msg
odd_msg db 'Odd Number!'
len2 equ $ - odd_msg

section .text
global _start

_start:
mov	ax, 8h		; put decimal 8 in ax
and	ax, 1		; and ax with 1 to see if its odd or even

jz	even		; if the zero flag was set (8 was an even number) jump to the 'even' block

mov	eax, 4		; if the zero flag was not set (8 was an odd number) print the odd message
mov	ebx, 1
mov	ecx, odd_msg
mov	edx, len1
int	80h

jmp	_exit		; unconditional jump to '_exit' block when the message was printed

even:			; print odd message
mov	eax, 4
mov	ecx, odd_msg
mov	edx, len2
mov	ebx, 1
int	80h

_exit:			; exit code
mov	eax, 1
mov	ebx, 0
int	80h






