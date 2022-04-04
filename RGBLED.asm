
JEDNICKA: MOV P0,#11110000b
	  CALL DELL2S;
	  MOV P0,#00001111b
	  CALL DELL2S;
	  MOV P0,#00010000b
	  CALL DELL2S;
	  MOV P0,#00100000b
	  CALL DELL2S;
	  JMP JEDNICKA
	
DELL2S:	CALL DEL1S;
	CALL DEL1S;
	
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

