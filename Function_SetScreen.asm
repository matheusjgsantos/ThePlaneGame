; Fill the name table with zeros, setting the whole screen to tile 0 (empty)
InitGraphicMode:
	ld hl,FORCLR
        ld (hl),b
        ld hl,BAKCLR
        ld (hl),c
        ld hl,BDRCLR
        ld (hl),d
        call INIGRP
        
        ret
        
SetSpriteSize16x16:
        ld a,(RG1SAV)	; Carrega em A o valor atual do registrador 1 
            		; do VDP
        and $FC		; Altera valor de A para xxxxxx00 
            		; (x=sem mudança)
        or $02
		; Altera valor de A para xxxxxx10
        di		; Desabilita as interrupçoes 
        ld b, a		; Coloca em B o valor a ser escrito no 
        		; registrador do VDP
        ld c, $01	; Coloca em C o valor do registrador alvo
        call WRTVDP	; Envia para o registrador C os dados em B
        ei		; Habilita novamente as interrupções
        
        ret

ResetNameTable:
	ld hl,1800H
        ld a,$0
        ld bc,$37F
        call FILVRM
        
        ret
