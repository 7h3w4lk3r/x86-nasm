; execute system commands

%include        'functions.asm'
 
section .data
command db "ls", 0h
arg1 db "-la", 0h

args dd	command		; a structure of arguments
     dd arg1
     dd 0h
environment dd 0h	; arguments to pass as environment variables (in this case none) end the struct

section .text
global _start

_start:
; execute the command
mov	edx, environment
mov	ecx, args
mov	ebx, command
mov	eax, 11		; sys_execve (opcode 11)
int	80h

call	quit
