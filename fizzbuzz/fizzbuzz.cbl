       IDENTIFICATION DIVISION.
       PROGRAM-ID.  "FIZZ BUZZ".
       AUTHOR.  VARIK VALEFOR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X PIC 9(38).
       01 Z PIC Z(38)9.

       PROCEDURE DIVISION.
       A-PARA.
         ADD 1 TO X.
         IF FUNCTION MOD(X,15) = 0 THEN
           DISPLAY "FIZZ BUZZ"
         ELSE
           IF FUNCTION MOD(X,5) = 0 THEN
             DISPLAY "BUZZ"
           ELSE
             IF FUNCTION MOD(X,3) = 0 THEN
               DISPLAY "FIZZ"
             ELSE
               MOVE X TO Z
               DISPLAY FUNCTION TRIM(Z LEADING)
             END-IF
           END-IF
         END-IF.
         GO TO A-PARA.
