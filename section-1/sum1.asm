; add two hard coded variables and print the sum
; remember these:
; for converting ascii to decimal --> subtract '0'
; for converting decimal to ascii --> add '0'

section .data
msg db "sum: "
len equ $ - msg

section .bss
sum resb 1

section .text
global _start

_start:
mov	eax, '3'	; put ascii '3' into eax
sub	eax, '0'	; convert ascii '3' to decimal 3
mov	ebx, '4'
sub	ebx, '0'

; add two values
add	eax, ebx
add	eax, '0'	; convert eax value back to ascii code for printing
mov	[sum], eax	; store the value in 'sum'

; print the message
mov	ecx,msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

; print the sum
mov	ecx, sum
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov	eax, 1
mov	ebx, 0
int	80h





