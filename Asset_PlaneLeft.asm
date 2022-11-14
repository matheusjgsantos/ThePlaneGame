MovePlaneLeft:
	push hl
        push af
        
        ld b,4	; Number of sprites
        ld c,4	; Initial Sprite ID
        
        ld hl,PlaneLeftVerPosition
        ld (hl),160
        ld hl,PlaneLeftHorPosition
        ld (hl),220
        
MovePlaneLeftLoop:
        ld a,c
        call CALATR
        ld a,(PlaneLeftVerPosition)
        call WRTVRM
        
        inc hl
        
        ld a,(PlaneLeftHorPosition)
        call WRTVRM
        
        inc c
	djnz MovePlaneLeftLoop
        
        pop af
        pop hl
        
        ret

;Plane going to left sprite

PLANE_LEFT_01A:
; 
; --- Slot 1
; color 1
        DB $03,$04,$04,$24,$27,$3C,$63,$98
        DB $98,$78,$3C,$24,$24,$04,$04,$03
        DB $80,$40,$46,$29,$A9,$71,$81,$01
        DB $06,$18,$20,$20,$20,$40,$40,$80
            
PLANE_LEFT_01B:
; 
; --- Slot 2
; color 3
        DB $00,$02,$00,$00,$00,$00,$04,$00
        DB $00,$03,$03,$02,$00,$00,$02,$00
        DB $00,$00,$00,$06,$46,$0E,$40,$00
        DB $00,$C0,$C0,$40,$00,$00,$00,$00
            
PLANE_LEFT_01C:
; 
; --- Slot 3
; color 2
        DB $00,$00,$00,$00,$00,$00,$00,$07
        DB $07,$04,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$0E,$86
        DB $80,$00,$00,$00,$00,$00,$00,$00
            
PLANE_LEFT_01D:
; 
; --- Slot 4
; color 15
        DB $00,$01,$02,$02,$00,$02,$00,$60
        DB $00,$00,$00,$01,$02,$02,$01,$00
        DB $00,$80,$00,$40,$00,$00,$30,$48
        DB $48,$20,$00,$80,$40,$00,$80,$00

            
PLANE_LEFT_01E:
; 
; --- Slot 5
; color 14
        DB $00,$00,$00,$00,$00,$01,$18,$00
        DB $60,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$80,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
            
PLANE_LEFT_01F:
; 
; --- Slot 6
; color 8
        DB $00,$00,$01,$01,$00,$00,$00,$00
        DB $00,$00,$00,$00,$01,$01,$00,$00
        DB $00,$00,$80,$80,$00,$00,$00,$30
        DB $30,$00,$00,$00,$80,$80,$00,$00