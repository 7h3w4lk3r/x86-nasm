; a demo for OR logical instruction


section .text
global _start

_start:
mov    al, 5             ; put 5 in al
mov    bl, 3             ; put 3 in bl
or     al, bl            ; OR al with bl, result should be 7
add    al, byte '0'      ; convert decimal to ascii and put it in al

mov    [result],  al	; move the value in al to the address of result variable (brackets are the refrence for an address)
mov    eax, 4		; print out the result...
mov    ebx, 1
mov    ecx, result
mov    edx, 1
int    0x80

mov	ebx, 0		; exit the program
mov    eax,1
int    0x80

section    .bss
result resb 1
