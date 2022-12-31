; ADD reg/memory, reg/memory/imm32

; add just adds two operands together and stores it in the first
; read the OVERFLOW FLAG for SIGNED CARRY
; read the CARRY FLAG for UNSIGNED CARRY

; flags: overflow, carry, sign, zero, auxiliary carry, and paritY
; LOCK IS SUPPORTED

; tricks and traps
; using the original registers (eax, cx, bl) is more efficent than using the new ones (r8b, r12w)
; using the new registers and the 64 bit instructions adds a REX prefix in the machine code
; adding is faster than multiplication so use ADD AX, AX to double AX instead of mul

; note: imm64 means immediate 64 bit value
; there is no 'ADD reg64, imm64' the closest you get is imm32
; add assumes the src will be 32 bits so if you add with a 64 bit it will sign extend
; e.g.
;		add rcx, 2147483648	-> -2147483648
; you get the negative version of the number because it read your value as a negative
; meaning, if you want to you need an intermediate instruction to move the imm64 into a temp register
; e.g.
;		mov rax, 2147483648						; mov is one of the only (if not the only) instructions that support imm64 as the src
;		add rcx, rax

; ------------------------------------------------------------------------------------------------------------------------------------
; SUB reg/mem, reg/mem/imm

; subtracts the second operand from the first and stores it in the first
; read OVERFLOW FLAG for SIGNED BORROW
; read CARRY FLAG for UNSIGNED BORROW

; flags: overflow, carry, sign, zero, auxiliary carry, and parity
; LOCK IS SUPPORTED

; tricks (similar to add)
; imm64 sub will sign extend
; NOTE: IF YOU NEED TO SUBTRACT A imm64 YOU MUST USE A MOV FIRST
; use dec x, 1 for dec x with the carry flag

; ------------------------------------------------------------------------------------------------------------------------------------
; INC reg/mem
; increments a value by one
; NOTE: INC DOESN'T AFFECT THE CARRY FLAG IN THE CASE OF AN OVERFLOW
; if you want to handle overflow then use ADD reg/mem, 1
; inc reg is slightly smaller (3 bytes) compared to add reg, 1 (4 bytes)
; flags: overflow, sign, zero, auxiliary, and parity
; LOCK IS SUPPORTED

; ------------------------------------------------------------------------------------------------------------------------------------
; DEC reg/mem
; opposite of inc
; in the same way DOESN'T AFFECT THE CARRY FLAG
; flags: overflow, sign, zero, auxiliary, and parity


.code
basicArithmetic proc
	; add
	mov rax, 5
	mov rcx, 12
	add rax, rcx

	; inc
	mov rax, 7
	inc rax					; now have 8 in rax

	; NOTE, NO OVERFLOW DETECTION
	mov al, 255				; al = 255
	inc al					; al = 0 and did NOT set the carry flag
	
	mov al, 255				; al = 255
	add al, 1				; al = 0 and DID set the carry flag

	; dec
	mov al, 0				; al = 0
	dec al					; al = 255 and did NOT set the carry flag

	ret

basicArithmetic endp
end