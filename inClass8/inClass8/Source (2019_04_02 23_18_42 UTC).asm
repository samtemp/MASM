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

	mov eax, LENGTHOF arr 
	mov edi, SWORD PTR [edi]
	

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

	jg unSort
		mov eax, 0
	unSort:

	loop again
	mov eax, 1
IsSorted ENP

END main