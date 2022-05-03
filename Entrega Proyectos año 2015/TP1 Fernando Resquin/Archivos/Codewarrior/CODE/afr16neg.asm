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

    GLOBAL  Fafr16Negate

; void  afr16Negate  (Frac16 *pX, Frac16 *pZ, UInt16 n)
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       A  - temp
;
;
    ORG  P:
Fafr16Negate:

    do        Y0,EndDo
    move.w    X:(R2)+,A
    neg       A
    move.w    A,X:(R3)+
EndDo:
    rts

    ENDSEC
    END
