;Game Variables need to be stored at the RAM
	org 0B000h
        
PlaneRightVertical:
	DB $0
PlaneRightHorizontal:
	DB $0
nuvem01H:      
	db $0	; posisao horizontal do sprite da nuvem01
nuvem01bH:      
	db $0	; posisao horizontal do sprite da nuvem01
nuvem02H:      
	db $0	; posicao horizontal do sprite da nuvem02
nuvem03H:
	db $0  ; posicao horizontal fo sprite da nuvem03
Posicao:
	DW $0
Preenche:
	DW $0
PreviousJiffy:
	DW $0
Done:
	DB 1,0