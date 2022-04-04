LED: 	MOV P0,#11111111b;  rozsv
	CALL DEL1S;
	MOV P0,#00000000b ;  zhas
	CALL DEL1S;

LED2:	MOV P1,#11111111b;  rozsv
	CALL DEL1S;
	MOV P1,#00000000b ;  zhas
	CALL DEL1S;
	

DSPL: 	MOV P3,#10001000b;  rozsv
	CALL DEL1S;
	MOV P3,#10001001b ;  zhas
	CALL DEL1S;
	MOV P3,#11000000b;  rozsv
	CALL DEL1S;
	MOV P3,#11100000b ;  zhas
	CALL DEL1S;
	MOV P3,#11111111b ;  zhas
	CALL DEL1S;
	JMP LED; opak
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
