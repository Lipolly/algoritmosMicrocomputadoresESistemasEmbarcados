#line 1 "C:/Users/Aluno/Desktop/Temporizador/Temporizador.c"


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
int flag1;

void main(){

 flag1 = -1;
 trisb = 7;
 ADCON1 = 0x0F;


 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 trisc.rc0 = 0;
 portc.rc0 = 0;


 Lcd_Out(1,3,":");
 Lcd_Out(1,6,":");

 while(flag1==-1){

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
 while (portb.b0 == 1){


 while (portb.b1 == 0){
 m++;
 delay_ms(500);
 inttostr(m,txtM);
 TrimLeft(txtM);
 Lcd_Out(1,4,txtM);


 if (m==60){
 m = 0;
 Lcd_Out(1,4,"  ");
 Lcd_Out(1,4,"0");
 }
 }
 while (portb.b2 == 0){
 h++;
 delay_ms(500);
 inttostr(h,txtH);
 TrimLeft(txtH);
 Lcd_Out(1,1,txtH);


 if (h==99){
 h = 0;
 Lcd_Out(1,1,"  ");
 Lcd_Out(1,1,"0");
 }
 }
 if (portb.b3 == 0){
 flag1 = 1;
 break;
 }
 }
 delay_ms(500);
 if (flag1!=-1)
 break;
 }
 Lcd_Out(1,8," ");
 if (flag1!=-1)
 break;
 }
 Lcd_Out(1,5," ");
 if (flag1!=-1)
 break;
 }
 Lcd_Out(1,2," ");
 }


 for(;h>=0;h--){
 inttostr(h,txtH);
 TrimLeft(txtH);
 Lcd_Out(1,1,txtH);
 for(;m>=0;m--){
 inttostr(m,txtM);
 TrimLeft(txtM);
 Lcd_Out(1,4,txtM);
 for(;seg>=0;seg--){
 inttostr(seg,txtS);
 TrimLeft(txtS);
 Lcd_Out(1,7,txtS);



 if (portb.b0 == 1)
 delay_ms(1000);
 else
 delay_ms(100);
 if (seg<11){
 Lcd_Out(1,8," ");
 }
 }
 Lcd_Out(1,8," ");
 seg = 59;
 if (m<11){
 Lcd_Out(1,5," ");
 }
 }
 Lcd_Out(1,5," ");
 m = 59;
 if (h<11){
 Lcd_Out(1,2," ");
 }
 }
 Lcd_Out(1,2," ");

 portc.rc0 = 1;
 delay_ms(5000);
 portc.rc0 = 0;
}
