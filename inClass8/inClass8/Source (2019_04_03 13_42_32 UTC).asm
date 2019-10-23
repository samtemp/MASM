TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	arr SWORD 1,2,3,4

.code
main PROC
	; Your code goes here
	mov eax, 0
	mov edi, 0

	mov edi, OFFSET 

	mov eax, LENGTHOF arr 
	mov edi, SWORD PTR [arr]

	call IsSorted
	mov edx, OFFSET arr
	call WriteDec
	call DumpRegs
	call WaitMsg
	exit
main ENDP

IsSorted PROC
	push eax
	push edi
	push ecx

	mov ecx, LENGTHOF arr

	again:
		mov bx, SWORD PTR [edi]
		mov eax, SWORD PTR [edi+1]
		cmp eax, bx ; >
	jg unSort
		mov eax, 0
	unSort:

	cmp eax, SWORD PTR [edi] ; <
	jl Sort 
	Sort:
	inc edi
	dec ecx
	loop again

	mov eax, 1
	ret

	pop ecx 
	pop edi
	pop eax
IsSorted ENDP
END main