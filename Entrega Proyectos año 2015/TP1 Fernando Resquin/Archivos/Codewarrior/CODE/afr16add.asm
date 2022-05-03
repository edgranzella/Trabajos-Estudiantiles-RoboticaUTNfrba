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

    GLOBAL  Fafr16Add

; asm void  afr16Add    (Frac16 *pX, Frac16 *pY, Frac16 *pZ, UInt16 n)
;
;    Register usage:
;       R4 - pZ (output vector)
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       Y0 - n  (length of all vectors)
;       X0 - temporary reg to hold y[i]
;       A  - hold y[i], then result of addition
;
;
  Fafr16Add:

    tst.w     Y0
    ble       endfunc
    move.w    X:(R2)+,A
    move.w    X:(R3)+,X0
;
; vector add loop
;
    dec.w     Y0
    do        Y0,endloop
    add       X0,A  X:(R3)+,X0
    move.w    A,X:(R4)+
    move.w    X:(R2)+,A
  endloop:
;
; add last elements of vector
;
     add       X0,A
     move.w    A,X:(R4)
   endfunc:
    rts

    ORG  X:

    ENDSEC
    END
