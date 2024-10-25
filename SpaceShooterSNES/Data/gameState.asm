;*****************************************************************************;
;*  Author        : Дракончик												 *;
;*  Machine       : Super Nintendo Entertainment System (PAL)				 *;
;*  Language      : 65c816 ASM                                               *;
;*  Assembler	  : ca65	                                                 *;
;*                                                                           *;
;*  File Contents : Game state where most playing logic takes place and such *;
;*  File Attribute: SOURCE                                                   *;
;*  File Name     : gameState.asm            	                             *;
;*                                                                           *;
;*****************************************************************************;



gameStart:
	.a16 ; the setting from init code
	.i16
	phk
	plb
	
	; A8 for 8 bit numbers and A16 for 16 bit adresses I guess...?
	A8		
	; DMA from BG_Palette to CGRAM
	stz CGADD ; $2121 cgram address = zero
	
	stz $4300 ; transfer mode 0 = 1 register write once
	lda #$22  ; $2122
	sta $4301 ; destination, cgram data
	ldx #.loword(BG_Palette)
	stx $4302 ; source
	lda #^BG_Palette
	sta $4304 ; bank
	ldx #32
	stx $4305 ; length
	lda #1
	sta MDMAEN ; $420b start dma, channel 0
	
	; DMA from Tiles to VRAM	
	lda #V_INC_1 ; the value $80
	sta VMAIN  ; $2115 = set the increment mode +1
	ldx #$0000
	stx VMADDL ; $2116 set an address in the vram of $0000
	
	lda #1
	sta $4300 ; transfer mode, 2 registers 1 write
			  ; $2118 and $2119 are a pair Low/High
	lda #$18  ; $2118
	sta $4301 ; destination, vram data
	ldx #.loword(Tiles)
	stx $4302 ; source
	lda #^Tiles
	sta $4304 ; bank
	ldx #(End_Tiles-Tiles)
	stx $4305 ; length
	lda #1
	sta MDMAEN ; $420b start dma, channel 0
	
	
	
	; DMA from Tilemap to VRAM	
	ldx #$6000
	stx VMADDL ; $2116 set an address in the vram of $6000
	
	lda #1
	sta $4300 ; transfer mode, 2 registers 1 write
			  ; $2118 and $2119 are a pair Low/High
	lda #$18  ; $2118
	sta $4301 ; destination, vram data
	ldx #.loword(Tilemap)
	stx $4302 ; source
	lda #^Tilemap
	sta $4304 ; bank
	ldx #$700
	stx $4305 ; length
	lda #1
	sta MDMAEN ; $420b start dma, channel 0	

	; a is still 8 bit.
	lda #1 ; mode 1, tilesize 8x8 all
	sta BGMODE ; $2105

	stz BG12NBA ; $210b tiles for BG 1+2 at VRAM address $0000

	lda #$60 ; bg1 map at VRAM address $6000
	sta BG1SC ; $2107

	lda #BG1_ON ; $01 = only bg 1 is active
	sta TM ; $212c

	lda #FULL_BRIGHT ; $0f = turn the screen on (end forced blank)
	sta INIDISP ; $2100
rts

gameUpdate:
	.a8
	.i16
	php
	A8
	dec bg1_y
	lda bg1_y
	sta BG1VOFS ;$210e
	stz BG1VOFS
	plp
rts

gameDraw:
	
rts

gameEnd:

rts


; Include all the image data used for Menu Screen

.segment "RODATA"

BG_Palette:
; 32 bytes
.incbin "../Graphics/Palettes/SF.pal"

Tiles:
; 4bpp tileset
.incbin "../Graphics/Tiles/SF.chr"
End_Tiles:

Tilemap:
; $700 bytes
.incbin "../Graphics/Maps/SF.map"


