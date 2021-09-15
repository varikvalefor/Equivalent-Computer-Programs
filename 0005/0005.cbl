       IDENTIFICATION DIVISION.
       PROGRAM-ID.  "0005".
       AUTHOR.  VARIK VALEFOR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TARGA    PIC X(69).
       01 BOUNDARY PIC 9(38) VALUE 86.
       01 CURRENTX PIC 9(38).
       01 CURRENTY PIC Z(38)9.

       PROCEDURE DIVISION.
       ACCEPT TARGA FROM COMMAND-LINE.
       MOVE TARGA TO BOUNDARY.
       PARA-PARA.
           ADD 1 TO CURRENTX.
           MOVE CURRENTX TO CURRENTY.
           DISPLAY FUNCTION TRIM (CURRENTY LEADING) WITH NO ADVANCING.
      *    "NO ADVANCING" removes the newline which would otherwise be
      *    added to the output; such a newline is unnecessary... and
      *    separates individual numbers, which is not the desired
      *    behaviour.
           IF (CURRENTX + 1) <= BOUNDARY THEN
             GO TO PARA-PARA
           END-IF.
       DISPLAY "".
