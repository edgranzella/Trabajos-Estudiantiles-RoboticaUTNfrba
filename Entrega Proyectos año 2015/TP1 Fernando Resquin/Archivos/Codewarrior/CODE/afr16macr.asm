;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;
;********************************************************************
;
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fafr16Mac_r

; void afr16Mac_r (Frac16 *pW, Frac16 *pX, Frac16 *pY, Frac16 *pZ, UInt16 n);
;
;    Register usage upon entry:
;       R2 - pW (input vector)
;       R3 - pX (input vector)
;       R4 - pY (input vector)
;       R5 - pZ (output vecttor)
;       Y0 - n  (length of all vectors)
;
;    Register usage upon entry:
;       R2 - pW
;       R3 - pX
;    R0,R4 - pY
;       R1 - pZ
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       Y1 - temp
;       A  - temp
;
        ORG  P:
Fafr16Mac_r:

        tfra      R4,R0
        nop
        move.w    X:(R0)+,Y1
        nop
        do        Y0,EndDo
        move.w    X:(R2)+,A
        move.w    X:(R3)+,X0
        macr      Y1,X0,A    X:(R0)+,Y1
        move.w    A,X:(R1)+
EndDo:
EndMacr:
        rts

      ENDSEC
      END
