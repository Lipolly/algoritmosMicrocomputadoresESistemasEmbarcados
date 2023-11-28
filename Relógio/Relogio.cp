#line 1 "C:/Users/Rodrigo/Google Drive/10º Período/Sistemas Embarcados/Praticas/Relógio/Relogio.c"


void TrimLeft(char *str) {
char count = 1;
 while (*str++ != 0) {
 if (*str != 32) {
 *(str - count--) = *str;
 }
 count++;
 }
}


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




 int seg;
 int m;
 int h;
 char txtH[7];
 char txtM[7];
 char txtS[7];


void main(){

 trisb = 7;
 ADCON1 = 0x0F;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);



 Lcd_Out(1,3,":");
 Lcd_Out(1,6,":");


 while(1){
 for(h=0;h<24;h++){
 inttostr(h,txtH);
 TrimLeft(txtH);
 Lcd_Out(1,1,txtH);

 for(m=0;m<60;m++){
 inttostr(m,txtM);
 TrimLeft(txtM);
 Lcd_Out(1,4,txtM);

 for(seg=0;seg<60;seg++){
 inttostr(seg,txtS);
 TrimLeft(txtS);
 Lcd_Out(1,7,txtS);




 if (portb.b0 == 1)
 delay_ms(1000);
 else
 delay_ms(100);




 if (portb.b1 == 0){
 m++;
 inttostr(m,txtM);
 TrimLeft(txtM);
 Lcd_Out(1,4,txtM);



 if (m==60){
 m = 0;
 Lcd_Out(1,4,"  ");
 Lcd_Out(1,4,"0");
 }
 }




 if (portb.b2 == 0){
 h++;
 inttostr(h,txtH);
 TrimLeft(txtH);
 Lcd_Out(1,1,txtH);



 if (h==24){
 h = 0;
 Lcd_Out(1,1,"  ");
 Lcd_Out(1,1,"0");
 }
 }

 }
 Lcd_Out(1,8," ");
 }
 Lcd_Out(1,5," ");
 }
 Lcd_Out(1,2," ");
 }
}
