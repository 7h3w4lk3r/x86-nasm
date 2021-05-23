; use ascii representation to add two 5-digit decimal numbers and display the sum

section .text
global _start

_start:
mov	esi, 4		; pointing to the rightmost digit
mov	ecx, 5		; number of digits
clc			; clear carry flag for future use

add_loop:
mov	al, [num1 + esi]	; put the address of num1 + offset in al
adc	al, [num2 + esi]	; add the most significant bits of the num2 + offset address to al
aaa				; convert the result of the addition of two valid unpacked bcd digits to al register
pushf				; push the lower 16 bits of EFLAGS to stack (empty eflags for use)
or	al, 30h
popf				; pop the lower 16 bits of EFLAGS from the stack

mov	[sum + esi], al		; move the result from al to the summary variable + offset address
dec	esi			; decrement esi for the next digit calculation
loop	add_loop		; loop  through 'add_loop'

mov	edx, len
mov	ecx, msg
mov	ebx, 1
mov	eax, 4
int	80h

mov	edx, 5
mov	ecx, sum
mov	ebx, 1
mov	eax, 4
int	80h

mov	eax, 1
int	80h

section .data
msg db "sum: "
len equ $ - msg
num1 db '12345'
num2 db '23456'
sum db '     '	; 5 bytes of ascii spaces (will be replaced with digits)
