#line 1 "C:/Users/Aluno/Desktop/Calculator/Calculator.c"

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


void LCD(char texto[16]){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,4,texto);
}

void main() {
 ADCON1=0x0f;
 trisd=0x0f;
 portb=0xff;
 trisb=0xf8;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 do{



 portb.rb1=0;
 if (portd.rd0==0)
 LCD("0");
 else if (portd.rd1==0)
 LCD("8");
 else if (portd.rd2==0)
 LCD("5");
 else if (portd.rd3==0)
 LCD("2");
 portb.rb1=1;

 portb.rb2=0;
 if (portd.rd0==0)
 LCD("__>");
 else if (portd.rd1==0)
 LCD("9");
 else if (portd.rd2==0)
 LCD("6");
 else if (portd.rd3==0)
 LCD("3");
 portb.rb2=1;

 portb.rb0=0;
 if (portd.rd0==0)
 LCD("<__");
 else if (portd.rd1==0)
 LCD("7");
 else if (portd.rd2==0)
 LCD("4");
 else if (portd.rd3==0)
 LCD("1");
 portb.rb0=1;

 } while(1);

}
