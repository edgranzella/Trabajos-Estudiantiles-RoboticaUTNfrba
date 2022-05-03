;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fvfr16Scale

; void    vfr16Scale (Int16  k, Frac16 *pX, Frac16 *pZ, UInt16 n)
;
;    Register usage upon entry:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - k
;       Y1 - n  (length of all vectors)
;
;    Register usage during execution:
;       R2 - pX
;       R3 - pZ
;       Y1 - n  (length of all vectors)
;       Y0 - k
;       A  - temp
;
      ORG  P:
Fvfr16Scale:

      tst.w     Y1
      ble       EndScale
      tst.w     Y0
      beq       EndScale
      nop
      blt       DownScale
      nop
UpScale:
      do        Y1,EndUpDo
      move.w    X:(R2)+,A
      rep       Y0
      asl       A
      move.w    A,X:(R3)+
EndUpDo:
EndScale:
      rts

DownScale:
      move.w    Y0,A
      neg       A
      move.w    A,Y0
      do        Y1,EndDownDo
      move.w    X:(R2)+,A
      rep       Y0
      asr       A
      move.w    A,X:(R3)+
EndDownDo:
      rts

      ENDSEC
      END
