TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	sum DWORD ?
	max DWORD 12000000
	msg BYTE "The sum is: ", 0
.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 1
	mov ecx, 3


	push eax
	mov eax, ebx
	call WriteDec
	call crlf

	mov eax, ecx
	call WriteDec
	call crlf
	pop eax

	call fib
	mov edx, OFFSET msg
    call WriteString
	mov eax, sum
	call WriteDec
	call crlf
	Call WaitMsg
	exit
main ENDP

;--------------------------------------------------------
; This funtion calculates the fibiboacci sequence 
; and sums the even numbers and store the sum 
; in a global variable it uses eax, ebx, eax registers 
; and clears ebx, ebx before reeturn
;--------------------------------------------------------

fib PROC
	push ebx
	push ecx

again:
	add eax, ebx
	add eax, ecx
	mov ebx, ecx 
	mov ecx, eax
	 
	cmp eax, max
	jg done
	
	bt eax, 0
	jb odd
	add sum,eax
odd:
	call WriteDec
	call crlf
	xor eax, eax
	jmp again
done:
	mov eax, sum
	pop ecx
	pop ebx
	ret
fib ENDP
END main