;BIOS calls
CHGSND: equ 0x0135; Enable or disable the keyboard click sound
INIGRP: equ 00072H; Initialize the Graphic mode (Screen 2)
FILVRM: equ 00056H; Fills the VRAM at address DE with content from A
LDIRVM: equ 0005CH; Transfere um bloco de tamanho BC do endereço em DE na RAM para o endereço em HL na VRAM
LDIRMV: equ 00059H
CHGMOD: equ 0005FH
CHGET:  equ 0009FH
CHPUT:  equ 000A2H
CALPAT: equ 00084H; Function : Returns the address of the sprite pattern table
		  ; Input    : A  - Sprite ID
		  ; Output   : HL - For the address
		  ; Registers: AF, DE, HL
CALATR: equ 00087H; Function : Returns the address of the sprite attribute table
		  ; Input    : A  - Sprite number
		  ; Output   : HL - For the address
		  ; Registers: AF, DE, HL
WRTVDP: equ 00047h; Function : Write data in the VDP-register
		  ; Input    : B  - Data to write
           	  ; C  - Number of the register
		  ; Registers: AF, BC
GTSTCK: equ 000D5H; Retorna status do joystick
                  ; Entrada: A  - numero do joystick
                  ; 0 = cursors, 
                  ; 1 = joystick na porta 1
                  ; 2 = joystick na porta 2
                  ; Saida: A  - Direcao
WRTVRM:	equ 0004Dh
		  ; Function : Writes data in VRAM
                  ; Input    : HL - Address write
                  ;            A  - Value write
                  ; Registers: AF
