MOV R0, #0FH
MOV R1, #0FH
MOV A, R0
MOV B, R1
MUL AB ;(BA = A x B)
MOV B, R1 ; multiply again
MUL AB
MOV R2, B
MOV R3, A
HERE: SJMP HERE
