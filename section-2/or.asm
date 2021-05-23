; a demo for OR instruction

section .bss
result resb 1

section .text
global _start

_start:
mov	al, 5		; put 5 in al
mov	bl, 3		; put 3 in bl
or	al, bl		; or al and bl (7)
add	al, byte '0'	; convert decimal 7 to ascii '7'
mov	[result], al	; store result in 'result'

mov	eax, 4		; print the result
mov	ebx, 1
mov	ecx, result
mov	edx, 1
int	80h

mov	eax, 1
mov	ebx, 0
int	80h
