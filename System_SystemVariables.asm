;System variables
FORCLR: equ 0F3E9H; Foreground color
BAKCLR: equ 0F3EAH; Background color
BDRCLR: equ 0F3EBH; Border color
CLIKSW: equ 0xF3DB; Keyboard click sound state
GRPNAM:	equ 0F3C7H; Name Table Base - default value: 1800H
GRPCOL: equ 0F3C9H; Colour Table Base - default value: 2000H
GRPCGP: equ 0F3CBH; Character Pattern Base - default value: 0000H
GRPATR: equ 0F3CDH; Sprite Attribute Base - default value 1B00H
GRPPAT: equ 0F3CFH; Sprite Pattern Base - default value: 3800H
ATRBAS:	equ 0F928H; Sprite size (8x8 or 16x16) - default value 1B00H
GRPACX: equ 0FCB7H; Show or set the current row-position of the cursor
GRPACY: equ 0FCB9H; Show or set the Current column-position of the cursor
RG1SAV: equ 0F3E0H
