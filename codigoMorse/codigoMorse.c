//Ricardo Piero Lippoli Batista || GAT135
void apagaLED(int miliSeg){                                    //função que apaga os leds
     portd = 0;                                                //valor apagado
     delay_ms(miliSeg);                                        //tempo fica apagado
}
void pausa(int palavraContinua){                               //faz o controle de pausas entre palavras ou letras
     if(palavraContinua){
          apagaLED(300);                                       //apaga o led durante 0,3 segundos para espaço entre letras/numeros
     }
     else{
          apagaLED(900);                                       //apaga o led durante 0,9 segundos para espaço entre palavras
     }
}
void caractere(int palavraContinua, int tipoCarac, int vezes){ //pisca o led de acordo com as variaveis recebidos fazendo um ponto ou traço
     while(int i = 0; i < vezes; i++){                         //repete o trecho com o numero de vezes que o mesmo caracter aparece
          portd = 255;                                         //valor acesso
          delay_ms(tipoCarac);                                 //tempo que fica acesso || se tipoCarac = 200 é um ponto se = 600 é um traço
          pausa(palavraContinua);                              //pausa entre caracteres
     }
}
void main() {                                                  //main
     trisb = 1;
     trisd = 0;
     apagaLED(100);                                            //inicia o led pagado
     while(1){
              while(portb.rb0 == 0){                           //Se rb0 for precionado
                    caractere(1, 200, 1);                      //R
                    caractere(1, 600, 1);
                    caractere(0, 200, 1);
                    
                    caractere(1, 200, 1);                      //P
                    caractere(1, 600, 2);
                    caractere(0, 200, 1);
                    
                    caractere(1, 200, 1);                      //L
                    caractere(1, 600, 1);
                    caractere(1, 200, 1);
                    caractere(0, 200, 1);
                    
                    caractere(1, 600, 1);                      // B
                    caractere(1, 200, 2);
                    caractere(0, 200, 1);
              }
              while(portb.rb1 == 0){                           //Se rb1 for precionado 
                    caractere(1, 200, 2);                      //2
                    caractere(1, 600, 2);
                    caractere(0, 600, 1);
                   
                    caractere(1, 600, 4);                      //0
                    caractere(0, 200, 1);
                   
                    caractere(1, 200, 2);                      //2
                    caractere(1, 600, 2);
                    caractere(0, 600, 1);
                    
                    caractere(1, 600, 4);                      //0
                    caractere(0, 600, 1);
                   
                    caractere(1, 200, 1);                      //1
                    caractere(1, 600, 3);
                    caractere(0, 600, 1);
                   
                    caractere(1, 600, 4);                      //0
                    caractere(0, 600, 1);
                   
                    caractere(1, 200, 4);                      //5
                    caractere(0, 200, 1);
                   
                    caractere(1, 600, 4);                      //0
                    caractere(0, 600, 1);
                   
                    caractere(1, 200, 4);                      //5
                    caractere(0, 200, 1);
              }
     }
}
