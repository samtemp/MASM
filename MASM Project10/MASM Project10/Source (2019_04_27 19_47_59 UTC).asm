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
SemiFactorial PROC
	push  ebp						; PUSH EBP ONTO STACK
	mov   ebp, esp				    ; FINISH SETTING UP STACK FRAME
	push  ecx
	push  ebx
	mov   ecx, [ebp + 8]			; ecx = n
	mov	DWORD PTR [ebp-4], 1		; [ebp-4] = value
	mov eax, 0
	mov ebx, 0
	mov ecx, 0

start:
	cmp ecx, 1
	ja done
	add eax, DWORD PTR [ebp-4]
	mov ebx, ecx
	mul ebx		;value *= n
	sub ecx, 2	;n -= 2
	call WriteInt
	jmp start

done:
	pop   ebx
	pop   ecx
	pop   ebp						; PUT EBP BACK
	ret   8							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
SemiFactorial ENDP

main PROC
	; Your code goes here
	mov edx, OFFSET prompt
	call WriteString
	call ReadInt

	
	mov edx, OFFSET result
	call WriteString
	call SemiFactorial
	call WriteInt

	call Crlf
	call WaitMsg
	exit
main ENDP
END main