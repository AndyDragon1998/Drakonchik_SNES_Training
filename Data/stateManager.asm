;*****************************************************************************;
;*  Author        : Дракончик												 *;
;*  Machine       : Super Nintendo Entertainment System (PAL)				 *;
;*  Language      : 65c816 ASM                                               *;
;*  Assembler	  : ca65	                                                 *;
;*                                                                           *;
;*  File Contents : State machine manager for handling what state we are in  *;
;*  File Attribute: SOURCE                                                   *;
;*  File Name     : stateManager.asm                                         *;
;*                                                                           *;
;*****************************************************************************;

.include "introState.asm"
.include "menuState.asm"
.include "gameState.asm"
.include "overState.asm"

stateList:
	.addr introStart
	.addr introUpdate
	.addr introDraw
	.addr introEnd
	.addr menuStart
	.addr menuUpdate
	.addr menuDraw
	.addr menuEnd
	.addr gameStart
	.addr gameUpdate
	.addr gameDraw
	.addr gameEnd
	.addr overStart
	.addr overUpdate
	.addr overDraw
	.addr overEnd


stateMachineStart:
	; .loword() clips the value to 16 bit
	jsr (.loword(stateList),x)

rts

stateMachineUpdate:

	jsr (.loword(stateList),x)
rts

stateMachineDraw:
	jsr (.loword(stateList),x)

rts

stateMachineChange:

rts
















