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

.p816
.smart

; asm files needed to initialize the SNES machine, better don't touch them
.include "Data/Init/regs.asm"
.include "Data/Init/variables.asm"
.include "Data/Init/macros.asm"
.include "Data/Init/init.asm"

.include "Data/stateManager.asm"


.segment "CODE"

; enters here in forced blank
Main:
	.a16 ; the setting from init code
	.i16
	phk
	plb
		
	A16				; A8 for 8 bit numbers and A16 for 16 bit adresses I guess...?

	; Start the State Machine by initializing the first state(Normally IntroState)
	ldx #$00
	jsr stateMachineStart

MainLoop:
	
	jsr stateMachineUpdate
	
	jsr stateMachineDraw

	jmp MainLoop

; The header file of the ASM project, here you can set up the ROM name and different stuff
.include "Data/Init/header.asm"	


	












