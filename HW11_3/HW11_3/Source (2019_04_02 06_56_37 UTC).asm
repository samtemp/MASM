TITLE Sam Tempestini/ HW 11.3

INCLUDE Irvine32.inc

.data
	; Your data goes here
	string BYTE "hello there students", 0

.code
main PROC
	; Your code goes here
	mov edx, OFFSET string
	Call WriteString 
	Call Crlf

         LH     R3,OFFSET          offset
         BAL    R14,CYPHER         call cypher
         LNR    R3,R3              -offset
         BAL    R14,CYPHER   


	start:

	Call WaitMsg
	exit
main ENDP
END main