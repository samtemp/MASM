TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	; bt 
	;sal eax,scr

	
.code
main PROC
	; Your code goes here
	mov eax, 11b
L1:

	sal eax, 1

	jmp L1


	exit
main ENDP
END main