;*****************************************************************************;
;*  Author        : Дракончик												 *;
;*  Machine       : Super Nintendo Entertainment System (PAL)				 *;
;*  Language      : 65c816 ASM                                               *;
;*  Assembler	  : ca65	                                                 *;
;*                                                                           *;
;*  File Contents : MAIN BODY                                                *;
;*  File Attribute: SOURCE                                                   *;
;*  File Name     : main.asm                                                 *;
;*                                                                           *;
;*****************************************************************************;


;puts the assembler in 65816 mode
.p816 

;tell the assembler to automatically adjust register size depending on REP / SEP changes 
;(handled through macros like A8, AXY16, etc)
.smart

; asm files needed to initialize the SNES machine, better don't touch them
.include "Data/Init/regs.asm"
.include "Data/Init/variables.asm"
.include "Data/Init/macros.asm"
.include "Data/Init/init.asm"

.include "Data/stateManager.asm"

.segment "BSS"


.segment "CODE"

; enters here in forced blank
Main:
	.a16 ; the setting from init code
	.i16
	phk
	plb
	
	; A8 for 8 bit numbers and A16 for 16 bit adresses I guess...?
	A16				

	; Start the State Machine by initializing the first state(Normally IntroState)
	ldx #$0004
	stx gameState
	jsr stateMachineStart

MainLoop:
	
	A8
	XY16
	jsr Wait_NMI
	
	jsr stateMachineUpdate
	
	jsr stateMachineDraw

	jmp MainLoop




Wait_NMI:
	.a8
	.i16
	;should work fine regardless of size of A
	lda in_nmi ;load A register with previous in_nmi
	
	@check_again:	
		WAI ;wait for an interrupt
		cmp in_nmi	;compare A to current in_nmi
					;wait for it to change
					;make sure it was an nmi interrupt
		beq @check_again
	rts
; The header file of the ASM project, here you can set up the ROM name and different stuff
.include "Data/Init/header.asm"	


	












