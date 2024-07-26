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

.segment "CODE"

.include "introState.asm"
.include "menuState.asm"
.include "gameState.asm"
.include "overState.asm"

stateStart:
	.addr introStart
	.addr menuStart
	.addr gameStart
	.addr overStart

stateUpdate:
	.addr introUpdate
	.addr menuUpdate
	.addr gameUpdate
	.addr overUpdate

stateDraw:
	.addr introDraw
	.addr menuDraw
	.addr gameDraw
	.addr overDraw
	
stateOver:
	.addr introEnd	
	.addr menuEnd
	.addr gameEnd
	.addr overEnd

stateMachineStart:
	; .loword() clips the value to 16 bit
	ldx gameState
	jsr (.loword(stateStart),x)

rts

stateMachineUpdate:
	ldx gameState
	jsr (.loword(stateUpdate),x)
rts

stateMachineDraw:
	ldx gameState
	jsr (.loword(stateDraw),x)

rts

stateMachineOver:
	ldx gameState
	jsr (.loword(stateOver),x)

rts

stateMachineChange:
	jsr stateMachineOver
	lda newState
	sta gameState
	jsr stateMachineStart
rts
















