#Leonardo Gast - lega4039
#Viggo Gustafsson - vigu2435

    .equ    RED_LED, 0x10000000    # Base address for red LEDs
    .equ    NUM_RED_LED, 18        # Number of red LEDs

    .text
    .global _start

_start:
    # Move base address of red LEDs to r16
    movia r16, RED_LED
    
    # Move number of red LEDs to r17
    movi r17, NUM_RED_LED
    
    # Set lowest bit in r18 to signify first red LED
    movi r18, 1

        
loop:
    # Branch to _start if r17 is equal to zero
    beq r17, r0, _start
    
    # Store the value in r18 to base address
    # of red LEDs (to light the corresponding
    # red LED)
    stwio r18, 0(r16)

    # Load 100 into register r4 (for 100 ms)
    movi r4, 100
    
    # Call paus_ms
    call    paus_ms
        
    # Shift register r18 to light to next
    # red LED
    slli r18, r18, 1

    # Decrement the number of remaining red
    # LEDs (this value is in register r17)
    subi r17, r17, 1
    
    # Branch to loop
    br      loop

loop_end:
    br      end
    
    
    
########################################################################
# paus (r4)                                                            #
# Pauses the program for some number of iterations.                    #
# r4: Number of iterations                                             #
########################################################################
paus:
    beq     r0, r4, end_paus
    subi    r4, r4, 0x1
    br      paus
end_paus:
    ret

    
        
########################################################################
# paus_ms (r4)                                                         #
# Pauses the program for some number of milliseconds.                  #
# r4: Number of milliseconds                                           #
########################################################################
paus_ms:
    # Convert milliseconds to 50 MHz ticks. If the number of
    # milliseconds are too big to fit within the limits of the
    # 32 bits available, then the timer must be repeated an
    # appropriate number of times.

    # Calculate milliseconds available
    nor     r8, r0, r0  # Set all bits in r8 to 1
    movui   r9, 0xC350  # Set r9 to 50 * 10^3
    divu    r8, r8, r9

    # Calculate the required number of timer loops
    divu    r8, r4, r8
    addi    r8, r8, 0x1  # r8 now contains the number of timer runs

    # Milliseconds per run
    divu    r9, r4, r8  # r9 now contains the number of milliseconds required per timer run

    # Calculate timer ticks
    movui   r11, 0xC350
    mul     r9, r9, r11

    # Set timer low bits
    movia   r10, 0x10002000  # Address of timer
    sthio   r9, 8(r10)       # Store lower values
    # Set timer high bits
    roli    r9, r9, 0x10
    sthio   r9, 12(r10)
    roli    r9, r9, 0x10  # Reset timer value

    # Set control register and start timer
    movui   r9, 0b110
    sthio   r9, 4(r10)

paus_timer_loop:
    beq     r0, r8, end_paus_ms  # End if r8 is zero

    # Reset TO bit
    ldhio   r9, 0(r10)
    andi    r9, r9, 0xFFFE
    sthio   r9, 0(r10)  # Set the TO bit to 0

paus_poll_to_loop:   
    ldhio   r9, 0(r10)
    andi    r9, r9, 0b1
    beq     r0, r9, paus_poll_to_loop
    subi    r8, r8, 0x1
    br      paus_timer_loop
        
end_paus_ms:
    ret
        
end:        
    .end
