; displays the largest of three variables, uses jumps and compares

section	.text
global _start

_start:			; the first subroutine checks the first two values against each other
mov   ecx, [num1]	; move the address of first number to ecx for comparing, we are doing this beause we cabt compare both variables directly in the memory so we move one to a register
cmp   ecx, [num2]	; compare num1 with num2 and set the greater-than flag if num1 is bigger
jg    check_third_num	; if num1 is greater than num2 (greater-than flag set) jump to 'check_third_num'
mov   ecx, [num2]	; if num2 is greater than num2 (greater-than flag not set) move num2 to ecx and then execute 'check_third_num'

check_third_num:
cmp   ecx, [num3]	; compare ecx (num2) with num3
jg    _exit		; if num2 is bigger than num3 jump to the '_exit' block
mov   ecx, [num3]	; if num3 is bigger move num3 to ecx then execute  the '_exit' block

_exit:
   mov   [largest], ecx		; move the ecx value (largets number) to the 'largets' varaible address in memory
   mov   ecx,msg		; move the message to ecx for printing
   mov   edx, len
   mov   ebx,1
   mov   eax,4
   int   0x80

   mov   ecx,largest		; move the value of the largest number into ecx for printing
   mov   edx, 2
   mov   ebx,1
   mov   eax,4
   int   0x80

   mov   eax, 1
   int   80h



section	.data

   msg db "The largest digit is: "
   len equ $- msg

   num1 dd '47'	; first number (dword)
   num2 dd '22'	; second number
   num3 dd '31'	; third number

segment .bss
   largest resb 2	; allocate space for the largest variable in memory (2 bytes)
