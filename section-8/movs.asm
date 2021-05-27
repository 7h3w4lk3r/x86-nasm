; a demo for copying data items using MOVS instruction

section .data
s1 db "hello world!"
len equ $ - s1

section .bss
s2 resb 20

section .text
global _start

_start:
mov	ecx, len	; move the length of s1 to ecx for operation
mov	esi, s1		; put s1 to esi as source string
mov	edi, s2		; put s2 to edi as destination string

; (clear directive flag) instruction sets the DF flag to 0
; string operations increment the index registers
cld

; repeat the movsb (byte strings) instruction until the counter hits 0, so s1 is completely copied to s2
rep	movsb

mov	edx, 20		; print out string 2
mov	ecx, s2
mov	ebx, 1
mov	eax, 4
int	80h

mov	ebx, 0		; exit code
mov	eax, 1
int	80h
