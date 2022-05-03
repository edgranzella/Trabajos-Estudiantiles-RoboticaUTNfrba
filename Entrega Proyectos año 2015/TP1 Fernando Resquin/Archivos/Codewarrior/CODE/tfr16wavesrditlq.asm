;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16WaveGenRDITLQ

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'


    ;  Frac16 tfr16WaveGenRDITLQ(tfr16_tWaveGenRDITLQ * pSWG, Frac16 PhaseIncrement)

    ;  Register usage upon Entry:
    ;      R2  - tfr16_tWaveGenRDITLQ * input value
    ;      Y0  - PhaseIncrement input value

    ;  Register usage during execution
    ;      X0  - temp
    ;      Y0  - temp
    ;      Y1  - Table Length
    ;      R2  - tfr16_tWaveGenRDITLQ
    ;      R1  - shift
    ;      R0  - pSineTable
    ;      N   - index into table
    ;      A   - temp
    ;      B   - temp

Offset_pSineTable       equ 0
Offset_Phase            equ Offset_pSineTable+PTR_SIZE
Offset_SineTableLength  equ Offset_Phase+1
Offset_Shift            equ Offset_SineTableLength+1

    ORG  P:

Ftfr16WaveGenRDITLQ:

 if SWG_USE_NON_MODULO_OPT==1

  move.w    x:(r2+Offset_Shift),x0       ; put shift into x0
  LoadRx    x:(r2+Offset_pSineTable),r0  ; put pSineTable into r0
  moveu.w   y0,n3                        ; store phase increment
  move.w    x:(r2+Offset_Phase),y0       ; put current phase into y0

  tst.w     y0                ; test initial phase
  blt       WaveGenRDITLQTest1

  cmp.w     #16384,y0
  bge       WaveGenRDITLQTest2
  asrr.w    y0,x0,x0          ; find index into table

  moveu.w   x0,r3             ; store index
  bfclr     #$FFC0,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #1,r1             ; store sign
  bra       WaveGenRDITLQValue

WaveGenRDITLQTest1:
  cmp.w     #-16384,y0
  bge       WaveGenRDITLQTest3
  clr       a
  clr       b
  move.w    #-32768,a0
  move.w    y0,b0             ; put phase in b0
  add       b,a
  move.w    a0,y0
  asrr.w    y0,x0,x0
  moveu.w   x0,r3             ; store index
    andc      #63,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #-1,r1            ; store sign
  bra       WaveGenRDITLQValue

WaveGenRDITLQTest2:
  clr       a
  clr       b
  move.w    #-32768,a0
  move.w    y0,b0             ; put phase in b0
  sub       b,a
  move.w    a0,y0
  asrr.w    y0,x0,x0
  moveu.w   x0,r3             ; store index
    andc      #63,y0
  moveu.w   y0,r4             ; store sine delta
  moveu.w   #1,r1             ; store sign
  bra       WaveGenRDITLQValue

WaveGenRDITLQTest3:
    abs       y0
  asrr.w    y0,x0,x0
  moveu.w   x0,r3             ; store index
    bfclr     #$FFC0,y0
    move.w    y0,r4
  moveu.w   #-1,r1            ; store sign

WaveGenRDITLQValue:
  moveu.w   r3,N              ; put index into N
  nop
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
  move.w    r1,x0             ; get sign
    impy.w    x0,y0,b
  move.w    x:(r2+Offset_Phase),y0  ; move current phase into y0
  move.w    n3,x0             ; put phase increment into x0
  add       y0,x0
  move.w    #32767,a          ; put MAX_16 into a
  cmp       x0,a
  bgt       WaveGenRDITLQEnd
  sub       y0,a
  move.w    n3,x0             ; put phase increment into x0
  sub       a,x0
  add.w     #-32768,x0

WaveGenRDITLQEnd:
  move.w    x0,x:(r2+Offset_Phase)   ; store new phase
  move.w    b1,y0             ; put return value into y0

 endif

  rts
_end

     ENDSEC
  END
