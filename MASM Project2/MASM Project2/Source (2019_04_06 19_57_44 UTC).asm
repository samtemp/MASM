TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	num DWORD ?
.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov ecx, 3; cnt

	mov edx, 1 ; 1
	mov ebx, 3 ; 3

	mov eax, edx ; print 1
	call WriteDec
	call Crlf
	mov eax, ebx ; print 2
	call WriteDec
	call Crlf	

	again:
		add edx, ebx ; 1+=3
		mov eax, edx ;4
		call WriteDec
		call Crlf
		add ebx, eax ; 3+=4
		mov eax, ebx ;7
		call WriteDec
		call Crlf
		add edx, eax ; 4+=7
		mov eax, edx ;11
		call WriteDec
		call Crlf

	loop again

	call Crlf
	call WaitMsg
	exit
main ENDP
END main