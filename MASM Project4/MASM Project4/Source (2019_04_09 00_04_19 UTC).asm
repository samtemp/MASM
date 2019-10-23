TITLE Sam Tempestini/HW13_2_oddEvenMult

INCLUDE Irvine32.inc

.data
	; Your data goes here
	decNum DWORD ?
	prompt BYTE "Enter an unsigned integer: ", 0
	val BYTE "The value is: ",0

.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0

	call dubTrip
	call Crlf
	call WaitMsg
	exit
main ENDP

;-------------------------------------------------------------------------
; If EAX input is odd, then return the value doubled
; Else If EAX input is a multiple of four, then return the value tripled
; Else If EAX input is even, then return the value 1
; used registers are restoered to in inital values
;--------------------------------------------------------------------------

dubTrip PROC
	push ebx
	push edx

	mov edx, OFFSET prompt
	call WriteString
	call ReadDec
	mov decNum, eax

	bt eax, 0		; if (eax = odd)
	jb odd			
	test eax, 3		; else if (eax = multiple of 4)
	jnz nm4
	add ebx, eax
	add ebx, eax
	add ebx, eax
	jmp b4	; jump odd and even operation
odd:
	sal eax, 1	; do odd operation and double eax
	jmp after4
nm4:
	mov eax, 1
	jmp after4
b4:
	mov eax, ebx
after4:
	mov edx, OFFSET val
	call WriteString
	call WriteDec
	pop edx
	pop ebx 
	ret
dubTrip ENDP
END main