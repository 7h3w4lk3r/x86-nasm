
; prompt for user input, read a number and print it out

section .data
   userMsg db 'Please enter a number: '
   lenUserMsg equ $-userMsg
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg

section .bss           ;Uninitialized data
   num resb 5		; take 5 bytes for num variable from user input

section .text
   global _start

_start:
 ;User prompt
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ;read user input
   mov eax, 3
   mov ebx, 2
   mov ecx, num
   mov edx, 5		; take 5 bytes as input
   int 80h

   ;print output message
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h

   ;print user input
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h

   ; Exit code
   mov eax, 1
   mov ebx, 0
   int 80h

