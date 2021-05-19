; use a subroutine (function) to print a message

section .data
msg db "print function called", 0ah
len equ $ - msg

section .text
global _start

_start:

mov	eax, msg		; move the message address to eax for print function
call	print			; call the print subroutine

mov	ebx, 0			; graceful exit (exit code 0)
mov	eax, 1
int 	80h

print:				; print the message
mov	edx, len
mov	ecx, msg
mov	ebx, 1
mov	eax, 4
int	80h
ret				; returns the control to the _start subroutine

