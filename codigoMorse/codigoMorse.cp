#line 1 "C:/Users/ricardo.batista1/Desktop/atividade1/codigoMorse.c"
void apaga(){
 portd = 0;
 delay_ms(300);
}

void ponto(int apaga){
 portd = 255;
 delay_ms(200);
 if(apaga){
 apaga();
 }
}

void traco(int apaga){
 portd = 255;
 delay_ms(600);
 if(apaga){
 apaga();
 }
}

void espaco(){
 portd = 0;
 delay_ms(900);
}

void main() {
 trisb = 1;
 trisd = 0;

 while(1){
 while(portb.rb0 == 0){
 apaga();

 ponto(1);
 traco(1);
 ponto(0);

 espaco();

 ponto(1);
 traco(1);
 traco(1);
 ponto(0);

 espaco();

 ponto(1);
 traco(1);
 ponto(1);
 ponto(0);

 espaco();

 traco(1);
 ponto(1);
 ponto(1);
 ponto(0);

 }

 while(portb.rb1 == 0){
 ponto(1);
 ponto(1);
 traco(1);
 traco(1);
 traco(0);

 traco(1);
 traco(1);
 traco(1);
 traco(1);
 traco(1);

 ponto(1);
 ponto(1);
 traco(1);
 traco(1);
 traco(0);

 traco(1);
 traco(1);
 traco(1);
 traco(1);
 traco(0);

 ponto(1);
 traco(1);
 traco(1);
 traco(1);
 traco(0);

 traco(1);
 traco(1);
 traco(1);
 traco(1);
 traco(0);

 ponto(1);
 ponto(1);
 ponto(1);
 ponto(1);
 ponto(1);

 traco(1);
 traco(1);
 traco(1);
 traco(1);
 traco(0);

 ponto(1);
 ponto(1);
 ponto(1);
 ponto(1);
 ponto(1);
 }
 }
}
