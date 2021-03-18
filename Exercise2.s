#-------------------------------------------------------------------------------------------------
#Funcion: 				F(A,B,C,D,E) = π(0,1,3,2,16,20,29,24,5,15)
#Function:				F(A,B,C,D,E) = AD + /AC/E + /BCD + /AB/C + /AB/D + B/CE + BC/E + A/BE
#-------------------------------------------------------------------------------------------------

.syntax unified

.data
func:
	.asciz	"F(A,B,C,D,E) = π(0,1,3,2,16,20,29,24,5,15)\nF(A,B,C,D,E) = AD + /AC/E + /BCD + /AB/C + /AB/D + B/CE + BC/E + A/BE"


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
	MOV R3, 0 	/* B */
	MOV R4, 0  	/* C */
	MOV R5, 0 	/* D */
	MOV R6, 0 	/* E */

	/* Set negations values */
	MVN R7, R2 	/* /A */
	MVN R8, R3 	/* /B */
	MVN R9, R4	/* /C */
	MVN R10, R5 /* /D */
	

	/* Function */

	AND R10, R3, R10
	AND R10, R10, R7	/* /AB/D */

	AND R5, R2, R5		/* AD */

	AND R5, R4, R5
	AND R5, R8, R5		/* /BCD */

	AND R8, R2, R8
	AND R8, R6, R8		/* A/BE */

	AND R9, R3, R9
	AND R9, R7, R9		/* /AB/C */

	AND R9, R3, R9
	AND R9, R6, R9		/* B/CE */

	ORR R6, R10, R5
	ORR R6, R6, R8
	ORR R6, R6, R9		/* /AB/D + AD + /BCD + A/BE + /AB/C + B/CE */

	MVN R2, R6		    /* /E */

	AND R5, R7, R4
	AND R5, R5, R2		/* /AC/E */

	AND R8, R3, R4
	AND R8, R2			/* BC/E */

	ORR R6, R6, R5
	ORR R6, R6, R8		/* /AB/D + AD + /BCD + A/BE + /AB/C + B/CE + /AC/E + BC/E */

    LDR R0, =resp
	MOV R1,R6
	BL printf

	POP {ip, pc}
