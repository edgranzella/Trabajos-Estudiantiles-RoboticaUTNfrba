;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SineWaveGenRDITL

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'


    ;  void tfr16SineWaveGenRDITL(tfr16_tSineWaveGenRDITL * pSWG, Frac16 * pValues, UInt16 Nsamples)

    ;  Register usage upon Entry:
    ;      R3  - pValues
    ;      R2  - tfr16_tSineWaveGenRDITL * input value
    ;      Y0  - Nsamples input value

    ;  Register usage during execution
    ;      X0  - temp
    ;      Y0  - temp
    ;      R2  - tfr16_tWaveGenRDITL
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

Ftfr16SineWaveGenRDITL:

 if SWG_USE_NON_MODULO_OPT==1


  moveu.w   x:(r2+Offset_Shift),r0  ; put shift into r0
  moveu.w   y0,r1             ; move nsample into r1
  move.w    x:(r2+Offset_Phase),y0  ; put current phase into y0

  do r1,SWGEndRDITL
  moveu.w   x:(r2+Offset_Shift),r0  ; put shift into r0
  tst.w     y0                ; test phase
  blt       SWGRDITLTest1

    cmp.w     #16384,y0
  bge       SWGRDITLTest2

  move.w    y0,a              ; put phase into y0
  bfclr     #$FFC0,y0
    moveu.w   y0,r4             ; store sine delta
  moveu.w   #1,n3             ; store sign
  bra       SWGRDITLShiftTest1

SWGRDITLTest1:
  cmp.w     #-16384,y0
  bge       SWGRDITLTest3

  clr       a
  clr       b
  move.w    #-32768,a0
  move.w    y0,b0             ; put phase in b0
  add       b,a
  move.w    a0,a1
    andc      #63,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #-1,n3            ; store sign
  bra       SWGRDITLShiftTest1

SWGRDITLTest2:
  clr       a
  clr       b
  move.w    #-32768,a0
  move.w    y0,b0             ; put phase in b0
  sub       b,a
  move.w    a0,y0
  move.w    y0,a1
    andc      #63,y0
  moveu.w   y0,r4
  moveu.w   #1,n3             ; store sign
  bra       SWGRDITLShiftTest1

SWGRDITLTest3:
    abs       y0
    move.w    y0,a
    bfclr     #$FFC0,y0
    moveu.w   y0,r4
  moveu.w   #-1,n3            ; store sign

SWGRDITLShiftTest1:
    tstdeca.w r0
  beq       SWGRDITLShiftTest2
  asr  a                 ; shift phase by 1
  bra       SWGRDITLShiftTest1

SWGRDITLShiftTest2:
  bftsth    #-32768,a0
  bcc       SWGRDITLShiftEnd
  inc.w     a

SWGRDITLShiftEnd:
  moveu.w   a1,N              ; put index into x0

SWGRDITLValue:
  LoadRx    x:(r2+Offset_pSineTable),r0  ; put pSineTable into r0
  move.w    x:(r0+N),x0       ; get sine value
  move.w    x0,y1             ; store sine value
    adda      #1,N
  move.w    x:(r0+N),x0       ; get sine value
  sub       y1,x0             ; get difference
  move.w    r4,y0             ; put sine delta in y0
    impy.w    x0,y0,y0

  move.w    x:(r2+Offset_Shift),x0  ; put shift into x0
  asrr.w    y0,x0,y0
  add       y1,y0             ; add delta to sine value
  move.w    n3,x0             ; get sign
    impy.w    x0,y0,b
  move.w    x:(r2+Offset_Phase),y0   ; move current phase into y0
  move.w    x:(r2+Offset_Delta),x0   ; put phase increment into x0
  add       x0,y0
  move.w    #32767,a          ; put MAX_16 into a
  cmp       y0,a
  bgt       SWGRDITLNoResetPhase
  move.w    x:(r2+Offset_Phase),y0   ; put phase into y0
  sub       y0,a
  move.w    x:(r2+Offset_Delta),y0   ; put phase increment into y0
  sub       a,y0
  add.w     #-32768,y0

SWGRDITLNoResetPhase:
  nop
  move.w    y0,x:(r2+Offset_Phase)   ; store new phase
  move.w    b1,x:(r3)+        ; put return value into pValue

SWGEndRDITL:

 endif

  rts

_end

     ENDSEC
  END

