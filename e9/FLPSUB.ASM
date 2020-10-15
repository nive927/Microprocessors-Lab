ASSUME CS:CODESEG, DS:DATASEG
DATASEG SEGMENT
	ORG 00H		; directive to assign an offset address for a variable
	X DD 20.4375
	ORG 10H
	Y DD 0.125
	ORG 20H
	SUM DD ?
DATASEG ENDS
CODESEG SEGMENT
start:
	MOV AX,DATASEG
	MOV DS,AX
	
	FINIT			; initialize 8087 stack
	FLD Y			; load X into ST(0)
	FLD X			; load Y into ST(0)
	FSUB ST(0),ST(1)	; ST(0) = Y - X
	FST SUM			; store ST(0) in sum
	
	MOV AH,4CH
	INT 21H
	CODESEG ENDS
END START