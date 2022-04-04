
JEDNICKA: MOV P1,#11110111b
	  MOV P0,#00000110b
	  CALL DEL1MS;

DVOJKA: MOV P1,#11111011b
	MOV P0,#01011011b
	CALL DEL1MS;

TROJKA: MOV P1,#11111101b
	MOV P0,#01001111b
	CALL DEL1MS;

CTVERKA: MOV P1,#11111110b
	MOV P0,#01100110b
	CALL DEL1MS;
	JMP JEDNICKA



	RB3	equ	11b

DEL1S:	acall	DEL200
DEL800:	acall	DEL400
DEL400:	acall	DEL200
DEL200:	acall	DEL100
DEL100:	push	acc
	mov	a,#100
DELAY:	acall	DEL1MS
	dec	a
	cjne	a,#0,DELAY
	pop	acc
	ret

DEL1MS:	push	PSW		;schovej puvodni RB
	orl	PSW,#RB3 shl 3	;nastav Register Bank = 3
	mov	r7,#0
	djnz	r7,$
	mov	r7,#0c6h
	djnz	r7,$
	pop	PSW		;obnov Register Bank
	ret
	END
