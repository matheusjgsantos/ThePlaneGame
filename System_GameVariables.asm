;Game Variables need to be stored at the RAM
	org 0B000h
        
Stage01_Sprites:
	dw PLANE_LEFT_01A,PLANE_LEFT_01B,PLANE_LEFT_01C,PLANE_LEFT_01D

Stage01_Attributes:
	dw PLANE_LEFT_01A_ATTRIB,PLANE_LEFT_01B_ATTRIB,PLANE_LEFT_01C_ATTRIB,PLANE_LEFT_01D_ATTRIB
        
PreviousJiffy:
	DW $0
NextSpriteId:
	db 0
LoadSpritePattern:
	dw 0
LoadSpriteAttrib:
	dw 0
LoadSpriteColor:
	db $01
        
Cloud01a_HorPosition:      
	db 0	
Cloud01b_HorPosition:      
	db 0	
Cloud02_HorPosition:      
	db 0	
Cloud03_HorPosition:      
	db 0	
        
PlaneRightVerPosition:
	DB $0
PlaneRightHorPosition:
	DB $0

Posicao:
	DW $0
Preenche:
	DW $0

Done:
	db 0