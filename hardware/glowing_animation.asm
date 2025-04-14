ORG 0

ResetBrightness:
	LOADI 0
	STORE BrightnessTicks ; initialize brightness to 0
	
Glow:
	LOAD BrightnessTicks
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
	JUMP IncreaseBrightness
	
	
	
IncreaseBrightness:
	LOAD BrightnessTicks
	ADD DecIncValue
	STORE BrightnessTicks ; BrightnessTicks = BrightnessTicks + 1
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
	CALL 	DELAY_1 ; call after increasing
	LOADI 100
	SUB BrightnessTicks ; Ac = 100 - Brightness Ticks
	JPOS IncreaseBrightness
	JZERO DecreaseBrightness
	JUMP ResetBrightness ; last resort 


DecreaseBrightness:
	LOAD BrightnessTicks
	SUB DecIncValue
	STORE BrightnessTicks ; BrightnessTicks = BrightnessTicks - 1
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
	CALL 	DELAY_1 ; call after increasing
	LOAD BrightnessTicks
	JPOS DecreaseBrightness
	JZERO IncreaseBrightness
	JUMP ResetBrightness ; last resort 

; ------ TIMER 1 second Delay SUBROUTINE ------
DELAY_1:
    OUT     Timer        ; Reset timer to 0
WAIT_1:
    IN      Timer        ; Read current timer value
	STORE 	TimerTicks1
    LOADI  	1		; 0.1 seconds
    SUB 	TimerTicks1    ; AC = 50 - TimerTicks
    JPOS	WAIT_1
    RETURN
; -----------------------------------------------
	
; Variables
BrightnessTicks:   DW 0
DecIncValue:		DW 2
TimerTicks1:   DW 0
	
; IO address constants
Switches:  EQU 000
Timer:     EQU 002
Hex0:      EQU 004
Hex1:      EQU 005
LED0:	EQU &H20
LED1: EQU &H21
LED2: EQU &H22
LED3: EQU &H23
LED4: EQU &H24
LED5: EQU &H25
LED6: EQU &H26
LED7: EQU &H27
LED8: EQU &H28
LED9: EQU &H29
