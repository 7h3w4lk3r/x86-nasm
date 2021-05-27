; compare 2 strings using CMPS instruction

section .data
s1 db "hello world",0
len1 equ $ - s1
s2 db "hello there",0
len2 equ $ - s2
msg_eq db "strings are equal",0xa
len_eq equ $ - msg_eq
msg_neq db "strings are not equal", 0xa
len_neq equ $ - msg_neq


section .data
global _start:
_start:
mov	ecx, len2
mov	esi, s1
mov	edi, s2
cld
repe	cmpsb		; compare all bytes of the strings
jecxz	equal		; jump when ecx is zero ( the strings are equal )

; print 'mot equal' message if ecx is not zero
mov	eax, 4
mov	ebx, 1
mov	ecx, msg_neq
mov	edx, len_neq
int	80h
jmp	_exit		; if we dont jump to exit, the equal block will be executed

equal:
mov	eax, 4
mov	ebx, 1
mov	ecx, msg_eq
mov	edx, len_eq
int	80h

_exit:
mov	eax, 1
mov	ebx, 0
int	80h
