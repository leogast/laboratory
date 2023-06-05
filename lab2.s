#Leonardo Gast - lega4039
#Viggo Gustafsson - vigu2435       

       
        .equ    JTAG_DATA, 0x10001000
        .equ    JTAG_CTRL, 0x10001004

        .equ    LCD_INST, 0x10003050
        .equ    LCD_DATA, 0x10003051

        .equ    RS232_DATA, 0x10001010
        .equ    RS232_CTRL, 0x10001014

        .text
        .global _start

_start: 
        call    turn_lcd_off    # Turn off LCD cursor
        br      main
        
main:
        movia   r16, JTAG_DATA          # Check for JTAG input
        ldwio   r8, 0(r16)
        andi    r8, r8, 0x8000
        beq     r0, r8, check_rs232     #If JTAG DATA RVALID is false, go to check_rs232

        call    get_jtag        # Read character from JTAG
        call    put_jtag        # Echo character to terminal over JTAG
        mov     r4, r2
        call    put_rs232       # Send character over RS-232   
        call    put_lcd         # Display character on the LCD (upper left corner)

check_rs232:    
        movia   r8, RS232_DATA          # Check for RS-232 input
        ldbio   r9, 1(r8)               
        andi    r9, r9, 0x8000
        beq     r0, r9, end_main        ## r9, r0 ? #If RS-232 DATA RVALID is false, back to main

        call    get_rs232       # Read character from RS-232
        call    put_jtag        # Send character to terminal over JTAG
        call    put_lcd2        # Display character on the LCD (upper right corner)

end_main:       
        br      main



get_jtag:
        movia   r8, JTAG_DATA   ## Read JTAG data
        ldbio   r2, 0(r8)
        ret
	  
get_rs232:
        movia   r8, RS232_DATA  # Read RS-232 data
        ldbio   r2, 0(r8)
        ret

put_rs232:
        movia   r8, RS232_CTRL  # Check available space in FIFO
        ldwio   r8, 0(r8)
        srli    r8, r8, 16
        ori     r8, r8, 0x0000
        beq     r0, r8, end_put_rs232

        movia   r8, RS232_DATA  # Write character to FIFO
        stbio   r4, 0(r8)
	ret

end_put_rs232:
        ret

put_jtag:  
	movia   r8, JTAG_DATA
	stwio   r2, 0(r8)
	ret

put_lcd:
	movia   r8, 0x0080      # Display JTAG input on LCD
        movia   r9, LCD_INST
        stbio   r8, 0(r9)
        movia   r9, LCD_DATA
        stbio   r2, 0(r9)
	ret

put_lcd2:
	movia   r8, LCD_INST    # Display RS-232 input on LCD
        movui   r9, 0x008F
        stbio   r9, 0(r8)
        movia   r8, LCD_DATA
        stbio   r2, 0(r8)
	ret		

turn_lcd_off:        
	movia   r8, LCD_INST    # Turn off LCD cursor
        movui   r9, 0x000C
        stbio   r9, 0(r8)
        ret
        .end
        
