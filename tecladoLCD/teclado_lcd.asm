
_LCD:

;teclado_lcd.c,44 :: 		void LCD(char texto[16])
;teclado_lcd.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);    //limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;teclado_lcd.c,47 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_LCD0:
	DECFSZ      R13, 1, 1
	BRA         L_LCD0
	DECFSZ      R12, 1, 1
	BRA         L_LCD0
	NOP
	NOP
;teclado_lcd.c,48 :: 		Lcd_Out(1,4,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCD_texto+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCD_texto+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;teclado_lcd.c,49 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_LCD1:
	DECFSZ      R13, 1, 1
	BRA         L_LCD1
	DECFSZ      R12, 1, 1
	BRA         L_LCD1
	NOP
	NOP
;teclado_lcd.c,50 :: 		}
L_end_LCD:
	RETURN      0
; end of _LCD

_main:

;teclado_lcd.c,52 :: 		void main(){
;teclado_lcd.c,53 :: 		ADCON0 = 0X00;     // Desabilita o conversor A/D
	CLRF        ADCON0+0 
;teclado_lcd.c,54 :: 		ADCON1 = 0x06;     // Configura todos pinos da porta A para digital
	MOVLW       6
	MOVWF       ADCON1+0 
;teclado_lcd.c,56 :: 		trisd = 0x0F;      //configura os pinos RD0,RD1,RD2,RD3 da PORTD como
	MOVLW       15
	MOVWF       TRISD+0 
;teclado_lcd.c,61 :: 		trisb = 0xF8;     // configura pinos RB0,RB1,RB2 da PORTB como saida (teclado)
	MOVLW       248
	MOVWF       TRISB+0 
;teclado_lcd.c,63 :: 		portb = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;teclado_lcd.c,65 :: 		Lcd_Init();                      //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;teclado_lcd.c,66 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;teclado_lcd.c,67 :: 		Lcd_Cmd(_LCD_CLEAR);             //limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;teclado_lcd.c,68 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
	NOP
;teclado_lcd.c,69 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;teclado_lcd.c,70 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;teclado_lcd.c,72 :: 		do
L_main5:
;teclado_lcd.c,74 :: 		portb.rb0 = 0;          //habilita primeira coluna  do teclado
	BCF         PORTB+0, 0 
;teclado_lcd.c,75 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;teclado_lcd.c,76 :: 		if (portd.rd0 == 0)                LCD("<---");
	BTFSC       PORTD+0, 0 
	GOTO        L_main9
	MOVLW       ?lstr1_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr1_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main10
L_main9:
;teclado_lcd.c,77 :: 		else if (portd.rd1 == 0)           LCD("7");
	BTFSC       PORTD+0, 1 
	GOTO        L_main11
	MOVLW       ?lstr2_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr2_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main12
L_main11:
;teclado_lcd.c,78 :: 		else if (portd.rd2 == 0)      LCD("4");
	BTFSC       PORTD+0, 2 
	GOTO        L_main13
	MOVLW       ?lstr3_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr3_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main14
L_main13:
;teclado_lcd.c,79 :: 		else if (portd.rd3 == 0) LCD("1");
	BTFSC       PORTD+0, 3 
	GOTO        L_main15
	MOVLW       ?lstr4_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr4_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
L_main15:
L_main14:
L_main12:
L_main10:
;teclado_lcd.c,80 :: 		portb.rb0 = 1;          //desabilita primeira coluna do teclado
	BSF         PORTB+0, 0 
;teclado_lcd.c,81 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	NOP
	NOP
;teclado_lcd.c,84 :: 		portb.rb1 = 0;          //habilita segunda coluna do teclado
	BCF         PORTB+0, 1 
;teclado_lcd.c,85 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
	NOP
;teclado_lcd.c,86 :: 		if (portd.rd0 == 0)                LCD("0");
	BTFSC       PORTD+0, 0 
	GOTO        L_main18
	MOVLW       ?lstr5_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr5_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main19
L_main18:
;teclado_lcd.c,87 :: 		else if (portd.rd1 == 0)           LCD("8");
	BTFSC       PORTD+0, 1 
	GOTO        L_main20
	MOVLW       ?lstr6_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr6_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main21
L_main20:
;teclado_lcd.c,88 :: 		else if (portd.rd2 == 0)      LCD("5");
	BTFSC       PORTD+0, 2 
	GOTO        L_main22
	MOVLW       ?lstr7_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr7_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main23
L_main22:
;teclado_lcd.c,89 :: 		else if (portd.rd3 == 0) LCD("2");
	BTFSC       PORTD+0, 3 
	GOTO        L_main24
	MOVLW       ?lstr8_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr8_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
L_main24:
L_main23:
L_main21:
L_main19:
;teclado_lcd.c,91 :: 		portb.rb1 = 1;          //desabilita segunda coluna do teclado
	BSF         PORTB+0, 1 
;teclado_lcd.c,92 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	NOP
	NOP
;teclado_lcd.c,95 :: 		portb.rb2 = 0;         //habilita terceira coluna do teclado
	BCF         PORTB+0, 2 
;teclado_lcd.c,96 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	NOP
	NOP
;teclado_lcd.c,97 :: 		if (portd.rd0 == 0)                LCD("--->");
	BTFSC       PORTD+0, 0 
	GOTO        L_main27
	MOVLW       ?lstr9_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr9_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main28
L_main27:
;teclado_lcd.c,98 :: 		else if (portd.rd1 == 0)           LCD("9");
	BTFSC       PORTD+0, 1 
	GOTO        L_main29
	MOVLW       ?lstr10_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr10_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main30
L_main29:
;teclado_lcd.c,99 :: 		else if (portd.rd2 == 0)      LCD("6");
	BTFSC       PORTD+0, 2 
	GOTO        L_main31
	MOVLW       ?lstr11_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr11_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main32
L_main31:
;teclado_lcd.c,100 :: 		else if (portd.rd3 == 0) LCD("3");
	BTFSC       PORTD+0, 3 
	GOTO        L_main33
	MOVLW       ?lstr12_teclado_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr12_teclado_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
L_main33:
L_main32:
L_main30:
L_main28:
;teclado_lcd.c,102 :: 		portb.rb2 = 1;        //desabilita terceira coluna do teclado
	BSF         PORTB+0, 2 
;teclado_lcd.c,103 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	NOP
	NOP
;teclado_lcd.c,106 :: 		} while(1);
	GOTO        L_main5
;teclado_lcd.c,108 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main
