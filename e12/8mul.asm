MOV R0, #0FFH	;operand1
MOV R1, #0FFH	;operand2
MOV A, R0
MOV B, R1
MUL AB			;(BA = A x B)
MOV R2, B
MOV R3, A
HERE: SJMP HERE
