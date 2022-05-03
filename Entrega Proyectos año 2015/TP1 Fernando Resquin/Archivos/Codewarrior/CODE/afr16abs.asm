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

    GLOBAL  Fafr16Abs

; void  afr16Abs  (Frac16 *pX, Frac16 *pZ, UInt16 n)
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       A  - temp
;
;
; ensure MAX_VECTOR_LEN >= vector length >= 0
;

    GLOBAL Fafr16Abs
    ORG  P:
Fafr16Abs:

    do        Y0,EndDo
    move.w    X:(R2)+,A
    abs       A
    move.w    A,X:(R3)+
EndDo:
    rts

    ENDSEC
    END
