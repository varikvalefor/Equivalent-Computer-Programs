PROGRAM FIBBER
  INTEGER :: A = 1;
  INTEGER :: B = 0;
  INTEGER :: C = 0;
  DO WHILE (A + B > -1)
    B = C;
    C = A + B;
    A = B;
    PRINT *, C;
  END DO
END PROGRAM FIBBER
