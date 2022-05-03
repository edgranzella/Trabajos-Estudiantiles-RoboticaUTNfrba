;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fafr32Negate

; void  afr32Negate  (Frac32 *pX, Frac32 *pZ, UInt16 n)
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       N  - 2
;       A  - temp
;
;
; ensure PORT_MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:
Fafr32Negate:

    do        Y0,EndDo
    move.l    X:(R2)+,A
    neg       A
    move.l    A10,X:(R3)+
EndDo:
    rts

    ENDSEC
    END
