TITLE Sam Tempestini/ HW 11.2
INCLUDE Irvine32.inc

.data
	; Your data goes here
	txt BYTE "Testing Colors", 0
.code
main PROC
	; Your code goes here
	mov eax, 0

	mov  eax,white+(red*16)
	Call SetTextColor

	call Clrscr
	mov eax, 0
	mov ecx, 16
	mov edx, OFFSET txt

	call DispText ; funct call 

	Call WaitMsg
	exit
main ENDP

;************************************************
; Loop that prints and displays colored text
;************************************************

DispText PROC
	again:
		call SetTextColor
		call WriteString
		inc eax
		call Crlf
		loop again
	ret
DispText ENDP
END main