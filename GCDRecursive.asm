INCLUDE Irvine32.inc

.data
array SDWORD  5, 20, 18, 24, 11, 7, 432, 226, 13, 26
str1 BYTE "Greatest common divisor is: ", 0

.code
main PROC

mov  ecx, LENGTHOF array / 2
mov  esi, OFFSET array

L1:	mov  eax, [esi]
	mov  ebx, [esi + 4]
	call CalcGcd
	mov  edx, OFFSET str1
	call WriteString
	call WriteDec
	call Crlf
	add  esi, TYPE array * 2
	loop L1

	exit
	main ENDP

	; -------------------------------------------- -
	CalcGcd PROC
	;
; Calculate the greatest common divisor, using
; a nonrecursive looping algorithm.
; Receives: EAX(integer 1), EBX(integer 2)
; Returns: EAX = Greatest common divisor
; -------------------------------------------- -
push ebx
push edx

	L1 : mov  edx, 0
	div  ebx; divide int1 by int2
	cmp  edx, 0; remainder = 0 ?
	je   L2; yes: quit
	mov  eax, ebx; no: prepare for
	mov  ebx, edx; next iteration
	jmp  L1

	L2 : mov eax, ebx; EAX = GCD

	pop edx
	pop ebx
	ret
	CalcGcd ENDP

	END main