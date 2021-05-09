global _start
section .text

_start:
    mov edx,0x1234
    push edx
    push 0x5678
    pop edi
    pop esi
    mov eax, 60
    mov edi, 0
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
