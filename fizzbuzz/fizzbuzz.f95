PROGRAM FIZZBUZZ
      INTEGER :: A = 0;
      DO WHILE(A > -1)
        A = A+1;
        IF(MODULO(A,15) == 0) THEN
          PRINT *, "FIZZ BUZZ";
        ELSE IF(MODULO(A,5) == 0) THEN
          PRINT *, "BUZZ";
        ELSE IF(MODULO(A,3) == 0) THEN
          PRINT *, "FIZZ";
        ELSE
          PRINT *, A;
        END IF
      END DO
END PROGRAM FIZZBUZZ
