
_LCD:

;lcd.c,25 :: 		void LCD(char texto[16])
;lcd.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);    //limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,28 :: 		delay_ms(atraso);
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
;lcd.c,29 :: 		Lcd_Out(1,4,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCD_texto+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCD_texto+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,30 :: 		delay_ms(atraso);
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
;lcd.c,31 :: 		}
L_end_LCD:
	RETURN      0
; end of _LCD

_piscaLED:

;lcd.c,33 :: 		void piscaLED(){
;lcd.c,34 :: 		int i = 0;
	CLRF        piscaLED_i_L0+0 
	CLRF        piscaLED_i_L0+1 
;lcd.c,35 :: 		do{
L_piscaLED2:
;lcd.c,36 :: 		portd = 0;
	CLRF        PORTD+0 
;lcd.c,37 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_piscaLED5:
	DECFSZ      R13, 1, 1
	BRA         L_piscaLED5
	DECFSZ      R12, 1, 1
	BRA         L_piscaLED5
	DECFSZ      R11, 1, 1
	BRA         L_piscaLED5
	NOP
	NOP
;lcd.c,38 :: 		portd = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;lcd.c,39 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_piscaLED6:
	DECFSZ      R13, 1, 1
	BRA         L_piscaLED6
	DECFSZ      R12, 1, 1
	BRA         L_piscaLED6
	DECFSZ      R11, 1, 1
	BRA         L_piscaLED6
	NOP
	NOP
;lcd.c,40 :: 		i = i+1;
	INFSNZ      piscaLED_i_L0+0, 1 
	INCF        piscaLED_i_L0+1, 1 
;lcd.c,41 :: 		}while(i <= 5);
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       piscaLED_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__piscaLED68
	MOVF        piscaLED_i_L0+0, 0 
	SUBLW       5
L__piscaLED68:
	BTFSC       STATUS+0, 0 
	GOTO        L_piscaLED2
;lcd.c,42 :: 		}
L_end_piscaLED:
	RETURN      0
; end of _piscaLED

_teclado:

