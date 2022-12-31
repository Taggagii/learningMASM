; question: how do I write an assembly program to add two numbers together


.code
addTwoNumbers proc
	; one: rcx
	; two: rdx
	add rcx, rdx
	; return param: rax
	mov rax, rcx
	ret
addTwoNumbers endp

addTwoFloats proc
	; one: xmm0
	; two: xmm1
	; return: xmm0
	addss xmm0, xmm1
	ret
addTwoFloats endp

addTwoDoubles proc
	; one: xmm0
	; two: xmm1
	; return: xmm0
	addsd xmm0, xmm1
	ret
addTwoDoubles endp

end