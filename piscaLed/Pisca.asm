
_main:

;Pisca.c,1 :: 		void main(){
;Pisca.c,2 :: 		trisb = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;Pisca.c,3 :: 		trisd = 0;
	CLRF        TRISD+0 
;Pisca.c,5 :: 		while(1){
L_main0:
;Pisca.c,6 :: 		while(portb.rb0 == 0){
L_main2:
	BTFSC       PORTB+0, 0 
	GOTO        L_main3
;Pisca.c,7 :: 		portd = 0;
	CLRF        PORTD+0 
;Pisca.c,8 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;Pisca.c,9 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;Pisca.c,10 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;Pisca.c,11 :: 		}
	GOTO        L_main2
L_main3:
;Pisca.c,12 :: 		}
	GOTO        L_main0
;Pisca.c,13 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
