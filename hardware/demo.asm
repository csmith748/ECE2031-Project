ORG 0
	
LOOP:
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
	
	LOAD DELAY_COUNT
	DELAY:
		STORE OUT_COUNT
		LOAD DELAY_COUNT
		IN_DELAY:
			ADDI -1
			JPOS IN_DELAY
		LOAD OUT_COUNT
		ADDI -1
		JPOS DELAY
	
	
	JUMP LOOP
	

NUM_LEDS: DW 10
OFFSET: DW 0
BRIGHTNESS_START: DW &H90
RESULT: DW 0
ADDRESS: DW 0
DELAY_COUNT: DW 1000
OUT_COUNT: DW 0

ORG &H90
	DW 20
	DW 40
	DW 60
	DW 80
	DW 100
	DW 80
	DW 60
	DW 40
	DW 20

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
