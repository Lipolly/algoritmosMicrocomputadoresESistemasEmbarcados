/****************************************************************
// GAT135 - Introdução aos sistemas embarcados e microcontroladores
// Pratica 07 --  Medidor de temperatura digital
// PIC18F452 - 8MHz
//Data  29-01-2021
//  Jean Paulo de Alvarenga   N matricula = 201621424

*****************************************************************/

// Conexoes LCD do kit PICGenios com 18F452
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
// Fim das conexoes

//**************** definicao de variaveis ********************************
char         texto[16];        //ponteiro texto
unsigned int valor_AD;         //define variavel
float        temperatura;      // temperatura em graus Celsius
int          temp;             //temperatura convertida
int          valor;            //definição da nidade de medida
//************************************************************************

//************** programa principal **************************************
void main() {
    //inicia em graus celsius
    valor = 0;
   // Desliga CAD
   ADCON0 = 0x00;
   //todos os pinos do porta (AN0-AN4) e porte (AN5-AN7) como i/o de uso geral
   ADCON1 = 0x06;

   trisd = 0x00;     //define portd como saida - LCD
   trise = 0x00;     //define porte como saida - LCD
   trisb=0b00000111;  //  botao b0 e b1 e b2
   trisa = 0x04;     // define RA2/AN2 como entrada, outros pinos como saida

   // Inicializa o LCD
   Lcd_Init();                      //Inicializa o Display
   Delay_ms(100);
   Lcd_Cmd(_LCD_CLEAR);             //limpa o Display
   Delay_ms(100);
   Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
   Delay_ms(100);
   Lcd_Out(1,1,"Temperatura[oC]:"); // exibe a mensaguem inicial
   Delay_ms(100);
  
   /*reconfigura e define pinos de A/D - ADCON1
   B7 - 1: justificado a direita
        0: justificado a esquerda
   B6 - 0: fonte de clock oscilador RC interno do ADC
   B5 - NC
   B4 - NC
   B3:B0 = 0b0010 = canais AN0 a AN4, Vref+ = VDD, Vref- = GND  */
   ADCON1 = 0b10000010;
    
   /*reconfigura A/D - ADCON0
   B7:B6 - 0b11: fonte de clock oscilador RC interno do ADC
   B5:B3 - 0b010: canal 2 - AN2
   B2 - status do CAD
   B1 - NC
   B0 - 1: ADC ligado
        0: ADC desligado    */
   ADCON0 = 0b11010001;

   do
   {
      if( portb.b0==0){          //quando b0 acionado, o valor exibido é graus celsius
        valor=0;
      }
      if( portb.b1==0){          //quando b0 acionado, o valor exibido é fahrenheit
        valor=1;
      }
      if( portb.b2==0){          //quando b0 acionado, o valor exibido é kelvin
        valor=2;
      }
      valor_AD =  adc_read(2);      //le canal 2 e salva
      temperatura = (float)valor_AD*((float)500/(float)1024); //converte para oC
      temp = temperatura;             //converte para inteiro
      if(valor == 0){
      Lcd_Out(1,1,"Temperatura[oC]:");
      intToStr(temp, texto);   //converte valor temperatura em string
      Lcd_Out(2,1,texto); //envia para o lcd o valor string da conversão ad
      Delay_ms(100);      //delay de 100ms
      }
      if(valor == 1){
      Lcd_Out(1,1,"Temperatura[oF]:");
      temp = ((temp*1.8)+32);    //converte para fahrenheit
      intToStr(temp, texto);   //converte valor temperatura em string
      Lcd_Out(2,1,texto); //envia para o lcd o valor string da conversão ad
      Delay_ms(100);      //delay de 100ms
      }
      if(valor == 2){
      Lcd_Out(1,1,"Temperatura[K]:");
      temp = (temp+273);        //converte para kelvin
      intToStr(temp, texto);   //converte valor temperatura em string
      Lcd_Out(2,1,texto); //envia para o lcd o valor string da conversão ad
      Delay_ms(100);      //delay de 100ms
      }
   } while (1);
}