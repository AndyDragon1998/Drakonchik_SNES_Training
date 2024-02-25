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



stateMachineStart:

	jsr introStart

rts

stateMachineUpdate:

	jsr introUpdate
rts

stateMachineDraw:


rts

stateMachineChange:

rts
