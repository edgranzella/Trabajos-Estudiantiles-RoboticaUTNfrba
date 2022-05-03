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

    GLOBAL  Fafr16Mult_r

; void afr16Mult_r (Frac16 *pX, Frac16 *pY, Frac16 *pZ, UInt16 n);

;    Register usage upon entry:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       R4 - pZ (output vector)
;       Y0 - n  (length of all vectors)
;
;    Register usage during execution:
;       R2 - pX
;       R3 - pY
;       R4 - pZ
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       Y1 - temp
;       A  - temp
;
      ORG  P:
Fafr16Mult_r:

      move.w    X:(R2)+,X0
      do        Y0,EndDo
      move.w    X:(R3)+,Y1
      mpyr      Y1,X0,A     X:(R2)+,X0
      move.w    A,X:(R4)+
EndDo:
EndMultr:
      rts

      ENDSEC
      END
