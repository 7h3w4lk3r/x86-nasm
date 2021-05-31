; passing arguments from command line

%include "functions.asm"

section .text
global _start

_start:

pop	ecx			; save ecx to reserve for first value on the stack (number of args)

nextArg:
cmp	ecx, 0h			; check for any other arguments
jz	noMoreArgs		; if zf is set ( no more args) jump to noMoreArgs
pop	eax			; pop the next argument off the stack
call	sprintLF		; print the argument
dec	ecx			; decrement ecx ( number of arguments ), go for next arg in the stack
jmp	nextArg			; loop this block until all arguments are printed

noMoreArgs:
call	quit			; if no more arguments are left, exit the program


