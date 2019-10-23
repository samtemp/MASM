TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	num DWORD 0
.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0

	mov num, 1 ; 1
	mov ebx, 3 ; 3

	add ebx, num ; 3+1
	mov eax, ebx ; 4
	call WriteInt
	call Crlf

	mov num, 3
	add ebx, num ; 4+3
	mov eax, ebx ; 7
	call WriteInt
	call Crlf

	mov num, 4
	add ebx, num ; 7+4
	mov eax, ebx ; 11
	call WriteInt
	call Crlf

	call Crlf
	call WaitMsg
	exit
main ENDP
END main