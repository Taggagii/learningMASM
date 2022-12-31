; Windows "C" calling convention

;			int		float/double	pointer/obj/array
; ---------------------------------------------------
; 1st		RCX		XMM0			RCX
; 2nd		RDX		XMM1			RDX
; 3rd		R8		XMM2			R8
; 4th		R9		XMM3			R9
; More		Stack	Stack			Stack


; returns
; --------------------------------------------------
; Return with RAX, EAX, AX, AL and just match the size for pointers, integers, shorts, etc.
; Return with XMM0 for floats, doubles
 
 ; integer and pointer returns are in RAX
 ; floating point returns are in XMM0

.code
cCallingConvention proc
	mov rax, rcx							; the first param passed in is RCX because it's an int
	add rax, rdx							; the second param passed in is RDX because it's an int
	; 3rd and 4th are in R8 and R9 if they're integers
	; 3rd param is in xmm2 because it's the 3rd param and is a float/double

	; 4th param is in R9 because it's an int and is the 4th param
	ret
cCallingConvention endp

passingObjects proc
	mov rax, rcx							; the j value in carly is stored within the rcx register as it's the first param passed in
	; commonly when you're working with objects you want to pass them around by pointer or reference to avoid this copying
	ret
passingObjects endp

passingPointers proc
											; the value in RCX is the same as the value saved in 
	; passing pointers are passed into the int registers
	movss xmm0, real4 ptr [myFloat]						; the value in xmm0 is read for float or double return values
	; ^ mov scalar single precison value
	; for moving doubles you would need to use movsd (move scalar double)
	ret
passingPointers endp

.data
myFloat real4 466.54

end
