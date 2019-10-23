TITLE Sam Tempestin/ HW 11.1

INCLUDE Irvine32.inc

.data
	; Your data goes here
	b BYTE 0


.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0

	call DumpRegs

	mov eax, DWORD PTR [esi] ; eax assigned as dword pointer
	mov ebx, DWORD PTR [edi] ; ebx assigned as dword pointer

	call DumpRegs
			call WriteInt 
	mov al, BYTE PTR [esi]
	mov bx, WORD PTR [edi]

	call DumpRegs
		call WriteInt

	mov b, 3
	mov al, 5

	call DumpRegs
		call WriteInt

	movzx eax, al
	movzx ebx, bx
	add eax, ebx

	call DumpRegs
	call WriteInt

	call DumpRegs

	call WaitMsg
	exit
main ENDP
END main