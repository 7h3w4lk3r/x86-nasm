; a program for changing variable value using mov

section .data
name db 'bob', 0xa
len equ $ - name

section .text
global _start

_start:

; print bob
mov eax, 4
mov ecx, name
mov edx, len
mov ebx, 1
int 80h

; change the string
mov [name], dword 'john'  ; change the first dword of the string with 'john'

; print john
mov edx, 4	; size of 'john'
mov eax, 4
mov ebx, 1
mov ecx, name
int 80h

; exit code
mov eax, 1
mov ebx, 0
int 80h



