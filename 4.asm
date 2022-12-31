; FUNDAMENTAL DATA TYPES

; integer: byte, word, dword, qword
; floating point: real4, real8, real10
; SIMD pointers: xmmword, ymmword, (zmmword <- (new only for AVX512))		"packed versions of the above (sorta)"

; asm is not type safe, signed vs unsigned is up for the programmer
; for DIV and MUL there are different versions: unsigned use DIV and MUL. for signed use: IDIV and IMUL
; NO SUCH THING FOR	add AND mul
; x86 uses two's complement

; byte:  8  bits (in C it's a char)
; word:	 16 bits (in C it's a short) (word usually means the fundamenal datatype, but not really anymore)
; dword: 32 bits (in C it's a int)
; qword: 64 bits (in C it's a long long)

; real4 : 32 bits (single precision float)  [1 sign bit, 8 bit exponent, 23 bit mantissa]
; real8 : 64 bits (double precision float)  [1 sign bit, 11 bit exponent, 52 bit mantissa]
; real10: 80 bits (extended prcision float) [1 sign bit, 15 bit exponent, 64 bit mantissa] (only used in the x87 FPU, mostly ignored nowadays [BUT OFFERS AMAZING PRECISION])

; xmmword: 128 bits, 16 bytes, 8 words, 4 dwords, or 2 qwords
; ymmword: 256 bits, 32 bytes, 16 words, 8 dwords, or 4 qwords

.data
	myByte byte 78					; defining a byte (somewhere in RAM) with the value of 78
	myWord word ?					; defining a word (somewhere in RAM) without caring what value it is [note: you can also use dw or db or such]
	somefloat real4 89.5

.code
dataTypes proc
	; mov al, byte ptr [myByte]		; moving the value of the address "myByte" into al
	; ^ same thing as: mov al, myByte
	mov al, myByte

	mov eax, real4 ptr [somefloat]	; eax is not meant for floating point, but because of no type safety you can move floating point into it

	; note: because assembly is so close to machine code you can actually start coding in it
	
	mov eax, eax
	
	db 45, 78, 19, 23				; this will be interpreted as machine code (YOU DON'T REALLY DO THIS MUCH)
	; ^ this isn't proper machine code (it's like sub eax, [something random] then a rotate left or somethign rol)

	mov eax, eax

	ret
dataTypes endp
end