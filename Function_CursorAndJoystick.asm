CheckStick:
        push af
	ld a,0			; 0 = Cursor keys
        call GTSTCK  		; Chama a rotina de checagem do cursor  
        cp 0			; A = 0 - sem tecla pressionada
        jp z,ExitLoop		; sai do loop
        jr UpStick

UpStick:
	cp 1
        jr nz,UpRightStick
        
        ld a,(PlaneRightVertical)
        cp 10
        jp z,ExitLoop
        
        sub a,1
        ld (PlaneRightVertical),a
        
        jp ExitLoop
        
UpRightStick:
	cp 2
        jr nz,RightStick
        
        ld a,(PlaneRightVertical)
        cp 10
        jp z,CheckUpRightLimit
        
        sub a,1
        ld (PlaneRightVertical),a

CheckUpRightLimit:        
        ld a,(PlaneRightHorizontal)
        cp 230
        jp z,ExitLoop
        
        add a,1
        ld (PlaneRightHorizontal),a
        
        jp ExitLoop
        
RightStick:
        cp 3
        jr nz,DownRightStick

        ld a,(PlaneRightHorizontal)
        cp 230
        jp z,ExitLoop
        
        add a,1
        ld (PlaneRightHorizontal),a
        
        jp ExitLoop
        
DownRightStick:
	cp 4
        jr nz,DownStick
        
        ld a,(PlaneRightVertical)
        cp 115
        jp z,CheckDownRightLimit
        
        add a,1
        ld (PlaneRightVertical),a
        
CheckDownRightLimit:       
        ld a,(PlaneRightHorizontal)
        cp 230
        jp z,ExitLoop
        
        add a,1
        ld (PlaneRightHorizontal),a
        
        jp ExitLoop
        
DownStick:
	cp 5
        jp nz,DownLeftStick
        
        ld a,(PlaneRightVertical)
        cp 115
        jp z,ExitLoop
        
        add a,1
        ld (PlaneRightVertical),a
        
        jp ExitLoop      

DownLeftStick:
	cp 6
        jr nz,LeftStick
        
        ld a,(PlaneRightVertical)
        cp 115
        jp z,CheckDownLeftLimit
        
        add a,1
        ld (PlaneRightVertical),a
        
CheckDownLeftLimit:       
        ld a,(PlaneRightHorizontal)
        cp 10
        jp z,ExitLoop
        
        sub a,1
        ld (PlaneRightHorizontal),a
        
        jp ExitLoop

LeftStick:
        cp 7	
        jr nz,UpLeftStick
        
        ld a,(PlaneRightHorizontal)
        cp 10
        jr z,ExitLoop
        
        sub a,1
        ld (PlaneRightHorizontal),a
        
        jp ExitLoop

UpLeftStick:
	cp 8
        jr nz,ExitLoop
        
        ld a,(PlaneRightVertical)
        cp 10
        jp z,CheckUpLeftLimit
        
        sub a,1
        ld (PlaneRightVertical),a
        
CheckUpLeftLimit:       
        ld a,(PlaneRightHorizontal)
        cp 10
        jp z,ExitLoop
        
        sub a,1
        ld (PlaneRightHorizontal),a
        
        jp ExitLoop
              
ExitLoop:
	call MovePlaneRight
	pop af
	ret
