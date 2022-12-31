; DIV is for unsigned
; IDIV is for signed

; DIV reg/mem
; there is an implied operand as the numerator of the divisor (usually a portion of rax)
; also, during division the remainder is also calculated and stored

.code
divisionStuff proc
	push rbx
	
	mov ax, 50
	mov bl, 3
	div bl						; if you're input is 8bit then the implied operand is ax (16bit register)
	; ^ this means ax / bl
	; Result: al
	; Remainder: ah
	
	mov ax, 50
	mov cx, 3
	xor dx, dx					; make sure to clear the remainder storage register first
	div cx						; if you're input is 16bits then the implied operand is DX:AX (32bit (16 + 16)bit compound register)
	; ^ this means DX:AX / CX
	; Result: ax
	; Remainder: dx

	mov eax, 7871
	mov ecx, 78
	xor edx, edx

	div ecx						; if you're input is 32bits then the implied operand is EDX:EAX (64bit (32 + 32)bit compound register)
	; ^ this means EDX:EAX / ECX
	; Result: EAX
	; Remainder: EDX


	mov rax, 79871
	mov rdx, 4					; we're now actually putting a number into rdx, this is now a very large number
	mov rcx, 1238

	div rcx						; if you're input is 64bits then the implied operand is RDX:RAX (128bit (64 + 64)bit compound register)
	; ^ this means RDX:RAX / RCX
	; Result: RAX
	; Remainder: RDX
	; **NOTE**: YOU DO HAVE TO BE CAREFUL THAT THE RESULT DOESN'T OVERFLOW, IF THE RESULT DOESN'T FIT INTO RAX YOU'LL GET AN INTEGER OVERFLOW CRASH
	

	pop rbx
	ret
divisionStuff endp

; finds the largest number that divides both values
GCD_ASM proc
	push rbx
	; RCX and RDX store the two params that are passed in

	; check if either value is 0
	and rcx, rdx
	
	; if either value is 0 don't do the algorithm and return 0
	mov rbx, 0
	cmove rax, rbx
	jz Finished

	; we are using div so we need to move our rdx param into rbx
	mov rbx, rdx

	; do algorithm
LoopHead:
	; take the modulus of a (rcx) and b (rbx)
	xor rdx, rdx
	mov rax, rcx
	div rbx					; RDX:RAX / RBX

	mov rcx, rbx			; move b into a
	mov rbx, rdx			; move remainder into b

	; if b is not 0 then continue the loop
	cmp rbx, 0
	jne LoopHead

	; algorithm done, our answer is in a (rcx)

	mov rax, rcx

Finished:
	pop rbx
	ret
	
GCD_ASM endp

end