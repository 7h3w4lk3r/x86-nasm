; a demo for fork system call to create a new process that duplicates our current process

%include        'functions.asm'

section .data
childMsg db "thisis the child process",0h
parentMsg db "this is the parent process",0h

section .text
global _start

_start:
mov	eax, 2
int	80h

cmp	eax, 0
jz	child

parent:
mov	eax, parentMsg
call	sprintLF
call	quit

child:
mov	eax, childMsg
call	sprintLF
call	quit
