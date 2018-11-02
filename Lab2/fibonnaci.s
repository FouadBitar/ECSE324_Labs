			.text
			.global _start	

_start:		
			LDR R4, =RESULT			//R4 holds the result of the fibonnaci calc
			LDR R1, [R4, #4]		//R1 holds the only argument for fibonnaci call
			PUSH {R1}				//registers fibonacci will use
			MOV R0, #0				//initialize final result
			BL FIBONACCI
			B END
			

FIBONACCI:	CMP R1, #2				//if greater than or equal to 2 recurse
			BGE RECURSE				
			ADD R0, R0, #1
			BX LR
RECURSE:	
			SUB R1, R1, #1
			PUSH {R1, LR}			
			BL FIBONACCI
			POP {R1}
			SUB R1, R1, #1
			BL FIBONACCI
			POP {LR}
			BX LR


END:		B END


RESULT:		.word	0
N:			.word 	9
