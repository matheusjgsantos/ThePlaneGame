desenha_borda:     
				; primeira seçao da tela
        ld hl,frame_supesq_01a	; carrega o padrao do desenho da borda
            			; superior esquerda. Vamos carregar 1 bloco
        ld bc,8			; de 8x8 e colocar na VRAM na posicao do
        ld de,$0008		; Slot 1 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia dos dados pra VRAM
            
        ld hl,frame_supesq_01a
        ld bc,8
        ld de,$1008		; Slot 1 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM
            
        ld hl,frame_supesq_01b ; Esse é a segunda parte do desenho da
        ld bc,8			; borda. Vamos carregar um bloco de 8x8 no
        ld de,$0010		; slot 2 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
            
        ld hl,frame_supesq_01b ; Esse é a segunda parte do desenho da
        ld bc,8			; borda. Vamos carregar um bloco de 8x8 no
        ld de,$1010		; slot 2 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
                            
        ld hl,frame_superior_01a ;bloco 1 do frame superior
	ld bc,8			; bloco de 8x8
        ld de,$0018		; slot 3 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
            
        ld hl,frame_superior_01a ;bloco 1 do frame superior
	ld bc,8			; bloco de 8x8
        ld de,$1018		; slot 3 da tabela de padroes do 2o 3/3 da tela
        call LDIRVM		; Envia pra VRAM

        ld hl,frame_superior_01b ;bloco 2 do frame superior
        ld bc,8			; bloco 8x8
        ld de,$0020		; slot 4 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
            
        ld hl,frame_superior_01b ;bloco 2 do frame superior
        ld bc,8			; bloco 8x8
        ld de,$1020		; slot 4 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
            
        ld hl,frame_supdir_01a	; carrega a primeira parte da borda
            			; superior direita
        ld bc,8			; bloco de 8x8
        ld de,$0028		; slot 4 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; envia pra VRAM
            
        ld hl,frame_supdir_01b	; carrega a primeira parte da borda
            			; superior direita
        ld bc,8			; bloco de 8x8
        ld de,$1028		; slot 4 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; envia pra VRAM
            
        ld hl,frame_supdir_01b; carrega a segunda parte da borda
            			; superior direita
        ld bc,8			; 1 blocos de 8x8
        ld de,$0030		; slot 4 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; envia para VRAM
            
        ld hl,frame_supdir_01b; carrega a segunda parte da borda
            			; superior direita
        ld bc,8			; 1 blocos de 8x8
        ld de,$1030		; slot 4 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; envia para VRAM
            
        ld hl,frame_supesq_02a; carrega o padrao do desenho da borda
            				; superior esquerda. Vamos carregar 2 blocos
        ld bc,8			; de 8x8 e colocar na posição
        ld de,$0038		; slot 5 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia dos dados pra VRAM
            
        ld hl,frame_supesq_02a; carrega o padrao do desenho da borda
            				; superior esquerda. Vamos carregar 2 blocos
        ld bc,8			; de 8x8 e colocar na posição
        ld de,$1038		; slot 5 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; Envia dos dados pra VRAM
            
        ld hl,frame_supesq_02b ; Esse é a segunda parte do desenho da
        ld bc,8		; borda. Vamos carregar novamente dois blocos
            				; de 8x8 e colocar na posicao
        ld de,$0040		; slot 6 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
            
	ld hl,frame_supesq_02b ; Esse é a segunda parte do desenho da
        ld bc,8			; borda. Vamos carregar novamente dois blocos
            				; de 8x8 e colocar na posicao
        ld de,$1040		; slot 6 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; Envia pra VRAM
            
        ld hl,frame_supdir_02a; carrega a primeira parte da borda
            			; superior direita
        ld bc,8			; 2 blocos de 8x8
        ld de,$0048		; slot 7 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; envia pra VRAM
            
        ld hl,frame_supdir_02a	; carrega a primeira parte da borda
            			; superior direita
        ld bc,8			; 2 blocos de 8x8
        ld de,$1048		; slot 7 da tabela de padroes do 2o 1/3 da tela
        call LDIRVM		; envia pra VRAM
            
        ld hl, frame_supdir_02b	; carrega a segunda parte da borda
            			; superior direita
        ld bc,8			; bloco de 8x8
        ld de,$0050		; slot 8 da tabela de padroes do 1o 1/3 da tela 
        call LDIRVM		; envia para VRAM
            
        ld hl, frame_supdir_02b	; carrega a segunda parte da borda
            			; superior direita
        ld bc,8			; bloco de 8x8
        ld de,$1050		; slot 8 da tabela de padroes do 2o 1/3 da tela 
        call LDIRVM		; envia para VRAM
            
        ld hl,mapa_borda_superior ; Mapeia na tela a posicao de cada
            			; tile nas duas linhas superiores da tela
	ld bc,64		; 32 blocos de tiles por linha = 2 linhas
	ld de,$1800		; Endereco na VRAM referente a tabela de nomes
                                ; do 1o 1/3 da tela
	call LDIRVM		; envia para VRAM

        ld hl,frame_infesq_01a	; carrega o padrao do desenho da borda
        			; inferior esquerda. Vamos carregar 1 bloco
        ld bc,8			; de 8x8 e colocar na VRAM na posicao do
        ld de,$1058		; Slot 9 da tabela de padroes do 3o 1/3 da tela
        call LDIRVM		; Envia dos dados pra VRAM

        ld hl,frame_infesq_01b 	; Esse é a segunda parte do desenho da
        ld bc,8			; borda. Vamos carregar um bloco de 8x8 no
        ld de,$1060		; slot 10 da tabela de padroes do 3o 1/3 da tela
        call LDIRVM		; Envia pra VRAM

        ld hl,frame_inferior_01a ;bloco 1 do frame inferior
        ld bc,8			; bloco de 8x8
        ld de,$1068		; slot 11 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia pra VRAM

        ld hl,frame_inferior_01b ;bloco 2 do frame inferior
        ld bc,8			; bloco 8x8
        ld de,$1070		; slot 12 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; Envia pra VRAM

        ld hl,frame_infdir_01a	; carrega a primeira parte da borda
        			; superior direita
        ld bc,8			; bloco de 8x8
        ld de,$1078		; slot 13 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; envia pra VRAM

        ld hl, frame_infdir_01b	; carrega a segunda parte da borda
        			; superior direita
        ld bc,8			; 1 blocos de 8x8
        ld de,$1080		; slot 14 da tabela de padroes do 1o 1/3 da tela
        call LDIRVM		; envia para VRAM

        ld hl,frame_infesq_02a	; carrega o padrao do desenho da borda
        			; superior esquerda. Vamos carregar 2 blocos
        ld bc,8			; de 8x8 e colocar na posição
        ld de,$1088		; slot 5 da tabela de padroes do 3o 1/3 da tela
        call LDIRVM		; Envia dos dados pra VRAM

        ld hl,frame_infesq_02b 	; Esse é a segunda parte do desenho da
        ld bc,8			; borda. Vamos carregar novamente dois blocos
				; de 8x8 e colocar na posicao
        ld de,$1090		; slot 6 da tabela de padroes do 3o 1/3 da tela
        call LDIRVM		; Envia pra VRAM

        ld hl,frame_infdir_02a; carrega a primeira parte da borda
        			; superior direita
        ld bc,8			; 2 blocos de 8x8
        ld de,$1098		; slot 7 da tabela de padroes do 3o 1/3 da tela
        call LDIRVM		; envia pra VRAM

        ld hl, frame_infdir_02b	; carrega a segunda parte da borda
        			; superior direita
        ld bc,8			; bloco de 8x8
        ld de,$10a0		; slot 8 da tabela de padroes do 3o 1/3 da tela 
        call LDIRVM		; envia para VRAM

        ld hl,mapa_borda_inferior ; Mapeia na tela a posicao de cada
        			; tile nas duas linhas superiores da tela
        ld bc,64		; 32 blocos de tiles por linha = 2 linhas
        ld de,$1a00		; Endereco na VRAM referente a tabela de nomes
        			; do 3o 1/3 da tela
        call LDIRVM		; envia para VRAM

        ld hl,frame_esquerdo_01
        ld bc,8
        ld de,$0070		; slot 14 da tabela de padroes 1o 1/3 da tela
        call LDIRVM

        ld hl,frame_direito_01
        ld bc,8
        ld de,$0078		; slot 15 da tabela de padroes 1o 1/3 da tela
        call LDIRVM

        ld hl,frame_esquerdo_01
        ld bc,8
        ld de,$0870		; slot 14 da tabela de padroes 2o 1/3 da tela
        call LDIRVM

        ld hl,frame_direito_01
        ld bc,8
        ld de,$0878		; slot 15 da tabela de padroes 2o 1/3 da tela
        call LDIRVM

        ld b,14
        ld c,0
        ld hl,$1800+64
        ld (posicao),hl
        ld hl,mapa_laterais_secao1
        ld (preenche),hl 	; Aponta preenche para mapa_laterais_secao1 <- MUITO IMPORTANTE
        call desenha_laterais_secao

        			; Segunda seçao da tela  
        ld hl,mapa_borda_superior ; Mapeia na tela a posicao de cada
        			; tile nas duas linhas superiores da tela
        ld bc,64		; 32 blocos de tiles por linha = 2 linhas
        ld de,$1a00+64		; Endereco na VRAM referente a tabela de nomes
        			; do 1o 1/3 da tela
        call LDIRVM		; envia para VRAM

        ld hl,mapa_borda_inferior ; Mapeia na tela a posicao de cada
        			; tile nas duas linhas superiores da tela
        ld bc,64		; 32 blocos de tiles por linha = 2 linhas
        ld de,$1aff-63		; Endereco na VRAM referente a tabela de nomes
        			; do 1o 1/3 da tela
        call LDIRVM		; envia para VRAM  

        ld hl,frame_esquerdo_01
        ld bc,8
        ld de,$10a8		; slot 9 da tabela de padroes 3o 1/3 da tela
        call LDIRVM

        ld hl,frame_direito_01
        ld bc,8
        ld de,$10b0		; slot 10 da tabela de padroes 3o 1/3 da tela
        call LDIRVM

        ld b,2
        ld c,0
        ld hl,$1a00+128
        ld (posicao),hl
        ld hl,mapa_laterais_secao2
        ld (preenche),hl 	; Aponta preenche para mapa_laterais_secao2 <- MUITO IMPORTANTE
        call desenha_laterais_secao

        ret

desenha_laterais_secao:
        push bc
        ld hl,(preenche)
        ld bc,32
        ld de,(posicao)
        call LDIRVM
        ld hl,(posicao)
        ld de,32
        ADD HL,DE
        ld (posicao),hl
        POP BC
        djnz desenha_laterais_secao

	ret

