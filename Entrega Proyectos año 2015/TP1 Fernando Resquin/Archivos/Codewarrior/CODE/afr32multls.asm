;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fafr32Mult_ls

; void afr32Mult_ls (Frac32 *pX, Frac16 *pY, Frac32 *pZ, UInt16 n)

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
    ORG  P:
Fafr32Mult_ls:

    move.w    X:(R3)+,X0
    do        Y0,EndDo
    move.l    X:(R2)+,Y
    mpysu     X0,Y0,A
    move.w    A1,A0
    move.w    A2,A1
    mac       Y1,X0,A      X:(R3)+,X0
    move.l    A10,X:(R4)+
EndDo:
    rts

    ENDSEC
    END
