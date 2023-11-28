// Sistemas Embarcados
//Rodrigo Reviglio Weishaupt
//201020656

//Codigo Morse - Pratica 01

// funcao ponto
void ponto(){
     portd = 255;
     delay_ms(250);
     portd = 0;
     delay_ms(200);
}
//funcao traco
void traco(){
     portd = 255;
     delay_ms(1000);
     portd = 0;
     delay_ms(200);
}
//funcao fim de caractere
void fdc(){
     delay_ms(1000);
}


void main() {
     //definicao de pinos
     trisb = 3; //rb1 e rb0 definidos como entrada
     trisd = 0; //rd0 a rd7 definidos como saida
     
     while(1){
     //Iniciais
     while(portb.b0 == 0){
     
     // R
     ponto();
     traco();
     ponto();
     fdc();
     
     // R
     ponto();
     traco();
     ponto();
     fdc();
     
     // W
     ponto();
     traco();
     traco();
     fdc();
     }
     
     //numero de matricula
     while(portb.b1 == 0){
     // 2
     ponto();
     ponto();
     traco();
     traco();
     traco();
     fdc();
     
     // 0
     traco();
     traco();
     traco();
     traco();
     traco();
     fdc();
     
     // 1
     ponto();
     traco();
     traco();
     traco();
     traco();
     fdc();
     
     // 0
     traco();
     traco();
     traco();
     traco();
     traco();
     fdc();
     
     // 2
     ponto();
     ponto();
     traco();
     traco();
     traco();
     fdc();

     // 0
     traco();
     traco();
     traco();
     traco();
     traco();
     fdc();

     // 6
     traco();
     ponto();
     ponto();
     ponto();
     ponto();
     fdc();
     
     // 5
     ponto();
     ponto();
     ponto();
     ponto();
     ponto();
     fdc();
     
     // 6
     traco();
     ponto();
     ponto();
     ponto();
     ponto();
     fdc();
     
     }
     
}
}

