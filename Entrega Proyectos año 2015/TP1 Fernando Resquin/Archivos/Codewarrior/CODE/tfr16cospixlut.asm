;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16CosPIxLUT

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'


    ;  Frac16 tfr16CosPIxLUT(tfr16_tCosPIxLUT * pSWG, Frac16 PhasePIx)

    ;  Register usage upon Entry:
    ;      R2  - tfr16_tCosPIxLUT * input value
    ;      Y0  - PhasePIx input value

    ;  Register usage during execution
    ;      R0  - pSineTable

    ;      X0  - temp
    ;      Y0  - temp
    ;      Y1  - Table Length
    ;      R2  - tfr16_tCosPIxLUT
    ;      R1  - shift
    ;      N   - index into table
    ;      A   - temp
    ;      B   - temp

Offset_pSineTable      equ 0
Offset_SineTableLength equ Offset_pSineTable+PTR_SIZE
Offset_Shift           equ Offset_SineTableLength+1

    ORG  P:

Ftfr16CosPIxLUT:

 if SWG_USE_NON_MODULO_OPT==1

    adda     #2,SP
    move.l   c2,x:(sp)+
    move.l   c10,x:(sp)

  move.w   x:(r2+Offset_Shift),x0       ; put shift into x0
  LoadRx   x:(r2+Offset_pSineTable),r0  ; put pSineTable into r0

  tst.w    y0                ; test initial phase
  bgt      CosPIxLUTStart
  move.w   #-1,a
  impy.w   a1,y0,y0          ; change sign convention of phase

CosPIxLUTStart:
  add.w    #-16384,y0        ; store shifted phase into y0

  blt      CosPIxLUTTest1
  asrr.w   y0,x0,x0          ; find index into table
  moveu.w  x0,r4             ; store index
  bfclr    #$FFC0,y0
  move.w   y0,y1             ; store sine delta
  move.w   #-1,c1            ; store sign
  bra      CosPIxLUTValue

CosPIxLUTTest1:
    abs      y0
  asrr.w   y0,x0,x0
  moveu.w  x0,r4             ; store index
    bfclr    #$FFC0,y0
    move.w   y0,y1
  move.w   #1,c1             ; store sign

CosPIxLUTValue:
  moveu.w  r4,N              ; put index into N
  nop
  move.w   x:(r0+N),b        ; get sine value
    adda     #1,N
  move.w   x:(r0+N),x0       ; get sine value
  sub      b,x0              ; get difference
  impy.w   y1,x0,y0
  move.w   x:(r2+Offset_Shift),x0   ; put shift into x0
  asrr.w   y0,x0,y0
  add      b,y0              ; add delta to sine value
  impy.w   c1,y0,y0          ; get return value
    move.l   x:(sp)-,c
    move.l   x:(sp)-,c2

 endif

  rts

_end

     ENDSEC
  END

