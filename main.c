#include "defines.h"
#include "serial.h"
#include "lib.h"

int main(void){
    serial_init(SERIAL_DEFAULT_DEVICE); //シリアルデバイスの初期化
    puts("Hello World!"); //hello worldを出力
    while(1); //無限ループで停止

    return 0;
}