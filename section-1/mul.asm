; demo for multiply instructions


section .data
msg db "result: "
len equ $ -msg

section .bss
result resb 1

section .test
global _start

_start:
mov	al, '3'		; put ascii '3' in al
sub	al, '0'		; convert ascii '3' to decimal 3
mov	bl, '2'
sub	bl, '0'

mul	bl		; multiply the value in AL by the value in BL ( 3 = 2 )
add	al, '0'		; convert the value back to ascii for printing
mov	[result], al	; store in 'result'

; print the message
mov	eax, 4
mov	ebx, 1
mov	edx, len
mov	ecx, msg
int	80h

; print the result
mov     eax, 4
mov     ebx, 1
mov     edx, 1
mov     ecx, result
int     80h

; exit
mov	eax, 1
mov	ebx, 0
int	80h









