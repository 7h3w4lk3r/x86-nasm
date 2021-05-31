; demo for scas instruction, search for one string in another string

section .data
s1 db "hello world", 0
len equ $ - s1
msg_found db "found!", 0xa
len_found equ $ - msg_found
msg_notfound db "not found!", 0xa
len_notfound equ $ - msg_notfound

section .text:
global _start
_start:
mov	ecx, len
mov	edi, s1
mov	al, 'e'		; set the search string to 'e'
cld

; repne ( repeat while not equal) means repeat the instruction while ecx/cx is not equal to zero
; or ZF is not set
;scasb will search for the character in al register in s2 string repeatedly

repne	scasb		; repeat comparing the content of al register with the content of s1 (search)

je	_found		; if ecx is equal to 0, jump to _found block (the string has a match)

_not_found:
mov	eax, 4
mov	ebx, 1
mov	ecx, msg_notfound
mov	edx, len_notfound
int	80h
jmp	_exit

_found:
mov	eax, 4
mov	ebx, 1
mov	ecx, msg_found
mov	edx, len_found
int	80h

_exit:
mov	eax, 1
mov	ebx, 0
int	80h
