TITLE Sam Tempestini / SemiFactorial

; **********************************************************************************************************************
;	What is the largest EVEN n value that returns a correct factorial value in a doubleword sized unsigned integer?
;	18 = +185794560
;	What is the largest ODD n value that returns a correct factorial value in a doubleword sized unsigned integer?
;	19 = +654729075
; ***********************************************************************************************************************

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
	push ecx
	push ebx
	mov ebx, 1

	mov value, 1					; unsigned int value = 1
	mov ecx, [ebp + 8]				; ecx = n
	mov eax, value ; move varable into eax

start:								; while (n > 1)
	cmp ecx, ebx					; see if n > 1
	jbe done
	cdq
	mul ecx							; value *= n
	sub ecx, 2						; n -= 2
	jmp start
done:
	pop ebx							; pop in reverse order
	pop ecx
	mov esp, ebp					; SET ESP = EBP
	pop ebp							; PUT EBP BACK
	ret 8							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
SemiFactorial ENDP

main PROC
	; Clear registers
	mov eax, 0
	mov edx, 0

	mov edx, OFFSET prompt
	call WriteString
	call ReadInt
	push eax
	mov edx, OFFSET result
	call WriteString
	call SemiFactorial
	call WriteInt
	pop eax
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