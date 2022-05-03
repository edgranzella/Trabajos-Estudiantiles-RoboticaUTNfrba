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

    GLOBAL  Fafr32Div

; void afr32Div (Frac32 *pX, Frac16 *pY, Frac16 *pZ, UInt16 n);
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       R4 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       Y1 - temp
;       N  - 2
;       A  - temp
;
; ensure PORT_MAX_VECTOR_LEN >= vector length >= 0
;

    ORG  P:
Fafr32Div:

    move.l    X:(R2)+,A
    do        Y0,EndDo
    move.w    X:(R3)+,X0
    move.w    A,Y1
    abs       A
    eor.w     X0,Y1
    bfclr     #1,SR
    rep       #16
    div       X0,A
    bftsth    #8,SR
    bcc       DivDone
    neg       A
DivDone:
    move.w    A0,X:(R4)+
    move.l    X:(R2)+,A
    nop
    nop
EndDo:
    rts

    ENDSEC
    END
