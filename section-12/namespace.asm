; namespace,  namespace can be achieved by using local labels

%include        'functions.asm'

section .data
msg1        db      'Jumping to finished label.', 0h
msg2        db      'Inside subroutine number: ', 0h
msg3        db      'Inside subroutine "finished".', 0h

section .text
global _start

_start:

subroutine1:			; print msg1
mov	eax, msg1
call	sprintLF
jmp	.finished

.finished:			; print msg2
mov	eax, msg2
call	sprint
mov	eax, 1			; subroutine number 1 (number in eax)
call iprintLF			; print the subroutine number (1)

subroutine2:			; print msg1
mov	eax, msg1
call	sprintLF
jmp	.finished

.finished:
mov     eax, msg2
call    sprint
mov     eax, 2                  ; subroutine number 2 (number in eax)
call iprintLF		        ; print the subroutine number (2)

mov     eax, msg1
call    sprintLF
jmp     finished


finished:		; print msg3
mov     eax, msg3
call    sprintLF
call    quit









