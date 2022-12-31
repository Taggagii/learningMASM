.code
main proc
	push rbx

	mov ax, -1			; this will fill all the 16 bits with 1s
	mov al, 0			; this is the lower 8 bits of ax, so this will change the last half to 0
	mov ah, 0			; this is the higher 8 bits of ax, so this will chagne the first half to 0

	pop rbx
	ret
main endp
end