; a demo for AND logical instruction

section .data
odd_msg db "odd number!",0ah
odd_len equ $ - odd_msg
even_msg db "even number!",0ah
even_len equ $ - even_msg


section .text
global _start

_start:
mov	eax, 8h		; put 8 in eax ( 8 is even so the 'even' subroutine will be executed)
and	eax, 1		; AND eax with 1
jz	even		; if the result of AND is even (zero flag is set), jump to 'even' subroutine
jnz	odd		; if the result of AND is odd (zero flag not set), jump to 'odd' subroutine

mov	ebx, 0		; exit gracefully
mov	eax, 1
int	80h


even:
mov	eax, 4
mov	ebx, 1
mov	ecx, even_msg
mov	edx, even_len
int	80h
ret


odd:
mov     eax, 4
mov     ebx, 1
mov     ecx, odd_msg
mov     edx, odd_len
int     80h
ret












