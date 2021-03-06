(DEFVAR FN (NTH 0 *ARGS*))

(DELETE-FILE FN)

(SETF (READTABLE-CASE *READTABLE*) :PRESERVE)

(LOOP 
	(SETQ VARX (READ))
	(FORMAT T "~A~%" VARX)
	(WITH-OPEN-FILE
	 	(PHILE FN
			:DIRECTION :OUTPUT
			:IF-EXISTS :APPEND
			:IF-DOES-NOT-EXIST :CREATE
		)
		(FORMAT PHILE "~A~%" VARX)
	)
)
