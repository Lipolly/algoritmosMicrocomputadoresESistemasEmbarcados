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
 int aux1 = -1;
 int aux2 = -1;
 int flag = -1;
 int res = 0;
 char H[7];
void main() {
 Lcd_Cmd(_LCD_CLEAR);
 ADCON1=0x0f;
 trisd=0x0f;
 portb=0xff;
 trisb=0xf8;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);


 while(1){


 while(aux1==-1){
 portb.rb1=0;
 if (portd.rd0==0){

 aux1=0;
 }else if (portd.rd1==0){

 aux1=8;
 }else if (portd.rd2==0){

 aux1 = 5;
 }else if (portd.rd3==0){

 aux1 = 2;}
 portb.rb1=1;

 portb.rb2=0;
 if (portd.rd0==0);

 else if (portd.rd1==0){

 aux1 = 9;
 }else if (portd.rd2==0){

 aux1 = 6;
 }else if (portd.rd3==0){

 aux1 = 3;}
 portb.rb2=1;

 portb.rb0=0;
 if (portd.rd0==0);

 else if (portd.rd1==0){

 aux1 = 7;
 }else if (portd.rd2==0){

 aux1 = 4;
 }else if (portd.rd3==0){

 aux1 = 1;}
 portb.rb0=1;

 };
 Lcd_Cmd(_LCD_CLEAR);
 inttostr(aux1,H);
 Lcd_Out(1,1,H);
 delay_ms(200);
 LCD_Out(2,1,"->");

 while(aux2==-1){
 portb.rb1=0;
 if (portd.rd0==0){

 aux2=0;
 }else if (portd.rd1==0){

 aux2=8;
 }else if (portd.rd2==0){

 aux2 = 5;
 }else if (portd.rd3==0){

 aux2 = 2;}
 portb.rb1=1;

 portb.rb2=0;
 if (portd.rd0==0);

 else if (portd.rd1==0){
 aux2 = 9;
 }else if (portd.rd2==0){

 aux2 = 6;
 }else if (portd.rd3==0){

 aux2 = 3;}
 portb.rb2=1;

 portb.rb0=0;
 if (portd.rd0==0);

 else if (portd.rd1==0){

 aux2 = 7;
 }else if (portd.rd2==0){

 aux2 = 4;
 }else if (portd.rd3==0){

 aux2 = 1;}
 portb.rb0=1;

 };
 inttostr(aux2,H);
 Lcd_Out(2,1,H);
 while(flag == -1){
 portb.rb2=0;
 if (portd.rd0==0){
 res = aux1 + aux2;
 inttostr(res,H);
 LCD(H);
 flag = 0;}
 portb.rb2=1;

 portb.rb0=0;
 if (portd.rd0==0){
 res = aux1 - aux2;
 inttostr(res,H);
 LCD(H);
 flag = 0;}
 portb.rb0=1;

 };
 flag = -1;
 aux1 = -1;
 aux2 = -1;
 res = 0;
 delay_ms(1000);
 Lcd_Out(1,1,"End");
}
}
