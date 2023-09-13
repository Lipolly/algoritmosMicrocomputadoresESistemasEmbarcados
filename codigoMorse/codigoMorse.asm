
_apaga:

;codigoMorse.c,1 :: 		void apaga(){
;codigoMorse.c,2 :: 		portd = 0;
	CLRF        PORTD+0 
;codigoMorse.c,3 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_apaga0:
	DECFSZ      R13, 1, 1
	BRA         L_apaga0
	DECFSZ      R12, 1, 1
	BRA         L_apaga0
	DECFSZ      R11, 1, 1
	BRA         L_apaga0
	NOP
	NOP
;codigoMorse.c,4 :: 		}
L_end_apaga:
	RETURN      0
; end of _apaga

_ponto:

;codigoMorse.c,6 :: 		void ponto(int apaga){
;codigoMorse.c,7 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;codigoMorse.c,8 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_ponto1:
	DECFSZ      R13, 1, 1
	BRA         L_ponto1
	DECFSZ      R12, 1, 1
	BRA         L_ponto1
	DECFSZ      R11, 1, 1
	BRA         L_ponto1
;codigoMorse.c,9 :: 		if(apaga){
	MOVF        FARG_ponto_apaga+0, 0 
	IORWF       FARG_ponto_apaga+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_ponto2
;codigoMorse.c,10 :: 		apaga();
	CALL        _apaga+0, 0
;codigoMorse.c,11 :: 		}
L_ponto2:
;codigoMorse.c,12 :: 		}
L_end_ponto:
	RETURN      0
; end of _ponto

_traco:

;codigoMorse.c,14 :: 		void traco(int apaga){
;codigoMorse.c,15 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;codigoMorse.c,16 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_traco3:
	DECFSZ      R13, 1, 1
	BRA         L_traco3
	DECFSZ      R12, 1, 1
	BRA         L_traco3
	DECFSZ      R11, 1, 1
	BRA         L_traco3
	NOP
;codigoMorse.c,17 :: 		if(apaga){
	MOVF        FARG_traco_apaga+0, 0 
	IORWF       FARG_traco_apaga+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_traco4
;codigoMorse.c,18 :: 		apaga();
	CALL        _apaga+0, 0
;codigoMorse.c,19 :: 		}
L_traco4:
;codigoMorse.c,20 :: 		}
L_end_traco:
	RETURN      0
; end of _traco

_espaco:

;codigoMorse.c,22 :: 		void espaco(){
;codigoMorse.c,23 :: 		portd = 0;
	CLRF        PORTD+0 
;codigoMorse.c,24 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_espaco5:
	DECFSZ      R13, 1, 1
	BRA         L_espaco5
	DECFSZ      R12, 1, 1
	BRA         L_espaco5
	DECFSZ      R11, 1, 1
	BRA         L_espaco5
;codigoMorse.c,25 :: 		}
L_end_espaco:
	RETURN      0
; end of _espaco

_main:

;codigoMorse.c,27 :: 		void main() {
;codigoMorse.c,28 :: 		trisb = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;codigoMorse.c,29 :: 		trisd = 0;
	CLRF        TRISD+0 
;codigoMorse.c,31 :: 		while(1){
L_main6:
;codigoMorse.c,32 :: 		while(portb.rb0 == 0){
L_main8:
	BTFSC       PORTB+0, 0 
	GOTO        L_main9
;codigoMorse.c,33 :: 		apaga();          //inicia apagado
	CALL        _apaga+0, 0
;codigoMorse.c,35 :: 		ponto(1);  //R
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,36 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,37 :: 		ponto(0);
	CLRF        FARG_ponto_apaga+0 
	CLRF        FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,39 :: 		espaco();
	CALL        _espaco+0, 0
;codigoMorse.c,41 :: 		ponto(1);  //P
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,42 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,43 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,44 :: 		ponto(0);
	CLRF        FARG_ponto_apaga+0 
	CLRF        FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,46 :: 		espaco();
	CALL        _espaco+0, 0
;codigoMorse.c,48 :: 		ponto(1);  //L
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,49 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,50 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,51 :: 		ponto(0);
	CLRF        FARG_ponto_apaga+0 
	CLRF        FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,53 :: 		espaco();
	CALL        _espaco+0, 0
;codigoMorse.c,55 :: 		traco(1);  // B
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,56 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,57 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,58 :: 		ponto(0);
	CLRF        FARG_ponto_apaga+0 
	CLRF        FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,60 :: 		}
	GOTO        L_main8
L_main9:
;codigoMorse.c,62 :: 		while(portb.rb1 == 0){
L_main10:
	BTFSC       PORTB+0, 1 
	GOTO        L_main11
;codigoMorse.c,63 :: 		ponto(1);  //2
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,64 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,65 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,66 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,67 :: 		traco(0);
	CLRF        FARG_traco_apaga+0 
	CLRF        FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,69 :: 		traco(1);  //0
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,70 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,71 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,72 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,73 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,75 :: 		ponto(1);  //2
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,76 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,77 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,78 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,79 :: 		traco(0);
	CLRF        FARG_traco_apaga+0 
	CLRF        FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,81 :: 		traco(1);  //0
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,82 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,83 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,84 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,85 :: 		traco(0);
	CLRF        FARG_traco_apaga+0 
	CLRF        FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,87 :: 		ponto(1);  //1
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,88 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,89 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,90 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,91 :: 		traco(0);
	CLRF        FARG_traco_apaga+0 
	CLRF        FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,93 :: 		traco(1);  //0
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,94 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,95 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,96 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,97 :: 		traco(0);
	CLRF        FARG_traco_apaga+0 
	CLRF        FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,99 :: 		ponto(1);  //5
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,100 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,101 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,102 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,103 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,105 :: 		traco(1);  //0
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,106 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,107 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,108 :: 		traco(1);
	MOVLW       1
	MOVWF       FARG_traco_apaga+0 
	MOVLW       0
	MOVWF       FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,109 :: 		traco(0);
	CLRF        FARG_traco_apaga+0 
	CLRF        FARG_traco_apaga+1 
	CALL        _traco+0, 0
;codigoMorse.c,111 :: 		ponto(1);  //5
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,112 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,113 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,114 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,115 :: 		ponto(1);
	MOVLW       1
	MOVWF       FARG_ponto_apaga+0 
	MOVLW       0
	MOVWF       FARG_ponto_apaga+1 
	CALL        _ponto+0, 0
;codigoMorse.c,116 :: 		}
	GOTO        L_main10
L_main11:
;codigoMorse.c,117 :: 		}
	GOTO        L_main6
;codigoMorse.c,118 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
