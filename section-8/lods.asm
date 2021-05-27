; a demo of LODS instruction
; encrypts a data simply replaving each alphabet in it with a shift of 2 alphabets

section .data
s1 db "password"	; text to be encrypted
len equ $ - s1

section .bss
s2 resb 10		; cypher destination

section .text
global _start
_start:
mov	ecx, len
mov	esi, s1
mov	edi, s2

_loop:
lodsb			; loads the byte addressed by DS:SI into AL

;After the data is loaded, the source-index register is automatically
;incremented or decremented as determined by the value of the direction flag (DF).
;The index register is incremented if DF = 0 (DF cleared by a cld instruction)
;it is decremented if DF = 1 (DF set by a std instruction).
;The increment/decrement count is 1 for a byte move, 2 for a word, and 4 for a long.

add	al, 02		; the shift of 2 alphabets
stosb			; stores a byte from al into the destination string pointed to by (ES:DI)
loop	_loop		; repeat the same for all characters in the string

cld			; clear the DF flag
rep	movsb		; copy s1 to s2

; print the cypher text
mov	ecx, s2
mov	edx, 20
mov	eax, 4
mov	ebx, 1
int	80h

; exit code
mov	eax, 1
mov	ebx, 0
int	80h





