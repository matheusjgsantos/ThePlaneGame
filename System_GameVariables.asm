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
        
Done:
	DB 1,0