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
                    apaga();          //inicia apagado

                    ponto(1);  //R
                    traco(1);
                    ponto(0);
                    
                    espaco();
                    
                    ponto(1);  //P
                    traco(1);
                    traco(1);
                    ponto(0);
                    
                    espaco();
                    
                    ponto(1);  //L
                    traco(1);
                    ponto(1);
                    ponto(0);
                    
                    espaco();
                    
                    traco(1);  // B
                    ponto(1);
                    ponto(1);
                    ponto(0);
                    
              }
              
              while(portb.rb1 == 0){
                    ponto(1);  //2
                    ponto(1);
                    traco(1);
                    traco(1);
                    traco(0);
                    
                    traco(1);  //0
                    traco(1);
                    traco(1);
                    traco(1);
                    traco(1);
                    
                    ponto(1);  //2
                    ponto(1);
                    traco(1);
                    traco(1);
                    traco(0);
                    
                    traco(1);  //0
                    traco(1);
                    traco(1);
                    traco(1);
                    traco(0);
                    
                    ponto(1);  //1
                    traco(1);
                    traco(1);
                    traco(1);
                    traco(0);
                    
                    traco(1);  //0
                    traco(1);
                    traco(1);
                    traco(1);
                    traco(0);
                    
                    ponto(1);  //5
                    ponto(1);
                    ponto(1);
                    ponto(1);
                    ponto(1);
                    
                    traco(1);  //0
                    traco(1);
                    traco(1);
                    traco(1);
                    traco(0);

                    ponto(1);  //5
                    ponto(1);
                    ponto(1);
                    ponto(1);
                    ponto(1);
              }
     }
}