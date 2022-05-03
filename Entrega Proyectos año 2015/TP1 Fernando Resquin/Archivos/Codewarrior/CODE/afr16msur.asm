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

    GLOBAL  Fafr16Msu_r

; void afr16Msu_r (Frac16 *pW, Frac16 *pX, Frac16 *pY, Frac16 *pZ, UInt16 n);
;
;    Register usage upon entry:
;       R2 - pW (input vector)
;       R3 - pX (input vector)
;       R4 - pY (input vector)
;       R5 - pZ (output vecttor)
;       Y0 - n  (length of all vectors)
;
;    Register usage during execution:
;       R2 - pW
;       R3 - pX
;       R4 - pY
;       R1 - pZ
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       Y1 - temp
;       A  - temp
;
        ORG  P:
Fafr16Msu_r:

        do        Y0,EndDo
        move.w    X:(R4)+,Y1
        move.w    X:(R2)+,A
        move.w    X:(R3)+,X0
        macr      -Y1,X0,A
        move.w    A,X:(R1)+
EndDo:
EndMsur:
        rts

        ENDSEC
        END
