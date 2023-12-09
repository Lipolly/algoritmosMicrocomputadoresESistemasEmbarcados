//importando bibliotecas
#ifndef MOTOR_H
#define MOTOR_H
#include <defines.h>
#include <giroscopio.h>
#include <servo.h>
Servo FW_PKS, ANG_PKS;

void initPKS(){ //função de iniciar o motor através da placa parkinson
        FW_PKS.attach(fw_pks);
        ANG_PKS.attach(ang_pks);
}

void stopPKS(){ //função para parar o motor através da placa parkinson
    FW_PKS.writeMicroseconds(1500);
    ANG_PKS.writeMicroseconds(1500);
}

void motorsControl(){ //função de simulçao para controle do motor
    if (Serial.available()){
        if(Serial.read() == 'Direita'){
            FW_PKS.writeMicroseconds(2000);
            ANG_PKS.writeMicroseconds(1800);
        }
        if(Serial.read() == 'Esquerda'){
            FW_PKS.writeMicroseconds(2000);
            ANG_PKS.writeMicroseconds(1200);
        }
        else{
            FW_PKS.writeMicroseconds(1500);
            ANG_PKS.writeMicroseconds(1500);
        }
    }
}

#endif