;lcd.c,44 :: 		int teclado(){
;lcd.c,45 :: 		portb.rb0 = 0;          //habilita primeira coluna  do teclado
	BCF         PORTB+0, 0 
;lcd.c,46 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclado7:
	DECFSZ      R13, 1, 1
	BRA         L_teclado7
	DECFSZ      R12, 1, 1
	BRA         L_teclado7
	NOP
	NOP
;lcd.c,48 :: 		if (portd.rd0 == 0){
	BTFSC       PORTD+0, 0 
	GOTO        L_teclado8
;lcd.c,49 :: 		LCD("<---");
	MOVLW       ?lstr1_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr1_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,50 :: 		}
	GOTO        L_teclado9
L_teclado8:
;lcd.c,51 :: 		else if (portd.rd1 == 0){
	BTFSC       PORTD+0, 1 
	GOTO        L_teclado10
;lcd.c,52 :: 		LCD("7");
	MOVLW       ?lstr2_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr2_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,53 :: 		return 7;
	MOVLW       7
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,54 :: 		}
L_teclado10:
;lcd.c,55 :: 		else if (portd.rd2 == 0){
	BTFSC       PORTD+0, 2 
	GOTO        L_teclado12
;lcd.c,56 :: 		LCD("4");
	MOVLW       ?lstr3_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr3_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,57 :: 		return 4;
	MOVLW       4
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,58 :: 		}
L_teclado12:
;lcd.c,59 :: 		else if (portd.rd3 == 0){
	BTFSC       PORTD+0, 3 
	GOTO        L_teclado14
;lcd.c,60 :: 		LCD("1");
	MOVLW       ?lstr4_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr4_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,61 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,62 :: 		}
L_teclado14:
L_teclado9:
;lcd.c,63 :: 		portb.rb0 = 1;          //desabilita primeira coluna do teclado
	BSF         PORTB+0, 0 
;lcd.c,64 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclado15:
	DECFSZ      R13, 1, 1
	BRA         L_teclado15
	DECFSZ      R12, 1, 1
	BRA         L_teclado15
	NOP
	NOP
;lcd.c,67 :: 		portb.rb1 = 0;          //habilita segunda coluna do teclado
	BCF         PORTB+0, 1 
;lcd.c,68 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclado16:
	DECFSZ      R13, 1, 1
	BRA         L_teclado16
	DECFSZ      R12, 1, 1
	BRA         L_teclado16
	NOP
	NOP
;lcd.c,70 :: 		if (portd.rd0 == 0){
	BTFSC       PORTD+0, 0 
	GOTO        L_teclado17
;lcd.c,71 :: 		LCD("0");
	MOVLW       ?lstr5_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr5_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,72 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_teclado
;lcd.c,73 :: 		}
L_teclado17:
;lcd.c,74 :: 		else if (portd.rd1 == 0){
	BTFSC       PORTD+0, 1 
	GOTO        L_teclado19
;lcd.c,75 :: 		LCD("8");
	MOVLW       ?lstr6_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr6_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,76 :: 		return 8;
	MOVLW       8
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,77 :: 		}
L_teclado19:
;lcd.c,78 :: 		else if (portd.rd2 == 0){
	BTFSC       PORTD+0, 2 
	GOTO        L_teclado21
;lcd.c,79 :: 		LCD("5");
	MOVLW       ?lstr7_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr7_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,80 :: 		return 5;
	MOVLW       5
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,81 :: 		}
L_teclado21:
;lcd.c,82 :: 		else if (portd.rd3 == 0){
	BTFSC       PORTD+0, 3 
	GOTO        L_teclado23
;lcd.c,83 :: 		LCD("2");
	MOVLW       ?lstr8_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr8_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,84 :: 		return 2;
	MOVLW       2
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,85 :: 		}
L_teclado23:
;lcd.c,86 :: 		portb.rb1 = 1;          //desabilita segunda coluna do teclado
	BSF         PORTB+0, 1 
;lcd.c,87 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclado24:
	DECFSZ      R13, 1, 1
	BRA         L_teclado24
	DECFSZ      R12, 1, 1
	BRA         L_teclado24
	NOP
	NOP
;lcd.c,90 :: 		portb.rb2 = 0;         //habilita terceira coluna do teclado
	BCF         PORTB+0, 2 
;lcd.c,91 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclado25:
	DECFSZ      R13, 1, 1
	BRA         L_teclado25
	DECFSZ      R12, 1, 1
	BRA         L_teclado25
	NOP
	NOP
;lcd.c,93 :: 		if (portd.rd0 == 0){
	BTFSC       PORTD+0, 0 
	GOTO        L_teclado26
;lcd.c,94 :: 		LCD("--->");
	MOVLW       ?lstr9_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr9_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,95 :: 		}
	GOTO        L_teclado27
L_teclado26:
;lcd.c,96 :: 		else if (portd.rd1 == 0){
	BTFSC       PORTD+0, 1 
	GOTO        L_teclado28
;lcd.c,97 :: 		LCD("9");
	MOVLW       ?lstr10_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr10_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,98 :: 		return 9;
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,99 :: 		}
L_teclado28:
;lcd.c,100 :: 		else if (portd.rd2 == 0){
	BTFSC       PORTD+0, 2 
	GOTO        L_teclado30
;lcd.c,101 :: 		LCD("6");
	MOVLW       ?lstr11_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr11_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,102 :: 		return 6;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,103 :: 		}
L_teclado30:
;lcd.c,104 :: 		else if (portd.rd3 == 0){
	BTFSC       PORTD+0, 3 
	GOTO        L_teclado32
;lcd.c,105 :: 		LCD("3");
	MOVLW       ?lstr12_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr12_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,106 :: 		return 3;
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_teclado
;lcd.c,107 :: 		}
L_teclado32:
L_teclado27:
;lcd.c,108 :: 		portb.rb2 = 1;        //desabilita terceira coluna do teclado
	BSF         PORTB+0, 2 
;lcd.c,110 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclado33:
	DECFSZ      R13, 1, 1
	BRA         L_teclado33
	DECFSZ      R12, 1, 1
	BRA         L_teclado33
	NOP
	NOP
;lcd.c,111 :: 		}
L_end_teclado:
	RETURN      0
; end of _teclado

_buzzer:

