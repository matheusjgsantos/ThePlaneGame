;Plane going to left sprite
LoadPlaneLeftSprite:
	ld   a,0
	call CALPAT
	push hl
        pop  de
        ld   hl,PLANE_LEFT_01A
        ld   bc,32
        call LDIRVM
	ld   a,0
        call CALATR
        push hl
        pop  de
        ld   bc,4		; Os atributos de sprite sao sempre 4 bytes:
            			; Byte 0: Coordenada X
                                ; Byte 1: Coordenada Y
                                ; Byte 3: Numero do sprite
                                ; Byte 4: Cor do Sprite (MSX1)
        ld   hl,PLANE_LEFT_01A_ATTRIB
        call LDIRVM
        
        ld   a,1
        call CALPAT
        push hl
        pop  de
        ld   hl,PLANE_LEFT_01B
	ld   bc,32
        call LDIRVM
	ld   a,1
        call CALATR
        push hl
        pop  de
        ld   bc,4
        ld   hl,PLANE_LEFT_01B_ATTRIB
        call LDIRVM
        
        ld   a,2
        call CALPAT
        push hl
        pop  de
        ld   hl,PLANE_LEFT_01C
	ld   bc,32
        call LDIRVM
	ld   a,2
        call CALATR
        push hl
        pop  de
        ld   bc,4
        ld   hl,PLANE_LEFT_01C_ATTRIB
        call LDIRVM
                
        ld   a,3
        call CALPAT
        push hl
        pop  de
        ld   hl,PLANE_LEFT_01D
	ld   bc,32
        call LDIRVM
	ld   a,3
        call CALATR
        push hl
        pop  de
        ld   bc,4
        ld   hl,PLANE_LEFT_01D_ATTRIB
        call LDIRVM
        
PLANE_LEFT_01A:
; 
; --- Slot 1
; color 1
        DB $03,$04,$04,$24,$27,$3C,$63,$98
        DB $98,$78,$3C,$24,$24,$04,$04,$03
        DB $80,$40,$46,$29,$A9,$71,$81,$01
        DB $06,$18,$20,$20,$20,$40,$40,$80

PLANE_LEFT_01A_ATTRIB:
	DB 10,10,0,1
            
PLANE_LEFT_01B:
; 
; --- Slot 2
; color 3
        DB $00,$02,$00,$00,$00,$00,$04,$00
        DB $00,$03,$03,$02,$00,$00,$02,$00
        DB $00,$00,$00,$06,$46,$0E,$40,$00
        DB $00,$C0,$C0,$40,$00,$00,$00,$00

PLANE_LEFT_01B_ATTRIB:
	DB 10,10,4*1,3
            
PLANE_LEFT_01C:
; 
; --- Slot 3
; color 2
            DB $00,$00,$00,$00,$00,$00,$00,$07
            DB $07,$04,$00,$00,$00,$00,$00,$00
            DB $00,$00,$00,$00,$00,$00,$0E,$86
            DB $80,$00,$00,$00,$00,$00,$00,$00

PLANE_LEFT_01C_ATTRIB:
	DB 10,10,4*2,2
            
PLANE_LEFT_01D:
; 
; --- Slot 4
; color 15
            DB $00,$01,$02,$02,$00,$02,$00,$60
            DB $00,$00,$00,$01,$02,$02,$01,$00
            DB $00,$80,$00,$40,$00,$00,$30,$48
            DB $48,$20,$00,$80,$40,$00,$80,$00
            
PLANE_LEFT_01D_ATTRIB:
	DB 10,10,4*3,15
            
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