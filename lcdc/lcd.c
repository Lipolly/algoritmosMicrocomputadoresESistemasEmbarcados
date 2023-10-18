// Conexoes LCD do kit PICGenios
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// Fim das conexoes do LCD

int primeiroDigito = -1;
int segundoDigito = -1;
int terceiroDigito = -1;
int quartoDigito = -1;
int digitando = 1;
   
#define atraso 50

void LCD(char texto[16])
{
   Lcd_Cmd(_LCD_CLEAR);    //limpa o Display
   delay_ms(atraso);
   Lcd_Out(1,4,texto);
   delay_ms(atraso);
}

void piscaLED(){
   int i = 0;
   do{
       portd = 0;
       delay_ms(1000);
       portd = 255;
       delay_ms(1000);
       i = i+1;
   }while(i <= 5);
}

int teclado(){
          portb.rb0 = 0;          //habilita primeira coluna  do teclado
          delay_ms(atraso);

          if (portd.rd0 == 0){
               LCD("<---");
          }
          else if (portd.rd1 == 0){
               LCD("7");
               return 7;
          }
          else if (portd.rd2 == 0){
               LCD("4");
               return 4;
          }
          else if (portd.rd3 == 0){
               LCD("1");
               return 1;
          }
          portb.rb0 = 1;          //desabilita primeira coluna do teclado
          delay_ms(atraso);
    //--------------------------------------------------------------------------

          portb.rb1 = 0;          //habilita segunda coluna do teclado
          delay_ms(atraso);

          if (portd.rd0 == 0){
               LCD("0");
               return 0;
          }
          else if (portd.rd1 == 0){
               LCD("8");
               return 8;
          }
          else if (portd.rd2 == 0){
               LCD("5");
               return 5;
          }
          else if (portd.rd3 == 0){
               LCD("2");
               return 2;
          }
          portb.rb1 = 1;          //desabilita segunda coluna do teclado
          delay_ms(atraso);
    //------------------------------------------------------------------------

          portb.rb2 = 0;         //habilita terceira coluna do teclado
          delay_ms(atraso);

          if (portd.rd0 == 0){
               LCD("--->");
          }
          else if (portd.rd1 == 0){
               LCD("9");
               return 9;
          }
          else if (portd.rd2 == 0){
               LCD("6");
               return 6;
          }
          else if (portd.rd3 == 0){
               LCD("3");
               return 3;
          }
          portb.rb2 = 1;        //desabilita terceira coluna do teclado

          delay_ms(atraso);
}

void buzzer(){
      portc.rc1 = 0;
      delay_ms(100);
      portc.rc1 = 1;
}

 void checagem(){
     if(primeiroDigito == 7){
           if(segundoDigito == 0){
               if(terceiroDigito == 0){
                   if(quartoDigito == 1){
                       piscaLED();
                   }
                   else{
                       buzzer();
                       digitando = 0;
                   }
               }
               else{
                   buzzer();
                   digitando = 0;
               }
           }
           else{
               buzzer();
               digitando = 0;
           }
       }
       else{
           buzzer();
           digitando = 0;
       }
}

void main(){
   ADCON0 = 0X00;     // Desabilita o conversor A/D
   ADCON1 = 0x06;     // Configura todos pinos da porta A para digital

   trisd = 0x0F;      //configura os pinos RD0,RD1,RD2,RD3 da PORTD como
                      // entradas (teclado), e RD4,RD5,RD6,RD7 como saida
                      // (LCD)

   trisb = 0xF8;     // configura pinos RB0,RB1,RB2 da PORTB como saida (teclado)
                     // e o restante como entrada
   portb = 0xFF;
   trisc = 0xFD;

   Lcd_Init();                      //Inicializa o Display
   delay_ms(atraso);
   Lcd_Cmd(_LCD_CLEAR);             //limpa o Display
   delay_ms(atraso);
   Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
   delay_ms(atraso);
   
   while(1){
     LCD("Digite a senha");
     digitando = 1;
       do{
          do{
             primeiroDigito = teclado();
          }while(primeiroDigito == -1);
          if(primeiroDigito >= 0){
                            do{
                               segundoDigito = teclado();
                            }while(segundoDigito == -1);
                            if(segundoDigito >= 0){
                                             do{
                                                terceiroDigito = teclado();
                                             }while(terceiroDigito == -1);
                                             if(terceiroDigito >= 0){
                                                               do{
                                                                  quartoDigito = teclado();
                                                               }while(quartoDigito == -1);
                                             }
                            }
          }
       checagem();
     }while(digitando == 1);
   }
}