; concepts of arrays, defines a 3-element array called x which
;stores three values: 2,3,4, adds the values and prints the result

section .data
global x                ; create a global variable called x

x:                      ; by this definition x is a 3-element array
db      2
db      4
db      3


sum:                    ; same as x but only 1 element
db      0


section .text
global _start

_start:

mov	eax, 3		; number of bytes to be summed
mov	ebx, 0		; empty ebx to store the sum
mov	ecx, x		; point to the current element of the array (x points to the first element)

top:
add	ebx, [ecx]	; add the current element value to ebx (sum)
add	ecx, 1		; move pointer to next element
dec	eax		; decrement counter
jnz	top		; if counter is not 0 (zero flag not set), loop through 'top'

done:
add	ebx, '0'	; if the counter is zero (zero flag set) convert binary value in ebx to ascii
mov	[sum], ebx	; move the summary result from ebx to 'sum' variable (9)


display:
mov	edx, 1		; print the result
mov	ecx, sum
mov	ebx, 1
mov	eax, 4
int	80h

mov	eax, 1		; exit
int	80h

