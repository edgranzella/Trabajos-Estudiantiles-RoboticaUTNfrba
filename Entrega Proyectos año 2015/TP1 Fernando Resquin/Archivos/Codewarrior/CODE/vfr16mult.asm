;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fvfr16Mult

; void    vfr16Mult (Frac16 c, Frac16 *pX, Frac16 *pZ, UInt16 n)
;
;    Register usage upon entry:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - c
;       Y1 - n  (length of all vectors)
;
;    Register usage during execution:
;       R2 - pX
;       R3 - pZ
;       Y1 - n  (length of all vectors)
;       Y0 - c
;       A  - temp
;
      ORG  P:
Fvfr16Mult:

      tst.w     Y1
      ble       EndMult
      move.w    X:(R2)+,X0
      do        Y1,EndDo
      mpy       Y0,X0,A      X:(R2)+,X0
      move.w    A,X:(R3)+
EndDo:
EndMult:
      rts

      ENDSEC
      END
