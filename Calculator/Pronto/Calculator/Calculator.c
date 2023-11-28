// LCD module connections
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// End LCD mocule connection

// funcao para escrever no LCD
void LCD(char texto[16]){
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1,4,texto);
}

//declaracao de variaveis
 int aux1 = -1;
 int aux2 = -1;
 int flag = -1;
 int res = 0;
 char H[7];
 
void main() {
     Lcd_Cmd(_LCD_CLEAR);           //limpa o LCD
     ADCON1=0x0f;                   //desativa portas AD
     trisd=0x0f;                    //ob00001111
     portb=0xff;                    //ob11111111
     trisb=0xf8;                    //ob11111000
     Lcd_Init();                    //inicializa o LCD
     Lcd_Cmd(_LCD_CURSOR_OFF);      //Desabilita o cursor
     
     while(1){

// while para captura do primeiro digito

     while(aux1==-1){
     portb.rb1=0; //ativa a segunda coluna
     if (portd.rd0==0){
        aux1=0;
        }else if (portd.rd1==0){
             aux1=8;
             }else if (portd.rd2==0){
                  aux1 = 5;
                  }else if (portd.rd3==0){
                       aux1 = 2;}
      portb.rb1=1;  //desativa a segunda coluna

      portb.rb2=0; //ativa a terceira coluna
      if (portd.rd0==0);
        else if (portd.rd1==0){
             aux1 = 9;
             }else if (portd.rd2==0){
                  aux1 = 6;
                  }else if (portd.rd3==0){
                       aux1 = 3;}
      portb.rb2=1;  //desativa a terceira coluna

       portb.rb0=0; //ativa a primeira coluna
     if (portd.rd0==0);
        else if (portd.rd1==0){
             aux1 = 7;
             }else if (portd.rd2==0){
                  aux1 = 4;
                  }else if (portd.rd3==0){
                       aux1 = 1;}
     portb.rb0=1;  //desativa a primeira coluna

 };
    Lcd_Cmd(_LCD_CLEAR);   // limpa o LCD
    inttostr(aux1,H);      // converte o primeiro digito para uma string
    Lcd_Out(1,1,H);        // escreve o primeiro digito no LCD
    delay_ms(200);         // delay
    LCD_Out(2,1,"->");     // indica que o software esta pronto para capturar o segundo digito
        
 // while para captura do segundo digito
 
     while(aux2==-1){
     portb.rb1=0; //ativa a segunda coluna
     if (portd.rd0==0){
        aux2=0;
        }else if (portd.rd1==0){
             aux2=8;
             }else if (portd.rd2==0){
                  aux2 = 5;
                  }else if (portd.rd3==0){
                       aux2 = 2;}
      portb.rb1=1;  //desativa a segunda coluna

      portb.rb2=0; //ativa a terceira coluna
      if (portd.rd0==0);
        else if (portd.rd1==0){
             aux2 = 9;
             }else if (portd.rd2==0){
                  aux2 = 6;
                  }else if (portd.rd3==0){
                       aux2 = 3;}
      portb.rb2=1;  //desativa a terceira coluna

       portb.rb0=0; //ativa a primeira coluna
     if (portd.rd0==0);
        else if (portd.rd1==0){
             aux2 = 7;
             }else if (portd.rd2==0){
                  aux2 = 4;
                  }else if (portd.rd3==0){
                       aux2 = 1;}
     portb.rb0=1;  //desativa a primeira coluna

 };
        inttostr(aux2,H);     // converte o segundo digito para uma string
        Lcd_Out(2,1,H);       // escreve o segundo digito no LCD
 
 // while para capturar a operacao matematica
 
     while(flag == -1){
      portb.rb2=0; //ativa a terceira coluna
      if (portd.rd0==0){
        res = aux1 + aux2;     // faz a operecao de soma
        inttostr(res,H);       // converte o resultado da operacao para uma string
        LCD(H);                // escreve o resultado da operacao no LCD
        flag = 0;}             // reseta o valor da flag
      portb.rb2=1;  //desativa a terceira coluna

      portb.rb0=0; //ativa a primeira coluna
     if (portd.rd0==0){
        res = aux1 - aux2;   // faz a operecao de subtracao
        inttostr(res,H);     // converte o resultado da operacao para uma string
        LCD(H);              // escreve o resultado da operacao no LCD
        flag = 0;}           // reseta o valor da flag
     portb.rb0=1;  //desativa a primeira coluna
 };
 
 // reseta os valores das variaveis
 flag = -1;
 aux1 = -1;
 aux2 = -1;
 res = 0;
 
 delay_ms(1000);        // delay
 Lcd_Out(1,1,"End");    // indica que o programa chegou ao fim e esta pronot para fazer outra conta
}
}