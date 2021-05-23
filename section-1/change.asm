; change the value of a variable in the program

section .data
name	db	"foo bar",0xa
len	equ $ - name

section .text
global _start

_start:
;print the name before changing
mov	eax, 4
mov	ebx, 1
mov	edx, len
mov	ecx, name
int	80h

; change the name
mov	[name], dword "too "	; change the first dword (4 bytes) of the name, 'foo ' becomes 'too '

; print after changing
mov	eax, 4
mov	ecx, name
mov	ebx, 1
mov	edx, len
int	80h


; exit
mov	eax, 1
mov	ebx, 0
int	80h

