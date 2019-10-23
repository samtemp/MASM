TITLE Sam Tempestini/inclass8

INCLUDE Irvine32.inc

.data
	; Your data goes here
	arr1 SWORD 5,4,3,2,1
	arr2 SWORD -6,-4,3,2

.code
main PROC
	; Your code goes here
	mov eax, 0
	mov edi, 0
	
	mov ecx, LENGTHOF arr1
	mov eax, LENGTHOF arr1
	mov edi, OFFSET arr1
	mov edx, OFFSET arr1

	call IsSorted
	mov edx, OFFSET arr1
	call WriteDec
	call Crlf

	mov ecx, LENGTHOF arr2
	mov eax, LENGTHOF arr2
	mov edi, OFFSET arr2
	mov edx, OFFSET arr2

	call IsSorted
	mov edx, OFFSET arr2
	call WriteDec
	call Crlf

	call WaitMsg
	exit
main ENDP

;-----------------------------------
; IsSorted Function
;
; if arr is sorted
;	set EAX = 1
; Else 
;	set EAX = 0
;-----------------------------------

IsSorted PROC	
	push ecx
	push bx
	push edi

	mov eax, 1
	again:
		mov bx, [edi+2]
		cmp bx, [edi]
	jg done
		mov eax, 0
	inc SWORD PTR [edi]
	loop again
	done:

	pop bx
	pop edi
	pop ecx
	ret		
IsSorted ENDP
END main