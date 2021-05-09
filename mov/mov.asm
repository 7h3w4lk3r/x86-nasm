; a demo for mov instruction ( run in a debgger )

global _start
section .text
_start:
    mov eax, 0x1234
    mov ebx, 0x56789
    mov eax, 60
    mov edi, 0
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
