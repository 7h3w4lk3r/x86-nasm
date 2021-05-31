; calculate (atoi), calculate the sum of given command line arguments

%include "functions.asm"

section .text
global _start

_start:

pop	ecx		; first value on the stack (number of args)
pop	edx		; second value on the stack (file name), discarded when initializing edx
sub	ecx, 1		; decrement ecx by 1 (number of args without program name)
mov	edx, 0		; clear ecx for storing the sum

nextArg:
    cmp     ecx, 0h         ; check to see if we have any arguments left
    jz      noMoreArgs      ; if zero flag is set jump to noMoreArgs label (jumping over the end of the loop)
    pop     eax             ; pop the next argument off the stack
    call    atoi            ; convert our ascii string to decimal integer
    add     edx, eax        ; perform our addition logic
    dec     ecx             ; decrease ecx (number of arguments left) by 1
    jmp     nextArg         ; jump to nextArg label

noMoreArgs:
    mov     eax, edx        ; move our data result into eax for printing
    call    iprintLF        ; call our integer printing with linefeed function
    call    quit            ; call our quit function
