#ifndef _SERIAL_H_INCLUDED_
#define _SERIAL_H_INCLUDED_

int serial_init(int index); //デバイス初期化
int serial_is_send_enable(int index); //送信可能か見る
int serial_send_byte(int index, unsigned char b); //一文字送信

#endif