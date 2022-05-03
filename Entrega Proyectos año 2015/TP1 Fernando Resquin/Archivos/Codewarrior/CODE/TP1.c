
/** ###################################################################
** Filename : TPN1.C
** Project : TPN1
** Processor : 56F8367
** Version : Driver 01.14
** Compiler : Metrowerks DSP C Compiler
** Date/Time : 10/06/2012, 08:06 p.m.
** Abstract :
** Main module.
** This module contains user's application code.
** Settings :
** Contents :
** No public methods
**
** ###################################################################*/
/* MODULE TPN1 */
/* Including needed modules to compile this module/procedure */
#include "Cpu.h"
#include "Events.h"
/* Including shared modules, which are used for whole project */
#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"
#include "stdio.h"
#include "TFR1.h"
#include "MFR1.h"
#include "MEM1.h"
#include "XFR1.h"
#include "AFR1.h"
#include "VFR1.h"

/*Prototipo de funciones*/
void EspacioManipulador(int, int, int, Frac16);

/* Defino los rangos de barrido de las variables. */

#define MENOS_UNO FRAC16(-1)
void main(void)
{
/* Write your local variable definition here */
Frac16 phi;

/*** Processor Expert internal initialization. DON'T REMOVE THIS CODE!!! ***/
PE_low_level_init();
/*** End of Processor Expert internal initialization. ***/

/* Write your code here */
phi=FRAC16(0.25)/*(45/180)*/;
/*Xg=1000cm, Yg=700cm, Zg=28cm*/
EspacioManipulador(1000, 700, 28, phi);

/* Watchdog */
for(;;) {}
}

/*---------------------------------------------------------------
				Subrutinas del modelo cinemático 
---------------------------------------------------------------*/

void EspacioManipulador(int Xg, int Yg, int Zg, Frac16 q0)
{
#define Q1_INI FRAC16(-0.5555555)//-100/180
#define Q1_STEP FRAC16(0.1111111)//20/180
#define Q1_FIN FRAC16(0.5555555)//100/180
#define Q2_INI FRAC16(-0.0277777777)//(-5/180)
#define Q2_STEP FRAC16(0.0277777777)//10/180
#define Q2_FIN FRAC16(0.4722222)//85/180
#define Q3_INI FRAC16(-0.2222222)//-40/180
#define Q3_STEP FRAC16(0.0277777777)//5/180
#define Q3_FIN FRAC16(0)
/* Defino los elementos fijos del ROBOT */
Frac16 l1=FRAC16(0.06)/*(6/100)*/;
Frac16 l2=FRAC16(0.4)/*(40/100)*/;
Frac16 l3=FRAC16(0.36)/*(36/100)*/;

/* Write your local variable definition here */
Frac16 q1, q2, q3;
Frac16 M_0A1[4][4] = {
{0/*cos(q1)*/,FRAC16(0),0/*sin(q1)*/,FRAC16(0)},
{0/*sin(q1)*/,FRAC16(0),0/*-cos(q1)*/,FRAC16(0)},
{FRAC16(0),FRAC16(1),FRAC16(0),0/*l1*/},
{FRAC16(0),FRAC16(0),FRAC16(0),FRAC16(1)}
};

Frac16 M_1A2[4][4] = {
{0/*cos(q2)*/,0/*-sin(q2)*/,FRAC16(0),0/*l2.cos(q2)*/},
{0/*sin(q2)*/,0/*cos(q2)*/,FRAC16(0),0/*l2.sin(q2)*/},
{FRAC16(0),FRAC16(0),FRAC16(1),FRAC16(0)},
{FRAC16(0),FRAC16(0),FRAC16(0),FRAC16(1)}
};

Frac16 M_2A3[4][4] = {
{0/*cos(q3)*/,0/*-sin(q3)*/,FRAC16(0),0/*l3.cos(q3)*/},
{0/*sin(q3)*/,0/*cos(q3)*/,FRAC16(0),0/*l3.sin(q3)*/},
{FRAC16(0),FRAC16(0),FRAC16(1),FRAC16(0)},
{FRAC16(0),FRAC16(0),FRAC16(0),FRAC16(1)}
};

Frac16 ROT_G[4][4] = {
{0/*cos(q0)*/,0/*-sin(q0)*/,FRAC16(0),FRAC16(0)},
{0/*sin(q0)*/,0/*cos(q0)*/,FRAC16(0),FRAC16(0)},
{FRAC16(0),FRAC16(0),FRAC16(1),FRAC16(0)},
{FRAC16(0),FRAC16(0),FRAC16(0),FRAC16(1)}
};

Frac16 M_0A2[4][4],M_0A3[4][4], H[4][4];
Frac16 senq0, senq1, senq2, senq3, cosq0, cosq1, cosq2, cosq3;

long x, y, z;
  


senq0 = tfr16SinPIx(q0);
cosq0 = tfr16CosPIx(q0);
ROT_G[0][0] = cosq0;
ROT_G[0][1] = mult(MENOS_UNO,senq0);
ROT_G[1][0] = senq0;
ROT_G[1][1] = cosq0;
printf("Puntos del Manipulador\n");

/* Código propio para calcular los límites del espacio de trabajo. */
for(q1=Q1_INI;q1<=Q1_FIN;q1+=Q1_STEP) {
senq1 = tfr16SinPIx(q1);
cosq1 = tfr16CosPIx(q1);
M_0A1[0][0] = cosq1;
M_0A1[0][2] = senq1;
M_0A1[1][0] = senq1;
M_0A1[1][2] = mult(MENOS_UNO,cosq1);
M_0A1[2][4] = l1;

for(q2=Q2_INI;q2<=Q2_FIN;q2+=Q2_STEP) {
senq2 = tfr16SinPIx(q2);
cosq2 = tfr16CosPIx(q2);
M_1A2[0][0] = cosq2;
M_1A2[0][1] = mult(MENOS_UNO,senq2);
M_1A2[0][3] = mult(l2,cosq2);
M_1A2[1][0] = senq2;
M_1A2[1][1] = cosq2;
M_1A2[1][3] = mult(l2,senq2);

for(q3=Q3_INI;q3<=Q3_FIN;q3+=Q3_STEP) {
senq3 = tfr16SinPIx(q3);
cosq3 = tfr16CosPIx(q3);
M_2A3[0][0] = cosq3;
M_2A3[0][1] = mult(MENOS_UNO,senq3);
M_2A3[0][3] = mult(l3,cosq3);
M_2A3[1][0] = senq3;
M_2A3[1][1] = cosq3;
M_2A3[1][3] = mult(l3,senq3);

xfr16Mult((Frac16 *)M_0A1,4,4,(Frac16 *)M_1A2,4,(Frac16 *)M_0A2);
xfr16Mult((Frac16 *)M_0A2,4,4,(Frac16 *)M_2A3,4,(Frac16 *)M_0A3);
xfr16Mult((Frac16 *)ROT_G,4,4,(Frac16 *)M_0A3,4,(Frac16 *)H);


x=(long) H[0][3];
y=(long) H[1][3];
z=(long) H[2][3];
x=(long) x*100/32768;
y=(long) y*100/32768;
z=(long) z*100/32768;


printf("%ld %ld %ld ;\n", x + Xg, y + Yg, z + Zg);
}

}
}	
}




/* END TPN1 */
/*
** ###################################################################
**
** This file was created by Processor Expert 3.00 [04.35]
** for the Freescale 56800 series of microcontrollers.
**
** ###################################################################
*/
