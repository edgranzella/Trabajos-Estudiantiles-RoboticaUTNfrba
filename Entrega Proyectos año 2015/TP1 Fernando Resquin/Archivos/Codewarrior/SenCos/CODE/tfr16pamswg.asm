;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SineWaveGenPAM
;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'

    ;  void tfr16SineWaveGenPAM(tfr16_tSineWaveGenPAM * pSWG, Frac16 * pValues, UInt16 Nsamples)
    ;  Register usage upon Entry:
    ;      R2  - tfr16_tSineWaveGenPAM * input value
    ;      R3  - pValues input address
    ;      Y0  - Nsample input value

    ;  Register usage:
    ;      X0  - temp
    ;      Y0  - temp
    ;      Y1  - Nsamples
    ;      R2  - Private data structure
    ;      R3  - pValues
    ;      A   - temp

Ftfr16SineWaveGenPAM:

 if SWG_USE_NON_MODULO_OPT==1

   tst.w    y0                  ; nsamples == 0?
  beq      EndPAM
    move.w   #32767,y1

  do       y0,EndPAM           ; do nsamples
  move.w   x:(r2)+,x0          ; put previous alpha into x0
  move.w   x:(r2)-,y0          ; put delta into y0
    add      x0,y0               ; get next alpha store in y0
  cmp      y1,y0               ; see if need to reset next alpha
  blt      NoResetNextAlphaPAM
  sub      y1,x0               ; subtract previous alpha from MAX16
  move.w   x:(r2+1),y0       ; put delta in y0
  add      x0,y0               ; add delta to next alpha
  add.w    #-32768,y0          ; add MIN16 to get new reset alpha
NoResetNextAlphaPAM:
  move.w   y0,x:(r2+2)         ; store next alpha
  move.w   x:(r2),y0           ; put previous alpha in y0
  jsr      Ftfr16SinPIx
  move.w   x:(r2+2),x0
  move.w   x0,x:(r2)           ; store next alpha in previous alpha
  move.w   x:(r2+3),x0         ; put amplitude in x0
  mpy      x0,y0,a             ; multiply sine value by amplitude
  move.w   a,x:(r3)+           ; store sine value in pValue

EndPAM:

 endif

  rts
_end


     ENDSEC
  END

