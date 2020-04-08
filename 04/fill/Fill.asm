(RESTART)
@SCREEN
D=A
@0
M=D	   // Sets screen address to RAM[0]


(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT	// if KBD register > 0, jump to black
@WHITE
D;JEQ	// else, jump to white

@KBDCHECK
0;JMP

(BLACK)
@1
M=-1	      // sets RAM[1] value to 16 black pixels
@LOOPFILL
0;JMP

(WHITE)
@1
M=0	        // sets RAM[1] value to 16 white pixels
@LOOPFILL
0;JMP


(LOOPFILL)
@1	        // what value is in RAM[1]? Black or white?
D=M	

@0
A=M	       // Fetches current pixel row
M=D	       // Paints it black or white 

@0
D=M+1	   // Go to next pixel row
@KBD
D=A-D	   // Subtracts KBD from the current address, for the check below

@0
M=M+1	// Go to next pixel row
A=M     // Reset the screen address, so we can start again

@LOOPFILL
D;JGT	    // If KBD - current_address = 0, our program is over. Screen is painted. 


@RESTART
0;JMP