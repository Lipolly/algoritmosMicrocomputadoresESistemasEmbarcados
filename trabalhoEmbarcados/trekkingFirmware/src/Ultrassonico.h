//Importa bibliotecas
#include <defines.h>
#include <Controle.h>

long duration;
int distance;
void initUltrassonico(){ //função para iniciar ultrassonico
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}
void distCone(){ //função para saber a distancia do robô ao cone
  // limpando trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // setando o trigPin como estado HIGH por 10 micro segundos
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  // faz a leitura do echoPin, retorna o pulso do tempo
  duration = pulseIn(echoPin, HIGH);
  // calcula a distancia
  distance = duration * 0.034 / 2;
  
  if(distance <= 300){ //se a distancia for menor que 300 para o robô e pisca o LED
    FW_PKS.writeMicroseconds(1500);
    ANG_PKS.writeMicroseconds(1500);
    pinMode(LEDCONE,LOW);
    delayMicroseconds(400);
    pinMode(LEDCONE,HIGH);
    delayMicroseconds(400);
  }
}
