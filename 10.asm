; CONDITIONAL JUMPS

; Jcc rel8/16/32
; provide an operand (usually a label) and if the condition is true then the jump is taken


; CONDITIONAL MOVES
; CMOVcc reg, reg/mem
; if the condition (the cc) is met, then the move happens
; NOTE: there are no 8 bit versions of these instructions only 16, 32, and 64 bit


; SET BYTE
; SETcc reg/mem8
; if "cc" is true then 1 is moved into the operand otherwise the value 0 is moved
; NOTE: only 8 bit operands are allowed

; cc CONDITION CODES
; O: Overflow
; NO: Not Overflow
; B/C/NAE: Carry Unsigned
; NB/NC/AE: Not Carry Unsigned
; E/Z: Zero
; NE/NZ: Not Zero
; BE/NA: Below or Equal Unsigned
; NBE/A: Above unsigned
; S: Sign
; NS: Not Sign
; P/PE: Parity Even
; NP/PO: Parity Odd
; L/NGE: Less Signed
; NL/GE: Not Less Signed
; LE/NG: Not Greater Signed
; NLE/G: Greater Signed

; **NOTE**: prefix the above cc as shown in the headings (with either J, CMOV, or SET) to do the action using the cc

.code
conditions proc
	; OVERFLOW JUMP

	;mov eax, -9
	;add eax, -12					; doesn't cause an overflow
	;jo Overflowed
	;jno DidntOverflow

;Overflowed:
	;mov rax, 12
	
;DidntOverflow:
	;mov rax, 15

	;ret


	;push rbx

	;mov ebx, 67
	;mov eax, -1
	;;mov eax, 100					; this won't cause an overflow
	;add eax, 1						; should cause a carry flag set
	;cmovc eax, ebx					; if the carry flag is set from the previous instruction then we want to move ebx into eax
	;pop rbx

	; NOTE: DOING A CMOV ON 32 BIT REGISTERS CLEARS THE TOP REGARDLESS IF IT'S TRUE OR NOT

	; loops

	;mov rax, 0
	;mov rcx, 10
;LoopHead:
	; loop body
	;add rax, 3

	; restarting stuff
	;dec rcx
	;jnz LoopHead

	; Zero flag is also the equals flag so

	;mov eax, 10
	;mov ecx, 5
	;cmp eax, ecx
	;sete bl					; set al if equals


	; below and above (below and above are for unsigned)

	;push rbx
	
	;mov rax, 78
	;mov rbx, 90

	;cmp rax, rbx
	;jb WasBelow
	;ja WasAbove

;WasBelow:
	;pop rbx
	;ret

;WasAbove
	;pop rbx
	;ret

	;push rbx						; you're not supposed to change rbx so push and pull it from the stack or bill gates will find you
	
	;mov rbx, 100
	;mov rax, 50
	;mov rcx, 90
	;sub rax, rcx

	;cmovs rax, rbx					; if the answer to the subtraction output a negative number then move rbx = 100 into rax

	;pop rbx


	mov eax, -9
	mov ecx, 100

	cmp eax, ecx					; compares
	setg bl							; if eax=-9 > ecx=100 then set bl=1
	setl bh							; if eax=-9 < ecx=100 then set bh=1

	ret

conditions endp
end
