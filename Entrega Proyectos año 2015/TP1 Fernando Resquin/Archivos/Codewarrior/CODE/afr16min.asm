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

    GLOBAL  Fafr16Min

; Frac16 afr16Min (Frac16 *pX, UInt16 n, UInt16 *pMaxIndex);
;
;    Register usage upon entry:
;       R2   - pX (input vector)
;       R3   - pMinIndex (pointer to output value; can be NULL)
;       Y0   - n  (length of all vectors)
;
;    Register usage during execution:
;       R0   - pX (increments in loop)
;       R1   - pX of minimum value
;       R2   - pX (original value)
;       R3   - pMinIndex (pointer to output value; can be NULL)
;       Y0   - n  (length of all vectors)
;       A    - Min value
;       B    - temp
;       Y1,X0- Minindex calculation
;
        ORG  P:
Fafr16Min:

    tst.w     Y0
    beq       EndMin

        move.w    X:(R2)+,A
        tfra      R2,R0
        tfra      R2,R1
    dec.w     Y0
    beq       EndDo
    nop
    nop
    do        Y0,EndDo
    move.w    X:(R0)+,B
    cmp       A,B
    tlt       B,A    R0,R1
    nop
EndDo:
    move.w    A,Y0
    tsta.l    R3
    beq       EndMin
    suba      R2,R1
    move.w    R1,X:(R3)
EndMin:
    rts

    ENDSEC
    END
