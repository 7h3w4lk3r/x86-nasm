; take a number as input and print it

section .data
input_msg	db	'enter a number: '
len_input_msg equ $ - input_msg
display_msg	db	'entered value: '
len_display_msg equ $ - display_msg


section .bss
value resb 5		; variable to hold input value, 5 bytes in size, 1 byte for sign

section .text
global	_start

_start:

; prompt for input
mov	eax, 4
mov	ebx, 1
mov	edx, len_input_msg
mov	ecx, input_msg
int	80h

; read and store input
mov	eax, 3		; system call for sys_read (opcode 3)
mov	ebx, 2		; set ebx  for size_t count
mov	ecx, value	; store the value in 'value' variable
mov	edx, 5		; size of input to accept (5 bytes)
int	80h

; print the output message
mov	eax, 4
mov	ebx, 1
mov	edx, len_display_msg
mov	ecx, display_msg
int	80h

; print the output value
mov	eax, 4
mov	edx, 5
mov	ebx, 1
mov	ecx, value
int	80h

; exit code
mov	eax, 1
mov	ebx, 0
int	80h
