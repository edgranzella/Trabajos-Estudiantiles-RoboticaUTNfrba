;********************************************************************
;
; (c) Freescale Semiconductor
; 2004 All Rights Reserved
;
;********************************************************************
    SECTION rtlib

    include "portasm.h"

    GLOBAL  Fvfr16Length
    XREF    Fmfr32Sqrt

; Frac16  vfr16Length (Frac16 *pX, UInt16 n)
;
;    Register usage upon entry:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       Y0 - n  (length of all vectors)
;
;    Register usage during execution:
;       R2 - pX
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       A  - temp
;       Y0 - Output value
;
      ORG  P:
Fvfr16Length:

      tst.w     Y0
      ble       EndLength
      move.w    Y0,X0
      clr       A
      move.w    X:(R2)+,Y0
      rep       X0
      mac       Y0,Y0,A      X:(R2)+,Y0
EndLength:
      jsr       Fmfr32Sqrt
      ; result is in Y0
      rts

      ENDSEC
      END
