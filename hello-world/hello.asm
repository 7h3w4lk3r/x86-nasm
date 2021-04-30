
; hello world in x86

section .txt			; start of text segment ( read-only code )
	global _start		; define an entry point called '_start'

_start:		; start of the entry point code ( like main function in C )
mov edx, len	; store the variable length
mov ecx, msg	; store the message for printing
mov ebx, 0	; set the descriptor to stdout ( exit code 0 )
mov eax, 4	; system call number 4 for write operation
int 0x80	; call kernel to write the string ( execute according to eax value)

mov	eax, 1	;system call number for exit operation
int	0x80	; call kernel to exit the program

section .data			; start of data segment ( declared store variables )
msg db 'hello world!'		; string to be printed
len equ $ - msg			; get the length of the string, store in 'len'

