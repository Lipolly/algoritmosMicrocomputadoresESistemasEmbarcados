
_TrimLeft:

;Relogio.c,3 :: 		void TrimLeft(char *str) {
;Relogio.c,4 :: 		char count  = 1;
	MOVLW       1
	MOVWF       TrimLeft_count_L0+0 
;Relogio.c,5 :: 		while (*str++ != 0) {
L_TrimLeft0:
	MOVF        FARG_TrimLeft_str+0, 0 
	MOVWF       R1 
	MOVF        FARG_TrimLeft_str+1, 0 
	MOVWF       R2 
	INFSNZ      FARG_TrimLeft_str+0, 1 
	INCF        FARG_TrimLeft_str+1, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_TrimLeft1
;Relogio.c,6 :: 		if (*str != 32) {
	MOVFF       FARG_TrimLeft_str+0, FSR0
	MOVFF       FARG_TrimLeft_str+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_TrimLeft2
;Relogio.c,7 :: 		*(str - count--) = *str;
	MOVF        TrimLeft_count_L0+0, 0 
	SUBWF       FARG_TrimLeft_str+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	SUBWFB      FARG_TrimLeft_str+1, 0 
	MOVWF       FSR1H 
	MOVFF       FARG_TrimLeft_str+0, FSR0
	MOVFF       FARG_TrimLeft_str+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        TrimLeft_count_L0+0, 1 
;Relogio.c,8 :: 		}
L_TrimLeft2:
;Relogio.c,9 :: 		count++;
	INCF        TrimLeft_count_L0+0, 1 
;Relogio.c,10 :: 		}
	GOTO        L_TrimLeft0
L_TrimLeft1:
;Relogio.c,11 :: 		}
L_end_TrimLeft:
	RETURN      0
; end of _TrimLeft

_main:

