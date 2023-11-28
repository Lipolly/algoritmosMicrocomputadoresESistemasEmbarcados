
_TrimLeft:

;Temporizador.c,3 :: 		void TrimLeft(char *str) {
;Temporizador.c,4 :: 		char count  = 1;
	MOVLW       1
	MOVWF       TrimLeft_count_L0+0 
;Temporizador.c,5 :: 		while (*str++ != 0) {
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
;Temporizador.c,6 :: 		if (*str != 32) {
	MOVFF       FARG_TrimLeft_str+0, FSR0
	MOVFF       FARG_TrimLeft_str+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_TrimLeft2
;Temporizador.c,7 :: 		*(str - count--) = *str;
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
;Temporizador.c,8 :: 		}
L_TrimLeft2:
;Temporizador.c,9 :: 		count++;
	INCF        TrimLeft_count_L0+0, 1 
;Temporizador.c,10 :: 		}
	GOTO        L_TrimLeft0
L_TrimLeft1:
;Temporizador.c,11 :: 		}
L_end_TrimLeft:
	RETURN      0
; end of _TrimLeft

_main:

;Temporizador.c,39 :: 		void main(){
;Temporizador.c,41 :: 		flag1 = -1;
	MOVLW       255
	MOVWF       _flag1+0 
	MOVLW       255
	MOVWF       _flag1+1 
;Temporizador.c,42 :: 		trisb = 7;          // Configura todos pinos das portas para digital e
	MOVLW       7
	MOVWF       TRISB+0 
;Temporizador.c,43 :: 		ADCON1  = 0x0F;     // desabilita o conversor A/D
	MOVLW       15
	MOVWF       ADCON1+0 
;Temporizador.c,46 :: 		Lcd_Init();                      //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;Temporizador.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);             //Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Temporizador.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Temporizador.c,49 :: 		trisc.rc0 = 0;
	BCF         TRISC+0, 0 
;Temporizador.c,50 :: 		portc.rc0 = 0;
	BCF         PORTC+0, 0 
;Temporizador.c,53 :: 		Lcd_Out(1,3,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,54 :: 		Lcd_Out(1,6,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,56 :: 		while(flag1==-1){ // WHILE que segura o temporizador em modo de configuracao ate que o flag seja estourado
L_main3:
	MOVLW       255
	XORWF       _flag1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       255
	XORWF       _flag1+0, 0 
L__main48:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Temporizador.c,58 :: 		for(h=0;h<24;h++){    // For loop para contar as horas
	CLRF        _h+0 
	CLRF        _h+1 
L_main5:
	MOVLW       128
	XORWF       _h+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVLW       24
	SUBWF       _h+0, 0 
L__main49:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;Temporizador.c,59 :: 		inttostr(h,txtH);     // Converte o inteiro hora para string e salva no char relativo a hora
	MOVF        _h+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _h+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtH+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,60 :: 		TrimLeft(txtH);       // Uso da funcao TrimLeft
	MOVLW       _txtH+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,61 :: 		Lcd_Out(1,1,txtH);    // Escreve as horas no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtH+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,62 :: 		for(m=0;m<60;m++){   // For loop para contar os minutos
	CLRF        _m+0 
	CLRF        _m+1 
L_main8:
	MOVLW       128
	XORWF       _m+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	MOVLW       60
	SUBWF       _m+0, 0 
L__main50:
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;Temporizador.c,63 :: 		inttostr(m,txtM);    // Converte o inteiro minuto para string e salva no char relativo ao minuto
	MOVF        _m+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _m+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtM+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,64 :: 		TrimLeft(txtM);      // Uso da funcao TrimLeft
	MOVLW       _txtM+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,65 :: 		Lcd_Out(1,4,txtM);   // Escreve os minutos no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,66 :: 		for(seg=0;seg<60;seg++){   //For loop para contar os segundos
	CLRF        _seg+0 
	CLRF        _seg+1 
L_main11:
	MOVLW       128
	XORWF       _seg+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVLW       60
	SUBWF       _seg+0, 0 
L__main51:
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;Temporizador.c,67 :: 		inttostr(seg,txtS);        // Converte o inteiro segundo para string e salva no char relativo ao segundo
	MOVF        _seg+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _seg+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtS+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,68 :: 		TrimLeft(txtS);            // Uso da funcao TrimLeft
	MOVLW       _txtS+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,69 :: 		Lcd_Out(1,7,txtS);         // Escreve os segundos no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtS+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,70 :: 		while (portb.b0 == 1){ // Enquanto Rb0 nao esta acionado, o programa busca a incrementacao de horas e minutos, os segundos
L_main14:
	BTFSS       PORTB+0, 0 
	GOTO        L_main15
;Temporizador.c,73 :: 		while (portb.b1 == 0){  //WHILE utilizado para somar os minutos
L_main16:
	BTFSC       PORTB+0, 1 
	GOTO        L_main17
;Temporizador.c,74 :: 		m++;
	INFSNZ      _m+0, 1 
	INCF        _m+1, 1 
;Temporizador.c,75 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
	NOP
;Temporizador.c,76 :: 		inttostr(m,txtM);
	MOVF        _m+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _m+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtM+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,77 :: 		TrimLeft(txtM);
	MOVLW       _txtM+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,78 :: 		Lcd_Out(1,4,txtM);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,81 :: 		if (m==60){
	MOVLW       0
	XORWF       _m+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main52
	MOVLW       60
	XORWF       _m+0, 0 
L__main52:
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;Temporizador.c,82 :: 		m = 0;
	CLRF        _m+0 
	CLRF        _m+1 
;Temporizador.c,83 :: 		Lcd_Out(1,4,"  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,84 :: 		Lcd_Out(1,4,"0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,85 :: 		}
L_main19:
;Temporizador.c,86 :: 		}
	GOTO        L_main16
L_main17:
;Temporizador.c,87 :: 		while (portb.b2 == 0){  //WHILE utilizado para somar as horas
L_main20:
	BTFSC       PORTB+0, 2 
	GOTO        L_main21
;Temporizador.c,88 :: 		h++;
	INFSNZ      _h+0, 1 
	INCF        _h+1, 1 
;Temporizador.c,89 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;Temporizador.c,90 :: 		inttostr(h,txtH);
	MOVF        _h+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _h+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtH+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,91 :: 		TrimLeft(txtH);
	MOVLW       _txtH+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,92 :: 		Lcd_Out(1,1,txtH);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtH+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,95 :: 		if (h==99){
	MOVLW       0
	XORWF       _h+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
	MOVLW       99
	XORWF       _h+0, 0 
L__main53:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Temporizador.c,96 :: 		h = 0;
	CLRF        _h+0 
	CLRF        _h+1 
;Temporizador.c,97 :: 		Lcd_Out(1,1,"  ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,98 :: 		Lcd_Out(1,1,"0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,99 :: 		}
L_main23:
;Temporizador.c,100 :: 		}
	GOTO        L_main20
L_main21:
;Temporizador.c,101 :: 		if (portb.b3 == 0){  // IF para acionar o flag que indica que o temporizador esta setado
	BTFSC       PORTB+0, 3 
	GOTO        L_main24
;Temporizador.c,102 :: 		flag1 = 1;
	MOVLW       1
	MOVWF       _flag1+0 
	MOVLW       0
	MOVWF       _flag1+1 
;Temporizador.c,103 :: 		break;  // quebra o WHILE Rb0==1(botao Rb0 nao esta acionado)
	GOTO        L_main15
;Temporizador.c,104 :: 		}
L_main24:
;Temporizador.c,105 :: 		}
	GOTO        L_main14
L_main15:
;Temporizador.c,106 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
	NOP
;Temporizador.c,107 :: 		if (flag1!=-1)  // quebra o FOR dos segundos
	MOVLW       255
	XORWF       _flag1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main54
	MOVLW       255
	XORWF       _flag1+0, 0 
L__main54:
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
;Temporizador.c,108 :: 		break;
	GOTO        L_main12
L_main26:
;Temporizador.c,66 :: 		for(seg=0;seg<60;seg++){   //For loop para contar os segundos
	INFSNZ      _seg+0, 1 
	INCF        _seg+1, 1 
;Temporizador.c,109 :: 		}
	GOTO        L_main11
L_main12:
;Temporizador.c,110 :: 		Lcd_Out(1,8," "); // limpa o campo dos segundos quando o loop dos segundos estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,111 :: 		if (flag1!=-1)  // quebra o FOR dos minutos
	MOVLW       255
	XORWF       _flag1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main55
	MOVLW       255
	XORWF       _flag1+0, 0 
L__main55:
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
;Temporizador.c,112 :: 		break;
	GOTO        L_main9
L_main27:
;Temporizador.c,62 :: 		for(m=0;m<60;m++){   // For loop para contar os minutos
	INFSNZ      _m+0, 1 
	INCF        _m+1, 1 
;Temporizador.c,113 :: 		}
	GOTO        L_main8
L_main9:
;Temporizador.c,114 :: 		Lcd_Out(1,5," "); // limpa o campo dos minutos quando o loop dos minutos estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,115 :: 		if (flag1!=-1) // quebra o FOR das horas
	MOVLW       255
	XORWF       _flag1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVLW       255
	XORWF       _flag1+0, 0 
L__main56:
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
;Temporizador.c,116 :: 		break;
	GOTO        L_main6
L_main28:
;Temporizador.c,58 :: 		for(h=0;h<24;h++){    // For loop para contar as horas
	INFSNZ      _h+0, 1 
	INCF        _h+1, 1 
;Temporizador.c,117 :: 		}
	GOTO        L_main5
L_main6:
;Temporizador.c,118 :: 		Lcd_Out(1,2," "); // limpa o campo das horas quando o loop das horas estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,119 :: 		}
	GOTO        L_main3
L_main4:
;Temporizador.c,122 :: 		for(;h>=0;h--){    // For loop para contar as horas
L_main29:
	MOVLW       128
	XORWF       _h+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       0
	SUBWF       _h+0, 0 
L__main57:
	BTFSS       STATUS+0, 0 
	GOTO        L_main30
;Temporizador.c,123 :: 		inttostr(h,txtH);     // Converte o inteiro hora para string e salva no char relativo a hora
	MOVF        _h+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _h+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtH+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,124 :: 		TrimLeft(txtH);       // Uso da funcao TrimLeft
	MOVLW       _txtH+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,125 :: 		Lcd_Out(1,1,txtH);    // Escreve as horas no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtH+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtH+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,126 :: 		for(;m>=0;m--){   // For loop para contar os minutos
L_main32:
	MOVLW       128
	XORWF       _m+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVLW       0
	SUBWF       _m+0, 0 
L__main58:
	BTFSS       STATUS+0, 0 
	GOTO        L_main33
;Temporizador.c,127 :: 		inttostr(m,txtM);    // Converte o inteiro minuto para string e salva no char relativo ao minuto
	MOVF        _m+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _m+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtM+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,128 :: 		TrimLeft(txtM);      // Uso da funcao TrimLeft
	MOVLW       _txtM+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,129 :: 		Lcd_Out(1,4,txtM);   // Escreve os minutos no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtM+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtM+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,130 :: 		for(;seg>=0;seg--){   //For loop para contar os segundos
L_main35:
	MOVLW       128
	XORWF       _seg+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
	MOVLW       0
	SUBWF       _seg+0, 0 
L__main59:
	BTFSS       STATUS+0, 0 
	GOTO        L_main36
;Temporizador.c,131 :: 		inttostr(seg,txtS);        // Converte o inteiro segundo para string e salva no char relativo ao segundo
	MOVF        _seg+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _seg+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txtS+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Temporizador.c,132 :: 		TrimLeft(txtS);            // Uso da funcao TrimLeft
	MOVLW       _txtS+0
	MOVWF       FARG_TrimLeft_str+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_TrimLeft_str+1 
	CALL        _TrimLeft+0, 0
;Temporizador.c,133 :: 		Lcd_Out(1,7,txtS);         // Escreve os segundos no LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txtS+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txtS+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,137 :: 		if (portb.b0 == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main38
;Temporizador.c,138 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
	DECFSZ      R11, 1, 1
	BRA         L_main39
	NOP
	NOP
	GOTO        L_main40
L_main38:
;Temporizador.c,140 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	DECFSZ      R11, 1, 1
	BRA         L_main41
	NOP
L_main40:
;Temporizador.c,141 :: 		if (seg<11){  // IF utilizado para limpar a segundo digitos dos segundos
	MOVLW       128
	XORWF       _seg+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main60
	MOVLW       11
	SUBWF       _seg+0, 0 
L__main60:
	BTFSC       STATUS+0, 0 
	GOTO        L_main42
;Temporizador.c,142 :: 		Lcd_Out(1,8," ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,143 :: 		}
L_main42:
;Temporizador.c,130 :: 		for(;seg>=0;seg--){   //For loop para contar os segundos
	MOVLW       1
	SUBWF       _seg+0, 1 
	MOVLW       0
	SUBWFB      _seg+1, 1 
;Temporizador.c,144 :: 		}
	GOTO        L_main35
L_main36:
;Temporizador.c,145 :: 		Lcd_Out(1,8," "); // limpa o campo dos segundos quando o loop dos segundos estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,146 :: 		seg = 59;
	MOVLW       59
	MOVWF       _seg+0 
	MOVLW       0
	MOVWF       _seg+1 
;Temporizador.c,147 :: 		if (m<11){  // IF utilizado para limpar a segundo digitos dos minutos
	MOVLW       128
	XORWF       _m+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main61
	MOVLW       11
	SUBWF       _m+0, 0 
L__main61:
	BTFSC       STATUS+0, 0 
	GOTO        L_main43
;Temporizador.c,148 :: 		Lcd_Out(1,5," ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,149 :: 		}
L_main43:
;Temporizador.c,126 :: 		for(;m>=0;m--){   // For loop para contar os minutos
	MOVLW       1
	SUBWF       _m+0, 1 
	MOVLW       0
	SUBWFB      _m+1, 1 
;Temporizador.c,150 :: 		}
	GOTO        L_main32
L_main33:
;Temporizador.c,151 :: 		Lcd_Out(1,5," "); // limpa o campo dos minutos quando o loop dos minutos estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,152 :: 		m = 59;
	MOVLW       59
	MOVWF       _m+0 
	MOVLW       0
	MOVWF       _m+1 
;Temporizador.c,153 :: 		if (h<11){  // IF utilizado para limpar a segundo digitos das horas
	MOVLW       128
	XORWF       _h+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main62
	MOVLW       11
	SUBWF       _h+0, 0 
L__main62:
	BTFSC       STATUS+0, 0 
	GOTO        L_main44
;Temporizador.c,154 :: 		Lcd_Out(1,2," ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,155 :: 		}
L_main44:
;Temporizador.c,122 :: 		for(;h>=0;h--){    // For loop para contar as horas
	MOVLW       1
	SUBWF       _h+0, 1 
	MOVLW       0
	SUBWFB      _h+1, 1 
;Temporizador.c,156 :: 		}
	GOTO        L_main29
L_main30:
;Temporizador.c,157 :: 		Lcd_Out(1,2," "); // limpa o campo das horas quando o loop das horas estoura
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_Temporizador+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_Temporizador+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Temporizador.c,159 :: 		portc.rc0 = 1; // ativacao do rele
	BSF         PORTC+0, 0 
;Temporizador.c,160 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	DECFSZ      R11, 1, 1
	BRA         L_main45
	NOP
	NOP
;Temporizador.c,161 :: 		portc.rc0 = 0; //desativacao do rele
	BCF         PORTC+0, 0 
;Temporizador.c,162 :: 		} /// fim do programa
L_end_main:
	GOTO        $+0
; end of _main
