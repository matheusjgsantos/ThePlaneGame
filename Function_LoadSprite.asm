InitSprites:
	ld a,0
        ld (NextSpriteId),a
        ret

LoadSprite:
	; Routine to load the sprites based in the pattern and attribute
        ; stored at the LoadSpritePattern and LoadSpriteAttribute "variables"
        ; First, load the values as below:
        ; 	ld hl,POINTER_TO_THE_PATTERN
        ; 	ld (LoadSpritePattern),hl
        ; 	ld hl,POINTER_TO_THE_ATTRIBUTE
        ; 	ld (LoadSpritePattern),hl
        ; Then call the LoadSprite routine
        
	
        push af
       
        ld   a,(NextSpriteId)		; get the ID for the next sprite available

        call CALPAT			; CALPAT returns the memory address of
        				; the next sprite in HL
        push hl				; Pushes HL into the stack
        pop  de				; Then POP back the value into DE
	
        ld   hl,(LoadSpritePattern)	; Load the memory position of the pattern
        				; into HL
        ld   bc,32			; 16x16 sprites. Needs improvements

	call LDIRVM			; Copies the pattern to the VRAM
        
        
        ld   a,(NextSpriteId)		; get the ID for the next sprite available
        
        call CALATR			; CALPAT returns the memory address of
        				; the next sprite in HL
        push hl				; Pushes HL into the sta
        pop  de				; Then POP back the value into DE
        
        ld   hl,LoadSpriteAttrib	; Load the memory position of the attribute
        				; into HL
	ld   (hl),160
	inc  hl
        ld   (hl),220
        inc  hl
        ld   a,(NextSpriteId)
        sla  a				; Multiplies by 4
        sla  a
        ;ld   a,4
        ld   (hl),a
	inc  hl
        ld   a,(LoadSpriteColor)
        ld   (hl),a
        
        ld   hl,LoadSpriteAttrib
     	
        ;dec hl
        ;dec hl
        ;dec hl
	ld   bc,4			; Attribute has 4 bytes:
        				; Vertical Position
                                        ; Horizontal Position
                                        ; Sprite ID
                                        ; Foreground (MSB) and Background (LSB)
                                        ; Colors, from 00 through FF
        
	call LDIRVM
	
        ld  a,(NextSpriteId)
	add a,1
        ld  (NextSpriteId),a
        
	pop af
        
        ret
