//Importa bibliotecas
#include <Arduino.h>

int SerialConvertion(){ //função que faz a descriptografia das cordenadas recebidas pelo serial
    String palavra = " ";
    char c;
    if (Serial.available() > 0){ //se não existir valor no Serial, retorna 0
        c = (Serial.read());
        if (c == (',')){
            while (c != '/'){
                int i = 0;
                if (Serial.available() > 0){   
                    c = char(Serial.read());
                    i++;
                    if (i < 2){
                        palavra = palavra + c;
                    }
                }
            }
            int eixoX = palavra.toInt();
            return eixoX;
        }
    }
    else{
        return 0;
    }
}
