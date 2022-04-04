PROG:
	CALL LED;
	CALL LED1;
	JMP PROG;

LED: MOV R1,#3
     HEP:MOV R0,#7
	     MOV P1,#00000001b;
	     CALL del400;
	     MOV A,P1;
	     HOP:RL A;
	     	MOV P1,A;
	     	CALL del400;
	    	DJNZ R0,HOP
	    	DJNZ R1, HEP
	    	RET
     	
LED1:MOV R1,#3
     HEP2:MOV R0,#7
	     MOV P1,#10000000b;
	     CALL del400;
	     MOV A,P1;
	     HOP2:RR A;
	     	MOV P1,A;
	     	CALL del400;
	    	DJNZ R0,HOP2
	    	DJNZ R1, HEP2
	    	RET
     
	
DEL2S:	CALL DEL1S;
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

