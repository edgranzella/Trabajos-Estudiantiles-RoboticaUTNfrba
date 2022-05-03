;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SineWaveGenRDITLQ

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'


    ;  void tfr16SineWaveGenRDITLQ(tfr16_tSineWaveGenRDITLQ * pSWG, Frac16 * pValues, UInt16 Nsamples)

    ;  Register usage upon Entry:
    ;      R3  - pValues
    ;      R2  - tfr16_tSineWaveGenRDITLQ * input value
    ;      Y0  - Nsamples input value

    ;  Register usage during execution
    ;      X0  - temp
    ;      Y0  - temp
    ;      R2  - tfr16_tWaveGenRDITLQ
    ;      R1  - shift
    ;      R0  - pSineTable
    ;      N   - index into table
    ;      A   - temp
    ;      B   - temp

Offset_pSineTable       equ 0
Offset_Phase            equ Offset_pSineTable+PTR_SIZE
Offset_Delta            equ Offset_Phase+1
Offset_SineTableLength  equ Offset_Delta+1
Offset_Shift            equ Offset_SineTableLength+1

    ORG  P:

Ftfr16SineWaveGenRDITLQ:

 if SWG_USE_NON_MODULO_OPT==1
    adda      #2,sp
    move.l    d2,x:(sp)+
    move.l    d10,x:(sp)

  LoadRx    x:(r2+Offset_pSineTable),r0 ; put pSineTable into r0
  moveu.w   y0,r1             ; move nsample into r1
  move.w    x:(r2+Offset_Phase),y0      ; put current phase into y0

  do        r1,SWGEndRDITLQ
  move.w    x:(r2+Offset_Shift),x0      ; put shift into x0
  tst.w     y0                ; test phase
  blt       SWGRDITLQTest1

  cmp.w     #16384,y0
  bge       SWGRDITLQTest2
  asrr.w    y0,x0,x0          ; find index into table

  moveu.w   x0,n3             ; store index
  bfclr     #$FFC0,y0
  moveu.w   y0,r4             ; store sine delta
  move.w    #1,d1             ; store sign
  bra       SWGRDITLQValue

SWGRDITLQTest1:
  cmp.w     #-16384,y0
  bge       SWGRDITLQTest3

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
  move.w    #-1,d1            ; store sign
  bra       SWGRDITLQValue

SWGRDITLQTest2:
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
  move.w    #1,d1             ; store sign
  bra       SWGRDITLQValue

SWGRDITLQTest3:
  asrr.w    y0,x0,x0          ; shift phase
    abs       y0

  bfclr     #$FFC0,y0
  moveu.w   y0,r4             ; store sine delta
    abs       x0
  moveu.w   x0,n3             ; store index
  move.w    #-1,d1            ; store sign

SWGRDITLQValue:
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
  move.w    d1,x0             ; get sign
    impy.w    x0,y0,b
  move.w    x:(r2+Offset_Phase),y0  ; move current phase into y0
  move.w    x:(r2+Offset_Delta),x0  ; put phase increment into x0
  add       x0,y0
  move.w    #32767,a          ; put MAX_16 into a
  cmp       y0,a
  bgt       SWGRDITLQNoResetPhase
  move.w    x:(r2+Offset_Phase),y0   ; put phase into y0
  sub       y0,a
  move.w    x:(r2+Offset_Delta),y0   ; put phase increment into y0
  sub       a,y0
  add.w     #-32768,y0

SWGRDITLQNoResetPhase:
  nop
  move.w    y0,x:(r2+Offset_Phase) ; store new phase
  move.w    b,x:(r3)+         ; put return value into pValue

SWGEndRDITLQ:

    move.l    x:(sp)-,d
    move.l    x:(sp)-,d2

 endif

  rts

_end

     ENDSEC
  END

