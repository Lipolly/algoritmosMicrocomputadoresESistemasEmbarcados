#line 1 "C:/Users/Aluno/Desktop/Tacometro Digital/tacometro.c"




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


void main(){

 int contador = 0;
 int rotacao = 0;
 char res[6];

 ADCON1 = 0x0F;

 trisd = 0;
 portd = 0;

 trisc = 1;
 portc.rc2 = 1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Contador Rotacao");
 while(1) {
 while (portc.rc0 == 0)
 ;
 while (portc.rc0 == 1)
 ;
 contador = contador + 1;

 if (contador == 9){
 contador = 0;
 rotacao += 1;
 inttostr(rotacao,res);
 Lcd_Out(2,1,res);
 }
 }
}
