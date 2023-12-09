//Importando bibliotecas
#include <defines.h>
#include <motor.h>

int ang, frente;
void testeMotor(int eixoX){ // função de definir a direção e velocidade do motor
    if (eixoX != 0){ //se o eixo recebido for diferente de 0 ele altera o estado anterior
        if (eixoX > 0 && eixoX < 220){ // se o eixo for maior que 0 e menor que 220, vai para a esquerda
            frente = 1340;
            ang = 1156;
        }
        else if (eixoX > 420){ // se o eixo for maior que  420, vai para a direita
            frente = 1760;
            ang = 1894;
        }
        else if (eixoX >= 220 && eixoX <= 420){ // se o eixo for maior ou igual a 220 e menor ou igual a 420, segue em frente
            frente = 1876;
            ang = 1500;
        }
    }
    //funções de controle do motor
    FW_PKS.writeMicroseconds(frente);
    ANG_PKS.writeMicroseconds(ang);
    delay(400);
}

float PID(float target, float atual){// função de PID geral
    float kp = 60;
    float error = target - atual;
    float output = error * kp;
    return output;
}

float pidCamera(int target, int atual){// função de PID da camera
    int kp = 0.00035;
    int error = target - atual;
    int output = error * kp;
    return output;
}

void align(int eixoX){ // função para ajuste de posição através do giroscopio
    float gyro = readAngularSpeed();
}

void getpulse(int frente, int ang){ // função para simulação de controle do robô
    FW_PKS.writeMicroseconds(frente);
    ANG_PKS.writeMicroseconds(ang);
}
