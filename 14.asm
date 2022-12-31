.data
; how to define and initalize a structure
Point struct
	x byte ?
	y byte ?
Point ends

myPoint point { 5, 3 }

; you can also provide default arguments, e.g.
DefaultPoint struct
	x byte 100
	y byte 100
DefaultPoint ends

point1 DefaultPoint {}					; use all defaults
point2 DefaultPoint { , 99 }			; use first default
point3 DefaultPoint	{ 123, 240 }		; override both defaults

.code
structureStuffASM proc
	mov myPoint.y, 100						; move 100 into the instance "myPoint" at y

	; say you're passed a pointer to a structure in RCX then you'd do
	; note that you have to reference that it's the Point structure again because the assembler doesn't know
	;mov [rcx].Point.y, 100					; means, treat rcx as a Point
	ret
structureStuffASM endp


; C++ Natural Alignment

; by default many c++ compilers align data so the offsets within the structures are divisible by the data size
; e.g:
; struct MyStruct {
;	char c;			// offset 0
;	int i;			// offset 4
;	short s;		// offset 8
;	double d;		// offset 16
; };				// total: 24 bytes

; memory diagram of the above (c = char bit, i = int bit, s = short bit, d = double bit) (each character is a bit [excluding spaces])

; c  _  _  _ i  i  i  i  s  s  _  _  _  _  _  _  d  d  d  d  d  d  d 
; 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25

; NOTE: for C++ structures, each element must be on a memory address divisible by it's size
; e.g: sizeof(int) == 4, therefore it must be on bit 0/4/8/12/..., sizeof(short) == 2, therefore 0/2/4/6/8/10/...


; the way we deal with this in asm is to add the padding ourselves

; for the above we'd have something like
;MyStruct struct
;	c byte ?
;		byte 3 dup(0)				; padding
;	i dword	?
;	s word ?
;		byte 6 dup(0)				; padding (dup(0) means duplicate 0 for 6 bytes)
;	d real8	?
;MyStruct ends

; the OTHER alternative is to pragma pack your data

; e.g.
; #pragma pack(1)
; struct MyStruct {
;	char c;			// offset 0
;	int i;			// offset 1
;	short s;		// offset 5
;	double d;		// offset 7
; };				// total: 15 bytes

; which just means align all the data to bits divisible by 1

; and now our ASM struct can just be
;MyStruct struct
;	c byte ?
;	i dword	?
;	s word ?
;	d real8	?
;MyStruct ends


; C++ classes work in the same way!
; NOTE: methods in a class DON'T TAKE ANY RAM IN THE STRUCT

.data
; see main.cpp for the C++ declaration of myClass
MyClass struct
	i dword ?
MyClass ends

.code
structureStuffCPP proc
	mov [rcx].MyClass.i, 123				; setting the private i value to 123
	mov rax, 0
	ret
structureStuffCPP endp


; UNIONS
; unions in C++ are just structures where all the params are located at the same point in RAM
; e.g
; union MyUnion { 
;	char small;
;	short medium;
;	int large;
;	long long huge;
; };

; note: ^ this will take up 8 bits

; in ASM they're basically the same thing, defined as

.data
MyUnion union
	small	byte	?
	medium	word	?
	large	dword	?
	huge	qword	?
MyUnion	ends

; note: this will also take 8 bits, (the size of a qword)

pp MyUnion { 0ffffffffh }					; if you specify an inital value for your union it will only set the first value for your union (in this case the small)

.code
structureStuffASMUnions proc
	mov pp.medium, 90
	mov [rcx].MyUnion.large, 3400537897
	ret
structureStuffASMUnions endp

end