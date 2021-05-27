; demo for STOS instruction, convert an upper case string to its lower case value

section .data
s1 db "HELLO WORLD"
len equ $ - s1

section .bss
s2 resb 20

section .text
global _start

_start:
mov	ecx, len	; set the length
mov	esi, s1		; set the source
mov	edi, s2		; set the destination

_loop:
lodsb			; load a byte from source into al
or	al, 20h		; for converting the corresponding ascii characters from upper to lower case
stosb			; store from al to destination
loop	_loop		; repeat for all characters
cld			; clear DF flag
rep	movsb		; copy s1 to s2

; print s2
mov	ecx, s2
mov	edx, 20
mov	ebx, 1
mov	eax, 4
int	80h

; exit
mov	eax, 1
mov	ebx, 0
int	80h
