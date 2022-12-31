; SIMD - single instruction multiple data
; meaning: provide one instruction and it is executed on bunch of data

; for example:
; scalar addition might look something like:
; c = a + b
; but SIMD addition might look something like:
; c0 = a0 + b0
; c1 = a1 + b1
; c2 = a2 + b2
; c3 = a3 + b3
; where a, b, and c are small arrays

; ---------------------------------------------------------------------------------
; SIMD releases
; SSE - streaming SIMD instructions
; SSE1 - floating point
; SSE2 - double precision integers
; SSE3 - horizontal
; SSS3 - more horizontal
; SSS4.1 4.2 4a - Strings, Blends, Etc.
; AVX - Advanced vector extensions; single and double floatin gpoint
; AVX2 - integers
; AVX512 - various...
; MMX - integers old

; ---------------------------------------------------------------------------------

; MMX : 8 registers (MM0 - MM7)
; SSE : 16 registers (XMM0 - XMM15) [ only in 64 bit mode ]
; AVX : 16 registers (YMM0 - YMM15)	
; AXV512 : 32 registers (ZMM0 - ZZM31) [ you also get 32 AVX and SSE registers aswell ]
;										^ note: the low half of the AVX512 registers are the AVX and the same for AVX and SSE


.data 
myIntegers1 dword	0, 1, 2, 3				; two vectors defined
myIntegers2 dword	5, 5, 5, 5
myFloats1	real4	0.0, 1.0, 2.0, 3.0
myFloats2	real4	7.0, 6.0, 5.0, 4.0
myDoubles1	real8	0.0, 1.0
myDoubles2	real8	7.0, 6.0

.code
simdstuff proc
	
	; ADD INSTRUCTION
	movdqu xmm0, xmmword ptr [myIntegers1]
	movdqu xmm1, xmmword ptr [myIntegers2]

	; movedqu - move unaligned double-quadword: reads 128 bits of integer data into an SSE register

	paddd xmm0, xmm1
	; paddd xmm, xmm : adds corresponding 32 bit integers from the first and second operands; stores result in first operand
	; in the watch window: look at the m128_i32 or m128_u32 which are signed and unsigned 32 bit integer views of the m128 storage

	; SUB INSTRUCTION

	psubd xmm1, xmm0
	; psubd xmm, xmm : packed subtraction of dwords. Subs the corresponding 32 bit integers (dwords) from the second operand; stores result in the first operand

	; -------------------------------------------------
	; FLOATING POINT SIMD INSTRUCTIONS
	; note: simd instruction sets are often geared toward extremely quick floating points

	movaps xmm0, xmmword ptr [myFloats1]
	movaps xmm1, xmmword ptr [myFloats2]
	; movaps xmm, mem- move aligned packed singles : reads 128 bits of floating point data into an SSE register
	; note: we'll talk about data alignment later

	addps xmm0, xmm1
	; addps xmm, xmm : add packed singles. adds corresponding elements, and stores the results in the first operand

	subps xmm1, xmm0
	; subps xmm, xmm : subtract packed singles. Subtracts corresponding elements, and stores the results in the first operand

	mulps xmm0, xmm1
	; mulps xmm, xmm : multiply packed singles. multiples the corresponding elements of two vectors, and stores the results in the first operand
	; NOTE: multiplication and division are slightly more complicated for integers than they are for floating point
	
	divps xmm1, xmm0
	; divps xmm, xmm : divide packed singles. divides the corresponding elements of two vectors and stores the results in the first operand

	; -----------------------------------------------------------------------------------------------------------------
	; DOUBLE PRECISION FLOATS

	movapd xmm0, xmmword ptr [myDoubles1]
	movapd xmm1, xmmword ptr [myDoubles2]
	; movapd xmm, mem : move aligned packed doubles. moves 128 bits or two double precision floating point numbers from memory into the see register

	addpd xmm0, xmm1
	; addpd xmm, xmm : add packed doubles. adds corresponding elements, and stores the results in the first operand

	; subpd xmm, xmm : subtract """"
	; mulpd xmm, xmm : multiply """"
	; divpd xmm, xmm : divide """""""""

	ret
simdstuff endp


end