       IDENTIFICATION DIVISION.
       PROGRAM-ID.  "0007".
        
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VA PIC 9(38).
       01 VB PIC 9(38).
       01 VC PIC Z(38)9.

       PROCEDURE DIVISION.
       A-PARA.
           ADD 1 TO VA.
           SET VB TO 0.
           B-PARA.
               ADD 1 TO VB.
               MOVE VB TO VC.
               DISPLAY FUNCTION TRIM (VC LEADING) WITH NO ADVANCING.
               IF VB + 1 <= VA THEN
                   GO TO B-PARA
               END-IF.
           DISPLAY " ".
           GO TO A-PARA.
