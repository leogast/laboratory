
############################## DEFINITIONS #############################
        .equ    JTAG_DATA, 0x10001000   # Base address to the JTAG data register
        .equ    JTAG_CTRL, 0x10001004   # Base address to the JTAG control register

        .equ    LCD_INST, 0x10003050    # Base address to the LCD instruction register
        .equ    LCD_DATA, 0x10003051    # Base address to the LCD data register

        .equ    RS232_DATA, 0x10001010  # Base address to the RS-232 data register
        .equ    RS232_CTRL, 0x10001014  # Base address to the RS-232 control register

        
############################# CODE SEGMENT #############################

        .text
        .global _start

_start:
        #
        # SKRIV ER EGEN KOD HÄR
        #

        ######################## JTAG FUNCTIONS ########################

        ################################################################
        # jtag_get                                                     #
        # Returns JTAG input.                                          #
        # Arguments: none                                              #
        # Returns:                                                     #
        #   r2  The data in bit field [0,7] of the                     #
        #       JTAG DATA register.                                    #
        ################################################################
jtag_get:
        #
        # SKRIV ER EGEN KOD HÄR
        #
        
        
        ################################################################
        # jtag_put                                                     #
        # Writes a character to the JTAG port if there is space        #
        # available in the FIFO.                                       #
        # Arguments:                                                   #
        #   r4  The character to write                                 #
        ################################################################
jtag_put:
        #
        # SKRIV ER EGEN KOD HÄR
        #
        
jtag_put_end:
        ret

        
        ####################### RS-232 FUNCTIONS #######################
        
        ################################################################
        # rs232_get                                                    #
        # Returns RS-232 input.                                        #
        # Arguments: none                                              #
        # Returns:                                                     #
        #   r2  The data in bit field [0,7] of the                     #
        #       RS-232 DATA register.                                  #
        ################################################################
rs232_get:
        #
        # SKRIV ER EGEN KOD HÄR
        #

        
        ################################################################
        # rs232_put                                                    #
        # Writes a character to the RS-232 port if there is space      #
        # available in the FIFO.                                       #
        # Arguments:                                                   #
        #   r4  The character to write                                 #
        ################################################################
rs232_put:
        #
        # SKRIV ER EGEN KOD HÄR
        #


rs232_end_put:
        ret
        
        
        ######################## LCD FUNCTIONS #########################

        ################################################################
        # lcd_cursor_off                                               #
        # Turns off the LCD cursor.                                    #
        # Arguments: none                                              #
        ################################################################
lcd_cursor_off:
        movia   r8, LCD_INST    # Turn off LCD cursor
        movui   r9, 0x000C
        stbio   r9, 0(r8)
        
        ret
        
        
        ################################################################
        # lcd_put                                                      #
        # Prints a character at a given position on the LCD.           #
        # Arguments:                                                   #
        #   r4  The line (0: line one, 1: line two)                    #
        #   r5  The position on the line (0, 1, ... or 15)             #
        #   r6  The character to print                                 #
        ################################################################        
lcd_put:
        # Set cursor position
        slli    r8, r4, 7       # Shift line bit to position 6
        or      r8, r8, r5      # Concatenate line bit and positions bits
        ori     r8, r8, 0x80    # Set instruction bit
        movia   r9, LCD_INST
        stbio   r8, 0(r9)
        
        movia   r10, LCD_DATA    # Print character
        stbio   r6, 0(r10)
        
        ret

end:
        .end
        
