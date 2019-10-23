TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	arr SDWORD 1,2,3,4

.code
main PROC
	; Your code goes here
	mov eax, 0
	mov edi, 0

	mov eax, LENGTHOF arr 
	mov edi, SDWORD PTR [arr]
	

	call IsSorted
	mov edx, OFFSET arr
	call WriteDec
	call DumpRegs
	call WaitMsg
	exit
main ENDP

IsSorted PROC
	mov ecx, LENGTHOF arr

	again:
		mov bx, SDWORD PTR [edi]
		mov eax, SDWORD PTR [edi+1]
		cmp eax, bx ; >
	jg unSort
		mov eax, 0
	unSort:
	inc edi
	dec ecx
	loop again
	mov eax, 1
	ret
IsSorted ENDP
END main