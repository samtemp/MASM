TITLE Sam Tempestini/09 In-Class - Playing Card Compression
 

INCLUDE Irvine32.inc

.data
	; Your data goes here
	value DWORD 00001000101001110010110111111000b
	;rank BYTE '2','3','4','5','6','7','8','9','10','JACK','QUEEN','KING','ACE'
	;suits BYTE 'HEART','DIAMONDS','CLUBS','SPADES'
	
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
				OFFSET st02, OFFSET st03,

	;card DWORD ?
	card BYTE ?

	
.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0

	mov eax, value
	mov ebx, eax
again:
	mov rank, ebx
	shr rank, 2 
	and rank, 00000011b
	mov ebx, rank
	movzx edx, bl
	dec edx
	dec edx
	;mov edx, rank, [edx]
	;mov  edx, [edx]
	call WriteString

	;mov edx, eax
	;shl edx, 2
	;mov edx, suits[edx]

	call WriteString
	call Crlf

	loop again

	call WaitMsg
	exit
main ENDP
END main


;mov card, al
;and al, 00000011b	; copy suit to al
;mov card, al		; mov al to card 
;ror eax, 6			; rotate 6 bits
;and al, 00111111b	; copy rank to al
;shr al, 2
;mov card, al
