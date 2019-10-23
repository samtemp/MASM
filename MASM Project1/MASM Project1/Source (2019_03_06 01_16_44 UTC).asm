TITLE Sam Tempestini in class activaty ;3/5/2019

INCLUDE Irvine32.inc

.data
	; Your data goes here
	bigE BYTE 12h, 34h, 56h, 78h
	littleE DWORD ?
.code
main PROC
	; Your code goes here
	mov bl, [bigE + 3]
	mov byte ptr [littleE], bl
	mov bl, [bigE + 2]
	mov byte ptr [littleE + 1], bl
	mov bl, [bigE + 1]
	mov byte ptr [littleE + 2], bl
	mov bl, [bigE]
	mov byte ptr [littleE + 3], bl
	
	mov eax, littleE

	call DumpRegs

	call WaitMsg
	exit
main ENDP
END main