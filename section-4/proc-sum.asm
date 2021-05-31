; a demo of call and ret instructions in procedures
; sum adds the variables stored in ecx and edx and returns the result in eax


section .data
msg db "sum: "
len equ $ - msg

segment .bss
result resb 1


section .text
global _start
_start:
mov	ecx, '4'	; put ascii '4' in ecx as first argument for 'sum' procedure
sub	ecx, '0'	; convert ascii '4' to decimal '4'
mov	edx, '5'	; put ascii '5' as second argument
sub	edx, '0'	; convert to decimal
call	sum		; call 'sum' procedure
mov	[result], eax	; put the return value of 'sum' procedure into 'result' variable in memory

mov	ecx, msg	; print the message
mov	eax, 4
mov	ebx, 1
mov	edx, len
int	80h

mov	eax, 4		; print the sum
mov	ecx, result
mov	edx, 1
mov	ebx, 1
int	80h

mov	eax, 1		; exit
mov	ebx, 0
int	80h


sum:
mov	eax, ecx	; move first argument from ecx to eax
add	eax, edx	; add second argument to eax
add	eax, '0'	; convert result in eax to ascii character
ret			; return to caller (return value is in eax)










