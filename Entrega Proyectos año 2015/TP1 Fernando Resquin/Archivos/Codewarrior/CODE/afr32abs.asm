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

    GLOBAL  Fafr32Abs

; void  afr32Abs  (Frac32 *pX, Frac32 *pZ, UInt16 n)
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       N  - 2
;       A  - temp
;
;
; ensure MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:
Fafr32Abs:

    do        Y0,EndDo
    move.l    X:(R2)+,A
    abs       A
    move.l    A10,X:(R3)+
EndDo:
    rts

    ENDSEC
    END
