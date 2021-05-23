; convert from ASCII to binary and vice versa.

section .text
global _start

_start:
mov	eax, '3'	; put number 3 into eax
sub	eax, '0'	; convert it to binary

mov	ebx,'4'		; put number 4 into ebx
sub	ebx, '0'	; convert it to binary
add	eax, ebx	; calculate the sum of eax and ebx
add	eax, '0'	; convert eax value (7) from digit to ascii character

mov	[sum], eax	; move the sum value (7) to 'sum' variable
mov	ecx, msg	; prepare for printing the message
mov	edx, len
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, sum	; print sum value
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int 80h


mov	eax, 1		; exit
int	80h


section .data
msg db "sum is: "
len equ $ - msg

section .bss
sum resb 1






