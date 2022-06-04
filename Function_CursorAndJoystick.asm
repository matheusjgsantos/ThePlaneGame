CheckStick:
        push af
	ld a,0			; 0 = Cursor keys
        call GTSTCK  		; Chama a rotina de checagem do cursor  
        cp 0			; A = 0 - sem tecla pressionada
        jp z,ExitLoop		; sai do loop
        jr UpStick

UpStick:
	cp 1
        jr nz,RightStick
        
        ld a,(PlaneRightVertical)
        cp 0
        jp z,ExitLoop
        
        sub a,1
        ld (PlaneRightVertical),a
        
        call MovePlaneRight
        
RightStick:
        cp 3
        jr nz,DownStick

        ld a,(PlaneRightHorizontal)
        cp 240
        jp z,ExitLoop
        
        add a,1
        ld (PlaneRightHorizontal),a
        call MovePlaneRight
        
        jp ExitLoop
        
DownStick:
	cp 5
        jp nz,LeftStick
        
        ld a,(PlaneRightVertical)
        cp 180
        jp z,ExitLoop
        
        add a,1
        ld (PlaneRightVertical),a
        call MovePlaneRight
        
        jp ExitLoop      

LeftStick:
        cp 7	
        jr nz,ExitLoop	
        
        ld a,(PlaneRightHorizontal)
        cp 1
        jr z,ExitLoop
        
        sub a,1
        ld (PlaneRightHorizontal),a

        call MovePlaneRight
        
        jp ExitLoop
              
ExitLoop:
	pop af
	ret
