TITLE Sam Tempestini/ Final_2

INCLUDE Irvine32.inc

.data
	; Your data goes here
	enterValue BYTE "Enter an unsigned int: ", 0
	value DWORD ?
.code


;***************************************************************
;*****					PrintALLFactors PROC			   *****
;***************************************************************
j EQU DWORD PTR [ebp-4] ; declare local variable by name
PrintAllFactors PROC
	push ebp
	mov ebp, esp
	sub esp, 4			;create 1 local variables
	push ebx
	push ecx
	mov ebx, [ebp + 8]  ; value

	mov eax,ebx
	call WriteDec
	mov al, ':'
	call WriteChar
						; for (int j = value; j > 0; --j)
	mov j, ebx			; j = value
again:
	cmp j, 0			; j > 0
	jle done				
	mov eax, ebx		; value % j
	xor edx, edx		; clear EDX
	mov ecx, j
	div ecx
	mov eax, edx		; eax now holds mod
	cmp eax, 0
	jnz notZero
	mov al, ' '
	call WriteChar		; cout << " ";
	mov eax, j
	call WriteDec		; cout << j;
notZero:
	dec j				; --j
	jmp again			
done:
	call Crlf
	pop ecx
	pop ebx
	add esp, 4
	pop ebp
	ret 4
PrintAllFactors ENDP

;***********************
; ***** Begin Main *****
;***********************

main PROC
	mov eax, 0
	
	mov edx, OFFSET enterValue
	call WriteString
	call ReadDec
	push eax				;value parameter 
	call PrintAllFactors
	call WaitMsg
	call Crlf
	exit
main ENDP
END main