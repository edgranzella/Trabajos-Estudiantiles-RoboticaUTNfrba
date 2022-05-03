/****************************************************************
*
* (c) Freescale Semiconductor
* 2004 All Rights Reserved
*
*
*****************************************************************
*
* File Name:
*    cyclecount.c
*
* Description:
*    This file contains the Cycle Count software which allows
*    users to count and report the number of system clock cycles
*    between two points in the user's application.
*
* Modules Included:
*    cycleCountReport
*    cycleCountStart
*    cycleCountStop
*
****************************************************************/


#include "port.h"
#include <stdio.h>
#include <string.h>
#include "cyclecount.h"


UWord32 cyclecount_CalibrationValue;

volatile bool cyclecount_Running;


/******************************************************************************
*
* Module:
*    cycleCountReport
*
* Description:
*    See cyclecount.h
*
*******************************************************************************/

void cycleCountReport(long int *pExecTime, int n)
{
  unsigned int i;
  UWord32 maxExecTime, minExecTime;
  UWord32 sum;

  sum=0;
  maxExecTime=0;
  minExecTime=0xFFFFFFFF;

  for(i=0;i<n;i++)
  {
    sum = sum + pExecTime[i];

    if (maxExecTime<pExecTime[i])
    {
      maxExecTime= (UWord32) pExecTime[i];
    }

    if (minExecTime>pExecTime[i])
    {
      minExecTime= (UWord32) pExecTime[i];
    }


  }
  sum=sum/n;

        printf("%s%lu \n", "AVG CYCLE COUNT: ", sum);
        printf("%s%lu \n", "MAX CYCLE COUNT: ", maxExecTime );
        printf("%s%lu \n", "MIN CYCLE COUNT: ", minExecTime );
}

/******************************************************************************
*
* Module:
*    cycleCountStart
*
* Description:
*    See cyclecount.h
*
*******************************************************************************/

void cycleCountStart(void)
{
  (void)Inhr1_Disable();
  cyclecount_Running = TRUE;
  (void)Inhr1_Enable();

}

/******************************************************************************
*
* Module:
*    cycleCountStop
*
* Description:
*    See cyclecount.h
*
*******************************************************************************/

UWord32 cycleCountStop(void)
{
  UWord32 CycleCount;

  (void)Inhr1_GetCounterValue(&CycleCount);
  (void)Inhr1_Disable();
  if (cyclecount_Running == FALSE)
  {
    return (UWord32) CYCLECOUNT_CALIBRATION_FAILURE;
  }
  cyclecount_Running = FALSE;
  return (CycleCount - cyclecount_CalibrationValue);
}

/*
 void cycleCountCalibrate(void)
{
    UWord32 TempCalib;

    cyclecount_CalibrationValue = 0;
    cycleCountStart();
    TempCalib = cycleCountStop();
    cyclecount_CalibrationValue = TempCalib;
}
*/
