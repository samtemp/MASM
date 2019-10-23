TITLE Sam Tempestini / Recursion

INCLUDE Irvine32.inc

.data

.code
Function PROC
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 12]				; eax = y
	
	cmp DWORD PTR [ebp + 8], 0		; if (x == 0)
	jnz notZero
	jmp done						; return y
notZero:							; else
	add eax, DWORD PTR [ebp + 8]	; y += x
	push eax						; push second parameter

	mov eax, DWORD PTR [ebp + 8]	; eax = x
	dec eax							; eax = x - 1
	push eax						; push first parameter
	call Function					; recursive call
done:
	mov esp, ebp
	pop ebp
	ret 8
Function ENDP

main PROC
	mov eax, 0

	push 3
	push 0
	call Function
	call WriteInt
	call Crlf
	
	push 3
	push 1
	call Function
	call WriteInt
	call Crlf

	push 3
	push 2
	call Function
	call WriteInt
	call Crlf

	push 3
	push 3
	call Function
	call WriteInt
	call Crlf

	push 3
	push 4
	call Function
	call WriteInt
	call Crlf

	push 3
	push 5
	call Function
	call WriteInt
	call Crlf
	
	call Crlf
	call WaitMsg
	exit
main ENDP
END main