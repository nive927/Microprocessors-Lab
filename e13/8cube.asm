MOV R0, #0FH
MOV A, R0
MOV B, R0
MUL AB ;(BA = A x B)
MOV B, R0 ; multiply again
MUL AB
MOV R1, B
MOV R2, A
HERE: SJMP HERE
