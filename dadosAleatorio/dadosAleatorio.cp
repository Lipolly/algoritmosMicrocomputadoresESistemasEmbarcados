#line 1 "C:/Users/joao.pereira7/Desktop/Temp/dadosAleatorio/dadosAleatorio.c"
void main (){
 int aleatorioB = 0;
 int aleatorioD = 0;
 trisb = 1;
 trisc = 0xFD;
 trisd = 0;
 portc.rc1 = 1;
 while(1){
 if(portb.rb0 == 0){
 portd = 255;
 portb = 255;
 delay_ms(100);
 if(portb.rb0 == 1){
 portd = 0;
 portb = 0;
 delay_ms(100);
 aleatorioD = (rand()%6)+1;
 if(aleatorioD == 1){
 portd.rd1 = 255;
 }
 else if(aleatorioD == 2){
 portd.rd2 = 255;
 }
 else if(aleatorioD == 3){
 portd.rd3 = 255;
 }
 else if(aleatorioD == 4){
 portd.rd4 = 255;
 }
 else if(aleatorioD == 5){
 portd.rd5 = 255;
 }
 else if(aleatorioD == 6){
 portd.rd6 = 255;
 };
 aleatorioB = (rand()%6)+1;
 if(aleatorioB == 1){
 portb.rb1 = 255;
 }
 else if(aleatorioB == 2){
 portb.rb2 = 255;
 }
 else if(aleatorioB == 3){
 portb.rb3 = 255;
 }
 else if(aleatorioB == 4){
 portb.rb4 = 255;
 }
 else if(aleatorioB == 5){
 portb.rb5 = 255;
 }
 else if(aleatorioB == 6){
 portb.rb6 = 255;
 };


 if((aleatorioB == 6) && (aleatorioB == aleatorioD)){
 portc.rc1 = 1;
 delay_ms(1000);
 portc.rc1 = 0;
 delay_ms(500);
 portc.rc1 = 1;
 delay_ms(1000);
 portc.rc1 = 0;
 delay_ms(500);
 };
 }
 }
 }
}
