DisableKeyClick:
        ld hl,CLIKSW	; Loads the key click system variable 
        ld (hl),$00	; changes the variable vbalue to $00 (off)
        call CHGSND	; Calls the change sound BIOS routine
        
        ret
