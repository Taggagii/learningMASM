; shl mem/reg, imm
; shr mem/reg, imm

; just shifts left or right the value in the mem/reg by the immediate value

; NOTE: the carry flag holds the last bit that was shifted out

; the imm that you're shifting by is ANDed with 63 meaning if you try to shift by 64 it won't clear the register
; shr rax, 64					; it will do nothing
; shr rax, 65					; will shift by 1 because 65 AND 64 = 1

; same thing with 32 bit registers though they're ANDed with 31
; shr eax, 32					; does nothing
; shr eax, 33					; will shift by 1

; though, with 16 bit registers IT DOESN'T APPLY
; shr ax, 16					; THIS WORKS!

; NOTE: if you shift by 1 it will also set the OVERFLOW FLAG (OF)

; NOTE: you can shift by a variable amount but ONLY IF IT'S CL
; e.g:
; mov al, 5
; shr edx, al					; this WON'T work

; mov cl, 5
; shr edx, cl					; this WILL work

; -------------------------------------------------------------------------------------------------------------

; shr and shl works with unsigned numbers, so if you're trying to divide eax by 4 then SHR EAX, 2 works, but ONLY IF EAX IS UNSIGNED
; so
; if you want to do shifting with signed values, then use ARITHMATIC SHIFTS

; sal mem/reg, imm
; sar mem/reg, imm

; the difference is, with normal shift right it brings in zero's but with arithmatic shift right it brings in whatever the sign bit is

; NOTE: SAL and SHL are the same thing because bringing in the sign bit wouldn't make sense in the left direction

; finally: shifting by 0 is a nop

; -------------------------------------------------------------------------------------------------------------

; rol mem/reg, imm
; ror mem/reg, imm

; cl for variable rotate
; one bit rotate will trigger OF as well
; carry flag is the value that was last rotated to the other side
; just rotates

; -------------------------------------------------------------------------------------------------------------

; rcr mem/reg, imm
; rcl mem/reg, imm

; same stuff but now the carry flag sorta extends through the carry flag. just ROTATE THROUGH THE CARRY FLAG
; sorta treats the operand as 65 bits

; -------------------------------------------------------------------------------------------------------------

; DOUBLE PRECISION SHIFTS

; shrd mem/reg, mem/reg, imm
; shld mem/reg, mem/reg, imm
; like placing the first operand next to the second operand and shifting values into it.

; shift left double precision will shift the top values of the second operand into the first operand
; shift right double precision will shift the bottom values of the second operand into the first operand

; NOTE: you can't do a double precision with 8 bit registers (like al and ah)
end