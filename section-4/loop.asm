; print number 1 to 9 using a loop

section .text
global _start

_start:
mov	ecx, 10		; move the counter number to ecx
mov	eax, '1'	; mov number 1 to eax ( to be copied to memory )

l1:			; loop block
mov	[num], eax	; copy eax to num variable in memory, value is 1
mov	eax, 4		; opcode 4 for sys_write
mov	ebx, 1		; stdout
push	ecx		; save the counter value (10) to memory because we need ecx for printing the number now

mov	ecx, num	; move the number value ( first is 1 ) to ecx for printing
mov	edx, 1		; length of 'num' variable
int	80h		; print the number

mov	eax, [num]	; move number to eax for incrementing
sub	eax, '0'	; this converts the character in al into the numbers 1-9 in the loop
inc	eax		; increment eax by 1 for next number
add	eax, '0'	; converts number to character for printing
pop	ecx		; pop the counter value back to ecx
loop	l1		; loop through l1 block

mov	eax, 1		; exit
mov	ebx, 0
int	80h

section .bss
num resb 1		; specify 1 byte of memory for 'num' variable
