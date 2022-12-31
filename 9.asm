; flags register


; bits and names:
; 0: CF Carry Flag [CY] (set to 1 when there's an overflow on the left hand side) 
; 2: PF	Parity Flag [PE] (1 last result was even, 0 last result was odd) {not really useful anymore}
; 4: AF	Auxillary Carry Flag [AC] (indicates an overflow on the lowest nibble (4 bits) of the result) {not really useful anymore}
; 6: ZF Zero Flag [ZR] (1 if previous result was 0, 0 if it wasnt) {REALLY USEFUL}
; 7: SF Sign Flag [PL] (1 if result was negative, 0 if result was positive)
; 8: TF Trap Flag (allows debuggers to stop through code)
; 9: IF Interrupt flag (allows interrupts to be called)
; 10: DF Direction Flag [UP] (0 reading strings forwards, 1 reading strings backwards*)
; 11: OF Overflow Flag [OV] (represents a signed overflow, like an overflow on the second from left most bit, 1 if the sign changed AND the original signs were the same)
	; e.g. -5+5 will not set it, but -120 + -120 will set it 
; 12-13: IOPL (shows IO port privilege level)
; 14: NT Nested Task (shows if this task is nested)


; NOTE: to know EXACTLY how certain operations affect the flags, you have to read the instruction manuel (example: inc and dec don't set the carry flag)

.code
flagStuff proc
	; CF
	mov rax, -1
	add rax, 1					; causes overflow sets CF to 1

	; PF
	mov eax, 3
	and eax, eax				; result is 3 and because 3 = 11b (with 2 on bits) we get an even parity (because 2 is even)

	mov eax, 7
	and eax, eax				; result is 7 and because 7 = 111b (with 3 on bits) we get an odd parity (because 2 is odd)

	; AF
	mov eax, 15
	add eax, 1					; causes an overflow on the low 4 bits of eax thus setting AF to 1

	; ZF
	xor eax, eax				; set's eax to 0 and sets the ZF (zero flag) to 1
	add eax, 5					; set's eax to 5 and sets the ZF (zero flag) to 0
	; NOTE: because the cmp instruction does a subtraction in the background and it sets the flags as though it did a subtraction but doesn't set the result of the 
	;			subtraction in first operand, if the zero flag is set it means the values were the same, because the first operand sub the second = 0 thus they're the same

	; SF
	mov eax, 7
	mov ecx, 12
	
	sub eax, ecx				; set's the SF to 1 because the result was negative 
	add eax, ecx				; set's the SF to 0 because the result was positive

	; DF
	; talk more about this later
	std							; set direction flag
	cld							; clear direction flag
	std
	cld

	; OF
	mov rax, -1
	shr rax, 1					; overflow flag set to 1
	add rax, 1					; overflow flag set to 1 (again)

	; How to read the flags register
	pushfq						; pushes the entire 64 bit flags register to the stack
	pop rax						; now we have rax storing the entire flags register
	; change it however you like
	push rax
	popfq						; sets the flag register to the value on top of the stack

	ret
flagStuff endp
end
