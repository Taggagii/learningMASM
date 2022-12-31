; SIMD FLOATING POINT ARITHMETIC
; looking at four functions:
; add, sub, mul, div
; on floats and doubles
; both SSE and AVX versions

.data 
vec1 real4 1.0, 2.0, 3.0, 4.0
vec2 real4 5.0, 6.0, 7.0, 8.0
vec3 real8 5.0, 6.0
vec4 real8 5.0, 6.0
avxVec1 real4 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0
avxVec2 real4 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0
avxVec3 real8 1.0, 2.0, 3.0, 4.0
avxVec4 real8 5.0, 6.0, 7.0, 8.0

; note: when we talk about aligned data, we mean that it needs to be divisible by some number
;                                                                                    ^ in this case 16      
.code
BasicSIMDFloatingPointArithmetic proc
	; SSE : 128 bits wide

	movaps xmm0, xmmword ptr [vec1]
	movaps xmm1, xmmword ptr [vec2]
	; NOTE: the data is aligned as the .data section is aligned and vec1 is 16 bytes 

	addps xmm0, xmm1
	; subps	: subtract packed singles
	; mulps
	; divps

	; working with double precision floating points (added SSE2)
	mov apd
	movapd xmm0, xmmword ptr [vec3]
	movapd xmm1, xmmword ptr [vec4]

	addpd xmm0, xmm1
	; subpd	: subtract packed doubles
	; mulpd
	; divpd


	; -------------------------------------------------------------------
	; AVX : 256 bits wide
	; uses YMM0 - YMM15
	; NOTE: the low 128 bits of the YMM registers are the corresponding XMM registers

	; single precision
	vmovups ymm0, ymmword ptr [avxVec1]
	vmovups ymm1, ymmword ptr [avxVec2]
	; vmovups (instead of movups)

	vaddps ymm2, ymm0, ymm1
	; vaddps xmm, xmm, xmm : it's non-destructive! adds the 2nd and 3rd and stores it in the 1st
	; though note you can do:
	; vaddps ymm0, ymm0, ymm1 ; and make it destructive

	;vsubps
	;vmulps
	;vdivps

	; NOTE: this also allows something like
	vaddpd xmm1, xmm2, xmm3	
	; allowing non-destructive 128 bit vectors

	; double precision
	; vmovupd : avx mov unaligned packed doubles
	vmovupd ymm0, ymmword ptr [avxVec3]
	vmovupd ymm1, ymmword ptr [avxVec4]
	vaddpd ymm3, ymm0, ymm1
	;vsubpd
	;vmulpd
	;vdivpd

	; SUMMARY
	; {v}[add/sub/mul/div][s/p][s/d]
	; 1 = avx
	; 2 = operation
	; 3 = s(calar), p(acked)
	; 4 = s(ingle precision), d(ouble precision)

	ret
BasicSIMDFloatingPointArithmetic endp
end