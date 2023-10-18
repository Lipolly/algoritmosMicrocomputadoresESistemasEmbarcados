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

char senha[4];
// Fim das conexoes do LCD

// Conexoes do teclado
// Saidas do PIC:
//    RB0 - primeira coluna
//    RB1 - segunda coluna
//    RB2 - terceira coluna
// Entradas do PIC:
//    RD3 - primeira linha
//    RD2 - segunda linha
//    RD1 - terceira linha
//    RD0 - quarta linha

#define atraso 50

void led_pisca(){
     portb.rb3 = 1;
     delay_ms(1000);
     portb.rb3 = 0;
     delay_ms(1000);
}

void buzina(){
  portc.rc1 = 0;
  delay_ms(1000);
  portc.rc1 = 1;
}

void preencher(){

int preenchido = 0;
      while(preenchido !=3){
      if (portd.rd1 == 0){
         senha[preenchido] = "9";
         preenchido++;
      }
           else if (portd.rd2 == 0){
               senha[preenchido] = "6";
               preenchido++;
           }
                else if (portd.rd3 == 0){
                senha[preenchido] = "3";
                preenchido++;
                }
      if (portd.rd1 == 0){
         senha[preenchido] = "7";
         preenchido++;
         }
           else if (portd.rd2 == 0){
           senha[preenchido] = "4";
           preenchido++;
           }
                else if (portd.rd3 == 0){
                senha[preenchido] = "1";
                preenchido++;
                }
      if (portd.rd0 == 0){
          senha[preenchido] = "0";
          preenchido++;
          }
      else if (portd.rd1 == 0){
      senha[preenchido] = "8";
      preenchido++;
      }
           else if (portd.rd2 == 0){
           senha[preenchido] = "5";
           preenchido++;
           }
                else if (portd.rd3 == 0){
                senha[preenchido] = "2";
                preenchido++;
                }
      }
      
}
void senha(char senha[4]){
     if(senha[0] == "1" && senha[1] == "2" && senha[2] == "3" && senha[3] == "4"){
         led_pisca();
     }
     else{
         buzina();
     }
}

void LCD(char texto[16])
{
   Lcd_Cmd(_LCD_CLEAR);    //limpa o Display
   delay_ms(atraso);
   Lcd_Out(1,4,texto);
   delay_ms(atraso);
}

void main(){

   trisc = 0xFD;
   portc . rc1 = 1;
   ADCON0 = 0X00;     // Desabilita o conversor A/D
   ADCON1 = 0x06;     // Configura todos pinos da porta A para digital

   trisd = 0x0F;      //configura os pinos RD0,RD1,RD2,RD3 da PORTD como
                      // entradas (teclado), e RD4,RD5,RD6,RD7 como saida
                      // (LCD)


   trisb = 0b11110000;     // configura pinos RB0,RB1,RB2 da PORTB como saida (teclado)
                     // e o restante como entrada
   portb = 0xFF;
   
   Lcd_Init();                      //Inicializa o Display
   delay_ms(atraso);
   Lcd_Cmd(_LCD_CLEAR);             //limpa o Display
   delay_ms(atraso);
   Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
   delay_ms(atraso);

   do
   {                   
      portb.rb0 = 0;          //habilita primeira coluna  do teclado
      delay_ms(atraso);
      if (portd.rd0 == 0)                LCD("<---");
      else if (portd.rd1 == 0)           LCD("7");
           else if (portd.rd2 == 0)      LCD("4");
                else if (portd.rd3 == 0) LCD("1");
      portb.rb0 = 1;          //desabilita primeira coluna do teclado
      delay_ms(atraso);
//--------------------------------------------------------------------------

      portb.rb1 = 0;          //habilita segunda coluna do teclado
      delay_ms(atraso);
      if (portd.rd0 == 0)                LCD("0");
      else if (portd.rd1 == 0)           LCD("8");
           else if (portd.rd2 == 0)      LCD("5");
                else if (portd.rd3 == 0) LCD("2");
                
      portb.rb1 = 1;          //desabilita segunda coluna do teclado
      delay_ms(atraso);
//------------------------------------------------------------------------

      portb.rb2 = 0;         //habilita terceira coluna do teclado
      delay_ms(atraso);
      if (portd.rd0 == 0)                LCD("--->");
      else if (portd.rd1 == 0)           LCD("9");
           else if (portd.rd2 == 0)      LCD("6");
                else if (portd.rd3 == 0) LCD("3");

      portb.rb2 = 1;        //desabilita terceira coluna do teclado
      delay_ms(atraso);
//------------------------------------------------------------------------
      Lcd_Out(1,1,"Digite a senha: ");
      preencher();
      senha();
   } while(1);

} // fim do programa
