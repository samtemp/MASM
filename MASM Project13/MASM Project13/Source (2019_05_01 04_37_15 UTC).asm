TITLE Sam Tempestini / Recursion

INCLUDE Irvine32.inc

.data

.code
Function PROC
	push ebp
	mov ebp, esp
	
	cmp DWORD PTR [ebp + 8], 0		; if (x == 0)
	jnz notZero
	mov eax, [ebp + 12]				; eax = y
	jmp done						; return y
notZero:
	mov eax, [ebp + 12]
	add eax, DWORD PTR [ebp + 8]	; ecx = x + y
	push eax						; push second parameter

	mov eax, DWORD PTR [ebp + 8]	; eax = x
	dec eax							; eax = x - 1
	push eax						; push first parameter
	call Function					; recursive call
	jmp done
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