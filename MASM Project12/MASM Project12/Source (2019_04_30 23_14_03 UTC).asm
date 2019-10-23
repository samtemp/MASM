TITLE Sam Tempestini / In Class 11

INCLUDE Irvine32.inc

.data
	; Your data goes here
	;promt BYTE ""

.code
Fibonacci PROC
	push ebp
	mov ebp, esp
	sub esp, 4			;create 1 local variables
	push ebx
	mov ebx, [ebp + 8]

	cmp	DWORD PTR [ebp + 8], 0			; if (n < 0)
	jge grtEqZero
	mov eax, -1
	jmp done
										; return -1
grtEqZero:
	cmp	DWORD PTR [ebp + 8], 0			; if(n == 0)
	jnz notZero
	mov eax, 0
	jmp done								; return 0
notZero:
	cmp	DWORD PTR [ebp + 8], 1			; if(n == 1)
	jne recursion
	mov eax, 1
	jmp done								; return 1
recursion:

	dec ebx ;--n
	push ebx
	call Fibonacci
	mov DWORD PTR [ebp - 4], eax

	dec ebx
	push ebx
	call Fibonacci
	add eax, [ebp - 4]

done:
	pop ebx
	add esp, 4
	pop ebp
	ret 4
Fibonacci ENDP
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0

	push -2
	call Fibonacci
	call WriteInt

	push 0
	call Fibonacci
	call WriteInt

	push 1
	call Fibonacci
	call WriteInt

	push 7
	call Fibonacci
	call WriteInt

	push 34
	call Fibonacci
	call WriteInt


	call Crlf
	call WaitMsg
	exit
main ENDP
END main