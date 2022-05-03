;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fafr32Mult

; void afr32Mult (Frac16 *pX, Frac16 *pY, Frac32 *pZ, UInt16 n)

;    Register usage:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       R4 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       N  - 2
;       A  - temp
;       X0 - temp
;       Y1 - temp
;
;
; ensure PORT_MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:

Fafr32Mult:

    do        Y0,EndDo
    move.w    X:(R2)+,Y1
    move.w    X:(R3)+,X0
    mpy       Y1,X0,A
    move.l    A10,X:(R4)+
EndDo:
    rts

    ENDSEC
    END
