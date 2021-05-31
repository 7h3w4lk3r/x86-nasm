; print the time in seconds using syscall SYS_TIME opcode 13

%include        'functions.asm'

section .data
msg db "seconds, since jan 01 1970: ",0h

section .text
global _start:
_start:
mov	eax, msg
call	sprint

mov	eax, 13
int	80h

call	iprintLF
call	quit
