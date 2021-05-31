; hello-world using external functions
; nasm -f elf helloworld-inc.asm
;  ld -m elf_i386 helloworld-inc.o

%include	'functions.asm'

section .data
msg1	db	"hello world!",0Ah
msg2	db	"this is a test", 0Ah

section .text
global _start

_start:
mov	eax, msg1	; set argument for external function
call	sprint		; call external function

mov	eax, msg2
call	sprint

call	quit

