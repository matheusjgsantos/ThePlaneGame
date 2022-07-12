LoadPlaneRightSprite:
	ld   a,4
	call CALPAT
        push hl
        pop  de
        
        ld   hl,PLANE_RIGHT_01A
        ld   bc,32
        call LDIRVM
	
        ld   a,4
        call CALATR
        
        push hl
        pop  de
        ld   bc,4		; Os atributos de sprite sao sempre 4 bytes:
            			; Byte 0: Coordenada X
                                ; Byte 1: Coordenada Y
                                ; Byte 3: Numero do sprite
                                ; Byte 4: Cor do Sprite (MSX1)
        ld   hl,PLANE_RIGHT_01A_ATTRIB
        call LDIRVM
        
        ld   a,5
        call CALPAT
        
        push hl
        pop  de
        ld   hl,PLANE_RIGHT_01B
	ld   bc,32
        call LDIRVM
	
        ld   a,5
        call CALATR
        
        push hl
        pop  de
        ld   bc,4
        ld   hl,PLANE_RIGHT_01B_ATTRIB
        call LDIRVM
        
        ld   a,6
        call CALPAT
        
        push hl
        pop  de
        ld   hl,PLANE_RIGHT_01C
	ld   bc,32
        call LDIRVM
	
        ld   a,6
        call CALATR
        
        push hl
        pop  de
        ld   bc,4
        ld   hl,PLANE_RIGHT_01C_ATTRIB
        call LDIRVM
                
        ld   a,7
        call CALPAT
        
        push hl
        pop  de
        ld   hl,PLANE_RIGHT_01D
	ld   bc,32
        call LDIRVM
	
        ld   a,7
        call CALATR
        
        push hl
        pop  de
        ld   bc,4
        ld   hl,PLANE_RIGHT_01D_ATTRIB
        call LDIRVM
        
        ld a,(PlaneRightVerPosition)
        ld a,20
        ld (PlaneRightVerPosition),a
        
        ld a,(PlaneRightHorPosition)
        ld a,10
        ld (PlaneRightHorPosition),a
        
        call MovePLaneRight
        
        ret

MovePlaneRight:
	push hl
        push af
        
        ld b,4	; Number of sprites
        ld c,0	; Initial Sprite ID
        
MovePLaneRightLoop:
        ld a,c
        call CALATR
        ld a,(PlaneRightVerPosition)
        call WRTVRM
        
        inc hl
        
        ld a,(PlaneRightHorPosition)
        call WRTVRM
        
        inc c
	djnz MovePlaneRightLoop
        
        pop af
        pop hl
        
        ret

PLANE_RIGHT_01A; 
; --- AviaoDireita
; color 1
        DB $00,$00,$00,$00,$60,$93,$8E,$82
        DB $81,$80,$78,$08,$10,$21,$1E,$00
        DB $00,$00,$38,$44,$84,$E8,$18,$14
        DB $E2,$04,$38,$40,$80,$00,$00,$00
      
PLANE_RIGHT_01A_ATTRIB:
	DB 0,0,4*4,1

PLANE_RIGHT_01B:
; color 12
        DB $00,$00,$00,$00,$00,$00,$00,$0C
        DB $1E,$7F,$07,$07,$07,$00,$00,$00
        DB $00,$00,$00,$00,$70,$10,$00,$08
        DB $1C,$F8,$C0,$80,$00,$00,$00,$00

PLANE_RIGHT_01B_ATTRIB:
	DB 0,0,4*5,12

PLANE_RIGHT_01C
; color 13
        DB $00,$00,$00,$00,$00,$60,$70,$70
        DB $60,$00,$00,$00,$08,$1E,$00,$00
        DB $00,$00,$00,$38,$08,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        
PLANE_RIGHT_01C_ATTRIB:
	DB 0,0,4*6,13

PLANE_RIGHT_01D
; color 14
        DB $00,$00,$00,$00,$00,$00,$01,$01
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$C0,$E0
        DB $00,$00,$00,$00,$00,$00,$00,$00
        
PLANE_RIGHT_01D_ATTRIB:
	DB 0,0,4*7,14

PLANE_RIGHT_01E
; color 15
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$20,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00

PlaneRightUp01A
        ; --- AviaoDireitaCima
        ; color 1
        DB $00,$00,$F0,$88,$85,$42,$24,$14
        DB $0B,$70,$88,$80,$40,$21,$12,$0C
        DB $00,$00,$00,$DC,$22,$22,$42,$84
        DB $08,$10,$10,$08,$04,$82,$42,$3E
        ; color 12
        DB $00,$00,$00,$00,$38,$3C,$18,$08
        DB $04,$0F,$07,$07,$07,$0E,$0C,$00
        DB $00,$00,$00,$00,$1C,$1C,$3C,$78
        DB $F0,$E0,$E0,$F0,$F8,$74,$20,$00
        ; color 13
        DB $00,$00,$00,$70,$40,$00,$00,$00
        DB $00,$00,$70,$78,$38,$10,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$08,$1C,$00
        ; color 14
        DB $00,$00,$00,$00,$00,$01,$03,$03
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$80,$C0,$80,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        ; color 15
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$40,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        ; 
        ; --- AviaoCima
        ; color 1
        DB $00,$00,$19,$26,$23,$24,$14,$0C
        DB $04,$07,$02,$02,$04,$08,$08,$07
        DB $00,$80,$40,$20,$20,$A0,$90,$88
        DB $84,$02,$02,$32,$2A,$24,$20,$C0
        ; color 12
        DB $00,$00,$00,$01,$0C,$08,$08,$00
        DB $00,$00,$01,$01,$00,$00,$00,$00
        DB $00,$00,$80,$C0,$C0,$40,$60,$70
        DB $78,$F8,$F8,$C0,$C0,$40,$40,$00
        ; color 13
        DB $00,$00,$00,$18,$10,$10,$00,$00
        DB $00,$00,$00,$00,$03,$07,$07,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$04,$04,$0C,$04,$80,$80,$00
        ; color 14
        DB $00,$00,$00,$00,$00,$01,$03,$03
        DB $03,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        ; color 15
        DB $00,$00,$00,$00,$00,$02,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00

