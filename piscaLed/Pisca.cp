#line 1 "C:/Users/ricardo.batista1/Desktop/Aula1/Pisca.c"
void main(){
 trisb = 1;
 trisd = 0;

 while(1){
 while(portb.rb0 == 0){
 portd = 0;
 delay_ms(1000);
 portd = 255;
 delay_ms(1000);
 }
 }
}
