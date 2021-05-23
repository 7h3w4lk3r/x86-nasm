; demo for constants using EQU directive


section .data
msg1	db	"this is a test", 0xa
len1	equ	$ -msg1
msg2	db	"and this is another test :)", 0xa
len2	equ	$ -msg2
STDIN	equ	2		; for ebx when taking input
STDOUT	equ	1		; for ebx when printing output
SYS_EXIT	equ	1	; system call for sys_exit (kernel opcode 0)
SYS_WRITE	equ	4	; system call for sys_write (kernel opcode 4)
SYS_READ	equ	3	; system call for sys_read (kernel opcode 3)

section .text
global _start


_start:
; print first message
mov	eax, SYS_WRITE
mov	ebx, STDOUT
mov	ecx, msg1
mov	edx, len1
int	80h

; print second message
mov     eax, SYS_WRITE
mov     ebx, STDOUT
mov     ecx, msg2
mov     edx, len2
int     80h

; exit
mov	eax, SYS_EXIT
mov	ebx, 0
int	80h


