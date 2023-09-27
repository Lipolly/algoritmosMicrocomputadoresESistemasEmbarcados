
_main:

;Buzzer.c,15 :: 		void main ()
;Buzzer.c,20 :: 		trisc = 0xFD; // 0b11111101
	MOVLW       253
	MOVWF       TRISC+0 
;Buzzer.c,23 :: 		portc.rc1 = 1;
	BSF         PORTC+0, 1 
;Buzzer.c,26 :: 		while(1)
L_main0:
;Buzzer.c,29 :: 		portc.rc1 = ~portc.rc1;
	BTG         PORTC+0, 1 
;Buzzer.c,32 :: 		delay_ms(1000) ;
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;Buzzer.c,33 :: 		}
	GOTO        L_main0
;Buzzer.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
