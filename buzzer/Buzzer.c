/*****************************************************************
**                        Exemplo 02                            **
**                                                              **
** Exemplo para utilizacao de buzzer do kit PIC 18 F452.        **
** Ao carregar o programa no kit, o buzzer desse sera           **
** acionado por um segundo e aguardara mais um segundo          **
** ate o proximo acionamento.                                   **
**                                                              **
** Arquivo : buzzer .c                                          **
** Compilador : MikroC PRO PIC v .6.4.0                         **
**                                                              **
** UFLA - Lavras /MG - 24/05/2017                               **
*****************************************************************/

void main ()
{
  // trisc e' uma posicao (registrador) na memoria de dados
  // do microcontrolador. Configura o pino RC1 como saida para
  // comunicacao com o buzzer.
  trisc = 0xFD; // 0b11111101

  // Inicia com buzzer desligado.
  portc.rc1 = 1;

  // Loop infinito
  while(1)
  {
    // Alterna estado do buzzer (ligado -> desligado -> ligado...)
    portc.rc1 = ~portc.rc1;

    // Aguarda 1s ate a proxima execucao do laco.
    delay_ms(1000) ;
  }
}