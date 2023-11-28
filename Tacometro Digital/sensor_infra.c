// Programa exemplo para uso do sensor infravermelho no kit PICGenios
// Ligar os dip-switchs: LED1, INFR, VENT
// Compilador: MikroC PRO PIC v.6.4
// Data: 2015

void main(){

   char contador = 0;
   
   ADCON1  = 0x0F;     // Configura todos pinos para digital e
                       // desabilita o conversor A/D
   trisd = 0; // porta D como saida
   portd = 0; // apaga todos os LEDs da porta D
   
   trisc = 1; // Entrada: RC0 ; os outros bits sao saida
   portc.rc2 = 1;  // liga a ventoinha
   
   while(1) {
        while (portc.rc0 == 0)
          delay_ms(10);
        while (portc.rc0 == 1)
          delay_ms(10);
        contador = contador + 1;
        portd = contador;
   }
} // fim do programa