
_LCD:

;Calculator.c,17 :: 		void LCD(char texto[16]){
;Calculator.c,18 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Calculator.c,19 :: 		Lcd_Out(1,4,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCD_texto+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCD_texto+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Calculator.c,20 :: 		}
L_end_LCD:
	RETURN      0
; end of _LCD

_main:

;Calculator.c,26 :: 		void main() {
;Calculator.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Calculator.c,28 :: 		ADCON1=0x0f;      //desativa portas AD
	MOVLW       15
	MOVWF       ADCON1+0 
;Calculator.c,29 :: 		trisd=0x0f;       //ob00001111
	MOVLW       15
	MOVWF       TRISD+0 
;Calculator.c,30 :: 		portb=0xff;       //ob11111111
	MOVLW       255
	MOVWF       PORTB+0 
;Calculator.c,31 :: 		trisb=0xf8;       //ob11111000
	MOVLW       248
	MOVWF       TRISB+0 
;Calculator.c,32 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Calculator.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Calculator.c,36 :: 		while(1){
L_main0:
;Calculator.c,39 :: 		while(aux1==-1){
L_main2:
	MOVLW       255
	XORWF       _aux1+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVLW       255
	XORWF       _aux1+0, 0 
L__main56:
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Calculator.c,40 :: 		portb.rb1=0; //ativa a segunda coluna
	BCF         PORTB+0, 1 
;Calculator.c,41 :: 		if (portd.rd0==0){
	BTFSC       PORTD+0, 0 
	GOTO        L_main4
;Calculator.c,43 :: 		aux1=0;
	CLRF        _aux1+0 
	CLRF        _aux1+1 
;Calculator.c,44 :: 		}else if (portd.rd1==0){
	GOTO        L_main5
L_main4:
	BTFSC       PORTD+0, 1 
	GOTO        L_main6
;Calculator.c,46 :: 		aux1=8;
	MOVLW       8
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
;Calculator.c,47 :: 		}else if (portd.rd2==0){
	GOTO        L_main7
L_main6:
	BTFSC       PORTD+0, 2 
	GOTO        L_main8
;Calculator.c,49 :: 		aux1 = 5;
	MOVLW       5
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
;Calculator.c,50 :: 		}else if (portd.rd3==0){
	GOTO        L_main9
L_main8:
	BTFSC       PORTD+0, 3 
	GOTO        L_main10
;Calculator.c,52 :: 		aux1 = 2;}
	MOVLW       2
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
L_main10:
L_main9:
L_main7:
L_main5:
;Calculator.c,53 :: 		portb.rb1=1;  //desativa a segunda coluna
	BSF         PORTB+0, 1 
;Calculator.c,55 :: 		portb.rb2=0; //ativa a terceira coluna
	BCF         PORTB+0, 2 
;Calculator.c,56 :: 		if (portd.rd0==0);
	BTFSC       PORTD+0, 0 
	GOTO        L_main11
	GOTO        L_main12
L_main11:
;Calculator.c,58 :: 		else if (portd.rd1==0){
	BTFSC       PORTD+0, 1 
	GOTO        L_main13
;Calculator.c,60 :: 		aux1 = 9;
	MOVLW       9
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
;Calculator.c,61 :: 		}else if (portd.rd2==0){
	GOTO        L_main14
L_main13:
	BTFSC       PORTD+0, 2 
	GOTO        L_main15
;Calculator.c,63 :: 		aux1 = 6;
	MOVLW       6
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
;Calculator.c,64 :: 		}else if (portd.rd3==0){
	GOTO        L_main16
L_main15:
	BTFSC       PORTD+0, 3 
	GOTO        L_main17
;Calculator.c,66 :: 		aux1 = 3;}
	MOVLW       3
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
L_main17:
L_main16:
L_main14:
L_main12:
;Calculator.c,67 :: 		portb.rb2=1;  //desativa a terceira coluna
	BSF         PORTB+0, 2 
;Calculator.c,69 :: 		portb.rb0=0; //ativa a primeira coluna
	BCF         PORTB+0, 0 
;Calculator.c,70 :: 		if (portd.rd0==0);
	BTFSC       PORTD+0, 0 
	GOTO        L_main18
	GOTO        L_main19
L_main18:
;Calculator.c,72 :: 		else if (portd.rd1==0){
	BTFSC       PORTD+0, 1 
	GOTO        L_main20
;Calculator.c,74 :: 		aux1 = 7;
	MOVLW       7
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
;Calculator.c,75 :: 		}else if (portd.rd2==0){
	GOTO        L_main21
L_main20:
	BTFSC       PORTD+0, 2 
	GOTO        L_main22
;Calculator.c,77 :: 		aux1 = 4;
	MOVLW       4
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
;Calculator.c,78 :: 		}else if (portd.rd3==0){
	GOTO        L_main23
L_main22:
	BTFSC       PORTD+0, 3 
	GOTO        L_main24
;Calculator.c,80 :: 		aux1 = 1;}
	MOVLW       1
	MOVWF       _aux1+0 
	MOVLW       0
	MOVWF       _aux1+1 
L_main24:
L_main23:
L_main21:
L_main19:
;Calculator.c,81 :: 		portb.rb0=1;  //desativa a primeira coluna
	BSF         PORTB+0, 0 
;Calculator.c,83 :: 		};
	GOTO        L_main2
L_main3:
;Calculator.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Calculator.c,85 :: 		inttostr(aux1,H);
	MOVF        _aux1+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _aux1+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _H+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Calculator.c,86 :: 		Lcd_Out(1,1,H);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _H+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Calculator.c,87 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
;Calculator.c,88 :: 		LCD_Out(2,1,"->");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Calculator+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Calculator+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Calculator.c,90 :: 		while(aux2==-1){
L_main26:
	MOVLW       255
	XORWF       _aux2+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       255
	XORWF       _aux2+0, 0 
L__main57:
	BTFSS       STATUS+0, 2 
	GOTO        L_main27
;Calculator.c,91 :: 		portb.rb1=0; //ativa a segunda coluna
	BCF         PORTB+0, 1 
;Calculator.c,92 :: 		if (portd.rd0==0){
	BTFSC       PORTD+0, 0 
	GOTO        L_main28
;Calculator.c,94 :: 		aux2=0;
	CLRF        _aux2+0 
	CLRF        _aux2+1 
;Calculator.c,95 :: 		}else if (portd.rd1==0){
	GOTO        L_main29
L_main28:
	BTFSC       PORTD+0, 1 
	GOTO        L_main30
;Calculator.c,97 :: 		aux2=8;
	MOVLW       8
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
;Calculator.c,98 :: 		}else if (portd.rd2==0){
	GOTO        L_main31
L_main30:
	BTFSC       PORTD+0, 2 
	GOTO        L_main32
;Calculator.c,100 :: 		aux2 = 5;
	MOVLW       5
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
;Calculator.c,101 :: 		}else if (portd.rd3==0){
	GOTO        L_main33
L_main32:
	BTFSC       PORTD+0, 3 
	GOTO        L_main34
;Calculator.c,103 :: 		aux2 = 2;}
	MOVLW       2
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
L_main34:
L_main33:
L_main31:
L_main29:
;Calculator.c,104 :: 		portb.rb1=1;  //desativa a segunda coluna
	BSF         PORTB+0, 1 
;Calculator.c,106 :: 		portb.rb2=0; //ativa a terceira coluna
	BCF         PORTB+0, 2 
;Calculator.c,107 :: 		if (portd.rd0==0);
	BTFSC       PORTD+0, 0 
	GOTO        L_main35
	GOTO        L_main36
L_main35:
;Calculator.c,109 :: 		else if (portd.rd1==0){
	BTFSC       PORTD+0, 1 
	GOTO        L_main37
;Calculator.c,110 :: 		aux2 = 9;
	MOVLW       9
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
;Calculator.c,111 :: 		}else if (portd.rd2==0){
	GOTO        L_main38
L_main37:
	BTFSC       PORTD+0, 2 
	GOTO        L_main39
;Calculator.c,113 :: 		aux2 = 6;
	MOVLW       6
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
;Calculator.c,114 :: 		}else if (portd.rd3==0){
	GOTO        L_main40
L_main39:
	BTFSC       PORTD+0, 3 
	GOTO        L_main41
;Calculator.c,116 :: 		aux2 = 3;}
	MOVLW       3
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
L_main41:
L_main40:
L_main38:
L_main36:
;Calculator.c,117 :: 		portb.rb2=1;  //desativa a terceira coluna
	BSF         PORTB+0, 2 
;Calculator.c,119 :: 		portb.rb0=0; //ativa a primeira coluna
	BCF         PORTB+0, 0 
;Calculator.c,120 :: 		if (portd.rd0==0);
	BTFSC       PORTD+0, 0 
	GOTO        L_main42
	GOTO        L_main43
L_main42:
;Calculator.c,122 :: 		else if (portd.rd1==0){
	BTFSC       PORTD+0, 1 
	GOTO        L_main44
;Calculator.c,124 :: 		aux2 = 7;
	MOVLW       7
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
;Calculator.c,125 :: 		}else if (portd.rd2==0){
	GOTO        L_main45
L_main44:
	BTFSC       PORTD+0, 2 
	GOTO        L_main46
;Calculator.c,127 :: 		aux2 = 4;
	MOVLW       4
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
;Calculator.c,128 :: 		}else if (portd.rd3==0){
	GOTO        L_main47
L_main46:
	BTFSC       PORTD+0, 3 
	GOTO        L_main48
;Calculator.c,130 :: 		aux2 = 1;}
	MOVLW       1
	MOVWF       _aux2+0 
	MOVLW       0
	MOVWF       _aux2+1 
L_main48:
L_main47:
L_main45:
L_main43:
;Calculator.c,131 :: 		portb.rb0=1;  //desativa a primeira coluna
	BSF         PORTB+0, 0 
;Calculator.c,133 :: 		};
	GOTO        L_main26
L_main27:
;Calculator.c,134 :: 		inttostr(aux2,H);
	MOVF        _aux2+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _aux2+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _H+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Calculator.c,135 :: 		Lcd_Out(2,1,H);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _H+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Calculator.c,136 :: 		while(flag == -1){
L_main49:
	MOVLW       255
	XORWF       _flag+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVLW       255
	XORWF       _flag+0, 0 
L__main58:
	BTFSS       STATUS+0, 2 
	GOTO        L_main50
;Calculator.c,137 :: 		portb.rb2=0; //ativa a terceira coluna
	BCF         PORTB+0, 2 
;Calculator.c,138 :: 		if (portd.rd0==0){
	BTFSC       PORTD+0, 0 
	GOTO        L_main51
;Calculator.c,139 :: 		res = aux1 + aux2;
	MOVF        _aux2+0, 0 
	ADDWF       _aux1+0, 0 
	MOVWF       R0 
	MOVF        _aux2+1, 0 
	ADDWFC      _aux1+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _res+0 
	MOVF        R1, 0 
	MOVWF       _res+1 
;Calculator.c,140 :: 		inttostr(res,H);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _H+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Calculator.c,141 :: 		LCD(H);
	MOVLW       _H+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;Calculator.c,142 :: 		flag = 0;}
	CLRF        _flag+0 
	CLRF        _flag+1 
L_main51:
;Calculator.c,143 :: 		portb.rb2=1;  //desativa a terceira coluna
	BSF         PORTB+0, 2 
;Calculator.c,145 :: 		portb.rb0=0; //ativa a primeira coluna
	BCF         PORTB+0, 0 
;Calculator.c,146 :: 		if (portd.rd0==0){
	BTFSC       PORTD+0, 0 
	GOTO        L_main52
;Calculator.c,147 :: 		res = aux1 - aux2;
	MOVF        _aux2+0, 0 
	SUBWF       _aux1+0, 0 
	MOVWF       R0 
	MOVF        _aux2+1, 0 
	SUBWFB      _aux1+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _res+0 
	MOVF        R1, 0 
	MOVWF       _res+1 
;Calculator.c,148 :: 		inttostr(res,H);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _H+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Calculator.c,149 :: 		LCD(H);
	MOVLW       _H+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(_H+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;Calculator.c,150 :: 		flag = 0;}
	CLRF        _flag+0 
	CLRF        _flag+1 
L_main52:
;Calculator.c,151 :: 		portb.rb0=1;  //desativa a primeira coluna
	BSF         PORTB+0, 0 
;Calculator.c,153 :: 		};
	GOTO        L_main49
L_main50:
;Calculator.c,154 :: 		flag = -1;
	MOVLW       255
	MOVWF       _flag+0 
	MOVLW       255
	MOVWF       _flag+1 
;Calculator.c,155 :: 		aux1 = -1;
	MOVLW       255
	MOVWF       _aux1+0 
	MOVLW       255
	MOVWF       _aux1+1 
;Calculator.c,156 :: 		aux2 = -1;
	MOVLW       255
	MOVWF       _aux2+0 
	MOVLW       255
	MOVWF       _aux2+1 
;Calculator.c,157 :: 		res = 0;
	CLRF        _res+0 
	CLRF        _res+1 
;Calculator.c,158 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	NOP
	NOP
;Calculator.c,159 :: 		Lcd_Out(1,1,"End");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Calculator+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Calculator+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Calculator.c,160 :: 		}
	GOTO        L_main0
;Calculator.c,161 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
