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

void LCD(char texto[16]){
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out(1,4,texto);
}

void main() {
     ADCON1=0x0f;      //desativa portas AD
     trisd=0x0f;       //ob00001111
     portb=0xff;       //ob11111111
     trisb=0xf8;       //ob11111000
     Lcd_Init();
     Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor

     do{

     portb.rb1=0; //ativa a segunda coluna
     if (portd.rd0==0)
        LCD("0");
        else if (portd.rd1==0)
             LCD("8");
             else if (portd.rd2==0)
                  LCD("5");
                  else if (portd.rd3==0)
                       LCD("2");
      portb.rb1=1;  //desativa a segunda coluna

      portb.rb2=0; //ativa a terceira coluna
      if (portd.rd0==0)
        LCD("__>");
        else if (portd.rd1==0)
             LCD("9");
             else if (portd.rd2==0)
                  LCD("6");
                  else if (portd.rd3==0)
                       LCD("3");
      portb.rb2=1;  //desativa a terceira coluna

       portb.rb0=0; //ativa a primeira coluna
     if (portd.rd0==0)
        LCD("<__");
        else if (portd.rd1==0)
             LCD("7");
             else if (portd.rd2==0)
                  LCD("4");
                  else if (portd.rd3==0)
                       LCD("1");
     portb.rb0=1;  //desativa a primeira coluna

 }    while(1);

}