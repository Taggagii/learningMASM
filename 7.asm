
; AND DEST, SRC
; AND mem/reg, mem/reg/imm

; OR mem/reg, mem/reg/imm
; OR DEST SRC

; NOT mem/reg
; not just stores it in the operand, `(one's complement)

; XOR mem/reg, mem/reg/imm
; NOTE: if you NOT the result of an xor you get equals to



.code 
booleanAlgebra proc
	mov eax, 1001100010011b					; putting a b at the end of a number will treat it as binary (as shown)
	mov ecx, 1001000010010b
	and eax, ecx
	;     0001001000010010					; <- this is the output currently in eax

	mov eax, 1001100010011b
	mov ecx, 1001000010010b
	or eax, ecx								; eax = 0001001100010011

	mov eax, 1001100010011b
	not eax									; eax = 1110110011101100   (the ones complement)

	mov eax, 1001100010011b
	mov ecx, 1001000010010b
	xor eax, ecx							; eax = 0000000100000001   (a 1 anywhere they're not equal)

	; note:
	xor eax, eax							; eax = 0000000000000000

	; equals to
	xor eax, ecx
	not eax									; a 1 anywhere they're equal

	;	nor
	mov eax, 1001100010011b
	mov ecx, 1001000010010b
	or eax, ecx								
	not eax									; eax = 1110110011101100

	; nand
	mov eax, 1001100010011b
	mov ecx, 1001000010010b
	and eax, ecx
	not eax									; eax = 1110110111101101

	; not with nand
	and eax, eax
	not eax									; -> outputs the same as NOTing eax

	; or with nand
	mov eax, 1001100010011b
	mov ecx, 1001000010010b

	and eax, eax
	not eax
	
	and ecx, ecx
	not ecx

	and eax, ecx
	not eax									; output is the same as ORing the result

	ret
booleanAlgebra endp
end
