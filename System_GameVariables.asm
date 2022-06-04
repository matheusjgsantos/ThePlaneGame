;Game Variables need to be stored at the RAM
	org 0B000h
        
PlaneRightVertical:
	DB $0
PlaneRightHorizontal:
	DB $0
Posicao:
	DW $0
Preenche:
	DW $0
PreviousJiffy:
	DW $0
nuvem01H:      
	db $10	; posisao horizontal do sprite da nuvem01
nuvem02H:      
	db $20	; posicao horizontal do sprite da nuvem02
nuvem03H:
	db $35  ; posicao horizontal fo sprite da nuvem03
Done:
	DB 1,0