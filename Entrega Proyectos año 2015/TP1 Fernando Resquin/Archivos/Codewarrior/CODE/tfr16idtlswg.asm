;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16SineWaveGenIDTL

;
; The following symbols can be used to exclude portions (using '0') of
; the SWG implementation in order to save program memory;  if you do so,
; however, please make sure that EVERY call to SWG will satisfy the
; constraints placed upon the limited implementation.
;
  define  SWG_USE_NON_MODULO_OPT   '1'
  define  SWG_USE_MODULO_OPT       '1'


    ;  void tfr16SineWaveGenIDTL(tfr16_tSineWaveGenIDTL * pSWG, Frac16 * pValues, UInt16 Nsamples)

    ;  Register usage upon Entry:
    ;      R2  - tfr16_tSineWaveGenIDTL * input value
    ;      R3  - pValues input address
    ;      Y0  - Nsample input value

    ;  Register usage during execution
    ;      X0  - Table Length
    ;      Y0  - temp
    ;      Y1  - address of sine table end
    ;      R2  - Sine table index
    ;      R3  - pValue
    ;      R0  - pIndex into sine table
    ;      N   - Delta for sine table
    ;      A   - temp
    ;      B   - temp

Offset_pIndex           equ 0
Offset_pEndTable        equ Offset_pIndex+PTR_SIZE
Offset_bAligned         equ Offset_pEndTable+PTR_SIZE
Offset_Delta            equ Offset_bAligned+1
Offset_SineTableLength  equ Offset_Delta+1

    ORG  P:

Ftfr16SineWaveGenIDTL:

    moveu.w   omr,n3
    bfset     #$100,omr
  LoadRx    x:(r2+Offset_pIndex),r0     ; put pIndex into r0
  tst.w     Y0                          ; Nsamples == 0?
  beq       EndIDTL
  moveu.w   x:(r2+Offset_Delta),N       ; put delta into N
  LoadRx    x:(r2+Offset_pEndTable),r1  ; put table end into r1
  clr       b
  move.w    x:(r2+Offset_SineTableLength),b0  ; put length of table in x0
  move.w    x:(r2+Offset_SineTableLength),b0  ; put length of table in x0

 if SWG_USE_NON_MODULO_OPT==1

 if SWG_USE_MODULO_OPT==1

    tst.w     x:(r2+Offset_bAligned)   ; bAligned?
  bne       DoModuloIDTL     ; branch to modulo if bAligned is true

 endif

  do        Y0,EndDoIDTL
  move.w    x:(r0)+N,y0      ; put sine value into y0
    move.w    y0,x:(r3)+       ; put sine value into pValue
  cmpa      r1,r0
  blo       NoWrapIDTL
    move.l    r0,A
  sub       B,A             ; get new pIndex
  move.l    A10,r0
NoWrapIDTL:
;  moveu.w   A,r0
    nop
EndDoIDTL:
  bra   EndIDTL

 endif


 if SWG_USE_MODULO_OPT==1

DoModuloIDTL:
  move.w    M01,x0            ; save M register
  move.w    b0,A             ; Set Modulo addressing value
  dec.w     A
  moveu.w   A,M01
  do        Y0,EndModDoIDTL
  move.w    x:(r0)+N,y0      ; put sine value into y0
  move.w    y0,x:(r3)+       ; put sine value into pValue
EndModDoIDTL:
  moveu.w   x0,M01            ; restore M register
  nop

 endif

EndIDTL:
  moveu.w   n3,omr
  StoreRx   r0,X:(r2+Offset_pIndex)  ; Save current index
  rts


    ENDSEC
  END
