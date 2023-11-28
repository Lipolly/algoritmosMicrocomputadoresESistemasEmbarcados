// Desenvolver um programa em C para o kit PICGenios que utilize o display LCD e o sensor
// infravermelho para indicar a quantidade de voltas realizadas pela ventoinha.

// LCD module connections
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
// End LCD mocule connection

void main(){

   int contador = 0;  // variavel para contar cada periodo da onda
   int rotacao = 0;   // variavel para contar o numero de rotacoes
   char res[6];       // variavel para armazenar o valor das rotacoes

   ADCON1  = 0x0F;     // Configura todos pinos para digital e
                       // desabilita o conversor A/D
   trisd = 0; // porta D como saida
   portd = 0; // apaga todos os LEDs da porta D

   trisc = 1; // Entrada: RC0 ; os outros bits sao saida
   portc.rc2 = 1;  // liga a ventoinha

   Lcd_Init();
   Lcd_Cmd(_LCD_CURSOR_OFF);        // Desabilita o cursor
   Lcd_Out(1,1,"Contador Rotacao"); // Escreve mensagem no LCD
   while(1) {
        while (portc.rc0 == 0)   // leitura do nivel logico 0 - sensor recebe luz
          ;
        while (portc.rc0 == 1)   // leitura do nivel logico 1 - sensor nao recebe luz
          ;
        contador = contador + 1; // contador incrementado a cada periodo da onda

        if (contador == 9){          // IF responsavel por contar as rotacoes
           contador = 0;             // reseta do contador de periodos
           rotacao += 1;             // contador incrementado a cada rotacao completa
           inttostr(rotacao,res);    // converte as rotacoes para uma string
           Lcd_Out(2,1,res);         // escrve a string no LCD
        }
   }
} // fim do programa