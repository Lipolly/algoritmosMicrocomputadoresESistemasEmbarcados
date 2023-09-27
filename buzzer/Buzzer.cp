#line 1 "C:/Users/joao.pereira7/Desktop/Temp/buzzer/Buzzer.c"
#line 15 "C:/Users/joao.pereira7/Desktop/Temp/buzzer/Buzzer.c"
void main ()
{



 trisc = 0xFD;


 portc.rc1 = 1;


 while(1)
 {

 portc.rc1 = ~portc.rc1;


 delay_ms(1000) ;
 }
}
