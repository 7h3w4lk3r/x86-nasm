; use function recursion to find the factorial 3
; Fact (n) = n * fact (n-1) for n > 0

section .text
global _start

_start:

mov	bx, 3		; 3 is the factorial limit
call	proc_fact
add ax, 30h
mov	[fact], ax

mov	edx, len	; print message
mov	ecx, msg
mov	ebx, 1
mov	eax, 4
int	80h

mov	edx, 1		; print factorial
mov	ecx, fact
mov	ebx, 1
mov	eax, 4
int	80h

mov	eax, 1		; exit
int	80h

proc_fact:
cmp	bl, 1		; a loop to calculate the factorial next number
jg	do_calculation
mov	ax,1
ret

do_calculation:
dec	bl		; decrement bl by one to use for next number (n-1)
call	proc_fact	; process next factorial
inc	bl		; increment bl by one to use for next number (n)
mul	bl		; ax = al * bl
ret


section .data
msg db "factorial 3 is: "
len equ $ - msg

section .bss
fact resb 1

