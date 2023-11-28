
_ponto:

;Morse.c,8 :: 		void ponto(){
;Morse.c,9 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;Morse.c,10 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_ponto0:
	DECFSZ      R13, 1, 1
	BRA         L_ponto0
	DECFSZ      R12, 1, 1
	BRA         L_ponto0
	DECFSZ      R11, 1, 1
	BRA         L_ponto0
	NOP
	NOP
;Morse.c,11 :: 		portd = 0;
	CLRF        PORTD+0 
;Morse.c,12 :: 		delay_ms(200);
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
;Morse.c,13 :: 		}
L_end_ponto:
	RETURN      0
; end of _ponto

_traco:

;Morse.c,15 :: 		void traco(){
;Morse.c,16 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;Morse.c,17 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_traco2:
	DECFSZ      R13, 1, 1
	BRA         L_traco2
	DECFSZ      R12, 1, 1
	BRA         L_traco2
	DECFSZ      R11, 1, 1
	BRA         L_traco2
	NOP
	NOP
;Morse.c,18 :: 		portd = 0;
	CLRF        PORTD+0 
;Morse.c,19 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_traco3:
	DECFSZ      R13, 1, 1
	BRA         L_traco3
	DECFSZ      R12, 1, 1
	BRA         L_traco3
	DECFSZ      R11, 1, 1
	BRA         L_traco3
;Morse.c,20 :: 		}
L_end_traco:
	RETURN      0
; end of _traco

_fdc:

;Morse.c,22 :: 		void fdc(){
;Morse.c,23 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_fdc4:
	DECFSZ      R13, 1, 1
	BRA         L_fdc4
	DECFSZ      R12, 1, 1
	BRA         L_fdc4
	DECFSZ      R11, 1, 1
	BRA         L_fdc4
	NOP
	NOP
;Morse.c,24 :: 		}
L_end_fdc:
	RETURN      0
; end of _fdc

_main:

;Morse.c,27 :: 		void main() {
;Morse.c,29 :: 		trisb = 3; //rb1 e rb0 definidos como entrada
	MOVLW       3
	MOVWF       TRISB+0 
;Morse.c,30 :: 		trisd = 0; //rd0 a rd7 definidos como saida
	CLRF        TRISD+0 
;Morse.c,32 :: 		while(1){
L_main5:
;Morse.c,34 :: 		while(portb.b0 == 0){
L_main7:
	BTFSC       PORTB+0, 0 
	GOTO        L_main8
;Morse.c,37 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,38 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,39 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,40 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,43 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,44 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,45 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,46 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,49 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,50 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,51 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,52 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,53 :: 		}
	GOTO        L_main7
L_main8:
;Morse.c,56 :: 		while(portb.b1 == 0){
L_main9:
	BTFSC       PORTB+0, 1 
	GOTO        L_main10
;Morse.c,58 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,59 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,60 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,61 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,62 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,63 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,66 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,67 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,68 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,69 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,70 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,71 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,74 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,75 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,76 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,77 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,78 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,79 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,82 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,83 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,84 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,85 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,86 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,87 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,90 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,91 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,92 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,93 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,94 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,95 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,98 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,99 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,100 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,101 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,102 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,103 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,106 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,107 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,108 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,109 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,110 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,111 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,114 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,115 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,116 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,117 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,118 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,119 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,122 :: 		traco();
	CALL        _traco+0, 0
;Morse.c,123 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,124 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,125 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,126 :: 		ponto();
	CALL        _ponto+0, 0
;Morse.c,127 :: 		fdc();
	CALL        _fdc+0, 0
;Morse.c,129 :: 		}
	GOTO        L_main9
L_main10:
;Morse.c,131 :: 		}
	GOTO        L_main5
;Morse.c,132 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
