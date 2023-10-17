
_main:

;lcd.c,42 :: 		void main()
;lcd.c,44 :: 		ADCON0  = 0x00;        // Configura todos pinos das portas para digital e
	CLRF        ADCON0+0 
;lcd.c,45 :: 		ADCON1  = 0x0F;       // desabilita o conversor A/D
	MOVLW       15
	MOVWF       ADCON1+0 
;lcd.c,47 :: 		Lcd_Init();                          //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;lcd.c,48 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;lcd.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);                 //Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,50 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
;lcd.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);            //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd.c,52 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;lcd.c,54 :: 		trisb = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;lcd.c,56 :: 		while(1){
L_main3:
;lcd.c,57 :: 		while(hora < 24){
L_main5:
	MOVLW       128
	XORWF       _hora+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main15
	MOVLW       24
	SUBWF       _hora+0, 0 
L__main15:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;lcd.c,58 :: 		while(minu < 59){
L_main7:
	MOVLW       128
	XORWF       _minu+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main16
	MOVLW       59
	SUBWF       _minu+0, 0 
L__main16:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;lcd.c,59 :: 		while (seg < 59){
L_main9:
	MOVLW       128
	XORWF       _seg+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVLW       59
	SUBWF       _seg+0, 0 
L__main17:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;lcd.c,60 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
	NOP
;lcd.c,61 :: 		seg++;
	INFSNZ      _seg+0, 1 
	INCF        _seg+1, 1 
;lcd.c,62 :: 		inttostr(seg,seg_string);
	MOVF        _seg+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _seg+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _seg_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;lcd.c,63 :: 		Ltrim(seg_string);
	MOVLW       _seg_string+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;lcd.c,64 :: 		Lcd_Out(1,10,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,65 :: 		if(seg<10){
	MOVLW       128
	XORWF       _seg+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       10
	SUBWF       _seg+0, 0 
L__main18:
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;lcd.c,66 :: 		Lcd_Out(1,12,seg_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _seg_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,67 :: 		}
	GOTO        L_main13
L_main12:
;lcd.c,69 :: 		Lcd_Out(1,11,seg_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _seg_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,70 :: 		}
L_main13:
;lcd.c,71 :: 		inttostr(minu,minu_string);
	MOVF        _minu+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _minu+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _minu_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_minu_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;lcd.c,72 :: 		Ltrim(minu_string);
	MOVLW       _minu_string+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_minu_string+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;lcd.c,73 :: 		Lcd_Out(1,7,":");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_lcd+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_lcd+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,74 :: 		Lcd_Out_Cp(minu_string);
	MOVLW       _minu_string+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(_minu_string+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;lcd.c,76 :: 		inttostr(hora,hora_string);
	MOVF        _hora+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _hora+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _hora_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hora_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;lcd.c,77 :: 		Ltrim(hora_string);
	MOVLW       _hora_string+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_hora_string+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;lcd.c,78 :: 		Lcd_Out(1,5,hora_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,79 :: 		}
	GOTO        L_main9
L_main10:
;lcd.c,81 :: 		minu++;
	INFSNZ      _minu+0, 1 
	INCF        _minu+1, 1 
;lcd.c,82 :: 		seg=0;
	CLRF        _seg+0 
	CLRF        _seg+1 
;lcd.c,83 :: 		inttostr(seg,seg_string);
	CLRF        FARG_IntToStr_input+0 
	CLRF        FARG_IntToStr_input+1 
	MOVLW       _seg_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;lcd.c,84 :: 		Ltrim(seg_string);
	MOVLW       _seg_string+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;lcd.c,85 :: 		Lcd_Out(1,11,seg_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _seg_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_seg_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,86 :: 		}
	GOTO        L_main7
L_main8:
;lcd.c,87 :: 		hora++;
	INFSNZ      _hora+0, 1 
	INCF        _hora+1, 1 
;lcd.c,88 :: 		minu=0;
	CLRF        _minu+0 
	CLRF        _minu+1 
;lcd.c,89 :: 		inttostr(minu,minu_string);
	CLRF        FARG_IntToStr_input+0 
	CLRF        FARG_IntToStr_input+1 
	MOVLW       _minu_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_minu_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;lcd.c,90 :: 		Ltrim(minu_string);
	MOVLW       _minu_string+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_minu_string+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;lcd.c,91 :: 		Lcd_Out(1,8,minu_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _minu_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_minu_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,92 :: 		}
	GOTO        L_main5
L_main6:
;lcd.c,93 :: 		hora = 0;
	CLRF        _hora+0 
	CLRF        _hora+1 
;lcd.c,94 :: 		minu = 0;
	CLRF        _minu+0 
	CLRF        _minu+1 
;lcd.c,95 :: 		seg = 0;
	CLRF        _seg+0 
	CLRF        _seg+1 
;lcd.c,96 :: 		inttostr(hora,hora_string);
	CLRF        FARG_IntToStr_input+0 
	CLRF        FARG_IntToStr_input+1 
	MOVLW       _hora_string+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_hora_string+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;lcd.c,97 :: 		Ltrim(hora_string);
	MOVLW       _hora_string+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_hora_string+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
;lcd.c,98 :: 		Lcd_Out(1,5,hora_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _hora_string+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_hora_string+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd.c,99 :: 		}
	GOTO        L_main3
;lcd.c,100 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main
