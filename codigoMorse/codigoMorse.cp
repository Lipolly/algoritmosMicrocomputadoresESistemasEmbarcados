#line 1 "C:/Users/ricardo.batista1/Desktop/Temp/cpp/codigoMorse.c"

void pausa(int palavraContinua){
 portd = 0;
 if(palavraContinua){
 delay_ms(300);
 }
 else{
 delay_ms(900);
 }
}
void caractere(int palavraContinua, int tipoCarac, int vezes){
 int i = 0;
 portd = 255;
 while(i < vezes){
 if(tipoCarac == 200){
 delay_ms(200);
 }
 else{
 delay_ms(600);
 };
 pausa(palavraContinua);
 i = i+1;
 }
}
void main() {
 trisb = 1;
 trisd = 0;
 while(1){
 while(portb.rb0 == 0){
 caractere(1, 200, 1);
 caractere(1, 600, 1);
 caractere(0, 200, 1);

 caractere(1, 200, 1);
 caractere(1, 600, 2);
 caractere(0, 200, 1);

 caractere(1, 200, 1);
 caractere(1, 600, 1);
 caractere(1, 200, 1);
 caractere(0, 200, 1);

 caractere(1, 600, 1);
 caractere(1, 200, 2);
 caractere(0, 200, 1);
 }
 while(portb.rb1 == 0){
 caractere(1, 200, 2);
 caractere(1, 600, 2);
 caractere(0, 600, 1);

 caractere(1, 600, 4);
 caractere(0, 200, 1);

 caractere(1, 200, 2);
 caractere(1, 600, 2);
 caractere(0, 600, 1);

 caractere(1, 600, 4);
 caractere(0, 600, 1);

 caractere(1, 200, 1);
 caractere(1, 600, 3);
 caractere(0, 600, 1);

 caractere(1, 600, 4);
 caractere(0, 600, 1);

 caractere(1, 200, 4);
 caractere(0, 200, 1);

 caractere(1, 600, 4);
 caractere(0, 600, 1);

 caractere(1, 200, 4);
 caractere(0, 200, 1);
 }
 }
}
