.code
controlStructuresIFs proc
	; if statements	
	; note: it is very costly to jump around like this, using conditional jumps is very costly because the cpu will often try to execute the path it believes it's gonna take
	;	and if it get's it wrong then it needs to flush it's code buffer and reload the real code buffer
	push rbx
	
	mov rax, 5
	mov rbx, 7
	mov rcx, 0

	cmp rax, rbx					; compare 5 to 7
	; so, instead of causing the issue in the above note, we use a conditional move instead
	mov rdx, 1
	cmovl rcx, rdx					; we just use a conditional move, which doesn't cause the weird code loading problem and branching problem


	;jl RAXLess						; jumps if RAX < RBX
	;jmp Finished

;RAXLess:
	;mov rcx, 1

;Finished:


	pop rbx
	mov rax, rcx
	ret
controlStructuresIFs endp


controlStructuresCompoundIFs proc
	push rbx

	mov rax, 10
	mov rbx, 12

	; COMPOUND CONDITIONS
	; ex: if (a < b && a == 10) c = 1

	; use conditional moves to stores results of each portion into registers and then literally AND or OR then together, you could also use the stack or RAM

	; NOTE: USING THE CONDITIONAL SET COMMAND WILL REMOVE THE NEED FOR THE RDX REGISTER BEING USED HERE SEE *** PORTIONS FOR EXAMPLES
	
	mov rcx, 0		
	mov r8, 0
	mov rdx, 1
	
	; rcx : a < b
	; r8 : a == 10
	; rax : a < b && a == 10
	; rdx : true

	cmp rax, rbx
	cmovl rcx, rdx
	; *** setl rcx

	cmp rax, 10
	cmove r8, rdx
	; *** sete r8

	and rcx, r8
	mov rax, rcx

	pop rbx

	ret
controlStructuresCompoundIFs endp


controlStructuresWhileLoop proc
	; while loop

	; int i = 0;
	; while (i < 100) {
	;	++i;
	; }
	mov eax, 0					; EAX is i
	
LoopHead:
	cmp eax, 5					; loop condition
	jge Finished

	; body
	inc eax						; EAX++
	
	jmp LoopHead				; basically a while(true) with a break if statement inside

Finished:

	ret

controlStructuresWhileLoop endp



controlStructuresDoWhileLoop proc
	; do while 
	
	; int i = 0;
	; do {
	;	++i;
	; } while (i < 5)

	mov eax, 10
LoopHead:
	inc eax

	cmp eax, 5
	jl LoopHead
	
	ret
controlStructuresDoWhileLoop endp


controlStructuresNormalASMLoop proc
	mov ecx, 5

	; say we're indexing an array
	;mov rax, [someArray]					; RAX is our base pointer for the array
	xor rdx, rdx
LoopHead:
	; body of the loop
	add dword ptr [rax+rdx], 1				; RDX is our acting offset

	add rdx, 4								; size of each element

	dec ecx
	jnz LoopHead


	ret
controlStructuresNormalASMLoop endp

controlStructuresForLoop proc
	; for (int i = 0; i < 10; ++i) {
	;		// body
	; }

	; int i = 0;
	mov eax, 0

LoopHead:
	; i < 10
	cmp eax, 10
	jge Finished
	
	; body

	; ++i
	inc eax

Finished:
	ret
controlStructuresForLoop endp

end
