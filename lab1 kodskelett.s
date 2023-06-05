.equ		GREEN_LEDS,		0x10000010

.text

.global _start

_start:

end:
    .end


# Här kan ni definiera eventuella uttryck med direktivet .equ
	    # Exempelvis adressen till de gröna lysdioderna:
	    # .equ    GREEN_LEDS, 0x10000010

	    # Allting som följer efter ett #-tecken på en rad räknas
	    # som en kommentar.

	    .text           # Det som följer tolkas som exekverbar kod

	    .global _start  # Gör etiketten _start synlig även utanför
	                    # den aktuella objektfilen

	_start:
	    # Skriv din kod här
	    # ...

	end:                # Etikett som kan användas för att hoppa till
	    .end            # slutet av programmet	    