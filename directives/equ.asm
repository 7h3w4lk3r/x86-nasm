; a demo for equ directive ( defining constants ) in nasm

; these are the system calls to be placed in eax
SYS_EXIT  equ 1
SYS_WRITE equ 4

; these are the file descriptors for write operation
STDIN     equ 0
STDOUT    equ 1


section	 .text
   global _start

_start:

; write operation
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg1
   mov edx, len1
   int 0x80

; another write operation
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg2
   mov edx, len2
   int 0x80

; and another one
   mov eax, SYS_WRITE
   mov ebx, STDOUT
   mov ecx, msg3
   mov edx, len3
   int 0x80

; exit operation
   mov eax,SYS_EXIT    ;system call number (sys_exit)
   int 0x80            ;call kernel


section	 .data
msg1 db	'Hello, programmers!',0xA,0xD
len1 equ $ - msg1

msg2 db 'Welcome to the world of,', 0xA,0xD
len2 equ $ - msg2

msg3 db 'Linux assembly programming! '
len3 equ $- msg3

