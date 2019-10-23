TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	decNum DWORD ?
	promptBad BYTE "Invalid input, please enter again: ", 0
	prompt BYTE "Enter an unsigned integer: ", 0

.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0
	mov edx, OFFSET prompt
	call WriteString

	call dubTrip
	call Crlf
	call WaitMsg
	exit
main ENDP

;-----------------------------------
;
;-----------------------------------

dubTrip PROC
	push ebx
read:  
	call ReadDec
    jnc goodInput

    mov edx, OFFSET promptBad
    call WriteString
    jmp read        ;go input again

goodInput:
	mov  decNum,eax  ;store good value
	;call WriteDec

	;if (eax = odd)
	bt eax, 0
	jb odd		
					; if multiple of 4
	test eax, 3
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
	call WriteDec
	pop ebx 
	ret
dubTrip ENDP
END main