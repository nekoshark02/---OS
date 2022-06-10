#include "defines.h"
#include "serial.h"

#define SERIAL_SCT_NUM_3 //SCIの数

//SCIの定義
#define H8_3069F_SCI0 ((volatile struct h8_3069f_sci * )0xffffb0)
#define H8_3069F_SCI1 ((volatile struct h8_3069f_sci * )0xffffb8)
#define H8_3069F_SCI2 ((volatile struct h8_3069f_sci * )0xffffc0)

struct h8_3069f_sci{
    volatile uint8_t smr;
    volatile uint8_t brr;
    volatile uint8_t scr;
    volatile uint8_t tdr;
    volatile uint8_t ssr;
    volatile uint8_t rdr;
    volatile uint8_t scmr;
};

#define H8_3069F_SCI_SMR_CKS_PER1  (0<<0)
#define H8_3069F_SCI_SMR_CKS_PER4  (1<<0)
#define H8_3069F_SCI_SMR_CKS_PER16 (2<<0)
#define H8_3069F_SCI_SMR_CKS_PER64 (3<<0)
#define H8_3069F_SCI_SMR_MP     (1<<2)