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

    GLOBAL  Fafr16Equal

; bool afr16Equal (Frac16 *pX, Frac16 *pY, UInt16 n)
;
;    Register usage:
;       R2 - pX (input vector)
;       R3 - pY (input vector)
;       Y0 - n  (length of all vectors)
;       X0 - temp
;       Y1 - temp
;       A1 - temp
;
      ORG  P:
Fafr16Equal:

      move.w    Y0,A1
      move.w    #1,Y0
      move.w    X:(R2)+,X0
      move.w    X:(R3)+,Y1
      cmp.w     Y1,X0
      do        A1,EndDo
      beq       Equal
      move.w    #0,Y0
      enddo
Equal:
      move.w    X:(R2)+,X0
      move.w    X:(R3)+,Y1
      cmp       Y1,X0
      nop
EndDo:
      rts

      ENDSEC
      END
