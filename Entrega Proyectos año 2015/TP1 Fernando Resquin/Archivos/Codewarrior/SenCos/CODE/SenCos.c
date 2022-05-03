/** ###################################################################
**     Filename  : SenCos.C
**     Project   : SenCos
**     Processor : 56F8367
**     Version   : Driver 01.14
**     Compiler  : Metrowerks DSP C Compiler
**     Date/Time : 25/04/2010, 10:57 p.m.
**     Abstract  :
**         Main module.
**         This module contains user's application code.
**     Settings  :
**     Contents  :
**         No public methods
**
** ###################################################################*/
/* MODULE SenCos */


/* Including needed modules to compile this module/procedure */
#include "Cpu.h"
#include "Events.h"
#include "DFR1.h"
#include "MEM1.h"
#include "TFR1.h"
#include "MFR1.h"
#include "CCNT1.h"
#include "Inhr1.h"
/* Including shared modules, which are used for whole project */
#include "PE_Types.h"
#include "PE_Error.h"
#include "PE_Const.h"
#include "IO_Map.h"

#include "stdio.h"
#define MXRAD 100
#define PULSE2RAD 32767/MXRAD  
Frac16 c,i;
Frac16 pulse2rad=PULSE2RAD ,testResult[MXRAD],
						testResult2[MXRAD];
Word16 c16[MXRAD];
Word32 c32[MXRAD];
	
  		
void main(void)
{
  /* Write your local variable definition here */

Word16 local_c16;
Word32 local_c32;
//UWord32 CycleCount;         /* Number of cycles         */




  /*** Processor Expert internal initialization. DON'T REMOVE THIS CODE!!! ***/
  PE_low_level_init();
  /*** End of Processor Expert internal initialization.                    ***/

  /* Write your code here */


		/* Calibrate the cycle counter                            */
		//CCNT1_cycleCountCalibrate();
		
  	for(;;)   {
  		//c=0;
    	for(i=0;i<MXRAD;i++)
  		{  	


  		/* Start the cycle-counter                                */
  		//cycleCountStart();
  		//CCNT1_cycleCountStart();

  		
  		local_c32=(L_mult(pulse2rad,i));  	
  		local_c16=extract_l(local_c32);  
	
  		testResult[i]=TFR1_tfr16SinPIx(local_c16);
  		/* Obtain and store the number of cycles                  */
  		//CycleCount = cycleCountStop();
  		//CycleCount=CCNT1_cycleCountStop();
	
		/* Check the obtained value for validity                
		if (CycleCount == CYCLECOUNT_CALIBRATION_FAILURE) {
		  printf ("Error calibracion");
		  }*/  

  		c32[i]= local_c32;
  		c16[i]=	local_c16;
  		printf ("i=%d \t c16=%d \t Sen=%d \t \n",i
  						 ,c16[i],testResult[i]);	
  		
		//CCNT1_cycleCountReport();


  		}
 	 }
}

/* END SenCos */
/*
** ###################################################################
**
**     This file was created by Processor Expert 3.00 [04.35]
**     for the Freescale 56800 series of microcontrollers.
**
** ###################################################################
*/
