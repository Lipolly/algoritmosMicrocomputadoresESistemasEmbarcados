
_main:

;tacometro.c,20 :: 		void main(){
;tacometro.c,22 :: 		int contador = 0;  // variavel para contar cada periodo da onda
	CLRF        main_contador_L0+0 
	CLRF        main_contador_L0+1 
	CLRF        main_rotacao_L0+0 
	CLRF        main_rotacao_L0+1 
;tacometro.c,26 :: 		ADCON1  = 0x0F;     // Configura todos pinos para digital e
	MOVLW       15
	MOVWF       ADCON1+0 
;tacometro.c,28 :: 		trisd = 0; // porta D como saida
	CLRF        TRISD+0 
;tacometro.c,29 :: 		portd = 0; // apaga todos os LEDs da porta D
	CLRF        PORTD+0 
;tacometro.c,31 :: 		trisc = 1; // Entrada: RC0 ; os outros bits sao saida
	MOVLW       1
	MOVWF       TRISC+0 
;tacometro.c,32 :: 		portc.rc2 = 1;  // liga a ventoinha
	BSF         PORTC+0, 2 
;tacometro.c,34 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;tacometro.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;tacometro.c,36 :: 		Lcd_Out(1,1,"Contador Rotacao"); // Escreve mensagem no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_tacometro+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_tacometro+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;tacometro.c,37 :: 		while(1) {
L_main0:
;tacometro.c,38 :: 		while (portc.rc0 == 0)   // leitura do nivel logico 0 - sensor recebe luz
L_main2:
	BTFSC       PORTC+0, 0 
	GOTO        L_main3
;tacometro.c,39 :: 		;
	GOTO        L_main2
L_main3:
;tacometro.c,40 :: 		while (portc.rc0 == 1)   // leitura do nivel logico 1 - sensor nao recebe luz
L_main4:
	BTFSS       PORTC+0, 0 
	GOTO        L_main5
;tacometro.c,41 :: 		;
	GOTO        L_main4
L_main5:
;tacometro.c,42 :: 		contador = contador + 1; // contador incrementado a cada periodo da onda
	INFSNZ      main_contador_L0+0, 1 
	INCF        main_contador_L0+1, 1 
;tacometro.c,44 :: 		if (contador == 9){          // IF responsavel por contar as rotacoes
	MOVLW       0
	XORWF       main_contador_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main8
	MOVLW       9
	XORWF       main_contador_L0+0, 0 
L__main8:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;tacometro.c,45 :: 		contador = 0;             // reseta do contador de periodos
	CLRF        main_contador_L0+0 
	CLRF        main_contador_L0+1 
;tacometro.c,46 :: 		rotacao += 1;             // contador incrementado a cada rotacao completa
	INFSNZ      main_rotacao_L0+0, 1 
	INCF        main_rotacao_L0+1, 1 
;tacometro.c,47 :: 		inttostr(rotacao,res);    // converte as rotacoes para uma string
	MOVF        main_rotacao_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_rotacao_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_res_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_res_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;tacometro.c,48 :: 		Lcd_Out(2,1,res);         // escrve a string no LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_res_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_res_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;tacometro.c,49 :: 		}
L_main6:
;tacometro.c,50 :: 		}
	GOTO        L_main0
;tacometro.c,51 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main
