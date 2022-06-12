;The BIOS calls and system variables are set in these two files

	include "System_BIOSCalls.asm"
	include "System_SystemVariables.asm"

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
        
        ;
        call desenha_borda
        call InitSprites
        ; The first sprite we will load will be the LeftPlane, so we will set
        ; 0 to A and call the sprite function
        
	; Load the plane sprites
        
        ld hl,PLANE_LEFT_01A
        ld (LoadSpritePattern),hl
        
        ld a,$01
        ld (LoadSpriteColor),a

	;ld hl,PLANE_LEFT_01A_ATTRIB
        ;ld (LoadSpriteAttrib),hl

	call LoadSprite
        
        ld hl,PLANE_LEFT_01B
        ld (LoadSpritePattern),hl
        
        ld a,$03
        ld (LoadSpriteColor),a
        
        ;ld hl,PLANE_LEFT_01B_ATTRIB
        ;ld (LoadSpriteAttrib),hl
        
        call LoadSprite
        
        ld hl,PLANE_LEFT_01C
        ld (LoadSpritePattern),hl
        
        ld bc,2
        ld (LoadSpriteColor),bc
        
        ;ld hl,PLANE_LEFT_01C_ATTRIB
        ;ld (LoadSpriteAttrib),hl
        
        call LoadSprite
        
        ld hl,PLANE_LEFT_01D
        ld (LoadSpritePattern),hl
        
        ld bc,15
        ld (LoadSpriteColor),bc
        
        ;ld hl,PLANE_LEFT_01D_ATTRIB
        ;ld (LoadSpriteAttrib),hl
        
        call LoadSprite
        
        ; Zeroes the JIFFY value
        ld a,0
        ld (JIFFY),a
        ld (PreviousJiffy),a
        
MainLoop:
	ld a,(JIFFY)
        ld hl,PreviousJiffy
        cp (hl)
        jr nz,ExecWithinJiffy
        
        jr MainLoop
        
ExecWithinJiffy:
	call CheckStick
        ;call movimenta_nuvem
        
NewJiffy:
	ld a,(JIFFY)
	ld (PreviousJiffy),a
        jp mainLoop
        
; Includes for functions and assets
	include "Function_SetScreen.asm"
        include "Function_SetSound.asm"
	include "Function_LoadSprite.asm"
	include "Asset_PlaneLeft.asm"
	include "Asset_PlaneRight.asm"
	include "Function_CursorAndJoystick.asm"
	include "Asset_ScreenBorder.asm"
	include "Function_DrawBorder.asm"
	include "Asset_Clouds.asm"


;This include should be the last entry in the main file
        include "System_GameVariables.asm"
	END Init
