;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SineWaveGenRDTL

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'

    ;  void tfr16SineWaveGenRDTL(tfr16_tSineWaveGenRDTL * pSWG, Frac16 * pValues, UInt16 Nsamples)
    ;  Register usage upon Entry:
    ;      R2  - tfr16_tSineWaveGenRDTL * input value
    ;      R3  - pValues input address
    ;      Y0  - Nsample input value

    ;  Register usage during execution
    ;      X0  - Phase
    ;      Y0  - Nsamples
    ;      Y1  - Address of Sine Table end
    ;      R2  - Sine Table Index
    ;      R3  - pValues
    ;      R0  - pIndex into sine table
    ;      N   - Index for sine table
    ;      A   - temp
    ;      B   - Delta

Offset_pSineTable       equ 0
Offset_Phase            equ Offset_pSineTable+PTR_SIZE
Offset_Delta            equ Offset_Phase+1
Offset_SineTableLength  equ Offset_Delta+1

Ftfr16SineWaveGenRDTL:

 if SWG_USE_NON_MODULO_OPT==1
    adda      #2,sp
    move.l    d2,x:(sp)+
    move.l    d10,x:(sp)

  tst.w     y0               ; Nsamples == 0?
  moveu.w   y0,r4
  beq       EndRDTL
  move.w    x:(r2+Offset_Phase),x0 ; put current phase in x0
  move.w    x:(r2+Offset_Delta),b  ; put delta in b
  LoadRx    x:(r2+Offset_pSineTable),r0  ; pSineTable
  move.w    x:(r2+Offset_SineTableLength),d1   ; put table length in d1
  move.w    #32767,y1        ; for resetting the phase
    move.w    x0,y0

   do        r4,EndRDTL       ; do nsamples
  mpy       d1,x0,a          ; store offset in a
  moveu.w   a,N              ; put index in offset register
  move.w    x:(r0+N),a       ; store sine value in a
  move.w    a1,x:(r3)+       ; store sine value in pValue
  add       b,x0             ; find new phase
  cmp       y1,x0            ; see if need to reset phase
  blt       NoPhaseReset
  move.w    y1,a
    sub       y0,a
  move.w    b1,x0
  sub       a,x0             ; reset phase
NoPhaseReset:

  move.w    x0,y0            ; store new phase
EndRDTL:

;    adda      #-3,r2
    move.w    x0,x:(r2+Offset_Phase)
    move.l    x:(sp)-,d
    move.l    x:(sp)-,d2

 endif

  rts
_end

     ENDSEC
  END

