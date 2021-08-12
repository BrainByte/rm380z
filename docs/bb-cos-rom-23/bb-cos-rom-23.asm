
; RML pseudo-instructions

EMT:    macro trap
        RST 30H
        DEFB trap
        endm

; '-1' instead of '-2' because we're generating displacement from second byte already
CALR:   macro label
        RST 28H
        DEFB label-$-1
        endm

;---------------------------------------------------------
;************ R.M.L. CASSETTE OPERATING SYSTEM ***********
;************  MONITOR VERSION 2.3 R  REV. 0   ***********
;---------------------------------------------------------
;---------------------------------------------------------

;       "BY VIEWING NATURE, NATURE'S HANDMAID, ART,
;        MAKES MIGHTY THINGS FROM SMALL BEGINNINGS GROW."
;                                       DRYDEN

        ORG     0
NXTROM: EQU     1000H
RAM:    EQU     4000H
BASIC:  EQU     2000H

MONST:  JP      BEGIN           ;RST 00H (& POWER ON RESET)
        JP      CONTC           ;ADDR FOR REENTER CMD
MSGM:   DEFM    'TO'
        JP      RST8            ;RST 08H
MSGB:   DEFM    'BREAK'
        JP      RST10           ;RST 10H
MSGE:   DEFM    '?ERR?'
        JP      RST18           ;RST 18H
MSGF:   DEFM    'FIRST'
        JP      RST20           ;RST 20H
MSGS:   DEFM    'START'
        JP RCALL                ;RST 28H (RELATIVE CALL)
MSGL:   DEFM    'LAST'
        DEFB    -1
        JR      TRAP            ;RST 30H (TRAP CALL)

;32H - THE NEXT TWO BYTES OF CODE ENABLE USER PROGRAMS TO
;FIND OUT WHERE THEY HAVE BEEN LOADED, MAKING IT POSSIBLE TO
;WRITE POSITION INDEPENDENT CODE (PIC).  THEY SHOULD BE
;CALLED ('CALL 32H'); ON RETURN OLD HL IS ON THE STACK
;AND HL CONTAINS THE ADDR OF THE CURRENT INSTRUCTION
;I.E. THE ONE AFTER THE CALL.

        EX      (SP),HL
        JP      (HL)

MSGP:   DEFM    'WITH'

;BREAKPOINT - COME HERE AFTER RST 38H (0FFH)
;(INTERRUPTS IN MODE 1 ALSO COME HERE)
;OLD PC ON THE STACK IS DECREMENTED, TO POINT
;TO THE LOCATION OF THE BREAKPOINT AND THIS ADDRESS
;IS ALSO PUT IN (MPTR)

BREAK:  EX      (SP),HL         ;HL <- ADDR OF NEXT INSTR
        DEC     HL              ;POINT TO BREAK POINT
        LD      (MPTR),HL
        EX      (SP),HL
        PUSH    HL
        PUSH    AF
        LD      HL,MSGB         ;ISSUE BREAK MESSAGE
        CALL    MOUT
        JP      FPM             ;GO TO FP WITH HL/AF ON STACK

;TRAP - A TRAP INSTRUCTION ('EMT'), SIMULATED BY RST 30H,
;IS A TWO BYTE INSTRUCTION EQUIVALENT TO 'CALL'.  THE SECOND
;BYTE CONTAINS THE TRAP CODE OF THE DESIRED TARGET ROUTINE,
;AS FOLLOWS:
;
;         CODE          TARGET
;
;         -VE           ?ERR?
;          0            MONITOR RESTART
;         1-10          TRANSFER VECTORS ('VTV' - 'IN3')
;        11-24          MONITOR ROUTINES IN 'TRTBL'
;        25-127         JUMP THROUGH 'TRAPX'

TRAP:   PUSH    HL              ;SAVE HL AND AF
        PUSH    AF
        CALL    LDRET           ;HL <- RET ADDR, INC RET ADDR
        LD      A,(HL)          ;A <- TRAP CODE
        OR      A
        JR      Z,MONST+3       ;TRAP 0 - RESTART
        JP      M,ERROR         ;-VE TRAP CODE MEANS ERROR

;IF CODE IS > 24(10), JUMP THROUGH TRAP EXTENSION VECTOR 'TRAPX'
;WITH THE CODE IN REG A AND AF, HL AND THE RET ADDR ON THE STACK.

        CP      25
        JP      NC,TRAPX
        SUB     11
        JR      C,TR2

;CODES 11 TO 24 (DECIMAL, INCLUSIVE) CALL THE MONITOR
;ROUTINES WHOSE ADDRESSES ARE IN THE JUMP TABLE 'TRTBL'

        ADD     A,A             ;A <- A * 2
        LD      HL,TRTBL        ;HL <- ADDR OF DISPATCH TABLE
        ADD     A,L             ;HL <- ADDR OF ADDR
        LD      L,A
        JR      TR1             ;AVOID NMI

        JR      NMI             ;LOCATION 66H

TR1:    LD      A,(HL)          ;HL <- DISPATCH ADDR
        INC     HL
        LD      H,(HL)
        LD      L,A
        JR      TR3

;.CHAN (EMT CHAN) ALLOWS CHANNEL TO BE PASSED IN REGISTER C

.CHAN:  PUSH    HL
        PUSH    AF
        LD      A,C             ;A <- CHANNEL
        CP      1               ;CHECK THAT IT IS IN THE
        JR      NC,.CHN2        ; RANGE 1 TO 10
.CHN1:  RST     38H             ;ELSE BREAK
.CHN2:  SUB     11
        JR      NC,.CHN1

;CODES 1 TO 10 (DECIMAL, INCLUSIVE) REACH THE TRANSFER VECTORS

TR2:    LD      L,A             ;A <- A * 3
        ADD     A,A
        ADD     A,L
        LD      HL,IN3+3        ;CALCULATE VECTOR ADDR
        ADD     A,L
        LD      L,A
TR3:    POP     AF              ;RESTORE AF AND HL
        EX      (SP),HL
        RET                     ;GO TO ADDR

;RCALL - CALL RELATIVE ('CALR') IS A TWO BYTE PSEUDO-
;INSTRUCTION SIMULATED BY RST 28H.  THE SECOND BYTE
;CONTAINS THE OFFSET TO THE TARGET ADDR WITH THE SAME
;CONVENTION AS THE RELATIVE JUMPS (I.E. TARGET-$-1).
;THIS CODE CONVERTS THE OFFSET TO AN ABSOLUTE ADDR, THEN
;JUMPS THERE, WITH THE UPDATED RETURN ADDR ON THE STACK.

RCALL:  PUSH    HL              ;SAVE HL AND AF
        PUSH    AF
        CALL    LDRET           ;HL <- ADDR OF OFFSET
        PUSH    DE              ;SAVE DE
        CALL    RTOA            ;HL <- HL + (HL) + 1
        POP     DE              ;RESTORE DE, AF AND HL
        POP     AF
        EX      (SP),HL
        RET                     ;GO TO CALL

;LDRET - LOAD HL WITH PREVIOUS RETURN ADDR, INCREMENT
;RETURN ADDR.  ASSUMES HL AND AF ARE ALREADY ON THE STACK.
;DESTROYS CY FLAG

LDRET:  PUSH    DE
        LD      HL,8            ;HL <- POINTER TO STACK
        ADD     HL,SP
        LD      E,(HL)          ;DE <- RETURN ADDR
        INC     HL
        LD      D,(HL)
        INC     DE              ;INC RETURN AND STORE
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        DEC     DE              ;CORRECT ADDR
        EX      DE,HL           ;HL <- ADDR
        POP     DE
        RET

;NMI - COME HERE AFTER NMI CAUSED BY RESET BUTTON OR
;SINGLE STEP LOGIC.
;IF RESET, WAIT FOR BUTTON RELEASE THEN RESTART MONITOR
;ELSE DISABLE SINGLE STEP BIT IN 'MASK' AND CHECK NMI FLAG:
;IF (SSFLG) = 'R', JUMP TO USER PROG THROUGH NMIX,
;ELSE IF (SSFLG) = 'S' (MONITOR SINGLE STEP) GO TO FP
;ELSE TREAT AS RESET BUTTON GLITCH AND RESTART MONITOR

NMI:    PUSH    HL
        PUSH    AF
        LD      HL,PORT0        ;DISABLE SINGLE STEP IF SET
        LD      (HL),MKINIT
        INC     HL              ;POINT TO PORT 1
        INC     HL
        BIT     RESET,(HL)      ;WAS IT RESET BUTTON?
        JR      NZ,NMI2         ;IF NOT

