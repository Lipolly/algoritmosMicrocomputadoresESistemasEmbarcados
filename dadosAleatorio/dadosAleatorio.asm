
_main:

;dadosAleatorio.c,1 :: 		void main (){
;dadosAleatorio.c,2 :: 		int aleatorioB = 0;
	CLRF        main_aleatorioB_L0+0 
	CLRF        main_aleatorioB_L0+1 
	CLRF        main_aleatorioD_L0+0 
	CLRF        main_aleatorioD_L0+1 
;dadosAleatorio.c,4 :: 		trisb = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;dadosAleatorio.c,5 :: 		trisc = 0xFD;
	MOVLW       253
	MOVWF       TRISC+0 
;dadosAleatorio.c,6 :: 		trisd = 0;
	CLRF        TRISD+0 
;dadosAleatorio.c,7 :: 		portc.rc1 = 1;
	BSF         PORTC+0, 1 
;dadosAleatorio.c,8 :: 		while(1){
L_main0:
;dadosAleatorio.c,9 :: 		if(portb.rb0 == 0){
	BTFSC       PORTB+0, 0 
	GOTO        L_main2
;dadosAleatorio.c,10 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;dadosAleatorio.c,11 :: 		portb = 255;
	MOVLW       255
	MOVWF       PORTB+0 
;dadosAleatorio.c,12 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;dadosAleatorio.c,13 :: 		if(portb.rb0 == 1){
	BTFSS       PORTB+0, 0 
	GOTO        L_main4
;dadosAleatorio.c,14 :: 		portd = 0;
	CLRF        PORTD+0 
;dadosAleatorio.c,15 :: 		portb = 0;
	CLRF        PORTB+0 
;dadosAleatorio.c,16 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;dadosAleatorio.c,17 :: 		aleatorioD = (rand()%6)+1;
	CALL        _rand+0, 0
	MOVLW       6
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       main_aleatorioD_L0+0 
	MOVF        R3, 0 
	MOVWF       main_aleatorioD_L0+1 
;dadosAleatorio.c,18 :: 		if(aleatorioD == 1){
	MOVLW       0
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVLW       1
	XORWF       R2, 0 
L__main37:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;dadosAleatorio.c,19 :: 		portd.rd1 = 255;
	BSF         PORTD+0, 1 
;dadosAleatorio.c,20 :: 		}
	GOTO        L_main7
L_main6:
;dadosAleatorio.c,21 :: 		else if(aleatorioD == 2){
	MOVLW       0
	XORWF       main_aleatorioD_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       2
	XORWF       main_aleatorioD_L0+0, 0 
L__main38:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;dadosAleatorio.c,22 :: 		portd.rd2 = 255;
	BSF         PORTD+0, 2 
;dadosAleatorio.c,23 :: 		}
	GOTO        L_main9
L_main8:
;dadosAleatorio.c,24 :: 		else if(aleatorioD == 3){
	MOVLW       0
	XORWF       main_aleatorioD_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVLW       3
	XORWF       main_aleatorioD_L0+0, 0 
L__main39:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;dadosAleatorio.c,25 :: 		portd.rd3 = 255;
	BSF         PORTD+0, 3 
;dadosAleatorio.c,26 :: 		}
	GOTO        L_main11
L_main10:
;dadosAleatorio.c,27 :: 		else if(aleatorioD == 4){
	MOVLW       0
	XORWF       main_aleatorioD_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main40
	MOVLW       4
	XORWF       main_aleatorioD_L0+0, 0 
L__main40:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;dadosAleatorio.c,28 :: 		portd.rd4 = 255;
	BSF         PORTD+0, 4 
;dadosAleatorio.c,29 :: 		}
	GOTO        L_main13
L_main12:
;dadosAleatorio.c,30 :: 		else if(aleatorioD == 5){
	MOVLW       0
	XORWF       main_aleatorioD_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main41
	MOVLW       5
	XORWF       main_aleatorioD_L0+0, 0 
L__main41:
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;dadosAleatorio.c,31 :: 		portd.rd5 = 255;
	BSF         PORTD+0, 5 
;dadosAleatorio.c,32 :: 		}
	GOTO        L_main15
L_main14:
;dadosAleatorio.c,33 :: 		else if(aleatorioD == 6){
	MOVLW       0
	XORWF       main_aleatorioD_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVLW       6
	XORWF       main_aleatorioD_L0+0, 0 
L__main42:
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
;dadosAleatorio.c,34 :: 		portd.rd6 = 255;
	BSF         PORTD+0, 6 
;dadosAleatorio.c,35 :: 		};
L_main16:
L_main15:
L_main13:
L_main11:
L_main9:
L_main7:
;dadosAleatorio.c,36 :: 		aleatorioB = (rand()%6)+1;
	CALL        _rand+0, 0
	MOVLW       6
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       main_aleatorioB_L0+0 
	MOVF        R3, 0 
	MOVWF       main_aleatorioB_L0+1 
;dadosAleatorio.c,37 :: 		if(aleatorioB == 1){
	MOVLW       0
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVLW       1
	XORWF       R2, 0 
L__main43:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;dadosAleatorio.c,38 :: 		portb.rb1 = 255;
	BSF         PORTB+0, 1 
;dadosAleatorio.c,39 :: 		}
	GOTO        L_main18
L_main17:
;dadosAleatorio.c,40 :: 		else if(aleatorioB == 2){
	MOVLW       0
	XORWF       main_aleatorioB_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main44
	MOVLW       2
	XORWF       main_aleatorioB_L0+0, 0 
L__main44:
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;dadosAleatorio.c,41 :: 		portb.rb2 = 255;
	BSF         PORTB+0, 2 
;dadosAleatorio.c,42 :: 		}
	GOTO        L_main20
L_main19:
;dadosAleatorio.c,43 :: 		else if(aleatorioB == 3){
	MOVLW       0
	XORWF       main_aleatorioB_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main45
	MOVLW       3
	XORWF       main_aleatorioB_L0+0, 0 
L__main45:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;dadosAleatorio.c,44 :: 		portb.rb3 = 255;
	BSF         PORTB+0, 3 
;dadosAleatorio.c,45 :: 		}
	GOTO        L_main22
L_main21:
;dadosAleatorio.c,46 :: 		else if(aleatorioB == 4){
	MOVLW       0
	XORWF       main_aleatorioB_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
	MOVLW       4
	XORWF       main_aleatorioB_L0+0, 0 
L__main46:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;dadosAleatorio.c,47 :: 		portb.rb4 = 255;
	BSF         PORTB+0, 4 
;dadosAleatorio.c,48 :: 		}
	GOTO        L_main24
L_main23:
;dadosAleatorio.c,49 :: 		else if(aleatorioB == 5){
	MOVLW       0
	XORWF       main_aleatorioB_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVLW       5
	XORWF       main_aleatorioB_L0+0, 0 
L__main47:
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
;dadosAleatorio.c,50 :: 		portb.rb5 = 255;
	BSF         PORTB+0, 5 
;dadosAleatorio.c,51 :: 		}
	GOTO        L_main26
L_main25:
;dadosAleatorio.c,52 :: 		else if(aleatorioB == 6){
	MOVLW       0
	XORWF       main_aleatorioB_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       6
	XORWF       main_aleatorioB_L0+0, 0 
L__main48:
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
;dadosAleatorio.c,53 :: 		portb.rb6 = 255;
	BSF         PORTB+0, 6 
;dadosAleatorio.c,54 :: 		};
L_main27:
L_main26:
L_main24:
L_main22:
L_main20:
L_main18:
;dadosAleatorio.c,57 :: 		if((aleatorioB == 6) && (aleatorioB == aleatorioD)){
	MOVLW       0
	XORWF       main_aleatorioB_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVLW       6
	XORWF       main_aleatorioB_L0+0, 0 
L__main49:
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
	MOVF        main_aleatorioB_L0+1, 0 
	XORWF       main_aleatorioD_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	MOVF        main_aleatorioD_L0+0, 0 
	XORWF       main_aleatorioB_L0+0, 0 
L__main50:
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
L__main35:
;dadosAleatorio.c,58 :: 		portc.rc1 = 1;
	BSF         PORTC+0, 1 
;dadosAleatorio.c,59 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
	NOP
;dadosAleatorio.c,60 :: 		portc.rc1 = 0;
	BCF         PORTC+0, 1 
;dadosAleatorio.c,61 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
	NOP
;dadosAleatorio.c,62 :: 		portc.rc1 = 1;
	BSF         PORTC+0, 1 
;dadosAleatorio.c,63 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
	NOP
;dadosAleatorio.c,64 :: 		portc.rc1 = 0;
	BCF         PORTC+0, 1 
;dadosAleatorio.c,65 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
	NOP
;dadosAleatorio.c,66 :: 		};
L_main30:
;dadosAleatorio.c,67 :: 		}
L_main4:
;dadosAleatorio.c,68 :: 		}
L_main2:
;dadosAleatorio.c,69 :: 		}
	GOTO        L_main0
;dadosAleatorio.c,70 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
