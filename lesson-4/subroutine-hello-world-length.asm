section .data
msg     db      'hello world!', 0Ah

section .text
global  _start

_start:

    mov     eax, msg
    call    strlen	; call the subroutine like last time

    mov     edx, eax	; move results of the executed subroutine in edx and keep it in eax
    mov     ecx, msg
    mov     ebx, 1
    mov     eax, 4
    int     80h

    mov     ebx, 0
    mov     eax, 1
    int     80h

strlen:			; calculate the length of string, the rest is same as before
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret
