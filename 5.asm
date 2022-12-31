; MOV dest, src

; takes two operands of the same size and copys the data from the source into the dest
; only one can be memory

.data
	someByte byte 10				; someByte is actually a number representing a ram address
	someByte2 byte 8

.code
movLearning proc
	mov rax, 89					; direct value to memory
	
	mov cx, ax					; register to register
	; mov cx, eax				; this won't work because they must be the same size
	
	mov someByte, cl			; register into memory

	mov cl, someByte			; memory into a register

	; mov someByte, someByte2	; this won't work (only one can be memory) MEMORY TO MEMORY IS INVALID

	mov someByte, 234			; immediate into memory works

	ret
movLearning endp

; --------------------------------------------------------------------------------
; LEA dest, src

; "load effect address" loads an address. if you have a variable you can load it's address into a register using LEA and modify the variables data indirectly with the
;   register as a pointer

leaLearning proc
	mov al, someByte			; this makes rax store the same value as someByte meaning you DIDN'T store the address
	lea rax, someByte			; this makes rax store the address of someByte instead

	; now because we have stored the address we can change someByte indirectly

	mov byte ptr [rax], 7		; treat rax as a pointer and then move 7 into that pointer
	; meaning someByte will now store the value 7
	xor rax, rax				; zero it out
	mov al, someByte			; then move the value into the return value for C++
	ret
leaLearning endp
end
