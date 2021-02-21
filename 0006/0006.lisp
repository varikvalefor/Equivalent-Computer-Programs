;This program is written with VIM.  Haw-haw!
(DEFUN K () (MAKE-RANDOM-STATE T))
(FORMAT T "~d"
	(* (RANDOM (EXPT 2 63) (K))
		 (IF (EQUAL (RANDOM 2 (K)) 0) -1 1)))
