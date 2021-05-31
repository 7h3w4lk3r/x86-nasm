; a demo for file operations in NASM
; open/create a text file, write a text, read the file and print the output

section .data
file_name db "test.txt"
msg db "this is a test"
len equ $-msg
msg_done db "Written to file", 0xa
len_done equ $-msg_done

section .bss
fd_out resb 1			; file descriptor for write operation (stdout)
fd_in resb 1			; file descriptor for read operation (stdin)
info resb 26			; buffer for storing the text after reading the file

section .text
global _start

_start:
; open/create the file
mov	eax, 8			; sys_create (open/create) or w+ in C
mov	ebx, file_name		; file name as first argument for syscall
mov	ecx, 0777		; permissions as second argument for syscall
int	80h			; execute

mov	[fd_out], byte eax	; save file descriptor to memory for writing later

; write to the file
mov	eax, 4			; sys_write
mov	edx, len		; msg length as second argument
mov	ecx, msg		; msg as first argument
mov	ebx, [fd_out]		; file descriptor as third argument
int	80h

; close the file
mov	eax, 6			; sys_close
mov	ebx, [fd_out]
int	80h

; print write message
mov	eax, 4
mov	ebx, 1
mov	ecx, msg_done
mov	edx, len_done
int	80h

; open the file for reading
mov	eax, 5			; sys_read
mov	ebx, file_name		; file name as first argument
mov	ecx, 0			; for read only access
mov	edx, 0777		; file permission
int	80h

mov	[fd_in], byte eax	; save file descriptor to memory for reading the content later

; read from file
mov	eax, 3
mov	ebx, [fd_in]
mov	ecx, info		; store the text in 'info' variable
mov	edx, 26			; length of text
int	80h

; close the file
mov	eax, 6
mov	ebx, [fd_in]
int	80h

; print the info
mov	eax, 4
mov	ecx, info
mov	ebx, 1
mov	edx, 26
int	80h

; exit code
mov	eax, 1
mov	ebx, 0
int	80h









