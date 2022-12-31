; question: how do I find the smallest of two numbers?

.code 
smallerFast proc
	; one: ecx
	; two: edx
	; return: eax

	cmp ecx, edx
	cmovle eax, ecx
	cmovg eax, edx
	ret
smallerFast endp


smallerSlow proc
	; one: ecx
	; two: edx
	; return: eax

	cmp	ecx, edx
	jle	oneIsSmaller
	jg	twoIsSmaller
oneIsSmaller:
	mov eax, ecx
	jmp Finished
twoIsSmaller:
	mov eax, edx
	jmp Finished
Finished:
	ret
smallerSlow endp
end