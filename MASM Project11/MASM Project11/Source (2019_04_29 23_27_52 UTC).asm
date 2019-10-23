TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	prompt BYTE "Enter a value for n: ",0
	result BYTE "The value of n is: ",0

.code
;-----------------------------------------------------------------------------------------------------------------
;		*** SemiFactorial ***																				   ---
;	Your function must use "pass by value" parameter passing for the n value below (page 289)				   ---
;	Your function must use a local variable for the value value below (page 295)							   ---
;	Your function must return the value value back to the calling code in the EAX register					   ---
;	Make sure all other registers are put back to their initial values prior to the function call (Chapter 6)  ---
;-----------------------------------------------------------------------------------------------------------------
value EQU DWORD PTR [ebp-4] ; declare local variable by name
SemiFactorial PROC
	push  ebp						; PUSH EBP ONTO STACK
	mov   ebp, esp				    ; FINISH SETTING UP STACK FRAME
	sub esp, 4

	mov ebx, 1

	;push  ecx
	mov ebx, 0
	mov value, 1
	mov ebx, [ebp + 8]			; ecx = n
	
	mov eax, value ; move varable into eax

start:
	cmp ecx, ebx ; see if n > 1
	jbe done
	cdq
	mul ecx 
	sub ecx, 2 ; value -= n
	jmp start
done:
	;pop   ecx
	pop   ebp						; PUT EBP BACK
	add esp, 4					; SET ESP = EBP
	ret   4							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
SemiFactorial ENDP

main PROC
	; Clear registers
	mov eax, 0
	mov edx, 0

	mov edx, OFFSET prompt
	call WriteString
	call ReadInt
	push eax
	call SemiFactorial
	call WriteInt

	call Crlf
	call WaitMsg
	exit
main ENDP
END main

; **********************************************************************************************************************
;	What is the largest EVEN n value that returns a correct factorial value in a doubleword sized unsigned integer?
;
;	What is the largest ODD n value that returns a correct factorial value in a doubleword sized unsigned integer?
;
; ***********************************************************************************************************************