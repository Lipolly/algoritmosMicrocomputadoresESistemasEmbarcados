
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

;Calculator.c,22 :: 		void main() {
;Calculator.c,23 :: 		ADCON1=0x0f;      //desativa portas AD
	MOVLW       15
	MOVWF       ADCON1+0 
;Calculator.c,24 :: 		trisd=0x0f;       //ob00001111
	MOVLW       15
	MOVWF       TRISD+0 
;Calculator.c,25 :: 		portb=0xff;       //ob11111111
	MOVLW       255
	MOVWF       PORTB+0 
;Calculator.c,26 :: 		trisb=0xf8;       //ob11111000
	MOVLW       248
	MOVWF       TRISB+0 
;Calculator.c,27 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Calculator.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Calculator.c,30 :: 		do{
L_main0:
;Calculator.c,34 :: 		portb.rb1=0; //ativa a segunda coluna
	BCF         PORTB+0, 1 
;Calculator.c,35 :: 		if (portd.rd0==0)
	BTFSC       PORTD+0, 0 
	GOTO        L_main3
;Calculator.c,36 :: 		LCD("0");
	MOVLW       ?lstr1_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr1_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main4
L_main3:
;Calculator.c,37 :: 		else if (portd.rd1==0)
	BTFSC       PORTD+0, 1 
	GOTO        L_main5
;Calculator.c,38 :: 		LCD("8");
	MOVLW       ?lstr2_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr2_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main6
L_main5:
;Calculator.c,39 :: 		else if (portd.rd2==0)
	BTFSC       PORTD+0, 2 
	GOTO        L_main7
;Calculator.c,40 :: 		LCD("5");
	MOVLW       ?lstr3_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr3_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main8
L_main7:
;Calculator.c,41 :: 		else if (portd.rd3==0)
	BTFSC       PORTD+0, 3 
	GOTO        L_main9
;Calculator.c,42 :: 		LCD("2");
	MOVLW       ?lstr4_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr4_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
L_main9:
L_main8:
L_main6:
L_main4:
;Calculator.c,43 :: 		portb.rb1=1;  //desativa a segunda coluna
	BSF         PORTB+0, 1 
;Calculator.c,45 :: 		portb.rb2=0; //ativa a terceira coluna
	BCF         PORTB+0, 2 
;Calculator.c,46 :: 		if (portd.rd0==0)
	BTFSC       PORTD+0, 0 
	GOTO        L_main10
;Calculator.c,47 :: 		LCD("__>");
	MOVLW       ?lstr5_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr5_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main11
L_main10:
;Calculator.c,48 :: 		else if (portd.rd1==0)
	BTFSC       PORTD+0, 1 
	GOTO        L_main12
;Calculator.c,49 :: 		LCD("9");
	MOVLW       ?lstr6_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr6_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main13
L_main12:
;Calculator.c,50 :: 		else if (portd.rd2==0)
	BTFSC       PORTD+0, 2 
	GOTO        L_main14
;Calculator.c,51 :: 		LCD("6");
	MOVLW       ?lstr7_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr7_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main15
L_main14:
;Calculator.c,52 :: 		else if (portd.rd3==0)
	BTFSC       PORTD+0, 3 
	GOTO        L_main16
;Calculator.c,53 :: 		LCD("3");
	MOVLW       ?lstr8_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr8_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
L_main16:
L_main15:
L_main13:
L_main11:
;Calculator.c,54 :: 		portb.rb2=1;  //desativa a terceira coluna
	BSF         PORTB+0, 2 
;Calculator.c,56 :: 		portb.rb0=0; //ativa a primeira coluna
	BCF         PORTB+0, 0 
;Calculator.c,57 :: 		if (portd.rd0==0)
	BTFSC       PORTD+0, 0 
	GOTO        L_main17
;Calculator.c,58 :: 		LCD("<__");
	MOVLW       ?lstr9_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr9_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main18
L_main17:
;Calculator.c,59 :: 		else if (portd.rd1==0)
	BTFSC       PORTD+0, 1 
	GOTO        L_main19
;Calculator.c,60 :: 		LCD("7");
	MOVLW       ?lstr10_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr10_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main20
L_main19:
;Calculator.c,61 :: 		else if (portd.rd2==0)
	BTFSC       PORTD+0, 2 
	GOTO        L_main21
;Calculator.c,62 :: 		LCD("4");
	MOVLW       ?lstr11_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr11_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
	GOTO        L_main22
L_main21:
;Calculator.c,63 :: 		else if (portd.rd3==0)
	BTFSC       PORTD+0, 3 
	GOTO        L_main23
;Calculator.c,64 :: 		LCD("1");
	MOVLW       ?lstr12_Calculator+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr12_Calculator+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
L_main23:
L_main22:
L_main20:
L_main18:
;Calculator.c,65 :: 		portb.rb0=1;  //desativa a primeira coluna
	BSF         PORTB+0, 0 
;Calculator.c,67 :: 		}    while(1);
	GOTO        L_main0
;Calculator.c,69 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
