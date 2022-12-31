; eax is just the 32bit version of ax which is 16bit

; BUT THEN 64BIT CAME ALONG

; now we have much more
; rax, rbx, rcx, rdx, rsi, rdi, rsp, rbp, rip, r8, r9, ..., r15
; which are all 64 bit registers

; we can also now acces the lower bit of rsi (sil), rdi (dil), rsp (spl), and rbp (bpl)

; also, you may have noticed the 8 other general purpose registers we got r8-15

; with any of the r8-15 (which we'll denote r# now)
; get:
; the whole 64 bit register with r#
; lower 32 bits with r#d								d is for dword (double word)
; lower 16 bits with r#w				1				w is for word
; lower 8  bits with r#b								b is for byte
; note: using the 32 bit mode (eg: eax, ebx, ...) of the 64 bit system will zero the top 32 bits of the registers you use it in
;	that is: doing anything with the 32bit portion of a 64bit register is going to wipe out the top 32 bits

.code
bigRegisters proc
	mov rax, -1				; rax will all be 1s
	mov al, 5				; the lowest byte of rax will be for 5 but the rest wont change
	mov ax, 17				; will move 17 into the lowest word of rax but not change anything else
	mov eax, 1				; will move 1 into the first dword of rax and ZERO THE REST OF RAX

	; NOTE: THE SAME IS TRUE FOR THE NEW REGISTERS eg:
	mov r11, -1
	mov r11b, 5
	mov r11w, 17
	mov r11d, 1


	
	ret
bigRegisters endp
end
