;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SinPIxLUT

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'


    ;  Frac16 tfr16SinPIxLUT(tfr16_tSinPIxLUT * pSWG, Frac16 PhasePIx)

    ;  Register usage upon Entry:
    ;      R2  - tfr16_tSinPIxLUT * input value
    ;      Y0  - PhasePIx input value

    ;  Register usage during execution
    ;      X0  - temp
    ;      Y0  - temp
    ;      Y1  - Table Length
    ;      R2  - tfr16_tSinPIxLUT
    ;      R1  - shift
    ;      R0  - pSineTable
    ;      N   - index into table
    ;      A   - temp
    ;      B   - temp

Offset_pSineTable       equ 0
Offset_SineTableLength  equ Offset_pSineTable+PTR_SIZE
Offset_Shift            equ Offset_SineTableLength+1

    ORG  P:

Ftfr16SinPIxLUT:

 if SWG_USE_NON_MODULO_OPT==1

  move.w    x:(r2+Offset_Shift),x0  ; put shift into x0
  LoadRx    x:(r2+Offset_pSineTable),r0  ; put pSineTable into r0

  tst.w     y0                ; test initial phase
  blt       SinPIxLUTTest1
  cmp.w     #16384,y0
  bge       SinPIxLUTTest2
  asrr.w    y0,x0,x0          ; find index into table
  moveu.w   x0,n3             ; store index
  bfclr     #$FFC0,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #1,r1             ; store sign
  bra       SinPIxLUTValue

SinPIxLUTTest1:
  cmp.w     #-16384,y0
  bge       SinPIxLUTTest3

  clr       a
  clr       b
  move.w    #-32768,a0
  move.w    y0,b0             ; put phase in b0
  add       b,a
  move.w    a0,y0

  asrr.w    y0,x0,x0
  moveu.w   x0,n3             ; store index
    andc      #63,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #-1,r1            ; store sign
  bra       SinPIxLUTValue

SinPIxLUTTest2:

  clr       a
  clr       b
  move.w    #-32768,a0
  move.w    y0,b0             ; put phase in b0
  sub       b,a
  move.w    a0,y0
  asrr.w    y0,x0,x0
  moveu.w   x0,n3             ; store index
    andc      #63,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #1,r1             ; store sign
  bra       SinPIxLUTValue

SinPIxLUTTest3:
    abs       y0
  asrr.w    y0,x0,x0
  moveu.w   x0,n3             ; store index
    bfclr     #$ffc0,y0
    moveu.w   y0,r4
  moveu.w   #-1,r1            ; store sign

SinPIxLUTValue:
  moveu.w   n3,N              ; put index into N
  nop
  move.w    x:(r0+N),y1       ; get sine value
    adda      #1,N
  move.w    x:(r0+N),x0       ; get sine value
  sub       y1,x0             ; get difference
  move.w    r4,y0             ; put sine delta in y0
    impy.w    x0,y0,y0
  move.w    x:(r2+Offset_Shift),x0   ; put shift into x0
  asrr.w    y0,x0,y0
  add       y1,y0             ; add delta to sine value
  move.w    r1,x0             ; get sign
    impy.w    x0,y0,y0

 endif

  rts
_end

     ENDSEC
  END

