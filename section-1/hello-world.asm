; hello world in nasm

; this section holds the declared variables, we can use 'segment' instead of 'section'
section .data
msg db 'hello world!', 0ah      ; assign msg variable with string, 0ah is the new-line character
len equ $ - msg			; assign the length of the msg to len variable

 ; this section contains the main code of the program and instructions
 section .text
 global _start              ; defined an entry point for the program

 _start:                    ; start of the entry point
    mov     edx, len        ; edx holds the length of the message for printing ( could use binary value 13 )
    mov     ecx, msg        ; ecx holds the message
    mov     ebx, 1          ; 1 is for writing to STDOUT file
    mov     eax, 4          ; invokes SYS_WRITE (kernel opcode 4), eax executes the syscalls by opcode
    int     80h             ; execute the instructions, actually invoke a software interrupt

    mov     ebx, 0	    ; return exit status 0 - indicating no errors
    mov     eax, 1          ; invokes SYS_EXIT (kernel opcode 1) to exit the program gracefully
    int     80h