NMI1:   BIT     RESET,(HL)      ;ELSE WAIT FOR BUTTON RELEASE
        JR      Z,NMI1
        XOR     A               ;MAKE SURE SS FLG IS CLEAR
        LD      (SSFLG),A
NMI1A:  RST     0               ;GO TO POWER ON ENTRY

NMI2:   LD      HL,MASK         ;NOT RESET BUTTON,
        SET     SINGLE,(HL)     ;(CLEAR SINGLE STEP ANYWAY)
        INC     HL              ;POINT TO SS FLG
        LD      A,(HL)          ;TEST FLAG
        LD      (HL),0          ;THEN CLEAR IT
        SUB     'R'
        JP      Z,NMIX          ;IF FLG = 'R' -> NMIX
        DEC     A               ;ELSE IF FLG NOT = 'S'
        JR      NZ,NMI1A        ; TREAT AS GLITCH ON RESET
        POP     AF              ;ELSE MUST BE MONITOR SS
        POP     HL
        JR      FPM1


;GETC - GET A CHARACTER FROM KEYBOARD
;WATCH FOR CTRL Z

GETC:   EMT     KBDIN
        JR      Z,GETC          ;NO CHAR AVAILABLE
        CP      CTRLZ
        RET     NZ              ;DROP THRO' ON CTRL Z

;HERE BEGINS THE FRONT PANEL EMULATOR
;
;       "AND NOW I SEE WITH EYE SERENE
;        THE VERY PULSE OF THE MACHINE."
;                       WILLIAM WORDSWORTH
;
;SAVE THE CURRENT REGS ON THE MONITOR STACK
;IN THE ORDER:  PC/SP/IY/IX/HL/DE/BC/AF

        PUSH    HL              ;SAVE AS 'BREAK' DOES
        PUSH    AF
FPM:    PUSH    DE              ;ENTRY FROM 'BREAK'
        PUSH    BC
        EMT     GRAFIX          ;CLEAR SCREEN
        POP     BC
        POP     DE
        POP     AF
        POP     HL

FPM1:   PUSH    HL              ;MAKE ROOM FOR SP
        PUSH    IY              ;SAVE ALL
        PUSH    IX
FPM2:   PUSH    HL              ;ENTRY FROM 'SWITCH'
        PUSH    DE
        PUSH    BC
        PUSH    AF
        LD      HL,16           ;CALCULATE OLD SP
        ADD     HL,SP
        LD      D,H             ;DE <- OLD SP
        LD      E,L
        DEC     HL
        DEC     HL
        DEC     HL
        LD      (HL),D          ;SAVE OLD SP AT (HL)
        DEC     HL
        LD      (HL),E

;RDIS - DISPLAY THE REGISTERS
;THIS IS THE RE-ENTRY POINT IN FP MODE: ITS ADDR IS PUSHED
;AT 'CMD:' AND MOST FP ROUTINES RETURN HERE WITH A 'RET'.
;IX STARTS BY POINTING TO THE TOP OF THE SAVED REGS (OLD PC)
;AND ENDS 2 BYTES BELOW SAVED AF. (RPTR) IS THE OFFSET
;(RANGE 2-16) FROM THE LATTER POSITION OF IX TO THE CURRENT
;REG. IY IS A POINTER TO THE REG NAME STRING.

RDIS:   LD      IY,RNSTR        ;IY <- PTR TO REG NAMES
        LD      IX,14           ;IX <- PTR TO TOP OF SAVED REGS
        ADD     IX,SP
        LD      A,'!'           ;INDICATE FP MODE
        CALL    AOUT            ;AFTER CR
        EMT     OPNWT           ;###
        LD      HL,0A16H
        LD      (HL),UPARR
        LD      HL,0B8AH
        LD      (HL),RARR
        LD      HL,0B92H
        LD      (HL),LARR
        LD      HL,840H         ;HL <- START OF REG DISPLAY
        LD      B,8
RD1:    LD      A,(RPTR)        ;TEST WHICH REG IS POINTED TO
        SRA     A               ;(RPTR) = 2*B
        CP      B
        LD      (HL),BLANK      ;ASSUME IT'S NOT THIS ONE
        JR      NZ,RD2          ;IF IT'S NOT
        LD      (HL),RARR       ;ELSE DISPLAY ARROW
