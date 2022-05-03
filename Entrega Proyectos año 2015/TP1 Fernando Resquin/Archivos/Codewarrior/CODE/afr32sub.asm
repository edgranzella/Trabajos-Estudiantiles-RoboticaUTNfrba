;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fafr32Sub

; void afr32Sub (Frac32 *pX, Frac32 *pY, Frac32 *pZ, UInt16 n)

;    Register usage:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       R4 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       N  - 2
;       A  - temp
;       B  - temp
;
;
; ensure PORT_MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:
Fafr32Sub:

    do        Y0,EndDo
    move.l    X:(R2)+,A
    move.l    X:(R3)+,B
    sub       B,A
    move.l    A10,X:(R4)+
EndDo:
    rts

    ENDSEC
    END
