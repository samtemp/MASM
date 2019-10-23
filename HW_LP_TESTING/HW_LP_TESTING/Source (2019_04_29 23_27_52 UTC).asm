;Logan Passi

;What is the largest EVEN n value that returns a correct factorial value in a doubleword sized unsigned integer?
;18

;What is the largest ODD n value that returns a correct factorial value in a doubleword sized unsigned integer?
;19

INCLUDE Irvine32.inc

.data
	prompt1 BYTE "Enter a number: ", 0
	prompt2 BYTE "Double Factorial: ", 0

.code
main PROC
	mov edx, 0
	mov eax, 0

	mov edx, OFFSET prompt1
	call WriteString
	call ReadInt
	push eax
	call semiFactorial
	call WriteInt
	call Crlf
	call WaitMsg
	exit
main ENDP

semiFactorial PROC
	push  ebp
	mov   ebp, esp
	sub esp, 4

	mov ecx, 1

	mov ebx, 0
	mov DWORD PTR [ebp - 4], 1 ;Initialize glocal variable to 1
	mov ebx, [ebp + 8] ;Move the parameter to ebx

	mov edx, OFFSET prompt2
	call WriteString

	mov eax, [ebp - 4] ;Move the local variable that is holding the variable of 1 to the eax register

	again:
	cmp ebx, ecx ;compare the entered value to one and if the value gets decremented to where it is less than one then jump to done
	jbe done
	cdq
	mul ebx ;Multiple eax * ebx
	sub ebx, 2
	jmp again
	done:
	pop ebp
	add esp, 4
	ret 4
semiFactorial ENDP

END main