#line 1 "C:/Users/Aluno/Desktop/Morse/Morse.c"







void ponto(){
 portd = 255;
 delay_ms(250);
 portd = 0;
 delay_ms(200);
}

void traco(){
 portd = 255;
 delay_ms(1000);
 portd = 0;
 delay_ms(200);
}

void fdc(){
 delay_ms(1000);
}


void main() {

 trisb = 3;
 trisd = 0;

 while(1){

 while(portb.b0 == 0){


 ponto();
 traco();
 ponto();
 fdc();


 ponto();
 traco();
 ponto();
 fdc();


 ponto();
 traco();
 traco();
 fdc();
 }


 while(portb.b1 == 0){

 ponto();
 ponto();
 traco();
 traco();
 traco();
 fdc();


 traco();
 traco();
 traco();
 traco();
 traco();
 fdc();


 ponto();
 traco();
 traco();
 traco();
 traco();
 fdc();


 traco();
 traco();
 traco();
 traco();
 traco();
 fdc();


 ponto();
 ponto();
 traco();
 traco();
 traco();
 fdc();


 traco();
 traco();
 traco();
 traco();
 traco();
 fdc();


 traco();
 ponto();
 ponto();
 ponto();
 ponto();
 fdc();


 ponto();
 ponto();
 ponto();
 ponto();
 ponto();
 fdc();


 traco();
 ponto();
 ponto();
 ponto();
 ponto();
 fdc();

 }

}
}
