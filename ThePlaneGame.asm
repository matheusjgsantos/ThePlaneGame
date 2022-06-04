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
        ; The first sprite we will load will be the LeftPlane, so we will set
        ; 0 to A and call the sprite function
        
	; Load the plane sprites
        call LoadPlaneLeftSprite
        call LoadPlaneRightSprite
        
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
        
NewJiffy:
	ld a,(JIFFY)
	ld (PreviousJiffy),a
        jp mainLoop
        
; Includes for functions and assets
	include "Function_SetScreen.asm"
	include "Asset_PlaneLeft.asm"
        include "Function_SetSound.asm"
	include "Asset_PlaneRight.asm"
	include "Function_CursorAndJoystick.asm"
        
	include "Asset_ScreenBorder.asm"

	include "Function_DrawBorder.asm"

        
;This include should be the last entry in the main file
        include "System_GameVariables.asm"
	END Init
