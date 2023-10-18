/*****************************************************************
**                          Exemplo 04                          **
**                                                              **
**     Exemplo para utilizacao do LCD e do teclado matricial    **
**     presente no kit PICGenios com PIC 18F452.                **
**     De acordo com a tecla acionada no teclado, o valor e'    **
**     escrito no LCD.                                          **
**                                                              **
** Arquivo: teclado_LCD.c                                       **
** Compilador: MikroC PRO PIC v.6.4.0                           **
** Obs.: fechar dipswitch LCD                                   **
** UFLA - Lavras/MG - 23/06/2020                                **
******************************************************************/

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

void LCD(char texto[16])
{
   Lcd_Cmd(_LCD_CLEAR);    //limpa o Display
   delay_ms(atraso);
   Lcd_Out(1,4,texto);
   delay_ms(atraso);
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

   } while(1);

} // fim do programa