;lcd.c,113 :: 		void buzzer(){
;lcd.c,114 :: 		portc.rc1 = 0;
	BCF         PORTC+0, 1 
;lcd.c,115 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_buzzer34:
	DECFSZ      R13, 1, 1
	BRA         L_buzzer34
	DECFSZ      R12, 1, 1
	BRA         L_buzzer34
	DECFSZ      R11, 1, 1
	BRA         L_buzzer34
	NOP
;lcd.c,116 :: 		portc.rc1 = 1;
	BSF         PORTC+0, 1 
;lcd.c,117 :: 		}
L_end_buzzer:
	RETURN      0
; end of _buzzer

_checagem:

;lcd.c,119 :: 		void checagem(){
;lcd.c,120 :: 		if(primeiroDigito == 7){
	MOVLW       0
	XORWF       _primeiroDigito+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__checagem72
	MOVLW       7
	XORWF       _primeiroDigito+0, 0 
L__checagem72:
	BTFSS       STATUS+0, 2 
	GOTO        L_checagem35
;lcd.c,121 :: 		if(segundoDigito == 0){
	MOVLW       0
	XORWF       _segundoDigito+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__checagem73
	MOVLW       0
	XORWF       _segundoDigito+0, 0 
L__checagem73:
	BTFSS       STATUS+0, 2 
	GOTO        L_checagem36
;lcd.c,122 :: 		if(terceiroDigito == 0){
	MOVLW       0
	XORWF       _terceiroDigito+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__checagem74
	MOVLW       0
	XORWF       _terceiroDigito+0, 0 
L__checagem74:
	BTFSS       STATUS+0, 2 
	GOTO        L_checagem37
;lcd.c,123 :: 		if(quartoDigito == 1){
	MOVLW       0
	XORWF       _quartoDigito+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__checagem75
	MOVLW       1
	XORWF       _quartoDigito+0, 0 
L__checagem75:
	BTFSS       STATUS+0, 2 
	GOTO        L_checagem38
;lcd.c,124 :: 		piscaLED();
	CALL        _piscaLED+0, 0
;lcd.c,125 :: 		}
	GOTO        L_checagem39
L_checagem38:
;lcd.c,127 :: 		buzzer();
	CALL        _buzzer+0, 0
;lcd.c,128 :: 		digitando = 0;
	CLRF        _digitando+0 
	CLRF        _digitando+1 
;lcd.c,129 :: 		}
L_checagem39:
;lcd.c,130 :: 		}
	GOTO        L_checagem40
L_checagem37:
;lcd.c,132 :: 		buzzer();
	CALL        _buzzer+0, 0
;lcd.c,133 :: 		digitando = 0;
	CLRF        _digitando+0 
	CLRF        _digitando+1 
;lcd.c,134 :: 		}
L_checagem40:
;lcd.c,135 :: 		}
	GOTO        L_checagem41
L_checagem36:
;lcd.c,137 :: 		buzzer();
	CALL        _buzzer+0, 0
;lcd.c,138 :: 		digitando = 0;
	CLRF        _digitando+0 
	CLRF        _digitando+1 
;lcd.c,139 :: 		}
L_checagem41:
;lcd.c,140 :: 		}
	GOTO        L_checagem42
L_checagem35:
;lcd.c,142 :: 		buzzer();
	CALL        _buzzer+0, 0
;lcd.c,143 :: 		digitando = 0;
	CLRF        _digitando+0 
	CLRF        _digitando+1 
;lcd.c,144 :: 		}
L_checagem42:
;lcd.c,145 :: 		}
L_end_checagem:
	RETURN      0
; end of _checagem

_main:

