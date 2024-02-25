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




.segment "CODE"

; enters here in forced blank
Main:
.a16 ; the setting from init code
.i16
	phk
	plb
	
	A16			; A8 for 8 bit numbers and A16 for 16 bit adresses I guess...?
	stz CGADD ; $2121 set color address to 0
	lda #$03e0	 ; palette low byte gggrrrrr
				 ; 1f = all the red bits
	sta CGDATA ; $2122 - write twice
	lda #$00	 ; palette high byte -bbbbbgg
	sta CGDATA ; $2122
	
; -bbbbbgg gggrrrrr
; black = $0000
; red = $001f
; green = $03e0
; blue = $7c00
; white = $7fff

; turn the screen on (end forced blank)
	lda #FULL_BRIGHT ; $0f
	sta INIDISP ; $2100

; note, nothing is active on the main screen,
; so only the main background color will show.
; $212c is the main screen register	



MainLoop:
	
	;code goes here

	jmp MainLoop

; The header file of the ASM project, here you can set up the ROM name and different stuff
.include "Data/Init/header.asm"	


	









