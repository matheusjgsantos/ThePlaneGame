mostra_nuvens:
	push af
        
        ld   a,8
        call CALPAT
        push hl
        pop  de

	ld   hl,CLOUD_01A_PATTERN
	ld   bc,32		

	call LDIRVM
        
        
        ld   a,8
        call CALATR
        push hl
        pop  de
        
	ld   hl,CLOUD_01A_ATTRIB
	ld   bc,4
        
	call LDIRVM

        ld a,9
        call CALPAT
        push hl
        pop de

	ld hl,CLOUD_01B_PATTERN
	ld bc,32		
        call LDIRVM
                                
        ld a,9
        call CALATR
        push hl
        pop de
	ld hl,CLOUD_01B_PATTERN
	ld bc,4	
        
	call LDIRVM
                                
        ld a,10
        call CALPAT
        push hl
        pop de
        
	ld hl,CLOUD_02_PATTERN
        ld bc,32
	call LDIRVM
        
        
        ld   a,10
        call CALATR
        push hl
        pop  de       
        
        ld   hl,CLOUD_02_ATTRIB
        ld   bc,4

        call LDIRVM
  
        ld a,11
        call CALPAT
        push hl
        pop de  
        ld hl,CLOUD_03_PATTERN
        ld bc,32

        call LDIRVM
 
 
        ld   a,11
        call CALATR
        push hl
        pop  de
        
        ld hl,CLOUD_03_ATTRIB
        ld bc,4


        CALL LDIRVM
        
	ret	

movimenta_nuvem:
	ld a,8
        call CALATR
        inc hl
        
	ld a,(Cloud01a_HorPosition)
	call WRTVRM
        
        ld a,9
        call CALATR
        
        push af
        add 16
        
        call WRTVRM
        
        pop af
        DEC A			; Decrementa A
	cp 8			; Compara A com 0 (inicio da tela)
	
        jp z,reset_nuvem01	; Se A = 0,chama rotina de reset do
            			; valor de nuvem_h para posicionar o sprite
                                ; no lado direito da tela
	ld (Cloud01a_HorPosition),a		; Coloca o valor de A em nuvem01H
        
	ld a,9
        call CALATR
        inc hl
        ;ld hl,SPR_ATT+(4*4+1)	; Coloca em HL a posicao da tabela de 	
          			; atributo de sprite + 9, que define a 
                                ; movimentacao horizontal do sprite 2
	ld a,(Cloud02_HorPosition)		; carrega o valor definido em nuvem02H em A
	sub 2			; Subtrai 2 de A para movimentar o sprite 2
            			; mais rapido que os demais
	call WRTVRM		; Coloca na posical HL da VRAM o valor de A
	cp 8			; Compara A com 0 (inicio da tela)
	jp z,reset_nuvem02	; Se A = 0,chama rotina de reset do
            			; valor de nuvem_h para posicionar o sprite
                                ; no lado direito da tela
	ld (Cloud02_HorPosition),a		; Coloca o valor de A em nuvem02H
        
        ld a,10
        call CALATR
        inc hl
        ld a,(Cloud02_HorPosition)
        call WRTVRM
        sub 1
        cp 8
        jp z,reset_nuvem03
        ld (Cloud03_HorPosition),a        
        
	ret			; Retorna pra origem da chamada

reset_nuvem01:			
	ld a,240-8
	ld (Cloud01a_HorPosition),a
        ld (Cloud01b_HorPosition),a
        ret

reset_nuvem02:
	ld a,240-8		; Carrega 240 em A (fim da tela)
	ld (Cloud02_HorPosition),a		; Coloca A em nuvem01H, resetando a posição
	ret			; Retorna pra origem da chamada
        
reset_nuvem03:
	ld a,240-8		; Carrega 240 em A (fim da tela)
	ld (Cloud03_HorPosition),a		; Coloca A em nuvem01H, resetando a posição
	ret			; Retorna pra origem da chamada

CLOUD_01A_PATTERN:
              DB $00,$00,$00,$00,$00,$01,$00,$00
              DB $0F,$7F,$1F,$00,$00,$00,$00,$00
              DB $00,$00,$00,$02,$00,$00,$00,$41
              DB $83,$FF,$CE,$00,$00,$00,$00,$00

CLOUD_01B_PATTERN:              
              DB $00,$00,$00,$00,$0C,$3E,$7F,$FF
              DB $FF,$FF,$7F,$03,$00,$00,$00,$00
              DB $00,$00,$00,$00,$00,$1C,$3E,$FF
              DB $FF,$FF,$FE,$00,$00,$00,$00,$00
              
CLOUD_02_PATTERN:
              DB $00,$00,$00,$00,$00,$00,$00,$03
              DB $0F,$3F,$FF,$00,$00,$00,$00,$00
              DB $00,$00,$00,$00,$00,$00,$F0,$F8
              DB $F8,$FE,$FF,$00,$00,$00,$00,$00
              
CLOUD_03_PATTERN:
              DB $00,$00,$00,$00,$00,$1F,$3F,$7F
              DB $7F,$FF,$00,$00,$00,$00,$00,$00
              DB $00,$00,$00,$00,$00,$00,$8C,$9E
              DB $FE,$FF,$00,$00,$00,$00,$00,$00

CLOUD_01A_ATTRIB:
		DB 30,10,4*8,15
              
CLOUD_01B_ATTRIB:
		DB 30,20,4*9,15

CLOUD_02_ATTRIB:
		DB 100,20,4*10,15

CLOUD_03_ATTRIB:
		DB 120,20,4*11,15