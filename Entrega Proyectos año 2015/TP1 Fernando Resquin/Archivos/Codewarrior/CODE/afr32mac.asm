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

    GLOBAL  Fafr32Mac

; void afr32Mac (Frac32 *pW, Frac16 *pX, Frac16 *pY, Frac32 *pZ, UInt16 n);
;
;    Register usage:
;       R2 - pW (input vector)
;       R3 - pX (input vector)
;    R0,R4 - pY (input vector)
;       R1 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       Y1 - temp
;       N  - 2
;       A  - temp
;
; ensure PORT_MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:
Fafr32Mac:

    tfra      R4,R0
    move.w    X:(R0)+,Y1
    do        Y0,EndDo
    move.l    X:(R2)+,A
    move.w    X:(R3)+,X0
    mac       Y1,X0,A     X:(R0)+,Y1
    move.l    A10,X:(R1)+
EndDo:
    rts

    ENDSEC
    END
