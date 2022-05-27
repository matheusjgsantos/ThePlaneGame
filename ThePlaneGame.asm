;BIOS calls
CHGSND: equ 0x0135; Enable or disable the keyboard click sound
INIGRP: equ 00072H; Initialize the Graphic mode (Screen 2)
FILVRM: equ 00056H; Fills the VRAM at address DE with content from A
LDIRVM: equ 0005CH; Transfere um bloco de tamanho BC do endereço em DE na RAM para o endereço em HL na VRAM
LDIRMV: equ 00059H
CHGMOD: equ 0005FH
CHGET:  equ 0009FH
CHPUT:  equ 000A2H
CALPAT: equ 00084H; Function : Returns the address of the sprite pattern table
		  ; Input    : A  - Sprite ID
		  ; Output   : HL - For the address
		  ; Registers: AF, DE, HL
CALATR: equ 00087H; Function : Returns the address of the sprite attribute table
		  ; Input    : A  - Sprite number
		  ; Output   : HL - For the address
		  ; Registers: AF, DE, HL
WRTVDP: equ 00047h; Function : Write data in the VDP-register
		  ; Input    : B  - Data to write
           	  ; C  - Number of the register
		  ; Registers: AF, BC

;System variables
FORCLR: equ 0F3E9H; Foreground color
BAKCLR: equ 0F3EAH; Background color
BDRCLR: equ 0F3EBH; Border color
CLIKSW: equ 0xF3DB; Keyboard click sound state
GRPNAM:	equ 0F3C7H; Name Table Base - default value: 1800H
GRPCOL: equ 0F3C9H; Colour Table Base - default value: 2000H
GRPCGP: equ 0F3CBH; Character Pattern Base - default value: 0000H
GRPATR: equ 0F3CDH; Sprite Attribute Base - default value 1B00H
GRPPAT: equ 0F3CFH; Sprite Pattern Base - default value: 3800H
ATRBAS:	equ 0F928H; Sprite size (8x8 or 16x16) - default value 1B00H
GRPACX: equ 0FCB7H; Show or set the current row-position of the cursor
GRPACY: equ 0FCB9H; Show or set the Current column-position of the cursor
RG1SAV: equ 0F3E0H


	org 0x4000
        
; MSX cartridge header @ 0x4000 - 0x400f
	dw 0x4241
        dw Init
        dw Init
        dw 0
        dw 0
        dw 0
        dw 0
        dw 0

Init:
	;Let's initialize the screen colors
	ld b,15		; Foreground color
        ld c,7		; Background color
        ld d,5		; Border color
        call InitGraphicMode;	Initializes graphic mode with the color at BCD 
        call SetSpriteSize16x16

        
        ; We need to set all screen tiles to tile 0 before loading any graphic
        call ResetNameTable
        
        ; The first sprite we will load will be the LeftPlane, so we will set
        ; 0 to A and call the sprite function
        
        push af
	; Load the plane sprites
        call LoadPlaneLeftSprite
        call LoadPlaneRightSprite
        pop af
        
        call CHGET
        ret
        
	include "Function_SetScreen.asm"
	include "Asset_PlaneLeft.asm"
        include "Function_SetSound.asm"
	
	include "Asset_PlaneRight.asm"

	END Init
