; variables declared

.segment "ZEROPAGE"

in_nmi: .res 2

gameState: .res 2
newState:  .res 2

; Variables for the backgrounds
bg1_x: .res 1
bg1_y: .res 1

.segment "BSS"

PAL_BUFFER: .res 512 ;palette

OAM_BUFFER: .res 512 ;low table
OAM_BUFFER2: .res 32 ;high table

