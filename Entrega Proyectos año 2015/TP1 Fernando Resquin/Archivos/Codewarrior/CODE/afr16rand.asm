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

    GLOBAL  Fafr16Rand
    XREF    Fmfr16Rand

; void afr16Rand (Frac16 *pZ, UInt16 n);

;    Register usage:
;       R2 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;
    ORG  P:
Fafr16Rand:

    tst.w     Y0
    ble       EndRand
    adda      #4,SP
    move.l    R2,X:(SP-2)
    move.w    Y0,X:(SP-1)
RandLoop:
    jsr       Fmfr16Rand
    move.l    X:(SP-2),R2
    move.w    Y0,X:(R2)+
    move.l    R2,X:(SP-2)
    dec.w     X:(SP-1)
    move.w    X:(SP-1),Y0
    bgt       RandLoop
    suba      #4,SP
EndRand:
    rts

    ENDSEC
    END
