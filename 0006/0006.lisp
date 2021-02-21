;This program is written with VIM.  Haw-haw!
(DEFUN K () (MAKE-RANDOM-STATE T))
(LOOP WHILE (EQUAL 1 1) DO
	(PRINT
		(* (RANDOM (EXPT 2 63) (K))
			 (IF (EQUAL (RANDOM 2 (K)) 0) -1 1))))
