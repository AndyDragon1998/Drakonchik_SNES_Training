;*****************************************************************************;
;*  Author        : Дракончик												 *;
;*  Machine       : Super Nintendo Entertainment System (PAL)				 *;
;*  Language      : 65c816 ASM                                               *;
;*  Assembler	  : ca65	                                                 *;
;*                                                                           *;
;*  File Contents : Game over state where score or continue is given		 *;
;*  File Attribute: SOURCE                                                   *;
;*  File Name     : overState.asm            	                             *;
;*                                                                           *;
;*****************************************************************************;



overStart:

	inx

rts

overUpdate:
	
	inx
rts

overDraw:

	dex
rts

overEnd:


rts
