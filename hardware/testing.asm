ORG 0
; ----- WAITLOOP Code ---------------
WaitLoop:
	; Get and store the switch values
	IN		Switches
	STORE	Pattern ; pattern is where we have the value
	;------------- here we call subroutine to check if all 10 bits down 
	JZERO 	All10Down
    JUMP 	WaitLoop ; else continue waiting
	
; ---- All10Down Code Block ------
All10Down: ; 
	LOADI   0 ; reset all leds to 0
	OUT 	Hex0 ; reset hex value
    OUT     LED0
	OUT     LED1
	OUT     LED2
	OUT     LED3
	OUT     LED4
	OUT     LED5
	OUT     LED6
	OUT     LED7
	OUT     LED8
	OUT     LED9
	
	IN 		Switches
	SUB Bit9
	JZERO Bit9Startup ; basically if only Bit 9 is high
	
	IN 		Switches
	SUB Bit8
	JZERO Bit8Startup ; basically if only Bit 0 is high
	
	IN 		Switches
	SUB Bit7
	JZERO Bit7Startup ; basically if only Bit 0 is high
	
	JUMP All10Down ; else wait until only Bit9 is high 
; ------- End Code Block ----------


; ------ Bit9Startup Demo Code subroutine ----
Bit9Startup:
    LOADI   0 ; load value 
    OUT     LED0 ; output to LED
	OUT 	Hex0 ; display intensity value on hex
    CALL    DELAY ; wait a second
	
	LOADI   10 ; repeat for all 10 leds
    OUT     LED1
	OUT 	Hex0
    CALL    DELAY

    LOADI  	20
    OUT     LED2
	OUT 	Hex0
    CALL    DELAY

    LOADI   30
    OUT     LED3
	OUT 	Hex0
    CALL    DELAY
	
    LOADI   40
    OUT     LED4
	OUT 	Hex0
    CALL    DELAY
	
    LOADI   50
    OUT     LED5
	OUT 	Hex0
    CALL    DELAY
	
    LOADI   60
    OUT     LED6
	OUT 	Hex0
    CALL    DELAY
	
    LOADI   70
    OUT     LED7
	OUT 	Hex0
    CALL    DELAY
	
	LOADI   80
    OUT     LED8
	OUT 	Hex0
    CALL    DELAY
	
	LOADI   90
    OUT     LED9
	OUT 	Hex0
    CALL    DELAY
	
	
	LOADI   0 ; reset all leds to 0
    OUT     LED0
	OUT     LED1
	OUT     LED2
	OUT     LED3
	OUT     LED4
	OUT     LED5
	OUT     LED6
	OUT     LED7
	OUT     LED8
	OUT     LED9
	
	IN 		Switches
	JZERO All10Down ; we always have to go to all 10 down before going to a different section
	JUMP Bit9Startup
; -----------------------------------------------


; ------ Bit8Startup Demo Code subroutine ----
Bit8Startup:
	
	LOADI 0
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_ZERO
	JPOS MOD_DONE_ZERO
	
	LOAD RESULT
	
	MOD_DONE_ZERO:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED0
	
	LOADI 1
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_ONE
	JPOS MOD_DONE_ONE
	
	LOAD RESULT
	
	MOD_DONE_ONE:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED1
	
	LOADI 2
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_TWO
	JPOS MOD_DONE_TWO
	
	LOAD RESULT
	
	MOD_DONE_TWO:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED2
	
	LOADI 3
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_THREE
	JPOS MOD_DONE_THREE
	
	LOAD RESULT
	
	MOD_DONE_THREE:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED3
	
	LOADI 4
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_FOUR
	JPOS MOD_DONE_FOUR
	
	LOAD RESULT
	
	MOD_DONE_FOUR:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED4
	
	LOADI 5
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_FIVE
	JPOS MOD_DONE_FIVE
	
	LOAD RESULT
	
	MOD_DONE_FIVE:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED5
	
	LOADI 6
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_SIX
	JPOS MOD_DONE_SIX
	
	LOAD RESULT
	
	MOD_DONE_SIX:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED6
	
	LOADI 7
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_SEVEN
	JPOS MOD_DONE_SEVEN
	
	LOAD RESULT
	
	MOD_DONE_SEVEN:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED7
	
	LOADI 8
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_EIGHT
	JPOS MOD_DONE_EIGHT
	
	LOAD RESULT
	
	MOD_DONE_EIGHT:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED8
	
	LOADI 9
	ADD OFFSET
	STORE RESULT
	
	SUB NUM_LEDS
	JZERO MOD_DONE_NINE
	JPOS MOD_DONE_NINE
	
	LOAD RESULT
	
	MOD_DONE_NINE:
	ADD BRIGHTNESS_START
	
	STORE ADDRESS
	ILOAD ADDRESS
	
	OUT LED9
	; Done with LEDS
	
	LOAD OFFSET
	ADDI 1
	STORE RESULT
	
	SUB NUM_LEDS
	
	JZERO MOD_DONE_END
	JPOS MOD_DONE_END
	
	LOAD RESULT
	
	MOD_DONE_END:
	STORE OFFSET
	
	IN 		Switches ; necessary to exit subroutine
	JZERO All10Down ; we always have to go to all 10 down before going to a different section
	
	LOAD DELAY_COUNT
	DELAY_Counting:
		STORE OUT_COUNT
		LOAD DELAY_COUNT
		IN_DELAY:
			ADDI -1
			JPOS IN_DELAY
		LOAD OUT_COUNT
		ADDI -1
		JPOS DELAY_Counting

	JUMP Bit8Startup
; -----------------------------------------------

Bit7Startup:
Loop8: JUMP Loop8

; ------ TIMER 5 second Delay SUBROUTINE ------
DELAY:
    OUT     Timer        ; Reset timer to 0
WAIT:
    IN      Timer        ; Read current timer value
	STORE TimerTicks
    LOADI  	10		; 1.5 seconds
    SUB 	TimerTicks    ; AC = 50 - TimerTicks
    JPOs    WAIT
    RETURN
; -----------------------------------------------



; Variables
TimerTicks:   DW 0
Pattern: DW 0

; Wave Variables
NUM_LEDS: DW 10
OFFSET: DW 0
BRIGHTNESS_START: DW &H700
RESULT: DW 0
ADDRESS: DW 0
DELAY_COUNT: DW 1000
OUT_COUNT: DW 0

; Wave Vector Values
ORG &H700
	DW 20
	DW 40
	DW 60
	DW 80
	DW 100
	DW 80
	DW 60
	DW 40
	DW 20
	
; Switch Values
Bit9:      DW &B1000000000 ; useful for starting Vector Subroutine
Bit8:      DW &B0100000000 ; useful for starting Demo Subroutine
Bit7:      DW &B0010000000 ; useful for starting GLow Subroutine

; IO address constants
Switches:  EQU 000
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
LED0: EQU &H20
LED1: EQU &H21
LED2: EQU &H22
LED3: EQU &H23
LED4: EQU &H24
LED5: EQU &H25
LED6: EQU &H26
LED7: EQU &H27
LED8: EQU &H28
LED9: EQU &H29