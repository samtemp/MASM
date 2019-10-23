TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	ANS DWORD ?

.code
main PROC
	; Your code goes here
	mov eax, ANS
	mov edx, eax
	mov ebx, 0
	mov edx, 1
	mov ecx, 3
	
	again:
		add ebx, edx
		mov eax, ebx
		mov ebx, edx
		mov edx, eax
	loop again
	sub edx, 1
	mov ANS, edx

	call WaitMsg
	exit
main ENDP
END main