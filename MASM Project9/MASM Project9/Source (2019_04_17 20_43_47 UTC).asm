TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	rk00 BYTE "2", 0
	rk01 BYTE "3", 0
	rk02 BYTE "4", 0
	rk03 BYTE "5", 0
	rk04 BYTE "6", 0
	rk05 BYTE "7", 0
	rk06 BYTE "8", 0
	rk07 BYTE "9", 0
	rk08 BYTE "10", 0
	rk09 BYTE "JACK", 0
	rk10 BYTE "QUEEN", 0
	rk11 BYTE "KING", 0	
	rk12 BYTE "ACE", 0

	st00 BYTE "HEARTS", 0
	st01 BYTE "DIAMONDS", 0
	st02 BYTE "CLUBS", 0
	st03 BYTE "SPADES", 0

	rank DWORD	OFFSET rk00, OFFSET rk01,
				OFFSET rk02, OFFSET rk03,
				OFFSET rk04, OFFSET rk05,
				OFFSET rk06, OFFSET rk07,
				OFFSET rk08, OFFSET rk09,
				OFFSET rk10, OFFSET rk11,
				OFFSET rk12

	suits DWORD	OFFSET st00, OFFSET st01,
				OFFSET st02, OFFSET st03

	value DWORD 00001000101001110010110111111000b
.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0


	mov eax, value
	mov ebx, eax
again:
	mov bl, al
	and bl, 00000011b
	mov dl, bl

	



	loop again

	call WaitMsg
	exit
main ENDP
END main