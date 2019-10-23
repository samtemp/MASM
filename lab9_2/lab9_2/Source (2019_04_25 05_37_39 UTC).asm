; ---------------------------------------------------------------------
; NOTE!  Students only have to modify the code in the Variance function 
; ---------------------------------------------------------------------

TITLE Sam Tempestini / SemiFactorials

INCLUDE Irvine32.inc

.data
	averageText  BYTE    "The average is:  ", 0
	array        DWORD   3, 7, 10, 20, 30
	varianceText BYTE    "The variance is: ", 0
	avg DWORD 0


.code
; --------------------------------------------------------------------------------------------------
; TODO:  Replace this code to calculate the variance value for the array passed into the function
;
; INPUTS:  [ebp + 12] - Pointer to the UNSIGNED doubleword array
;          [ebp + 8]  - The number of elements in the doubleword array
; OUTPUT:  eax        - The CALCULATED variance value...  For this example it's 95.6 or 95 truncated
; --------------------------------------------------------------------------------------------------
Variance PROC
	push  ebp
	mov   ebp, esp
	sub   esp, 4
	push  ecx						; PUSH USED REGISTERS
	push  edx
	push  ebx
	mov   ecx, [ebp + 8]			; LOOP FOR EACH ELEMENT IN THE ARRAY
	mov   edx, [ebp + 12]			; POINTER TO FIRST ARRAY ELEMENT
	mov   ebx, 0
	mov eax, 0

	push ecx
	push edx
L1:
	add   eax, [edx]				; ADD ELEMENT TO ACCUMULATOR
	add   edx, 4					; MOVE POINTER TO NEXT ELEMENT
	loop  L1					; DONE YET?
	mov   edx, 0					; CLEAR EDX TO PREPARE FOR DIVISION
	div   DWORD PTR [ebp + 8]		; EAX WILL HOLD RESULT OF UNSIGNED DIVISION
	mov   DWORD PTR [ebp-4], eax
	mov   eax, 0					; ACCUMULATOR
	
	pop edx
	pop ecx

again:
	add  eax, [edx]			; ADD ELEMENT TO ACCUMULATOR
    push edx				; PRESERVE EDX VALUE BEFORE MUL
	sub eax, DWORD PTR [ebp-4]	; EAX -= AVERAGE
	mul eax					; SQUARE EAX
	add ebx, eax			; EBX += EAX
	pop edx					; RESTORE EDX
	add edx, 4				; MOVE POINTER TO NEXT ELEMENT
	mov eax, 0 
	loop  again				; DONE YET?
	
	
	mov edx, 0
	mov eax, ebx
	mov ebx, DWORD PTR [ebp + 8]
	div ebx

	pop   ebx
	pop   edx						; POP BACK USED REGISTERS
	pop   ecx
	mov esp,ebp
	pop   ebp						; PUT EBP BACK
	ret   8							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
Variance ENDP

; --------------------------------------------------------------------------------------------------
; Calculates the average value for the array passed into the function
;
; INPUTS:  [ebp + 12] - Pointer to the UNSIGNED doubleword array
;          [ebp + 8]  - The number of elements in the doubleword array
; OUTPUT:  eax        - The CALCULATED average value...  For this example it's 14
; --------------------------------------------------------------------------------------------------

 Average PROC
 	push  ebp						; PUSH EBP ONTO STACK
	mov   ebp, esp				    ; FINISH SETTING UP STACK FRAME
	push  ecx						; PUSH USED REGISTERS
	push  edx
	mov   ecx, [ebp + 8]			; LOOP FOR EACH ELEMENT IN THE ARRAY
	mov   edx, [ebp + 12]			; POINTER TO FIRST ARRAY ELEMENT
	mov   eax, 0					; ACCUMULATOR
again:
	add   eax, [edx]				; ADD ELEMENT TO ACCUMULATOR
	add   edx, 4					; MOVE POINTER TO NEXT ELEMENT
	loop  again						; DONE YET?
	mov   edx, 0					; CLEAR EDX TO PREPARE FOR DIVISION
	div   DWORD PTR [ebp + 8]		; EAX WILL HOLD RESULT OF UNSIGNED DIVISION
	pop   edx						; POP BACK USED REGISTERS
	pop   ecx
	pop   ebp						; PUT EBP BACK
	ret   8							; TAKE BOTH PARAMETERS OFF THE STACK AND RETRUN
Average ENDP

main PROC
	mov   edx, OFFSET averageText	; WRITE THE STRING
	call  WriteString
	push  OFFSET array				; ESSENTIALLY THE SAME AS EAX = Average(array, 5)
	push  LENGTHOF array
	call  Average
	call  WriteInt					; WRITE THE AVERAGE (14)
	call  Crlf

	mov   edx, OFFSET varianceText	; WRITE THE STRING
	call  WriteString
	push  OFFSET array				; ESSENTIALLY THE SAME AS EAX = Variance(array, 5)
	push  LENGTHOF array
	call  Variance
	call  WriteInt					; WRITE THE VARIANCE (95)

	call  Crlf
	call  WaitMsg
	exit							; PROGRAM COMPLETE
main ENDP
END main