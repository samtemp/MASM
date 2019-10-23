TITLE Name/Purpose Here

INCLUDE Irvine32.inc

.data
	; Your data goes here
	fseq DWORD ?
	max DWORD 12000000
.code
main PROC
	; Your code goes here
	mov eax, 0
	mov ebx, 0
	;mov edx, 0
	;mov edi, 0
	
	;mov edi, OFFSET fseq
	;mov esi, LENTHOF fseq

	call fib
	call evSum
	call Crlf
	call WaitMsg
	exit
main ENDP

;-------------------------------
;
;-------------------------------

fib PROC
	mov edx, 1 ; 1
	mov ebx, 3 ; 3

	mov eax, edx ; print 1
	call WriteDec
	call Crlf
	mov eax, ebx ; print 2
	call WriteDec
	call Crlf	
	
	mov ecx, 30 ; cnt

	again:
		add edx, ebx ; 1+=3 d = b
		mov eax, edx ;4
		cmp eax, max 
		jg done
		call WriteDec
		call Crlf
		add ebx, edx ; 3+=4 b = d
		mov eax, ebx ;7
		cmp eax, max 
		jg done
		call WriteDec
		call Crlf
	loop again
	done:
	ret 
fib ENDP


evSum PROC
	mov edx, 1 ; 1
	mov ebx, 3 ; 3
	
	mov ecx, 30 ; cnt

	again:
		add edx, ebx ; 1+=3 d = b
		mov eax, edx ;4
		cmp eax, max 
		jg done
		add ebx, edx ; 3+=4 b = d
		mov eax, ebx ;7
		cmp eax, max 
		jg done
	
	loop again
	done:

	mov ecx, 9
	xor eax, eax
	L1:
	test ecx, 1
	jz L2
	jmp L3
	L2:
	add eax, ecx
	L3:
	loop L1
	ret 
evSum ENDP
	

END main