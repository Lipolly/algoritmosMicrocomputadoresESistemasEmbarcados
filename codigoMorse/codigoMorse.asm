
_pausa:

;codigoMorse.c,2 :: 		void pausa(int palavraContinua){
;codigoMorse.c,3 :: 		portd = 0;                                                //faz o controle de pausas entre palavras ou letras
	CLRF        PORTD+0 
;codigoMorse.c,4 :: 		if(palavraContinua){
	MOVF        FARG_pausa_palavraContinua+0, 0 
	IORWF       FARG_pausa_palavraContinua+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_pausa0
;codigoMorse.c,5 :: 		delay_ms(300);                                       //apaga o led durante 0,3 segundos para espaço entre letras/numeros
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_pausa1:
	DECFSZ      R13, 1, 1
	BRA         L_pausa1
	DECFSZ      R12, 1, 1
	BRA         L_pausa1
	DECFSZ      R11, 1, 1
	BRA         L_pausa1
	NOP
	NOP
;codigoMorse.c,6 :: 		}
	GOTO        L_pausa2
L_pausa0:
;codigoMorse.c,8 :: 		delay_ms(900);                                       //apaga o led durante 0,9 segundos para espaço entre palavras
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_pausa3:
	DECFSZ      R13, 1, 1
	BRA         L_pausa3
	DECFSZ      R12, 1, 1
	BRA         L_pausa3
	DECFSZ      R11, 1, 1
	BRA         L_pausa3
;codigoMorse.c,9 :: 		}
L_pausa2:
;codigoMorse.c,10 :: 		}
L_end_pausa:
	RETURN      0
; end of _pausa

_caractere:

;codigoMorse.c,11 :: 		void caractere(int palavraContinua, int tipoCarac, int vezes){ //pisca o led de acordo com as variaveis recebidos fazendo um ponto ou traço
;codigoMorse.c,12 :: 		int i = 0;
	CLRF        caractere_i_L0+0 
	CLRF        caractere_i_L0+1 
;codigoMorse.c,13 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;codigoMorse.c,14 :: 		while(i < vezes){                                         //repete o trecho com o numero de vezes que o mesmo caracter aparece
L_caractere4:
	MOVLW       128
	XORWF       caractere_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_caractere_vezes+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__caractere18
	MOVF        FARG_caractere_vezes+0, 0 
	SUBWF       caractere_i_L0+0, 0 
L__caractere18:
	BTFSC       STATUS+0, 0 
	GOTO        L_caractere5
;codigoMorse.c,15 :: 		if(tipoCarac == 200){                                //tempo que fica acesso || se tipoCarac = 200 é um ponto se = 600 é um traço
	MOVLW       0
	XORWF       FARG_caractere_tipoCarac+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__caractere19
	MOVLW       200
	XORWF       FARG_caractere_tipoCarac+0, 0 
L__caractere19:
	BTFSS       STATUS+0, 2 
	GOTO        L_caractere6
;codigoMorse.c,16 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_caractere7:
	DECFSZ      R13, 1, 1
	BRA         L_caractere7
	DECFSZ      R12, 1, 1
	BRA         L_caractere7
	DECFSZ      R11, 1, 1
	BRA         L_caractere7
;codigoMorse.c,17 :: 		}
	GOTO        L_caractere8
L_caractere6:
;codigoMorse.c,19 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_caractere9:
	DECFSZ      R13, 1, 1
	BRA         L_caractere9
	DECFSZ      R12, 1, 1
	BRA         L_caractere9
	DECFSZ      R11, 1, 1
	BRA         L_caractere9
	NOP
;codigoMorse.c,20 :: 		};
L_caractere8:
;codigoMorse.c,21 :: 		pausa(palavraContinua);                              //pausa entre caracteres
	MOVF        FARG_caractere_palavraContinua+0, 0 
	MOVWF       FARG_pausa_palavraContinua+0 
	MOVF        FARG_caractere_palavraContinua+1, 0 
	MOVWF       FARG_pausa_palavraContinua+1 
	CALL        _pausa+0, 0
;codigoMorse.c,22 :: 		i = i+1;
	INFSNZ      caractere_i_L0+0, 1 
	INCF        caractere_i_L0+1, 1 
;codigoMorse.c,23 :: 		}
	GOTO        L_caractere4
