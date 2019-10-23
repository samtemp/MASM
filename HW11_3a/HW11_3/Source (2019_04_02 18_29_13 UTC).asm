TITLE Sam Tempestini/ HW 11.3

INCLUDE Irvine32.inc

.data
	; Your data goes here
	string BYTE "hello there students", 0
	len equ $-string
.code
main PROC
	; Your code goes here
	mov edx, OFFSET string
	Call WriteString 
	Call Crlf
	
; I stumped and out of time

	Call WaitMsg
	exit
main ENDP
END main