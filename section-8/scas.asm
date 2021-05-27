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
repne	scasb		; 
