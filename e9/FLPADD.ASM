ASSUME CS:CODESEG, DS:DATASEG
DATASEG SEGMENT
	ORG 00H		; directive to assign an offset address for a variable
	X DD 20.4375
	ORG 10H
	Y DD 20.4375
	ORG 20H		;(hex)20 is (dec)32 for double word which is (word)16 X 2
	SUM DD ?	; meaning of the question mark is that
			; the value is uninitialized
			; but dd amount of memory is reserved
			; to the contents of this location
			; we need to load some meaningful value there
			; otherwise, some undefined or garbage value is
			; displayed
DATASEG ENDS
CODESEG SEGMENT
start: 
	MOV AX,DATASEG
	MOV DS,AX
	
	FINIT			; initialize 8087 stack
	FLD X			; load X into ST(0)
	FLD Y			; load Y into ST(0)
	FADD ST(0),ST(1)	; ST(0) = Y[ST(0)] + X[ST(1)]
	FST SUM			; store ST(0) in sum
	
	MOV AH,4CH
	INT 21H
	CODESEG ENDS
END START