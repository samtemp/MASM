TITLE Sam Tempestini in class activaty
;3/5/2019

INCLUDE Irvine32.inc

.data
	; Your data goes here
	bigE BYTE 12h, 34h, 56h, 78h
	littleE DWORD ?
.code
main PROC
	; Your code goes here
	mov ebx, [bigE] 
	mov bl, [littleE + 3]
	mov [littleE + 3], ebx
	mov bl, [littleE + 2]
	mov [littleE + 2], ebx
	mov bl, [littleE + 1]
	mov [littleE + 1], ebx
	mov bl, [littleE]
	mov [littleE], ebx
		
	mov eax, littleE

	call DumpRegs

	call WaitMsg
	exit
main ENDP
END main