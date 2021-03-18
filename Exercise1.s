#----------------------------------------------------------------
#Function (Maxterms): 	F(A,B,C,D,E) = π(17,21,29,25,6,14)
#Function:		F(A,B,C,D,E) = /A./C + /A./D + D.E + A./E
#----------------------------------------------------------------

.syntax unified

.data
func:
	.asciz	"F(A,B,C,D,E) = π(17,21,29,25,6,14)\nF(A,B,C,D,E) = /A./C + /A./D + D.E + A./E\nTest values: 01000\n"

.text
resp:
	.asciz	"Result: %d \n"
.global main
.extern printf

main:	PUSH {ip, lr}

	LDR r0, =func
	BL printf

    /* Set variable values */
	MOV R2, 0 	/* A */
	MOV R3, 1 	/* B */
	MOV R4, 0 	/* C */
	MOV R5, 0 	/* D */
	MOV R6, 0 	/* E */

	MOV R7, 1 	/* /A */
	MOV R8, 0 	/* /B */
	MOV R9, 1 	/* /C */
	MOV R10, 1 	/* /D */


	/* Function */
	AND R3, R7, R9			/* /A./C */
	MOV R7, 1			/* Set /E */
	AND R4, R2, R7			/* A./E */
	AND R8, R5, R6			/* D.E */
	AND R5, R2, R10			/* A./D */
	ORR R6, R3, R5			/* /A./C + A./D */
	ORR R3, R6, R8			/* /A./C + A./D + D.E */
	ORR R5, R3, R4			/* /A./C + A./D + D.E + A./E */
	
	/* Print result */
	LDR R0, =resp
	MOV R1,R5
	BL printf
	
	POP {ip, pc}