;Relogio.c,40 :: 		void main(){
;Relogio.c,42 :: 		trisb = 7;          // Configura todos pinos das portas para digital e
	MOVLW       7
	MOVWF       TRISB+0 
;Relogio.c,43 :: 		ADCON1  = 0x0F;     // desabilita o conversor A/D
	MOVLW       15
	MOVWF       ADCON1+0 
;Relogio.c,46 :: 		Lcd_Init();                      //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;Relogio.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);             //Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Relogio.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Relogio.c,52 :: 		Lcd_Out(1,3,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,53 :: 		Lcd_Out(1,6,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,56 :: 		while(1){
L_main3:
;Relogio.c,57 :: 		for(h=0;h<24;h++){    // For loop para contar as horas
	CLRF        _h+0 
	CLRF        _h+1 
L_main5:
	MOVLW       128
	XORWF       _h+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVLW       24
	SUBWF       _h+0, 0 
L__main24:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;Relogio.c,58 :: 		inttostr(h,txtH);     // Converte o inteiro hora para string e salva no char relativo a hora
	MOVF        _h+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _h+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtH+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Relogio.c,59 :: 		TrimLeft(txtH);       // Uso da funcao TrimLeft
	MOVLW       _txtH+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Relogio.c,60 :: 		Lcd_Out(1,1,txtH);    // Escreve as horas no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtH+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,62 :: 		for(m=0;m<60;m++){   // For loop para contar os minutos
	CLRF        _m+0 
	CLRF        _m+1 
L_main8:
	MOVLW       128
	XORWF       _m+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVLW       60
	SUBWF       _m+0, 0 
L__main25:
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;Relogio.c,63 :: 		inttostr(m,txtM);    // Converte o inteiro minuto para string e salva no char relativo ao minuto
	MOVF        _m+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _m+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtM+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Relogio.c,64 :: 		TrimLeft(txtM);      // Uso da funcao TrimLeft
	MOVLW       _txtM+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Relogio.c,65 :: 		Lcd_Out(1,4,txtM);   // Escreve os minutos no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,67 :: 		for(seg=0;seg<60;seg++){   //For loop para contar os segundos
	CLRF        _seg+0 
	CLRF        _seg+1 
L_main11:
	MOVLW       128
	XORWF       _seg+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main26
	MOVLW       60
	SUBWF       _seg+0, 0 
L__main26:
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;Relogio.c,68 :: 		inttostr(seg,txtS);        // Converte o inteiro segundo para string e salva no char relativo ao segundo
	MOVF        _seg+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _seg+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtS+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Relogio.c,69 :: 		TrimLeft(txtS);            // Uso da funcao TrimLeft
	MOVLW       _txtS+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Relogio.c,70 :: 		Lcd_Out(1,7,txtS);         // Escreve os segundos no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtS+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,75 :: 		if (portb.b0 == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main14
;Relogio.c,76 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
	NOP
	GOTO        L_main16
L_main14:
;Relogio.c,78 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
L_main16:
;Relogio.c,83 :: 		if (portb.b1 == 0){
	BTFSC       PORTB+0, 1 
	GOTO        L_main18
;Relogio.c,84 :: 		m++;
	INFSNZ      _m+0, 1 
	INCF        _m+1, 1 
;Relogio.c,85 :: 		inttostr(m,txtM);
	MOVF        _m+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _m+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtM+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Relogio.c,86 :: 		TrimLeft(txtM);
	MOVLW       _txtM+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Relogio.c,87 :: 		Lcd_Out(1,4,txtM);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,91 :: 		if (m==60){
	MOVLW       0
	XORWF       _m+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main27
	MOVLW       60
	XORWF       _m+0, 0 
L__main27:
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;Relogio.c,92 :: 		m = 0;
	CLRF        _m+0 
	CLRF        _m+1 
;Relogio.c,93 :: 		Lcd_Out(1,4,"  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,94 :: 		Lcd_Out(1,4,"0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,95 :: 		}
L_main19:
;Relogio.c,96 :: 		}
L_main18:
;Relogio.c,101 :: 		if (portb.b2 == 0){
	BTFSC       PORTB+0, 2 
	GOTO        L_main20
;Relogio.c,102 :: 		h++;
	INFSNZ      _h+0, 1 
	INCF        _h+1, 1 
;Relogio.c,103 :: 		inttostr(h,txtH);
	MOVF        _h+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _h+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtH+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Relogio.c,104 :: 		TrimLeft(txtH);
	MOVLW       _txtH+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Relogio.c,105 :: 		Lcd_Out(1,1,txtH);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtH+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,109 :: 		if (h==24){
	MOVLW       0
	XORWF       _h+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVLW       24
	XORWF       _h+0, 0 
L__main28:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Relogio.c,110 :: 		h = 0;
	CLRF        _h+0 
	CLRF        _h+1 
;Relogio.c,111 :: 		Lcd_Out(1,1,"  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,112 :: 		Lcd_Out(1,1,"0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,113 :: 		}
L_main21:
;Relogio.c,114 :: 		}
L_main20:
;Relogio.c,67 :: 		for(seg=0;seg<60;seg++){   //For loop para contar os segundos
	INFSNZ      _seg+0, 1 
	INCF        _seg+1, 1 
;Relogio.c,116 :: 		}
	GOTO        L_main11
L_main12:
;Relogio.c,117 :: 		Lcd_Out(1,8," "); // limpa o campo dos segundos quando o loop dos segundos estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,62 :: 		for(m=0;m<60;m++){   // For loop para contar os minutos
	INFSNZ      _m+0, 1 
	INCF        _m+1, 1 
;Relogio.c,118 :: 		}
	GOTO        L_main8
L_main9:
;Relogio.c,119 :: 		Lcd_Out(1,5," "); // limpa o campo dos minutos quando o loop dos minutos estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,57 :: 		for(h=0;h<24;h++){    // For loop para contar as horas
	INFSNZ      _h+0, 1 
	INCF        _h+1, 1 
;Relogio.c,120 :: 		}
	GOTO        L_main5
L_main6:
;Relogio.c,121 :: 		Lcd_Out(1,2," "); // limpa o campo das horas quando o loop das horas estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_Relogio+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_Relogio+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Relogio.c,122 :: 		}
	GOTO        L_main3
;Relogio.c,123 :: 		} /// fim do programa
L_end_main:
	GOTO        $+0
; end of _main
