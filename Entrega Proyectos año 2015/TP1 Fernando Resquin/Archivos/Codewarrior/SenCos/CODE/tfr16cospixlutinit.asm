;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Ftfr16CosPIxLUTInit

;
;void tfr16CosPIxLUTInit(tfr16_tCosPIxLUT * pSWG,
;              Frac16     * pSineTable,
;              UInt16       SineTableLength)
;{
;  sCosPIxLUT * pState = (sCosPIxLUT *) pSWG;

    ;  Register usage upon Entry:
    ;      R2  - pSWG
    ;      R3  - pSineTable
    ;      Y0  - SineTableLength

    ;  Register usage during execution
        ;      B   - temp
        ;      A   - temp

Offset_pSineTable      equ 0
Offset_SineTableLength equ Offset_pSineTable+PTR_SIZE
Offset_Shift           equ Offset_SineTableLength+1

    ORG  P:

Ftfr16CosPIxLUTInit:
;
; 1254:   pState -> pSineTable      = pSineTable;
;

        StoreRx     r3,x:(r2+Offset_pSineTable)

;
; 1255:   pState -> SineTableLength      = SineTableLength;
; 1256:
;
        move.w      Y0,X:(R2+Offset_SineTableLength)
;
; 1257:   pState -> Shift = div_s((Frac16)SineTableLength,(Frac16)SWG_180_DEGREES);
;
    move.w      #16384,B
    tst         A
    move.w      Y0,A
    rep         #16
    div         B1,A
    asl16       A,Y0
;
; 1259:   pState -> Shift = norm_s(pState -> Shift);
;
    move.w      Y0,A
    move.w      #-31,B
    tst.w       A1
    beq         Zero
        clr         B

Zero:
    clb         A,A
    add         B,A
;
; 1260:   pState -> Shift = (pState -> Shift) + 1;
;
    inc.w       A
    move.w      A1,X:(R2+Offset_Shift)
;
; 1261: }
    rts


      ENDSEC
    END

