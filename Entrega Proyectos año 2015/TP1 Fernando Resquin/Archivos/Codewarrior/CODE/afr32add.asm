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

    GLOBAL  Fafr32Add

; void afr32Add (Frac32 *pX, Frac32 *pY, Frac32 *pZ, UInt16 n)

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
Fafr32Add:

    do        Y0,EndDo
    move.l    X:(R2)+,A
    move.l    X:(R3)+,B
    add       A,B
    move.l    B10,X:(R4)+
EndDo:
    rts

    ENDSEC
    END
