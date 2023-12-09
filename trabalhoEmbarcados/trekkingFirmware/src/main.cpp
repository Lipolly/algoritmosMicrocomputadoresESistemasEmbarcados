//Importar bibliotecas
#include <Arduino.h>
#include <Serial.h>
#include <Controle.h>
#include <Ultrassonico.h>

int leitura, eixoX, valEixoX;
void setup(){ //função de inicialização dos sensores
  pinMode(LED_BUILTIN, OUTPUT);
  initPKS();
  Serial.begin(9600);
  init_mpu();
  initUltrassonico();
}

void loop(){ //função principal
  eixoX = SerialConvertion();
  testeMotor(eixoX);
  distCone();
}
