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

    GLOBAL  Fafr16Div

; void    afr16Div    (Frac16 *pX, Frac16 *pY, Frac16 *pZ, UInt16 n)
;
;    Register usage:
;       R4 - pZ (output vector)
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       X0 - temp
;       Y0 - n  (length of all vectors)
;       Y1 - temp
;       A  - temp
;
        ORG  P:
Fafr16Div:

        move.w    X:(R2)+,A
        move.w    X:(R3)+,X0
        do        Y0,EndDo
        move.w    A,Y1
        abs       A
        eor.w     X0,Y1
        bfclr     #1,SR
        rep       #16
        div       X0,A
        bftsth    #8,SR
        bcc       Positive
        neg       A
Positive:
        move.w    A0,X:(R4)+
        move.w    X:(R2)+,A
        move.w    X:(R3)+,X0
        nop
EndDo:
        rts

        ENDSEC
        END
