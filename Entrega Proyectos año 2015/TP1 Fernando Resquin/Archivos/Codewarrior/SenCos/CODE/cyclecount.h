/** ###################################################################
**
**     (c) Freescale Semiconductor
**     2004 All Rights Reserved
**
**
**     Copyright : 1997 - 2009 Freescale Semiconductor, Inc. All Rights Reserved.
**     
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/

#ifndef __CYCLECOUNT_H
#define __CYCLECOUNT_H

#include "port.h"
/* Include inherited beans */
#include "Inhr1.h"

#ifdef __cplusplus
extern "C" {
#endif

#define CYCLECOUNT_CALIBRATION_FAILURE 0xFFFFFFFF

/******************************************************************************
*
* Module:
*    cycleCountReport
*
* Description:
*    This function calculates the mean, maximum, and minimum execution times,
*    and writes the results to the Console.
*
* Returns:
*    None
*
* Global Data:
*    None
*
* Arguments:
*    pExecTime - (in) array of measured execution times
*    n         - (in) length of pExecTime (number of valid execution times
*                     in pExecTime)
*
* Range Issues:
*    None
*
* Special Issues:
*    None
*
*******************************************************************************/

EXPORT void    cycleCountReport (long int *pIC, int n);

/******************************************************************************
*
* Module:
*    cycleCountStart
*
* Description:
*    This function performs the initialization of the Quad Timers and enables
*    counting of instruction cycles.
*
* Returns:
*    None
*
* Global Data:
*    cyclecountQuadParam1 -
*        Structure containing initialization information for the
*        first quad timer
*
*    cyclecountQuadParam2 -
*        Structure containing initialization information for the
*        second quad timer
*
*    cyclecountDevice.timerDevice1 -
*        the first Quad Timer device name
*
*    cyclecountDevice.timerDevice2 -
*        the second Quad Timer device name
*
*    cyclecount_pFileDesc1 -
*        pointer to the first Quad Timer device descriptor.
*
*    cyclecount_pFileDesc2 -
*        pointer to the second Quad Timer device descriptor.
*
* Arguments:
*    None
*
* Range Issues:
*
* Special Issues:
*    cyclecountDevice.timerDevice1 and cyclecountDevice.timerDevice2 must be
*    Quad Timers from the same Quad Timer module (A, B, C or D).
*
*******************************************************************************/

EXPORT void cycleCountStart(void);

/******************************************************************************
*
* Module:
*    cycleCountStop
*
* Description:
*    This function disables the Quad Timers and returns number of system
*    clock cycles counted by Quad Timers.
*
* Returns:
*    Number of system clock cycles
*
* Global Data:
*    cyclecountQuadParam1 -
*        Structure containing initialization information for the
*        first quad timer
*
*    cyclecountQuadParam2 -
*        Structure containing initialization information for the
*        second quad timer
*
*    cyclecount_pFileDesc1 -
*        pointer to the first Quad Timer device descriptor.
*
*    cyclecount_pFileDesc2 -
*        pointer to the second Quad Timer device descriptor.
*
*    cyclecount_CalibrationValue -
*        contains the calibration value for the Cycle Count tool
*
* Arguments:
*    None
*
* Range Issues:
*
* Special Issues:
*
*******************************************************************************/

EXPORT UWord32 cycleCountStop(void);

/******************************************************************************
*
* Module:
*    cycleCountCalibrate
*
* Description:
*    This function calls cycleCountStart and cycleCountStop functions and
*    returns a calibration value.  This calibration value is the number of
*    system clock cycles counted when there is no code between cycleCountStart
*    and cycleCountStop function calls.
*
* Returns:
*    calibration value - the number of system clock cycles counted when there
*                        is no code between cycleCountStart and cycleCountStop
*                        function calls.if a failure occurs a value of
*                        0xFFFFFFFF is returned
*
* Global Data:
*    None
*
* Arguments:
*    None
*
* Range Issues:
*
* Special Issues:
*
*******************************************************************************/

//EXPORT void cycleCountCalibrate(void);

//#define CYCLECOUNT_TIMER_A_0  0
//#define CYCLECOUNT_TIMER_A_1  1
//#define CYCLECOUNT_TIMER_A_2  2
//#define CYCLECOUNT_TIMER_A_3  3
//#define CYCLECOUNT_TIMER_B_0  4
//#define CYCLECOUNT_TIMER_B_1  5
//#define CYCLECOUNT_TIMER_B_2  6
//#define CYCLECOUNT_TIMER_B_3  7
//#define CYCLECOUNT_TIMER_C_0  8
//#define CYCLECOUNT_TIMER_C_1  9
//#define CYCLECOUNT_TIMER_C_2  10
//#define CYCLECOUNT_TIMER_C_3  11
//#define CYCLECOUNT_TIMER_D_0  12
//#define CYCLECOUNT_TIMER_D_1  13
//#define CYCLECOUNT_TIMER_D_2  14
//#define CYCLECOUNT_TIMER_D_3  15

#define cycleCountCalibrate()                                                         \
{                                                                                     \
    extern UWord32 cyclecount_CalibrationValue;                                       \
                                                                                      \
    cyclecount_CalibrationValue = 0;                                                  \
    cycleCountStart();                                                                \
    cyclecount_CalibrationValue = cycleCountStop();                                   \
}

/********************************************************************
* Private data structures
*********************************************************************/
/*
typedef struct
{
   const char * timerDevice1;
   const char * timerDevice2;
} cyclecount_sDevice;
*/

#ifdef __cplusplus
}
#endif

#endif

