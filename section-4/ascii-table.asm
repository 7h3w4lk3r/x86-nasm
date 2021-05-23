; display the whole ascii table using subroutines

section .text
global _start

_start:
call	display	; call display function

mov	eax, 1	; exit
int	80h

display:
mov	ecx, 256	; put the value 256 (ascii character highest number) to ecx, as a counter

next:
push	ecx		; save ecx on stack
mov	eax, 4		; print the achar variable ascii representation
mov	ebx, 1
mov	ecx, achar
mov	edx, 1
int	80h

pop	ecx			; pop ecx value back for using as a counter
mov	dx, [achar]		; move 'achar' address to dx for finding next character
cmp	byte [achar], 0dh	; compare number of bytes in achar agains ascii number 13
inc	byte [achar]		; increment the address of achar by one to point to the next character
loop	next			; repeate 'next' until all the characters are printed
ret				; return to '_start'

section .data
achar db '0'			; ascii character '0'