RD2:    INC     HL              ;LEAVE A SPACE
        SCF
        CALL    RNAM            ;OUTPUT REG NAME
        CALL    RNAM
        LD      A,4             ;MIGHT IT BE THE ALT SET?
        CP      B
        CALL    Z,CLSOPN        ;###PAUSE IF B = 4
        JR      C,RD3           ;IF PC/SP/IY/IX
        LD      A,(RSET)        ;(RSET) = 0 FOR STANDARD SET
        OR      A
        LD      (HL),BLANK      ;ASSUME NOT
        JR      Z,RD3           ;IF STANDARD SET
        LD      (HL),'''        ;ELSE APPEND A '
RD3:    INC     HL              ;LEAVE A GAP
        INC     HL
        LD      D,(IX+1)        ;DE <- REG CONTENTS
        LD      E,(IX+0)
        DEC     IX
        DEC     IX
        CALL    .DEOUT          ;DISPLAY CONTENTS
        DJNZ    RD5             ;FOR ALL BUT AF, ALSO DISPLAY (REG)

        INC     HL              ;AF, DISPLAY FLAGS
        LD      A,E             ;A <- FLAG REG
        LD      B,8
RD4:    RLA                     ;CY <- NEXT FLAG
        CALL    RNAM            ;DISPLAY FLAG IF CY SET
        DJNZ    RD4
        JR      MDIS

RD5:    PUSH    HL              ;SAVE VT ADDR
        LD      HL,-4           ;DISPLAY (REG-4) TO (REG+3)
        ADD     HL,DE
        EX      DE,HL           ;(DE) WILL BE DISPLAYED
        POP     HL
        LD      C,B             ;SAVE B
        LD      B,8
RD6:    INC     HL
        LD      A,(DE)          ;OUTPUT (REG)
        INC     DE
        CALL    .BYTEO
        DJNZ    RD6
        LD      B,C             ;RESTORE B
        LD      DE,40H-33       ;DE <- DISTANCE TO NEXT LINE ON VT
        ADD     HL,DE           ;UPDATE VT ADDR
        JR      RD1

RNAM:   LD      (HL),BLANK
        JR      NC,RN1          ;SKIP IF NO CARRY
        LD      C,(IY+0)        ;ELSE OUTPUT NEXT CHAR FROM RNSTR
        LD      (HL),C
RN1:    INC     HL
        INC     IY
        RET

RNSTR:  DEFM    'PCSPIYIXHLDEBCAFSZ H VNC'

;MDIS - DISPLAY MEMORY AROUND MPTR

MDIS:   CALL    CLSOPN          ;###PAUSE TO AVOID BLINK
        LD      HL,(MPTR)       ;DE <- (MPTR)-12
        LD      DE,-12
        ADD     HL,DE
        EX      DE,HL
        LD      HL,0A80H        ;HL <- START OF DISPLAY
        LD      B,4             ;4 COLUMNS
MD1:    LD      C,B             ;COUNTED BY C
        LD      A,C             ;###IF C = 2
        CP      2               ;###
        CALL    Z,CLSOPN        ;###PAUSE TO AVOID BLINK
        LD      B,8             ;8 ROWS
MD2:    CALL    .DEOUT          ;OUTPUT ADDRESS
        INC     HL              ;LEAVE A BLANK
        LD      A,(DE)          ;GET CONTENT
        CALL    .BYTEO          ;OUTPUT IT
        INC     DE              ;POINT TO NEXT
        PUSH    DE
        LD      DE,57           ;BUMP VT POINTER
        ADD     HL,DE
        POP     DE
        DJNZ    MD2             ;REPEAT FOR 8 ROWS
        PUSH    DE
        LD      DE,-200H+11     ;START OF NEXT COLUMN
        ADD     HL,DE
        POP     DE
        LD      B,C
        DJNZ    MD1             ;REPEAT FOR 4 COLUMNS
        EMT     CLOSE           ;###

;CMD - GET MODIFIED VALUE FOR MPTR OR REG, PARSE COMMAND

CMD:    LD      HL,RDIS         ;RETURN ADDRESS
        PUSH    HL
        EMT     GETHEX
        LD      A,'.'           ;IF TERMINATOR WAS '.'
        SUB     B               ;THIS IS A REG OPERATION
        JR      Z,SETR
        LD      A,C             ;GET NUMBER OF HEX CHARS
        OR      A
        JR      Z,CMD1          ;IF THERE WERE NONE
        LD      A,L             ;A <- BYTE
        LD      HL,(MPTR)
        EMT     OPNWT           ;###IN CASE (MPTR) IS VT
        LD      (HL),A          ;STORE IT
        EMT     CLOSE           ;###
CMD1:   LD      A,B             ;A <- TERMINATOR
        LD      HL,TBL1
        LD      D,0
        LD      B,D
        LD      C,8             ;BC <- TBL LENGTH (1ST)
        CALR    LOOKUP
        JR      NZ,CMD2         ;IF NO MATCH
        LD      HL,(MPTR)       ;UPDATE MPTR
        LD      BC,-16          ;VALUES FROM TBL ARE OFFSET
        ADD     HL,BC           ; TO SAVE INSTRUCTIONS
        ADD     HL,DE           ;ADD UPDATE
SVM:    LD      (MPTR),HL
        RET

CMD2:   LD      C,TBL2LN        ;BC <- TBL LENGTH (2ND)
        CALR    LOOKUP
        RET     PO              ;NOTHING FOUND
        LD      HL,SETM         ;CALCULATE REL ADDR
        ADD     HL,DE
        JP      (HL)

;SETR - MODIFY REG OR MOVE REG POINTER

SETR:   LD      D,A             ;CLEAR D FOR LATER (A = 0)
        CP      C               ;TEST IF ANY HEX
        LD      A,(RPTR)        ;A <- OFFSET FROM IX TO REG
        JR      Z,SR1           ;IF NO HEX
        LD      E,A             ;ELSE LOAD REG
        ADD     IX,DE           ;POINT TO REG
        LD      (IX+1),H        ;REG <- HL
        LD      (IX+0),L
        RET                     ;OR 'NOP'
SR1:    DEC     A               ;DECR OFFSET, TO NEXT REG
        DEC     A
        JR      NZ,SR2          ;UNLESS OFF THE BOTTOM
        LD      A,16            ;POINT TO PC
SR2:    CP      14              ;SKIP SP
        JR      Z,SR1
        LD      (RPTR),A        ;SAVE OFFSET
        RET

;LOOKUP - SEARCH TABLE POINTED TO BY HL FOR BC BYTES,
;RETURNING ENTRY IN E
;Z SET FOR A MATCH, P ODD IF OFF THE END

LOOKUP: CPI
        LD      E,(HL)
        RET     Z               ;IF MATCH
        CPI
        RET     PO              ;IF OFF THE END
        JR      LOOKUP

;TBL - FRONT PANEL SWITCHES

TBL1:   DEFB    CR              ;FORWARD ONE
        DEFB    17
        DEFM    '-'             ;BACK ONE
        DEFB    15
        DEFB    LF              ;FORWARD EIGHT
        DEFB    24
        DEFM    '/'             ;BACK EIGHT
        DEFB    8
TBL2:   DEFM    'G'             ;GET AND FIND PATTERN
        DEFB    GETPAT-SETM
        DEFM    'H'             ;HEX CALCULATOR
        DEFB    HEXCAL-SETM
        DEFM    'I'             ;MPTR <- CURRENT WORD
        DEFB    IND-SETM
        DEFM    'J'             ;CLEAR STACK, JUMP
        DEFB    FPJMP-SETM
        DEFM    'K'             ;CONTINUE EXECUTION
        DEFB    CONTIN-SETM
        DEFM    'M'             ;SET MPTR
        DEFB    SETM-SETM
        DEFM    'N'             ;FIND NEXT PATTERN
        DEFB    GPNXT-SETM
        DEFM    'P'             ;FILL AND TEST MEMORY
        DEFB    PUT-SETM
        DEFM    'R'             ;MPTR <- MPTR + CURRENT OFFSET
        DEFB    REL-SETM
        DEFM    'S'             ;MOVE MEMORY
        DEFB    MOVER-SETM
        DEFM    'W'             ;SWITCH REGISTER SET
        DEFB    SWITCH-SETM
        DEFM    'Z'             ;SINGLE STEP
        DEFB    STEP-SETM
TBL2LN: EQU     $-TBL2

;SETM - PROMPT AND GET NEW VALUE FOR MPTR

SETM:   CALL    PGTHEX
        JR      SVM

;IND - SET MPTR TO CURRENT WORD ADDRESS

IND:    LD      HL,(MPTR)
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        JR      SVM

;REL - SET MPTR TO CURRENT RELATIVE ADDRESS

REL:    LD      HL,(MPTR)
        CALR    RTOA            ;HL <- HL + (HL) + 1
        JR      SVM

;RTOA - LOAD HL WITH HL + (HL) + 1 (REL TO ABS)
;DESTROYS AF AND DE

RTOA:   LD      E,(HL)          ;E <- OFFSET
        LD      D,0             ;EXTEND SIGN TO D
        BIT     7,E
        JR      Z,RA1
        DEC     D
RA1:    ADD     HL,DE
        INC     HL
        RET

;SWITCH - SWITCH REGISTER SET BEING DISPLAYED

SWITCH: LD      A,(RSET)        ;TOGGLE THE SWITCH
        CPL
        LD      (RSET),A
        POP     AF              ;POP RET ADDR
        POP     AF              ;RESTORE CURRENT SET
        POP     BC
        POP     DE
        POP     HL
        EX      AF,AF'          ;EXCHANGE REGISTERS
        EXX
        JP      FPM2            ;RE-ENTER TO DISPLAY OTHER SET

;STEP - ENABLE SINGLE INSTRUCTION MODE
;       MODE IS CLEARED ON NMI

STEP:   LD      HL,MASK         ;SET SS BIT IN MASK
        RES     SINGLE,(HL)
        INC     HL              ;POINT TO SS FLG
        LD      (HL),'S'        ;SET MONITOR SS FLAG

;CONTIN - CONTINUE EXECUTION AT SAVED PC
;         CALL UPDATE TO ENABLE
;         SINGLE STEP LOGIC IF SET IN 'MASK'

CONTIN: POP     AF              ;POP FP RET ADDR
        POP     AF              ;POP CURRENT REGS
        POP     BC
        POP     DE
        POP     HL
        POP     IX
        EMT     UPDATE          ;SS CN IF SET
        POP     IY
        INC     SP
        INC     SP
        RET

;PUT - FILLS AND TESTS MEMORY BETWEEN LIMITS

PUT:    CALL    FSTLST          ;DE <- FIRST, HL <- DIFF
        INC     HL              ;LENGTH INCLUSIVE
        PUSH    HL              ;SAVE COUNT
        LD      HL,MSGP
        CALL    MGTHEX          ;GET FILL BYTE
        LD      A,L             ;A = FILLER
        EX      DE,HL           ;HL = START
        POP     BC              ;BC = NO. OF ADDRS TO FILL

PT1:    LD      (HL),A          ;FILL MEMORY
        CPI                     ;THEN CHECK IT
        JR      Z,PT2           ;IF (HL) MATCHES A
        PUSH    AF              ;ELSE ERR, SAVE PARITY FLAG
        PUSH    HL              ;SAVE NEXT ADDR TO TEST
        DEC     HL              ;(HL) IS NOW INCORRECT BYTE
        LD      (MPTR),HL       ;SO IT'S SEEN ON FP
        CALL    ERROUT          ;ERROR MSG
        POP     HL              ;RESTORE NEXT ADDR
        POP     AF              ;RESTORE PARITY FLAG
        CALL    FPM1            ;FP ON, CONTINUE TEST AFTER 'K'
PT2:    RET     PO              ;UNTIL BC = 0
        JR      PT1
;HEXCAL - HEXADECIMAL CALCULATOR

HEXCAL: CALL    CGTHEX          ;GET X
        PUSH    HL              ;(SP) <- X
        EX      DE,HL           ;DE <- X
        CALL    CGTHEX          ;GET Y
        PUSH    HL              ;(SP) <- Y
        ADD     HL,DE           ;HL <- X+Y
        EX      DE,HL           ;DE <- X+Y
        LD      HL,0DC6H        ;HL <- VT ADDR
        CALL    DEOUTW          ;DISPLAY SUM
        POP     DE              ;GET Y
        EX      (SP),HL         ;GET X, SAVE VT PTR
        OR      A               ;CLEAR CY
        SBC     HL,DE           ;HL <- X-Y
        EX      DE,HL           ;DE <- X-Y
        POP     HL              ;RESTORE VT PTR
        INC     HL
        JP      DEOUTW          ;DISP DIF, RET TO FP

;GETPAT - ENTRY TO GET PATN FROM KBD, THEN SEARCH

GETPAT: LD      DE,PATN         ;DE <- PATN ADDR
        XOR     A
GP1:    LD      (PATL),A        ;UPDATE PATN LENGTH
        CALL    CGTHEX          ;POSSIBLY GET A BYTE
        LD      A,C             ;TEST FOR ONE
        OR      A
        JR      Z,GPNXT         ;JUMP IF NO BYTE
        LD      A,L             ;ELSE STORE IT
        LD      (DE),A
        INC     DE
        LD      A,(PATL)        ;INC LENGTH
        INC     A
        JR      GP1

;GPNXT - GET NEXT OCCURRENCE OF PATN

GPNXT:
GP2:    LD      HL,(MPTR)       ;START FROM (MPTR)+1
        INC     HL
        LD      DE,PATN         ;DE <- START OF PATTERN
        LD      A,(DE)          ;A <- FIRST BYTE TO FIND
        LD      BC,0            ;SET BC FOR 65K
        CPIR                    ;FIND FIRST MATCH
        DEC     HL              ;POINT TO START AND
        LD      (MPTR),HL       ;SAVE MEMORY PTR
        INC     HL              ;THEN POINT TO NEXT AGAIN
        LD      A,(PATL)        ;A <- PATTERN LENGTH
        OR      A               ;/IGNORE ZERO LENGTH
        RET     Z               ;/
        DEC     A               ;HAVE FOUND FIRST
        LD      C,A             ;BC <- LENGTH
GP3:    XOR     A
        LD      B,A
        OR      C               ;WHILE (BC > 0)
        RET     Z
        INC     DE              ;CHECK REST OF PATN
        LD      A,(DE)          ;A <- NEXT IN PATN
        CPI
        JR      NZ,GP2          ;IF NO MATCH, BREAK TO CONTINUE SEARCH
        JR      GP3


;JUMP - PROMPT FOR ADDRESS, THEN
;RESTORE SCROLLER AND GO TO ADDRESS

FPJMP:  LD      SP,STACK        ;CLEAN UP STACK

JUMP:   CALL    PGTHEX          ;GET ADDR
        PUSH    HL              ;SAVE FOR RET

;SCROLL - RESTORES FULL SCREEN SCROLL

.SCROL: LD      BC,3            ;RESTORE SCROLLER

;INIT - MOVES BC WORDS FROM INITBK TO RAM SCRATCH AREA

INIT:   LD      HL,INITBK
IT1:    LD      DE,RAM
        LDIR
        RET

;GRAFIX - CLEARS GRAPHICS ('FRONT PANEL') AREA
;AND SETS SCROLLER TO BOTTOM FOUR LINES

.GRAFX: LD      A,20            ;NO. OF LINES
        LD      HL,800H         ;TOP OF SCREEN
        EMT     CLEAR

;GRAFNC - SETS SCROLLER WITHOUT CLEARING

GRAFNC: LD      BC,3
        LD      HL,GRAFBK
        JR      IT1

;MOVER - SEE MOVE

MOVER:  JR      MOVE


;       "THE WHITE RABBIT PUT ON HIS SPECTACLES. 'WHERE
;        SHALL I BEGIN, PLEASE YOUR MAJESTY?' HE ASKED.
;        'BEGIN AT THE BEGINNING,' THE KING SAID GRAVELY,
;        'AND GO ON TILL YOU COME TO THE END: THEN STOP."
;               LEWIS CARROLL  ALICE'S ADVENTURES IN WONDERLAND

;BEGIN - SET STACK AND SYSTEM POINTERS, DROP
;THROUGH TO MAIN MONITOR COMMANDS

BEGIN:  LD      SP,STACK
        DI
        LD      BC,INITLN       ;COPY INITBK TO RAM
        CALR    INIT
        LD      A,0FFH          ;SET REMAINING VECTORS TO 0FFH
        LD      B,FFLEN
        LD      HL,OUT1
BG1:    LD      (HL),A
        INC     HL
        DJNZ    BG1
        LD      (HL),0C9H       ;SET MONX TO 'RET'

        LD      A,MKINIT+1      ;/CLEAR KBD (RESETS PORT0)
        LD      (PORT0),A
        EMT     UPDATE
        LD      A,FORM          ;CLEAR SCREEN
        EMT     OUTC

BG2:    LD      (HIMEM),HL      ;FIND TOP OF RAM
        INC     HL
        LD      A,(HL)          ;SAVE CONTENT
        CPL
        LD      (HL),A          ;TEST IF COMPL READS BACK
        CP      (HL)
        CPL
        LD      (HL),A          ;RESTORE ORIGINAL CONTENT
        JR      Z,BG2           ;CONTINUE UNTIL END OF RAM

        LD      A,(NXTROM)      ;TEST FOR ADDITIONAL ROM
        OR      A               ;IF IT CONTAINS ZERO
        CALL    Z,NXTROM        ; CALL IT

        LD      HL,MSGV         ;OUTPUT VERSION
        CALL    MOUT

;CONTC - DO PARTIAL RESET, THEN DROP THROUGH TO MONITOR

CONTC:  LD      SP,STACK
        LD      BC,CCLEN        ;RESET SCROLLER TO FULL SCREEN
        CALR    INIT            ;AND INITIALISE PORT0 MASK

;ZMON - MONITOR COMMAND LOOP

ZMON:   LD      A,RARR          ;ISSUE CR, MONITOR PROMPT
        CALL    AOUT
        CALL    MONX            ;CHECK FOR EXTENDED MONITOR
        CALL    GETC
        EMT     OUTC
        CP      'L'             ;LOAD MEMORY FROM CASSETTE
        JR      Z,LOAD
        CP      'D'             ;DUMP MEMORY TO CASSETTE
        JP      Z,SAVE          ;/POSSIBLY JR
        CP      'J'             ;GO TO ADDRESS
        JR      Z,JUMP
        CP      'C'             ;REENTER USER PROG
        JR      Z,RNTR
        CP      'B'             ;MOVE MEMORY
        CALL    Z,BASIC         ; MUST BE LAST IN LIST
        CP      'S'             ;MOVE MEMORY
        CALL    Z,MOVE          ; MUST BE LAST IN LIST
        JR      ZMON            ; BECAUSE MOVE DOES A 'RET'

;RNTR - REENTER USER PROGRAM AT (ADDR) + 3

RNTR:   LD      HL,(ADDR)
        INC     HL
        INC     HL
        INC     HL
        JP      (HL)

;MOVE - MOVE BLOCK OF MEMORY UP OR DOWN
;       PROMPTS FOR START (OLD S) AND FINISH (OLD F),
;        THEN NEW START (NEW S)

MOVE:   CALL    FSTLST          ;DE <- OLD S, HL <- (OLD F-OLD S)
        PUSH    HL              ;(SP) <- LEN-1
        LD      HL,MSGM         ;GET NEW S
        CALL    MGTHEX          ;HL <- NEW S
        EX      DE,HL           ;HL <- OS, DE <- NS
        POP     BC              ;BC <- LEN-1
        PUSH    HL              ;(SP) <- OLD S
        OR      A               ;CLEAR CY
        SBC     HL,DE           ;CY->UP, NO CY->DOWN
        POP     HL              ;HL <- OLD S
        EMT     OPNWT           ;### ALLOW VT MOVES
        JR      NC,MV1          ;IF MOVE DOWN
        ADD     HL,BC           ;HL <- OLD F
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL           ;DE <- NEW F
        INC     BC              ;MAKE LENGTH INCLUSIVE
        LDDR                    ;MOVE UP FROM TOP
        JR      MV2
MV1:    INC     BC              ;MAKE LENGTH INCLUSIVE
        LDIR                    ;MOVE DOWN FROM BOTTOM
MV2:    EMT     CLOSE           ;###
        RET


;LOAD - LOADS TAPE IN RML ABSOLUTE FORMAT

LOAD:   CALL    GETNAM          ;GET NAME TO FIND
        CALL    CROUT
                                ;START TAPE
FIND:   LD      HL,0            ;/SET RECORD ADDR TO ZERO
        CALL    RECNO           ;/
        CALL    GETHDR
        INC     A               ;SET Z IF NAME REC (TYPE -1)
        JR      NZ,FIND         ;ELSE CONTINUE SEARCH

        LD      HL,PATN         ;HL <- BUFFER ADDR FOR NAME
        PUSH    HL              ;SAVE THE ADDR
        CALL    GET             ;READ THE NAME REC
        JR      NZ,LDERR        ;CKSUM ERROR
        LD      (HL),-1         ;PUT EOS TO BUF
        POP     HL              ;HL <- START OF NAME
        CALL    .MSG            ;DISPLAY IT (HL UNCHANGED)
        CALL    CROUT
        LD      DE,NAME         ;DE <- START OF WANTED NAME
        LD      B,6             ;COMPARE 6 CHARS
COMP:   LD      A,(DE)          ;GET CHAR FROM TARGET
        CP      (HL)            ;COMPARE CHAR FROM THIS NAME
        JR      NZ,FIND         ;JUMP IF NO MATCH
        INC     DE              ;INC POINTERS
        INC     HL
        DJNZ    COMP            ;REPEAT IF MORE

GETREC: CALL    GETHDR
        PUSH    HL              ;SAVE ADDR
        OR      A               ;TEST TYPE
        JR      NZ,GR1          ;IF NOT TYPE 0
        CALL    GET             ;LOAD DATA
        POP     HL              ;/RESTORE ADDR
        CALR    RECNO           ;/AND DISPLAY IT
        JR      Z,GETREC        ;Z MEANS CKSUM OK

LDERR:  CALL    ERROUT          ;OUTPUT ERROR MSG
LDER1:  CALL    GETC            ;WAIT FOR KBD
        CP      'L'
        JR      NZ,LDER1        ;WAIT FOR 'L'
        CALL    CROUT
        JR      GETREC          ;CONTINUE LOADING

GR1:    DEC     A               ;TEST TYPE
        JR      NZ,GR2          ;IF NOT TYPE 1
        CALR    TI              ;EOF, GET CKSUM
        POP     HL              ;/RESTORE ADDR
        CALR    RECNO           ;/AND DISPLAY IT
        JR      NZ,LDERR

        LD      (ADDR),HL       ;SAVE START ADDR
        JP      (HL)            ;GO TO ADDRESS

GR2:    POP     HL              ;/SKIP REC IF NOT TYPES 0 OR 1
        JR      GETREC          ;CONTINUE LOADING

;GETHDR - GET RECORD HEADER
; RETURN WITH HL=ADDRESS, B=LENGTH AND A=TYPE

GETHDR: LD      A,SOH           ;WAIT FOR START OF RECORD
        EMT     GETSYN
        XOR     A               ;CLEAR CKSUM
        LD      C,A
        CALR    TI              ;GET LENGTH
        LD      B,A
        CALR    TI              ;GET ADDR H
        LD      H,A
        CALR    TI              ;GET ADDR L
        LD      L,A
        CALR    TI              ;GET RECORD TYPE
        RET

;GET - READ B BYTES FROM TAPE TO (HL), RETURNING
;       WITH Z SET FROM CKSUM

GET:    CALR    TI
        LD      (HL),A
        CP      (HL)
        JR      Z,GT1           ;IF BYTE LOADED
        RST     38H             ;ELSE BREAK
GT1:    INC     HL
        DJNZ    GET             ;DROP THRO' TO TI FOR CKSUM

;TI - READ BYTE FROM TAPE INTO A, FORM CKSUM

TI:     EMT     GETBYT
        LD      D,A             ;D <- BYTE
        ADD     A,C             ;ADD CKSUM TO BYTE
        LD      C,A             ;RESTORE CKSUM
        LD      A,D             ;RESTORE BYTE
        RET                     ;WITH Z FLAG FROM CKSUM

;RECNO - INDICATE TAPE ACTIVITY, DISPLAY RECORD ADDRESS

RECNO:  PUSH    HL              ;STANDARD SAVE SEQUENCE
        PUSH    DE
        PUSH    BC
        PUSH    AF
        EX      DE,HL           ;/DE <- ADDR (HL ON ENTRY)
        LD      HL,0DC0H        ;HL <- CURSOR ADDR
        EMT     OPNWT           ;###
        LD      A,(HL)          ;BLINK CURSOR
        XOR     CURSOR
        LD      (HL),A
        INC     HL              ;/LEAVE A SPACE
        INC     HL              ;/
        CALL    DEOUTC          ;/### AND CLOSE
        JP      RET1            ;STANDARD EXIT

;SAVE - DUMPS MEMORY TO TAPE WITH OPTIONAL START ADDR

SAVE:   CALL    GETNAM          ;GET A NAME
        CALL    FSTLST          ;DE <- FIRST ADDR, BC <- LAST
        PUSH    BC              ;(SP) <- LAST
        LD      HL,MSGS         ;GET AUTOSTART ADDR
        CALL    MGTHEX          ;HL <- START
        EX      (SP),HL         ;(SP) <- START ADDR
        PUSH    HL              ;SAVE LAST ADDR
        PUSH    DE              ;SAVE FIRST ADDR
        CALL    CROUT
        LD      HL,0            ;/CLEAR REC ADDR
        CALR    RECNO           ;/INDICATE ACTIVITY
                                ;START TAPE
        CALL    SEC5            ;5 SEC DELAY

        LD      HL,NAME         ;OUTPUT NAME
        LD      D,-1            ;REC TYPE -1 (NAME)
        LD      B,6
        CALL    PUTRNA          ;PUTREC, NO ADDR
        POP     DE              ;RESTORE DUMP LIMITS
        POP     HL

SV1:    PUSH    HL              ;(SP) <- LAST ADDR
        LD      B,RECLEN-6      ;B <- RECORD SIZE
        XOR     A               ;CLEAR CY
        SBC     HL,DE           ;GET LENGTH TO DUMP
        JR      C,SV3           ;DUMP COMPLETE (BECAUSE INCL)
        CP      H               ;IF LENGTH > 255
        JR      NZ,SV2          ; CONTINUE
        LD      A,L             ;IF LENGTH >= 1 REC
        CP      B
        JR      NC,SV2          ; CONTINUE
        LD      B,A             ;ELSE DUMP REMAINDER
        INC     B               ; INCLUSIVELY
SV2:    EX      DE,HL           ;NOW HL <- CURRENT ADDR
        LD      D,0             ;REC TYPE 0 (DATA)
        CALL    PUTREC          ;WHICH UPDATES HL
        POP     DE              ;DE <- LAST ADDR TO DUMP
        EX      DE,HL           ;HL <- LAST, DE <- CURRENT
        JR      SV1

SV3:    POP     HL              ;END REC, BALANCE STACK
        POP     HL              ;HL <- START ADDR
        LD      B,0
        LD      D,1             ;REC TYPE 1 (EOF)
        CALL    PUTREC
        CALL    SEC5            ;5 SEC DELAY
                                ;STOP TAPE
        EMT     0               ;BACK TO MONITOR

;PUTREC - WRITE RECORD TO TAPE WITH CKSUM
; OUTPUT B BYTES FROM (HL), D=TYPE, C=CKSUM

PUTREC: CALR    RECNO           ;/DISPLAY ADDR (FROM HL)
PUTRNA: LD      A,SOH           ;PUT SOH (NOT IN CKSUM)
        CALR    TO
        XOR     A               ;ZERO CKSUM
        LD      C,A
        LD      A,B             ;PUT LENGTH
        CALR    TO
        LD      A,H             ;PUT ADDR H
        CALR    TO
        LD      A,L             ;PUT ADDR L
        CALR    TO
        LD      A,D             ;PUT TYPE
        CALR    TO
        LD      A,B             ;CHECK LENGTH
        OR      A
        JR      Z,PR2           ;JUMP IF NO DATA
PR1:    LD      A,(HL)
        INC     HL
        CALR    TO
        DJNZ    PR1
PR2:    LD      A,C             ;GET CKSUM
        NEG
        CALR    TO              ;PUT CKSUM
        LD      B,GAP
        CALL    MS100           ;INTER RECORD GAP
        RET

;TO - PUT BYTE TO TAPE, FORM CKSUM IN C

TO:     EMT     PUTBYT          ;A <- BYTE
        ADD     A,C             ;ADD CKSUM TO BYTE
        LD      C,A             ;SAVE CKSUM
        RET


;.KBDIN - READ KEYBOARD (CALLED VIA EMT)
;ON EXIT Z SET IF NO CHAR, ELSE CLEAR
;WATCH FOR CTRL C (RETURN TO MONITOR)

.KBDIN: PUSH    HL
        LD      HL,MASK
        SET     CLRKBD,(HL)     ;SET UP TO CLEAR KBD
        LD      A,(KBD)         ;A <- POSSIBLE CHAR
        AND     7FH             ;CLEAR MS BIT
        JR      Z,KBD1          ;IF NO CHAR AVAILABLE
        EMT     UPDATE          ;CLEAR KBD
KBD1:   RES     CLRKBD,(HL)
        EMT     UPDATE
        POP     HL
        RET     Z               ;NO CHAR AVAILABLE
        CP      CTRLC           ;IF NOT CTRL C
        RET     NZ              ;RETURN THE CHAR
        EMT     0               ;ELSE RESTART MONITOR

;CLSOPN - CLOSE THEN OPEN (USED WHEN ROUTINE IS
;LONGER THAN FRAME BLANKING PERIOD)

CLSOPN: EMT     CLOSE           ;DROP THRO' TO OPNWT


;.OPNWT - OPEN VT MEMORY IN FRAME BLANKING PERIOD

.OPNWT: PUSH    HL
        PUSH    AF
        LD      HL,PORT1
OPNW1:  BIT     FRAME,(HL)      ;IF IN IT, WAIT
        JR      NZ,OPNW1
OPNW2:  BIT     FRAME,(HL)      ;WAIT FOR NEXT
        JR      Z,OPNW2
        LD      HL,MASK         ;OPEN MEMORY
        SET     VTOPN,(HL)
        EMT     UPDATE
        POP     AF
        POP     HL
        RET

;.CLEAR - EXTERNAL CALL TO CLR WHICH DROPS
;THROUGH TO CLOSE

.CLEAR: EMT     OPNWT
        CALL    CLR

;.CLOSE - CLOSE VT MEMORY

.CLOSE: PUSH    HL
        LD      HL,MASK
        RES     VTOPN,(HL)
        EMT     UPDATE
        POP     HL
        RET

;UPDATE - OUTPUT MASK TO PORT 0

.UPDAT: PUSH    AF
UPD1:   LD      A,(MASK)
        LD      (PORT0),A
        POP     AF
        RET

;CLR - CLEAR THE VT SCREEN
;ON ENTRY A HOLDS THE NUMBER OF LINES TO
;CLEAR AND HL THE ADDRESS OF THE FIRST LINE
;ON EXIT HL POINTS TO ONE PAST LAST CHARACTER

CLR:    LD      DE,018H         ;INCR BETWEEN LINES
CLR1:   LD      B,40            ;CHARS/LINE
CLR2:   LD      (HL),BLANK      ;CLEAR A LINE
        INC     HL
        DJNZ    CLR2
        DEC     A               ;ALL LINES DONE
        RET     Z               ;YES
        ADD     HL,DE           ;POINT TO NEXT LINE
        JR      CLR1

;AOUT, PMTOUT AND CROUT OUTPUT TO THE VT SCREEN

AOUT:   PUSH    AF              ;OUTPUT CR THEN A
        CALL    CROUT
        POP     AF
        JR      ..OUTC

PMTOUT: LD      A,'>'           ;OUTPUT PROMPT
        JR      ..OUTC          ;RETURNING VIA OUTC

CROUT:  LD      A,CR            ;RETURN VIA OUTC
..OUTC:

;.OUTC - PUTS ONE CHARACTER TO SCREEN
;CALLED VIA 'EMT OUTC' BY MONITOR
;INTERPRETS DELETE, CR, FORM FEED AND TAB

.OUTC:  PUSH    HL              ;SAVE ALL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        EMT     OPNWT           ;###
        LD      HL,(VTPTR)      ;HL <- CURRENT POS
        LD      (HL),BLANK      ;CURSOR OFF
        LD      DE,SCRL         ;ELSE RET VIA SCRL
        PUSH    DE

        CP      DELETE          ;IF DELETE
        JR      NZ,OUTC1
        LD      A,0C0H              ;ANY CHARS?
        CP      L
        RET     NC                  ;NO--IGNORE
        DEC     HL                  ;YES--DEC PTR
        RET

OUTC1:  CP      20H             ;ELSE IF NOT CONTR CHAR
        JR      C,OUTC2
        CP      'O'                 ;SWITCH 'O'
        JR      NZ,OUTC1A
        XOR     A
OUTC1A: LD      (HL),A              ;DISPLAY IT
        INC     HL                  ;AND INC PTR
        RET

OUTC2:  SUB     CR              ;ELSE IF CARR RET
        JR      NZ,OUTC3
        LD      L,0E8H              ;FORCE A SCROLL
        RET

OUTC3:  INC     A               ;ELSE IF FORM FEED
        JR      NZ,OUTC5
        LD      A,(NLINES)          ;CLEAR SCROLLING SCREEN
        LD      HL,(TOP)
        JR      CLR

; OUTC4: COULD BE VERTICAL TAB

OUTC5:  ADD     A,3             ;ELSE IF NOT HOR TAB
        RET     NZ                  ;IGNORE
        LD      A,L             ;GET LAST TAB POS
        AND     0F8H
        LD      L,A
        LD      BC,8            ;BUMP BY 8
        ADD     HL,BC
        RET

;SCRL - SCROLL THE VT SCREEN IF NECESSARY, CLEARING
;LAST LINE, THEN RESTORE CURSOR AND UPDATE POINTER

SCRL:   LD      A,0E8H
        CP      L               ;OFF THE END?
        JR      NZ,CURON        ;NO

        LD      A,(NLINES)
        DEC     A               ;A <- LINES TO SCROLL
        LD      HL,(TOP)
        EX      DE,HL           ;DE <- ADDR OF TOP LINE
        LD      HL,40H
        ADD     HL,DE           ;HL <- ADDR OF NEXT LINE
SCRL1:  LD      BC,40           ;BC <- LINE LENGTH
        LDIR
        DEC     A
        JR      Z,CLAST         ;DONE?
        LD      BC,18H          ;NO
        ADD     HL,BC           ;ADVANCE POINTERS TO NEXT
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        PUSH    AF
        AND     7               ;###PAUSE EVERY 8
        CALL    Z,CLSOPN        ;###
        POP     AF
        JR      SCRL1

CLAST:  LD      A,0C0H          ;A <- START OF LAST
        CP      L               ;DONE?
        JR      Z,CURON         ;YES
        DEC     HL
        LD      (HL),BLANK
        JR      CLAST+2

CURON:  LD      (HL),CURSOR
        LD      (VTPTR),HL
        EMT     CLOSE           ;###
RET1:   POP     AF              ;STANDARD EXITS
RET2:   POP     BC
        POP     DE
        POP     HL
        RET

;MOUT - OUTPUT CR, THEN STRING, USING .MSG
;  REG A LOST, OTHERS PRESERVED

ERROUT: LD      HL,MSGE

MOUT:   CALL    CROUT

;.MSG - FAST STRING OUTPUT TO VT SCROLLER
;  ENTER WITH (HL) -> STRING
;  END OF STRING (EOS) IS A -VE BYTE
;  ALL REGISTERS PRESERVED

.MSG:   PUSH    HL              ;STANDARD SAVE SEQUENCE
        PUSH    DE
        PUSH    BC
        PUSH    AF
        LD      DE,(VTPTR)
        EMT     OPNWT           ;###
.MSG1:  LDI                     ;CAN ALWAYS MOVE ONE CHAR
        BIT     7,(HL)          ;REACHED END OF STRING?
        JR      Z,.MSG1         ;CONTINUE IF NOT
        EX      DE,HL           ;USE SCROLLER TO REPLACE
        JR      SCRL            ;CURSOR, DO CR IF NEEDED

;FSTLST - PROMPT FOR 'FIRST' ADDR AND 'LAST' ADDR
;ON RETURN, DE = FIRST, BC = LAST AND HL = (LAST - FIRST)
;ERROR IF FIRST > LAST

FSTLST: LD      HL,MSGF         ;GET 'FIRST'
        CALR    MGTHEX
        EX      DE,HL           ;DE <- FIRST
        LD      HL,MSGL         ;GET 'LAST'
        CALR    MGTHEX
        LD      B,H             ;BC <- LAST
        LD      C,L
        OR      A               ;TEST IF VALID, CLR CY
        SBC     HL,DE
        RET     NC              ;WITH HL = LAST - FIRST

;ERROR - ISSUE ERROR MESSAGE AND RESTART

ERROR:  CALL    ERROUT
        EMT     0               ;AND RESET STACK

;GETHEX - GETS HEX VALUE FROM KEYBOARD
;ON RETURN HL CONTAINS VALUE, C CONTAINS NUMBER
;OF HEX CHARS, B CONTAINS TERMINATOR AND DE IS
;UNCHANGED.  INTERPRETS DELETE.

MGTHEX: CALL    MOUT            ;OUTPUT CR, THEN STR >
        JR      PGTHEX

CGTHEX: CALL    CROUT           ;OUTPUT CR, >

PGTHEX: CALL    PMTOUT          ;OUTPUT PROMPT

.GTHEX: LD      HL,0            ;CLEAR BUFFER AND
        LD      C,L             ;CHAR COUNTER
NXTC:   EMT     KBDIN           ;GET A CHAR
        JR      Z,NXTC
        LD      B,A             ;SAVE LAST IN B
        CP      '0'             ;CONTROL CHAR?
        RET     C               ;YES--RETURN
        CP      DELETE          ;IF DELETE
        JR      Z,NXTC2         ;DELETE LAST DIG (IF ANY)
        EMT     OUTC            ;ECHO PRINTING CHAR
        SUB     '0'             ;CONVERT TO HEX
        CP      10              ;0 TO 9?
        JR      C,NXTC1         ;YES
        SUB     7
        CP      0AH             ;LESS THEN A?
        RET     C               ;YES--RETURN
        CP      10H             ;MORE THAN F?
        RET     NC              ;YES

NXTC1:  ADD     HL,HL           ;SHIFT LEFT 4
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        OR      L               ;MERGE NEW
        LD      L,A
        LD      A,3             ;HAVE THERE BEEN 4 CHARS?
        CP      C
        JR      C,NXTC4         ;IF C > 3
        INC     C               ;ELSE BUMP CHAR COUNT
        JR      NXTC

NXTC2:  INC     C               ;DELETE, TEST IF ANY CHARS
        DEC     C
        JR      Z,NXTC          ;Z IF NONE
        LD      B,4             ;SHIFT RIGHT 4
NXTC3:  SRL     H
        RR      L
        DJNZ    NXTC3
        DEC     C               ;DEC COUNT
        JR      NXTC5           ;ECHO DELETE

NXTC4:  PUSH    DE              ;5 CHARS, SAVE DE
        EX      DE,HL           ;DE <- HEX VALUE
        LD      HL,(VTPTR)      ;HL <- ADDR OF CURSOR
        LD      A,L
        SUB     5
        LD      L,A             ;HL <- ADDR OF START OF STR
        CALL    DEOUTW          ;DISPLAY TRUE 4 CHAR STR
        EX      DE,HL           ;HL <- HEX VALUE
        POP     DE              ;RESTORE DE

NXTC5:  LD      A,DELETE        ;DELETE FIFTH CHAR
        EMT     OUTC
        JR      NXTC

;GETNAM - GET NAME FROM KBD, HANDLE DELETE

GETNAM: LD      HL,MSGN         ;OUTPUT CR NAME>
        CALL    MOUT
        CALL    PMTOUT
        LD      B,6
        LD      HL,NAME         ;HL <- BUFFER ADDR
NM1:    CALL    GETC            ;GET A CHAR
        CP      '0'
        JR      C,NM2
        CP      DELETE
        JR      Z,NM4
        EMT     OUTC            ;ECHO CHAR
        LD      (HL),A          ;SAVE IT IN BUF
        INC     HL
        DJNZ    NM1             ;GET UP TO 6 CHARS
NM2:    INC     B               ;WHILE (B != 0)
NM3:    DEC     B
        RET     Z
        LD      (HL),' '        ;PAD WITH SPACE (NOT GRAPHICS BLANK)
        INC     HL
        JR      NM3
NM4:    LD      A,B             ;TEST IF ANY CHARS
        CP      6
        JR      Z,NM1           ;Z IF NONE
        INC     B               ;ELSE UPDATE CHAR
        DEC     HL              ;AND DELETE CHAR FROM BUF
        LD      A,DELETE        ;ECHO DELETE
        EMT     OUTC
        JR      NM1

;HL IS SCREEN ADDRESS

;DEOUTW - DEOUT WHEN VT IS CLOSED
;DEOUTC - DEOUT, THEN CLOSE

DEOUTW: EMT     OPNWT           ;###
DEOUTC: EMT     DEOUT
        EMT     CLOSE           ;###
        RET

;.DEOUT - PUTS 4 HEX CHARS FROM DE

.DEOUT: LD      A,D
        CALL    .BYTEO
        LD      A,E

;.BYTEO - PUTS 2 HEX CHARS FROM A

.BYTEO: PUSH    AF
        RRCA                    ;GET UPPER 4 BITS
        RRCA
        RRCA
        RRCA
        CALL    HEXO
        POP     AF

;HEXO - PUTS LOWER 4 BITS OF A IN HEX

HEXO:   AND     0FH             ;MASK TO 4 BITS
        ADD     A,90H           ;CONVERT TO HEX
        DAA
        ADC     A,40H
        DAA
CHO:    LD      (HL),A          ;PUT OUT CHARACTER
        INC     HL              ;BUMP POINTER
        RET


;.GTBYT - GETS NEXT BYTE FROM TAPE INTO A
;CALLED VIA EMT

.GTBYT: PUSH    HL              ;SAVE ALL BUT A
        PUSH    DE
        PUSH    BC
        CALL    GETCYC
        XOR     A
        LD      D,A
        DEC     A
        LD      E,A

GB1:    BIT     3,E
        JR      NZ,GB2
        DEC     D
GB2:    CALL    GETCYC
        JR      C,GB3
        INC     D
GB3:    RL      E
        LD      A,1
        CP      D
        JR      NC,GB1

        BIT     3,E
        JR      Z,GB4
        CALL    GETCYC
        RL      E
        BIT     3,E
        JR      Z,GB4
        CALL    GETCYC
GB4:    LD      B,8
        LD      D,B

GB5:    LD      E,0
        LD      A,-8
        ADD     A,D
        LD      D,A

GB6:    CALL    GETCYC
        INC     D
        INC     E
        JR      C,GB7
        INC     D
        DEC     E
GB7:    LD      A,7
        CP      D
        JR      NC,GB6

        LD      A,3
        CP      E
        RR      C
        DJNZ    GB5

        LD      A,C
        JP      RET2            ;STANDARD EXIT

;GETCYC - TIME A CYCLE FROM TAPE
;/ALLOW ESCAPE BY CTRL C

GETCYC: LD      HL,PORT1
GC1:    CALL    .KBDIN          ;CHECK FOR CTRL C
        BIT     TAPE,(HL)
        JR      Z,GC1
        BIT     TAPE,(HL)
        JR      Z,GC1
GC2:    BIT     TAPE,(HL)
        JR      NZ,GC2
        BIT     TAPE,(HL)
        JR      NZ,GC2
        CALL    RDCNT
        CALL    RESCNT
        CP      VALUE
        RET

;GETSYN - WAIT FOR START OF RECORD (TRAP ROUTINE)
;CALLED WITH SOH IN A. WAITS FOR INTERRECORD GAP,
;THEN SOH CHAR.  REGS UNCHANGED.

.GTSYN: PUSH    HL              ;STANDARD SAVE
        PUSH    DE
        PUSH    BC
        PUSH    AF
        LD      C,A             ;C <- SOH
GTSN1:  CALL    GETGAP          ;WAIT FOR GAP
        EMT     GETBYT          ;READ FIRST CHAR
        CP      C               ;IS IT CORRECT?
        JR      NZ,GTSN1        ;NO--ASSUME A GLITCH
        JR      PBY2            ;STANDARD EXIT

;.GTGAP - FIND INTER RECORD GAP (GAPLEN '1' CYCLES)
;CALLED VIA GETGAP (RAM VECTOR) SO THAT IT CAN BE
;SKIPPED FOR PAPER TAPE

.GTGAP: LD      B,GAPLEN-256    ;SET B TO # OF '1' CYCLES
GG1:    CALL    GETCYC
        JR      NC,.GTGAP       ;RESET B IF A '0' CYCLE SEEN
        DJNZ    GG1             ;COUNT DOWN B '1' CYCLES
        RET

;.PTBYT - OUTPUTS BYTE TO TAPE FROM A
;CALLED VIA EMT

.PTBYT: PUSH    HL              ;SAVE ALL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CPL
        LD      C,A
        LD      A,1
        CALR    PUTBIT
        LD      B,10

PBY1:   SRL     C
        RLA
        CALR    PUTBIT
        DJNZ    PBY1

        EMT     KBDIN
PBY2:   JP      RET1            ;STANDARD EXIT

;PUTBIT - PUT BIT 0 OF A TO TAPE

PUTBIT: PUSH    BC
        LD      HL,MASK
        LD      B,4
        AND     11B
        JR      Z,PBT4
        CP      11B
        JR      Z,PBT4
        RES     FREQ,(HL)
        CP      01B
        JR      Z,PBT1
        SET     FREQ,(HL)

PBT1:   PUSH    AF
        LD      A,(HL)
        LD      DE,PORT0
        LD      HL,PORT1
PBT2:   BIT     CLK,(HL)
        JR      Z,PBT2
PBT3:   BIT     CLK,(HL)
        JR      NZ,PBT3
        LD      (DE),A
        POP     AF
        DEC     B

PBT4:   EMT     EDGE
        POP     BC
        RET

;RDCNT - READ THE 8 USEC COUNTER INTO A (REGS PRESERVED)

RDCNT:  PUSH    HL
        PUSH    BC
        LD      HL,CNTR
        LD      B,(HL)
        LD      A,(HL)
        LD      C,(HL)
        LD      H,(HL)
        CP      B
        JR      Z,RC1
        CP      C
        JR      Z,RC1
        LD      A,H
RC1:    POP     BC
        POP     HL
        RET

;RESCNT - CLEAR THE 8 USEC COUNTER (REGS PRESERVED)
;(N.B. TO RETAIN TIMING, DOES NOT USE TRAP FOR 'UPDATE')

RESCNT: PUSH    HL
        LD      HL,MASK
        SET     CLRCNT,(HL)
        CALL    .UPDAT
        RES     CLRCNT,(HL)
        CALL    .UPDAT
        POP     HL
        RET

;SEC5 - WAIT 5 SEC (DESTROYS B)

SEC5:   LD      B,50            ;SET 50 * 100 MSEC

;MS100 - WAIT FOR B 100 MSEC INTERVALS

MS100:  PUSH    BC
        LD      B,120           ;SET 120 * 1/1200 SEC
        EMT     EDGE
        POP     BC
        DJNZ    MS100
        RET

;EDGE - WAIT FOR B 1200 HZ EDGES
;       (ALSO USED AS 833 1/3 USEC TIMER)

.EDGE:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        LD      HL,PORT1
ED1:    BIT     CLK,(HL)        ;WAIT FOR CLOCK HIGH
        JR      Z,ED1
ED2:    BIT     CLK,(HL)        ;WAIT FOR CLOCK LOW
        JR      NZ,ED2
        DJNZ    ED1
        JP      RET1


;DISPATCH TABLE FOR TRAP CODES 11 TO 24

OPNWT:  EQU     11
CLOSE:  EQU     12
GRAFIX: EQU     13
SCROLL: EQU     14
CLEAR:  EQU     15
EDGE:   EQU     16
GETSYN: EQU     17
UPDATE: EQU     18
GETHEX: EQU     19
DEOUT:  EQU     20
BYTEO:  EQU     21
OUTC:   EQU     22
MSG:    EQU     23
CHAN:   EQU     24

TRTBL:  DEFW    .OPNWT
        DEFW    .CLOSE
        DEFW    .GRAFX
        DEFW    .SCROL
        DEFW    .CLEAR
        DEFW    .EDGE
        DEFW    .GTSYN
        DEFW    .UPDAT
        DEFW    .GTHEX
        DEFW    .DEOUT
        DEFW    .BYTEO
        DEFW    .OUTC
        DEFW    .MSG
        DEFW    .CHAN

;SYSTEM MESSAGES - THE MAJORITY OF THESE ARE INTERSPERSED
;WITH THE JUMPS TO THE 'RST' VECTORS

MSGN:   DEFM    'NAME'
        DEFB    -1
MSGV:   DEFM    'COS 2.3 BB'       ;VERSION NUMBER
        DEFB    -1

;INITBK - THIS THE INITIAL STATE OF RAM AND
;IS SET UP BY BEGIN ON RESET OR PARTIALLY BY CTRL C

INITBK: DEFB    24              ;NLINES
        DEFW    0800H           ;TOP
        DEFB    MKINIT          ;MASK
CCLEN:  EQU     $-INITBK
        DEFB    0               ;SSFLG
        DEFW    0DC0H           ;VTPTR
        DEFW    STACK           ;MPTR
        DEFB    16              ;RPTR
        DEFB    0               ;RSET
        DEFW    0               ;ADDR
        JP      .GTGAP          ;GETGAP
        JP      .OUTC
        JP      .KBDIN          ;KBDIN
        JP      .PTBYT          ;PUTBYT
        JP      .GTBYT          ;GETBYT
        JP      VTV             ;LP VECTOR
INITLN: EQU     $-INITBK

GRAFBK: DEFB    4               ;NLINES
        DEFW    0D00H           ;TOP

MONEND: EQU     $-1
MONLEN: EQU     MONEND-MONST+1

;DEDICATED RAM FOR SYSTEM

        ORG     RAM

NLINES: DEFS    1               ;LINES TO SCROLL
TOP:    DEFS    2               ;TOP OF SCROLLED AREA
MASK:   DEFS    1               ;PORT 0 MASK
SSFLG:  DEFS    1               ;SINGLE STEP FLAG
VTPTR:  DEFS    2               ;VT POINTER
MPTR:   DEFS    2               ;MEMORY POINTER
RPTR:   DEFS    1               ;REGISTER POINTER
RSET:   DEFS    1               ;STANDARD/ALT REG SWITCH
ADDR:   DEFS    2               ;USER COLD START ADDR
GETGAP: DEFS    3               ;GAP VECTOR (ALTER FOR PAPER TAPE)

;TRANSFER VECTORS

KBDIN:  EQU     2
PUTBYT: EQU     3
GETBYT: EQU     4

VTV:    DEFS    3               ;CONSOLE OUT
KBDV:   DEFS    3               ;CONSOLE IN
TOV:    DEFS    3               ;TAPE OUT
TIV:    DEFS    3               ;TAPE IN
LPV:    DEFS    3               ;LINE PRINTER OUT

                                ;HERE DOWN INITIALISED TO '0FFH'
OUT1:   DEFS    3               ;AUX I/O, USED BY FILE SYSTEMS
OUT2:   DEFS    3
IN1:    DEFS    3
IN2:    DEFS    3
IN3:    DEFS    3

RST8:   DEFS    3               ;RESTART VECTORS
RST10:  DEFS    3
RST18:  DEFS    3
RST20:  DEFS    3

NMIX:   DEFS    3               ;NMI EXTENSION VECTOR
TRAPX:  DEFS    3               ;TRAP EXTENSION VECTOR
FFLEN:  EQU     $-OUT1
MONX:   DEFS    3               ;MONITOR EXTENSION VECTOR
HIMEM:  DEFS    2               ;TOP OF RAM

;GENERAL STORAGE (NOT INITIALISED)

NAME:   DEFS    6               ;TARGET FILE NAME
PATL:   DEFS    1               ;LENGTH OF PATTERN
PATN:   DEFS    1               ;START OF PATTERN

STACK:  EQU     RAM+100H

;PORT ADDRESSES

KBD:    EQU     0FFCH
PORT0:  EQU     0FFCH
CNTR:   EQU     0FFDH
PORT1:  EQU     0FFEH

;PORT 0 BIT ALLOCATION

MKINIT: EQU     10010010B       ;INITIAL STATE OF PORT 0 MASK
PAGE:   EQU     7               ;MEMORY PAGE SWITCH (=1 FOR OFF)
CLRCNT: EQU     6               ;CLEAR 8 USEC COUNTER
RLY2:   EQU     5               ;RELAY 2 (=0 FOR CLOSED)
FREQ:   EQU     4               ;SET 2400 HZ
RLY1:   EQU     3               ;RELAY 1 (=0 FOR CLOSED)
VTOPN:  EQU     2               ;OPEN VT MEMORY
SINGLE: EQU     1               ;ENABLE SINGLE STEP (=0 FOR SET)
CLRKBD: EQU     0               ;CLEAR KEYBOARD LATCH

;PORT 1 BIT ALLOCATION

LINE:   EQU     7               ;VT LINE WAVE FORM
FRAME:  EQU     6               ;VT FRAME WAVE FORM
TAPE:   EQU     5               ;CASSETTE SIGNAL SENSE
VOL:    EQU     3               ;CASSETTE VOLUME SENSE
RESET:  EQU     2               ;RESET BUTTON
CLK:    EQU     1               ;1200 HZ CLOCK

VALUE:  EQU     47H             ;TAPE CYCLE DISCRIMINATOR
RECLEN: EQU     128             ;RECORD LENGTH IN BYTES
GAP:    EQU     2               ;INTER REC GAP (100'S OF MSEC)
GAPLEN: EQU     240             ;GAP TO FIND WHEN READING ('1' CYCLES)
SOH:    EQU     01001101B       ;START OF RECORD (4DH)

LF:     EQU     0AH
FORM:   EQU     0CH
CR:     EQU     0DH

CTRLC:  EQU     3
CTRLU:  EQU     15H
CTRLZ:  EQU     1AH

BLANK:  EQU     80H             ;GRAPHICS BLANK
LARR:   EQU     5BH
RARR:   EQU     5DH
UPARR:  EQU     5EH
DELETE: EQU     7FH
CURSOR: EQU     7FH

        END
