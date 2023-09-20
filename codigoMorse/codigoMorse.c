//Ricardo Piero Lippoli Batista || GAT135
void pausa(int palavraContinua){
     portd = 0;                                                //faz o controle de pausas entre palavras ou letras
     if(palavraContinua){
          delay_ms(300);                                       //apaga o led durante 0,3 segundos para espaço entre letras/numeros
     }
     else{
          delay_ms(900);                                       //apaga o led durante 0,9 segundos para espaço entre palavras
     }
}
void caractere(int palavraContinua, int tipoCarac, int vezes){ //pisca o led de acordo com as variaveis recebidos fazendo um ponto ou traço
     int i = 0;
     portd = 255;
     while(i < vezes){                                         //repete o trecho com o numero de vezes que o mesmo caracter aparece
          if(tipoCarac == 200){                                //tempo que fica acesso || se tipoCarac = 200 é um ponto se = 600 é um traço
               delay_ms(200);
          }
          else{
               delay_ms(600);
          };
          pausa(palavraContinua);                              //pausa entre caracteres
          i = i+1;
     }
}
void main() {                                                  //main
     trisb = 1;
     trisd = 0;
     while(1){
              if(portb.rb0 == 0){                           //Se rb0 for precionado
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
              else if(portb.rb1 == 0){                           //Se rb1 for precionado
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
