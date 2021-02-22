PROGRAM A0002
INTEGER :: A, B, C;
A = 1;
DO WHILE(A > 0)
  B = 1;
  C = 2;
  DO WHILE (C < A)
    IF (MOD(A,C) == 0) THEN
      B = 0;
    END IF
    C = C + 1;
  END DO

  IF (B == 1) THEN
    PRINT *, A;
  END IF
  A = A + 1;
END DO
END PROGRAM A0002
