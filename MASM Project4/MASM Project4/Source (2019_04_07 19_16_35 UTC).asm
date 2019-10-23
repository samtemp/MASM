TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	decNum DWORD ?
	promptBad BYTE "Invalid input, please enter again", 0

.code
main PROC
	; Your code goes here
	mov eax, 0

	call dubTrip
	call Crlf
	call WaitMsg
	exit
main ENDP

;-----------------------------------
;
;-----------------------------------

dubTrip PROC
	; bt 
	;sal eax,scr

read:  
	call ReadDec
    jnc goodInput

    mov edx, OFFSET promptBad
    call WriteString
    jmp read        ;go input again

goodInput:
	mov  decNum,eax  ;store good value
	mov eax, decNum
	call WriteDec


;L1:
	;sal eax, 1
	;jmp L1

	ret
dubTrip ENDP
END main