//Ricardo Piero Lippoli Batista || GAT135

void apagaLED(int miliSeg){         //apaga o led durante 0,3 segundos para espaço entre letras/numeros ou 0,9 segundos para espaço entre palavras
     portd = 0;
     delay_ms(miliSeg);
}

void pausa(int palavraContinua){
     if(palavraContinua){
          apagaLED(300);
     }
     else{
          apagaLED(900);
     }
}

void caractere(int palavraContinua, int tipoCarac, int vezes){ //acende o led por 0,6 segundos e depois apaga, fazendo um traço
     while(int i; i < vezes; i++){
          portd = 255;
          delay_ms(tipoCarac); //se tipoCarac = 200 é um ponto se = 600 é um traço
          pausa(palavraContinua);
     }
}

void main() {          //main
     trisb = 1;
     trisd = 0;
     apagaLED(100);       //inicia o led pagado
     
     while(1){
              while(portb.rb0 == 0){  //Se rb0 for precionado
                    caractere(1, 200, 1);  //R
                    caractere(1, 600, 1);
                    caractere(0, 200, 1);
                    
                    caractere(1, 200, 1);  //P
                    caractere(1, 600, 2);
                    caractere(0, 200, 1);
                    
                    caractere(1, 200, 1);  //L
                    caractere(1, 600, 1);
                    caractere(1, 200, 1);
                    caractere(0, 200, 1);
                    
                    caractere(1, 600, 1);  // B
                    caractere(1, 200, 2);
                    caractere(0, 200, 1);
                    
              }
              
              while(portb.rb1 == 0){  //Se rb1 for precionado 
                    caractere(1, 200, 2);  //2
                    caractere(1, 600, 2);
                    caractere(0, 600, 1);
                   
                    caractere(1, 600, 4);  //0
                    caractere(0, 200, 1);
                   
                    caractere(1, 200, 2);  //2
                    caractere(1, 600, 2);
                    caractere(0, 600, 1);
                    
                    caractere(1, 600, 4);  //0
                    caractere(0, 600, 1);
                   
                    caractere(1, 200, 1);  //1
                    caractere(1, 600, 3);
                    caractere(0, 600, 1);
                   
                    caractere(1, 600, 4);  //0
                    caractere(0, 600, 1);
                   
                    caractere(1, 200, 4);  //5
                    caractere(0, 200, 1);
                   
                    caractere(1, 600, 4);  //0
                    caractere(0, 600, 1);
                   
                    caractere(1, 200, 4);  //5
                    caractere(0, 200, 1);
              }
     }
}