L_caractere5:
;codigoMorse.c,24 :: 		}
L_end_caractere:
	RETURN      0
; end of _caractere

_main:

;codigoMorse.c,25 :: 		void main() {                                                  //main
;codigoMorse.c,26 :: 		trisb = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;codigoMorse.c,27 :: 		trisd = 0;
	CLRF        TRISD+0 
;codigoMorse.c,28 :: 		while(1){
L_main10:
;codigoMorse.c,29 :: 		while(portb.rb0 == 0){                           //Se rb0 for precionado
L_main12:
	BTFSC       PORTB+0, 0 
	GOTO        L_main13
;codigoMorse.c,30 :: 		caractere(1, 200, 1);                      //R
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,31 :: 		caractere(1, 600, 1);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,32 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,34 :: 		caractere(1, 200, 1);                      //P
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,35 :: 		caractere(1, 600, 2);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       2
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,36 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,38 :: 		caractere(1, 200, 1);                      //L
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,39 :: 		caractere(1, 600, 1);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,40 :: 		caractere(1, 200, 1);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,41 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,43 :: 		caractere(1, 600, 1);                      // B
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,44 :: 		caractere(1, 200, 2);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       2
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,45 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,46 :: 		}
	GOTO        L_main12
L_main13:
;codigoMorse.c,47 :: 		while(portb.rb1 == 0){                           //Se rb1 for precionado
L_main14:
	BTFSC       PORTB+0, 1 
	GOTO        L_main15
;codigoMorse.c,48 :: 		caractere(1, 200, 2);                      //2
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       2
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,49 :: 		caractere(1, 600, 2);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       2
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,50 :: 		caractere(0, 600, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,52 :: 		caractere(1, 600, 4);                      //0
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       4
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,53 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,55 :: 		caractere(1, 200, 2);                      //2
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       2
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,56 :: 		caractere(1, 600, 2);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       2
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,57 :: 		caractere(0, 600, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,59 :: 		caractere(1, 600, 4);                      //0
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       4
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,60 :: 		caractere(0, 600, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,62 :: 		caractere(1, 200, 1);                      //1
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,63 :: 		caractere(1, 600, 3);
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       3
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,64 :: 		caractere(0, 600, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,66 :: 		caractere(1, 600, 4);                      //0
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       4
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,67 :: 		caractere(0, 600, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,69 :: 		caractere(1, 200, 4);                      //5
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       4
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,70 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,72 :: 		caractere(1, 600, 4);                      //0
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       4
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,73 :: 		caractere(0, 600, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       88
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       2
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,75 :: 		caractere(1, 200, 4);                      //5
	MOVLW       1
	MOVWF       FARG_caractere_palavraContinua+0 
	MOVLW       0
	MOVWF       FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       4
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,76 :: 		caractere(0, 200, 1);
	CLRF        FARG_caractere_palavraContinua+0 
	CLRF        FARG_caractere_palavraContinua+1 
	MOVLW       200
	MOVWF       FARG_caractere_tipoCarac+0 
	MOVLW       0
	MOVWF       FARG_caractere_tipoCarac+1 
	MOVLW       1
	MOVWF       FARG_caractere_vezes+0 
	MOVLW       0
	MOVWF       FARG_caractere_vezes+1 
	CALL        _caractere+0, 0
;codigoMorse.c,77 :: 		}
	GOTO        L_main14
L_main15:
;codigoMorse.c,78 :: 		}
	GOTO        L_main10
;codigoMorse.c,79 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
