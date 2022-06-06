mostra_nuvens:
	push af
        
        ld   a,8
        call CALPAT
        push hl
        pop  de

	ld   hl,nuvem01_pattern
	ld   bc,32		

	call LDIRVM
        
        
        ld   a,8
        call CALATR
        push hl
        pop  de
        
	ld   hl,nuvem01_attrib
	ld   bc,4
        
	call LDIRVM

        ld a,9
        call CALPAT
        push hl
        pop de

	ld hl,nuvem01b_pattern 	; Carrega o endereço do padrao da 
            			; nuvem01 em HL
	ld bc,32		; Numero de blocos a serem copiados pra VRAM

	call LDIRVM		; Transfere BC blocos da posicao HL da RAM
            			; para posicao DE da VRAM
                                
        ld a,9
        call CALATR
        push hl
        pop de
	ld hl,nuvem01b_attrib 	; Carrega o endereço do attributo da 
            			; nuvem01 em HL
	ld bc,4	
        
	call LDIRVM		; Transfere BC blocos da posicao HL da RAM
            			; para posicao DE da VRAM
                                
        ld a,10
        call CALPAT
        push hl
        pop de
        
	ld hl,nuvem02_pattern
        ld bc,32
	call LDIRVM
        
        
        ld   a,10
        call CALATR
        push hl
        pop  de       
        
        ld   hl,nuvem02_attrib
        ld   bc,4

        call LDIRVM
  
        ld   a,11
        call CALPAT
        push hl
        pop  de  
        ld   hl,nuvem03_pattern
        ld   bc,32

        call LDIRVM
 
 
        ld   a,11
        call CALATR
        push hl
        pop  de
        
        ld   hl,nuvem03_attrib
        ld   bc,4


        CALL LDIRVM
        
	ret	

movimenta_nuvem:
	ld a,8
        call CALATR
        inc hl
        
	ld a,(nuvem01H)		; carrega o valor definido em nuvem01H em A
        call WRTVRM
        
        sub a,1
        cp 8			; Compara A com 0 (inicio da tela)
	
        jp z,reset_nuvem01
        ld (nuvem01H),a
        
        ld a,9
        call CALATR
        inc hl
        
        ld a,(nuvem01bH)
        push af
        add a,16
        call WRTVRM
        pop af
        sub a,1			; Decrementa A
	cp 8			; Compara A com 0 (inicio da tela)
	
        jp z,reset_nuvem01b	; Se A = 0,chama rotina de reset do
            			; valor de nuvem_h para posicionar o sprite
                                ; no lado direito da tela
        ld (nuvem01bH),a
	
	ld a,10
        call CALATR
        inc hl
        
        ld a,(nuvem02H)		; carrega o valor definido em nuvem02H em A
	sub 1			; Subtrai 2 de A para movimentar o sprite 2
            			; mais rapido que os demais
	call WRTVRM		; Coloca na posical HL da VRAM o valor de A
	cp 8			; Compara A com 0 (inicio da tela)
	jp z,reset_nuvem02	; Se A = 0,chama rotina de reset do
            			; valor de nuvem_h para posicionar o sprite
                                ; no lado direito da tela
	ld (nuvem02H),a		; Coloca o valor de A em nuvem02H
        
        ld a,11
        call CALATR
        inc hl
        ld a,(nuvem03H)

        call WRTVRM
        
        sub 1
        cp 8
        jp z,reset_nuvem03
        ld (nuvem03H),a        
        
	ret			; Retorna pra origem da chamada

reset_nuvem01:			
	ld a,240-8		; Carrega 240 em A (fim da tela)
	ld (nuvem01H),a		; Coloca A em nuvem01H, resetando a posição
	ret			; Retorna pra origem da chamada

reset_nuvem01b:			
	;ld a,240-16		; Carrega 240 em A (fim da tela)
	ld a,(nuvem01H)
        cp 240-16
        ret nz
        ld (nuvem01bH),a	; Coloca A em nuvem01H, resetando a posição
	ret	

reset_nuvem02:
	ld a,240-8		; Carrega 240 em A (fim da tela)
	ld (nuvem02H),a		; Coloca A em nuvem01H, resetando a posição
	ret			; Retorna pra origem da chamada
        
reset_nuvem03:
	ld a,240-8		; Carrega 240 em A (fim da tela)
	ld (nuvem03H),a		; Coloca A em nuvem01H, resetando a posição
	ret			; Retorna pra origem da chamada

nuvem01_pattern:
              DB $00,$00,$00,$00,$00,$01,$00,$00
              DB $0F,$7F,$1F,$00,$00,$00,$00,$00
              DB $00,$00,$00,$02,$00,$00,$00,$41
              DB $83,$FF,$CE,$00,$00,$00,$00,$00

nuvem01b_pattern:              
              DB $00,$00,$00,$00,$0C,$3E,$7F,$FF
              DB $FF,$FF,$7F,$03,$00,$00,$00,$00
              DB $00,$00,$00,$00,$00,$1C,$3E,$FF
              DB $FF,$FF,$FE,$00,$00,$00,$00,$00
              
nuvem02_pattern:
              DB $00,$00,$00,$00,$00,$00,$00,$03
              DB $0F,$3F,$FF,$00,$00,$00,$00,$00
              DB $00,$00,$00,$00,$00,$00,$F0,$F8
              DB $F8,$FE,$FF,$00,$00,$00,$00,$00
              
nuvem03_pattern              
              DB $00,$00,$00,$00,$00,$1F,$3F,$7F
              DB $7F,$FF,$00,$00,$00,$00,$00,$00
              DB $00,$00,$00,$00,$00,$00,$8C,$9E
              DB $FE,$FF,$00,$00,$00,$00,$00,$00

nuvem01_attrib:
		DB 30,10,4*8,15
              
nuvem01b_attrib:
		DB 30,20,4*9,15

nuvem02_attrib:
		DB 100,20,4*10,15

nuvem03_attrib:
		DB 120,20,4*11,15