;lcd.c,147 :: 		void main(){
;lcd.c,148 :: 		ADCON0 = 0X00;     // Desabilita o conversor A/D
	CLRF        ADCON0+0 
;lcd.c,149 :: 		ADCON1 = 0x06;     // Configura todos pinos da porta A para digital
	MOVLW       6
	MOVWF       ADCON1+0 
;lcd.c,151 :: 		trisd = 0x0F;      //configura os pinos RD0,RD1,RD2,RD3 da PORTD como
	MOVLW       15
	MOVWF       TRISD+0 
;lcd.c,155 :: 		trisb = 0xF8;     // configura pinos RB0,RB1,RB2 da PORTB como saida (teclado)
	MOVLW       248
	MOVWF       TRISB+0 
;lcd.c,157 :: 		portb = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;lcd.c,158 :: 		trisc = 0xFD;
	MOVLW       253
	MOVWF       TRISC+0 
;lcd.c,160 :: 		Lcd_Init();                      //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;lcd.c,161 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	NOP
	NOP
;lcd.c,162 :: 		Lcd_Cmd(_LCD_CLEAR);             //limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,163 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	NOP
	NOP
;lcd.c,164 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,165 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	NOP
	NOP
;lcd.c,167 :: 		while(1){
L_main46:
;lcd.c,168 :: 		LCD("Digite a senha");
	MOVLW       ?lstr13_lcd+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr13_lcd+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;lcd.c,169 :: 		digitando = 1;
	MOVLW       1
	MOVWF       _digitando+0 
	MOVLW       0
	MOVWF       _digitando+1 
;lcd.c,170 :: 		do{
L_main48:
;lcd.c,171 :: 		do{
L_main51:
;lcd.c,172 :: 		primeiroDigito = teclado();
	CALL        _teclado+0, 0
	MOVF        R0, 0 
	MOVWF       _primeiroDigito+0 
	MOVF        R1, 0 
	MOVWF       _primeiroDigito+1 
;lcd.c,173 :: 		}while(primeiroDigito == -1);
	MOVLW       255
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main77
	MOVLW       255
	XORWF       R0, 0 
L__main77:
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
;lcd.c,174 :: 		if(primeiroDigito >= 0){
	MOVLW       128
	XORWF       _primeiroDigito+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main78
	MOVLW       0
	SUBWF       _primeiroDigito+0, 0 
L__main78:
	BTFSS       STATUS+0, 0 
	GOTO        L_main54
;lcd.c,175 :: 		do{
L_main55:
;lcd.c,176 :: 		segundoDigito = teclado();
	CALL        _teclado+0, 0
	MOVF        R0, 0 
	MOVWF       _segundoDigito+0 
	MOVF        R1, 0 
	MOVWF       _segundoDigito+1 
;lcd.c,177 :: 		}while(segundoDigito == -1);
	MOVLW       255
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main79
	MOVLW       255
	XORWF       R0, 0 
L__main79:
	BTFSC       STATUS+0, 2 
	GOTO        L_main55
;lcd.c,178 :: 		if(segundoDigito >= 0){
	MOVLW       128
	XORWF       _segundoDigito+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main80
	MOVLW       0
	SUBWF       _segundoDigito+0, 0 
L__main80:
	BTFSS       STATUS+0, 0 
	GOTO        L_main58
;lcd.c,179 :: 		do{
L_main59:
;lcd.c,180 :: 		terceiroDigito = teclado();
	CALL        _teclado+0, 0
	MOVF        R0, 0 
	MOVWF       _terceiroDigito+0 
	MOVF        R1, 0 
	MOVWF       _terceiroDigito+1 
;lcd.c,181 :: 		}while(terceiroDigito == -1);
	MOVLW       255
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main81
	MOVLW       255
	XORWF       R0, 0 
L__main81:
	BTFSC       STATUS+0, 2 
	GOTO        L_main59
;lcd.c,182 :: 		if(terceiroDigito >= 0){
	MOVLW       128
	XORWF       _terceiroDigito+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main82
	MOVLW       0
	SUBWF       _terceiroDigito+0, 0 
L__main82:
	BTFSS       STATUS+0, 0 
	GOTO        L_main62
;lcd.c,183 :: 		do{
L_main63:
;lcd.c,184 :: 		quartoDigito = teclado();
	CALL        _teclado+0, 0
	MOVF        R0, 0 
	MOVWF       _quartoDigito+0 
	MOVF        R1, 0 
	MOVWF       _quartoDigito+1 
;lcd.c,185 :: 		}while(quartoDigito == -1);
	MOVLW       255
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main83
	MOVLW       255
	XORWF       R0, 0 
L__main83:
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
;lcd.c,186 :: 		}
L_main62:
;lcd.c,187 :: 		}
L_main58:
;lcd.c,188 :: 		}
L_main54:
;lcd.c,189 :: 		checagem();
	CALL        _checagem+0, 0
;lcd.c,190 :: 		}while(digitando == 1);
	MOVLW       0
	XORWF       _digitando+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main84
	MOVLW       1
	XORWF       _digitando+0, 0 
L__main84:
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
;lcd.c,191 :: 		}
	GOTO        L_main46
;lcd.c,192 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
