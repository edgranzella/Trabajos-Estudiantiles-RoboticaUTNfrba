;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fafr32Sqrt
    XREF    Fmfr32Sqrt

; void afr32Sqrt (Frac32 *pX, Frac16 *pZ, UInt16 n);

;    Register usage:
;       R2 - pX (input vector)
;       R3 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;
    ORG  P:
Fafr32Sqrt:

    tst.w     Y0
    ble       EndSqrt
    adda      #6,SP
    move.l    R3,X:(SP-2)
    move.w    Y0,X:(SP-1)
SqrtLoop:
    move.l    X:(R2)+,A
    move.l    R2,X:(SP-4)
    jsr       Fmfr32Sqrt
    move.l    X:(SP-2),R3
    move.l    X:(SP-4),R2
    move.w    Y0,X:(R3)+
    move.l    R3,X:(SP-2)
    dec.w     X:(SP-1)
    bgt       SqrtLoop
    suba      #6,SP       ; pop Y0, R2, R3
EndSqrt:
    rts

    ENDSEC
    END
