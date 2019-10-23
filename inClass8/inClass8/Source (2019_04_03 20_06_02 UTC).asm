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
	mov edi, OFFSET arr

	mov edx, OFFSET arr

	call IsSorted
	mov edx, OFFSET arr
	call WriteDec
	call Crlf
	;call DumpRegs
	call WaitMsg
	exit
main ENDP

IsSorted PROC
	push ecx
	push edi
	push eax
	
	
	mov ecx, LENGTHOF arr
	dec ecx
	
	again:
		mov ebx, [edi]
		mov eax, [edi+4]
		cmp eax, ebx ; greater than
	jg unSort
		mov eax, 0
	unSort:
	inc edi
	dec ecx
	loop again

	mov eax, 1
	;ret	
	
	pop eax
	pop edi
	pop ecx
IsSorted ENDP
END main