; a demo for DIV instruction, devides 8 by 2 using AX and BL

section .data
msg db "result: "
len equ $ - msg

section .bss
result resb 1

section .text
global _start

_start:

mov	ax, '8'		; put ascii '8' in ax
sub	ax, '0'		; convert ascii '8' to decimal 8
mov	bl, '2'
sub	bl, '0'
div	bl		; devide the value in AX (8) by the value in BL (2), result goes into AX
add	ax, '0'		; convert the result back to ascii for printing
mov	[result], ax	; put the result in variable

; print the message
mov	ecx, msg
mov	eax, 4
mov	ebx, 1
mov	edx, len
int	80h

; print the result
mov	eax, 4
mov	ebx, 1
mov	edx, 1
mov	ecx, result
int	80h

; exit
mov	eax, 1
mov	ebx, 0
int	80h

