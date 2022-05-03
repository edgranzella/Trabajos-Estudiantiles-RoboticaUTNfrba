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

    GLOBAL  Fafr32Equal

; bool  afr32Equal  (Frac32 *pX, Frac32 *pY, UInt16 n)
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       Y0 - n  (length of all vectors)
;       N  - 2
;       A  - temp
;       B  - temp
;
;
; ensure PORT_MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:
Fafr32Equal:

    move.w    Y0,X0
    move.w    #1,Y0
    move.l    X:(R2)+,A
    move.l    X:(R3)+,B
    do        X0,EndDo
    cmp       A,B
    beq       Equal
NotEqual:
    move.w    #0,Y0
    enddo
Equal:
    move.l    X:(R2)+,A
    move.l    X:(R3)+,B
    nop
    nop
EndDo:
    rts

    ENDSEC
    END
