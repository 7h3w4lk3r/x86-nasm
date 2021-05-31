; a demo for stack operations (push/pop) in asm
; display the entire ascii character set using a procedure call

section .data
achar db '0'		; first ascii character '0'

section .text
global _start

_start:
call	display		; call display
mov	ebx, 0		; exit right after display is called
mov	eax, 1
int	80h

display:
mov	ecx, 256	; for printing the entire ascii charset

next:
push	ecx		; save ecx (256) to memory
mov	eax, 4		; print the character (from '0')
mov	ebx, 1
mov	ecx, achar
mov	edx, 1
int	80h

pop	ecx			; pop the ecx value back from memory
mov	dx, [achar]
cmp	byte [achar], 0dh
inc	byte [achar]
loop	next
ret

