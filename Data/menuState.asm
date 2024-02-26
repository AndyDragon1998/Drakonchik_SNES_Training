;*****************************************************************************;
;*  Author        : Дракончик												 *;
;*  Machine       : Super Nintendo Entertainment System (PAL)				 *;
;*  Language      : 65c816 ASM                                               *;
;*  Assembler	  : ca65	                                                 *;
;*                                                                           *;
;*  File Contents : Main Menu state for choosing game mode and such			 *;
;*  File Attribute: SOURCE                                                   *;
;*  File Name     : menuState.asm            	                             *;
;*                                                                           *;
;*****************************************************************************;



menuStart:

	inx

rts

menuUpdate:
	
	inx
rts

menuDraw:

	dex
rts

menuEnd:


rts
