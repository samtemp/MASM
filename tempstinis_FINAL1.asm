TITLE Sam Tempestini / FINAL_1

INCLUDE Irvine32.inc

.data
	; Your data goes here
	enterValue BYTE "Enter a value [0 to quit]: ", 0
	largestText BYTE "The second largest value is: ", 0

	value DWORD ?
	largest DWORD 0
	nextLargest DWORD 0

.code
main PROC
	mov eax, 0
	mov ebx, largest
	mov ecx, nextLargest
again:
	mov edx, OFFSET enterValue
	call WriteString
	call ReadDec
	mov value, eax	; input value

	cmp value, ebx			; if (value >= largest)
	jl less
	mov ecx, ebx ;largest
	mov largest, ecx
	mov ebx, eax ;value
	mov largest, eax
	jmp postCon
less:
	cmp value, ecx  ;nextLargest
	jle lessEq
	mov ecx, eax 
	mov nextLargest, ecx
lessEq:
postCon:
	mov value, eax
	cmp value, 0
	jnz again
	mov edx, OFFSET largestText
	call WriteString
	mov eax, nextLargest
	call WriteDec
	call Crlf
	call WaitMSg
	call Crlf
	exit
main ENDP
END main