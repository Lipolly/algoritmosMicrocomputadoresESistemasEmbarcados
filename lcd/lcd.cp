#line 1 "F:/sis embarcados/lcd/lcd.c"
#line 15 "F:/sis embarcados/lcd/lcd.c"
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

int seg = 0;
int minu = 0;
int hora = 0;

char seg_string [8];
char minu_string [8];
char hora_string [8];






void main()
{
 ADCON0 = 0x00;
 ADCON1 = 0x0F;

 Lcd_Init();
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms(100);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 delay_ms(100);

 trisb = 1;

 while(1){
 while(hora < 24){
 while(minu < 59){
 while (seg < 59){
 delay_ms(50);
 seg++;
 inttostr(seg,seg_string);
 Ltrim(seg_string);
 Lcd_Out(1,10,":");
 if(seg<10){
 Lcd_Out(1,12,seg_string);
 }
 else{
 Lcd_Out(1,11,seg_string);
 }
 inttostr(minu,minu_string);
 Ltrim(minu_string);
 Lcd_Out(1,7,":");
 Lcd_Out_Cp(minu_string);

 inttostr(hora,hora_string);
 Ltrim(hora_string);
 Lcd_Out(1,5,hora_string);
 }

 minu++;
 seg=0;
 inttostr(seg,seg_string);
 Ltrim(seg_string);
 Lcd_Out(1,11,seg_string);
 }
 hora++;
 minu=0;
 inttostr(minu,minu_string);
 Ltrim(minu_string);
 Lcd_Out(1,8,minu_string);
 }
 hora = 0;
 minu = 0;
 seg = 0;
 inttostr(hora,hora_string);
 Ltrim(hora_string);
 Lcd_Out(1,5,hora_string);
 }
}
