

KL0: JB P2.0,KL1  ;TL = 1 -> NENÍ ZMÁČKJKLÉ
	CALL C1

KL1: JB P2.1,KL2
	CALL D1

KL2: JB P2.2,KL3
	CALL E1

KL3: JB P2.3,KL4
	CALL F1

KL4: JB P2.4,KL5
	CALL G1

KL5: JB P2.5,KL6
	CALL A1

KL6: JB P2.6,KL7
	CALL H1

KL7: JB P2.7,KL0
	CALL C2
	JMP KL0 ;SKOČ NA KLÁVESU 0
	

;VOLÁNÍ TONŮ;	
C1: MOV R7,#100 ;NASTAVENÍ POČTU OPAKOVÁNÍ PROGRAMU
CV: CALL TONC ;VOLÁNÍ TONU C
	DJNZ R7,CV ;NASTAVENÍ OPAKOVÁNÍ
	RET ;RETURN - NÁVRAT Z PODPROGRAMU

D1:	MOV R7,#100
CB: CALL TOND
	DJNZ R7,CB
	RET

E1: MOV R7,#100
CN: CALL TONE
	DJNZ R7,CN
	RET

F1: MOV R7,#100
CM: CALL TONF
	DJNZ R7,CM
	RET

G1: MOV R7,#100
CYT: CALL TONG
	DJNZ R7,CYT
	RET

A1: MOV R7,#100
CER: CALL TONA
	DJNZ R7, CER
	RET

H1:MOV R7,#100
CRE:	CALL TONH
	DJNZ R7, CRE ;OPAKOVÁNÍ PROGRAMU
	RET

C2:	MOV R7,#100
CFE:	CALL TONC2
	DJNZ R7,CFE
	RET

TICHO:	CALL DEL1S
	RET

TONC:	SETB P0.7 ;zapne se reproduktor
	CALL U1908 ;Reproduktor bzučí po dobu 1908 ms
	CLR P0.7 ;vypne se reproduktor
	CALL U1908 ;Reproduktor je ticho po dobu 1908 ms

U1908:	CALL MS1
	CALL U408
	CALL U500
	RET

U500:	MOV R0,#248
HL1:	DJNZ R0,HL1
	RET

MS1:	CALL U500
	CALL U500
	RET

U408:	MOV R1,#202
XA:	DJNZ R1,XA
	NOP
	RET

TOND: 	SETB P0.7
	CALL U1701
	CLR P0.7
	CALL U1701

U1701:	CALL MS1
	CALL U500
	CALL U201
	RET

U201:	MOV R2,#99
XB:	DJNZ R2,XB
	RET

TONE:	SETB P0.7
	CALL U1515
	CLR P0.7
	CALL U1515

U1515:	CALL MS1
	CALL U500
	CALL U15
	RET

U15:	MOV R3,#6
XC:	DJNZ R3,XC
	RET

TONF:	SETB P0.7
	CALL U1433
	CLR P0.7
	CALL U1433

U1433:	CALL MS1
	CALL U433
	RET

U433:	MOV R1,#215
XD:	DJNZ R1,XD
	RET

TONG:	SETB P0.7
	CALL U1276
	CLR P0.7
	CALL U1276

U1276:	CALL MS1
	CALL U276
	RET

U276:	MOV R2,#136
XE:	DJNZ R2,XE
	NOP
	RET

TONA:	SETB P0.7
	CALL U1136
	CLR P0.7
	CALL U1136

U1136:	CALL MS1
	CALL U136
	RET

U136:	MOV R3,#66
XF:	DJNZ R3,XF
	NOP
	RET

TONH:	SETB P0.7
	CALL U1012
	CLR P0.7
	CALL U1012

U1012:	CALL MS1
	CALL U12
	RET

U12:	MOV R3,#4
XG:	DJNZ R3,XG
	NOP
	RET

TONC2:	SETB P0.7
	CALL U956
	CLR P0.7
	CALL U956

U956:	CALL U500
	CALL U456
	RET

U456:	MOV R1,#226
XH:	DJNZ R1,XH
	NOP
	RET


;NĚCO
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

DEL1MS:	push	PSW
	orl	PSW,#RB3 shl 3
	mov	r7,#0
	djnz	r7,$
	mov	r7,#0c6h
	djnz	r7,$
	pop	PSW
	ret
end