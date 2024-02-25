;*****************************************************************************;
;*  Author        : Дракончик												 *;
;*  Machine       : Super Nintendo Entertainment System (PAL)				 *;
;*  Language      : 65c816 ASM                                               *;
;*  Assembler	  : ca65	                                                 *;
;*                                                                           *;
;*  File Contents : Intro state for presenting the author of game and logo   *;
;*  File Attribute: SOURCE                                                   *;
;*  File Name     : introState.asm                                           *;
;*                                                                           *;
;*****************************************************************************;



introStart:
	.a16 ; the setting from init code
	.i16
	phk
	plb
		
	A16				; A8 for 8 bit numbers and A16 for 16 bit adresses I guess...?
	
	stz CGADD 		; $2121 set color address to 0
	lda #$0000	 	; palette low byte gggrrrrr
				 	; 1f = all the red bits
	sta CGDATA 		; $2122 - write twice
	lda #$00	 	; palette high byte -bbbbbgg
	sta CGDATA 		; $2122

	; -bbbbbgg gggrrrrr
	; black = $0000
	; red = $001f
	; green = $03e0
	; blue = $7c00
	; white = $7fff

	; turn the screen on (end forced blank)
	lda #FULL_BRIGHT ; $0f
	sta INIDISP ; $2100


rts

introUpdate:
	inc a
	sta CGDATA 		; $2122 - write twice
	lda #$00	 	; palette high byte -bbbbbgg
	sta CGDATA 		; $2122
rts

introDraw:


rts

introEnd:


rts
