TITLE Sam Tempestini/ HW 11.2
INCLUDE Irvine32.inc

.data
	; Your data goes here
	mov edx, 0
	txt BYTE "Testing Colors", 0
	carriageReturn BYTE ' ', 13, 10, 0

	cnt DWORD 16

.code
main PROC
	; Your code goes here
	mov eax, 0
	mov  eax,red+(blue*16)
     call SetTextColor
again:

	mov ecx, cnt
	

	mov edx, OFFSET txt
	Call WriteString

	mov edx, OFFSET carriageReturn
	Call WriteString

	dec cnt
	loop again

	Call WaitMsg
	exit
main ENDP
END main