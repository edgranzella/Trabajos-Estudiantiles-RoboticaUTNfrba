;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SineWaveGenDOM

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'

    ;  void tfr16SineWaveGenDOM(tfr16_tSineWaveGenDOM * pSWG, Frac16 * pValues, UInt16 Nsamples)
    ;  Register usage upon Entry:
    ;      R2  - tfr16_tSineWaveGenDOM * input value
    ;      R3  - pValues input address
    ;      Y0  - Nsample input value

    ;  Register usage:
    ;      X0  - temp
    ;      Y0  - Nsamples
    ;      Y1  - temp
    ;      R2  - Private data structure
    ;      R3  - pValues
    ;      A   - temp

Ftfr16SineWaveGenDOM:

 if SWG_USE_NON_MODULO_OPT==1
    adda      #2,sp
    move.l    c2,x:(sp)+
    move.l    c10,x:(sp)

    tst.w     y0                ; nsamples == 0?
  beq       EndDOM
  moveu.w   y0,r0

  move.w    x:(r2)+,x0           ; put filter state 1 into x0
    move.w    x:(r2+1),y0          ; put filter coef into y0
    move.w    #16384,c1            ; filter coef
    moveu.w   #0,n

  do        r0,EndDOM            ; do nsamples
  mpy       x0,y0,a  x:(r2)+n,b  ; put product into a. Fetch
                                 ;  second filter state
    move.w    a,y1
  mpy       b1,c1,b              ; put product into b
  move.w    x0,x:(r2)+n                               ;  pValue
    sub       b,y1
    add       y1,y1
    move.w    y1,x:(r3)+           ; save sine value in pValue
    move.w    y1,x0                ; first filter state

EndDOM:

    deca      r2
    move.w    x0,x:(r2)
    move.l    x:(sp)-,c
    move.l    x:(sp)-,c2

 endif

  rts
_end

     ENDSEC
  END

