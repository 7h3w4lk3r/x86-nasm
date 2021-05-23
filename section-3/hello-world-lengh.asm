; calculate the length of hello world string

section .data
msg db "hello world!", 0ah

section .text
global _start

_start:
mov	ebx, msg	; move the message into ebx
mov	eax, ebx	; move ebx to eax, both have the same value now

nextchar:		; next block of code, this acts like a loop here
cmp	byte [eax], 0	; examin the byte pointed to by eax (of the string) against zero (EOF)
jz	finished	; if the byte pointed to by the eax is equal to zero (the zero flag is set) jump to the section of code called 'finished'
inc	eax		; increment the address in eax by one byte, this is done only if the zero flag is not set, so this way we can examin the next byte of the string against EOF and go on finding the length
jmp	nextchar	; if the jump to finished section didnt happen, execute the nextchar section again until we find the length of string and reach EOF (zero flag set)


finished:		; this block is executed when the zero flag is set and eax contains the length of string
sub	eax, ebx	; subtract the address in exx from eax to find the exact number of bytes in the string
mov	edx, eax	; now we move the length of the string from eax to edx for printing
mov	ecx, msg
mov	ebx, 1
mov	eax, 4
int 	80h		; if you can see the whole string text this means that the calculated length was right

mov	ebx, 0
mov	eax, 1
int 80h

