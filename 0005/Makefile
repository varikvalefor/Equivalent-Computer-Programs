build:
	${CC} ${CFLAGS} 0005.c
	${C++} ${C++FLAGS} 0005.cc
	${HS} ${HSFLAGS} 0005.hs
	${COBBLE} ${COBBLEFLAGS} 0005.cbl

clean:
	rm 0005.hi 0005.o

CC = cc
CFLAGS = -O2 -L/usr/local/lib/ -I/usr/local/include/ -lgmp -o executable_c
C++ = g++ #CLANG throws a fit when compiling the file, despite VARIK's
          #having referred to the GMP info page when writing 0005.cc.
C++FLAGS = -O2 -L/usr/local/lib/ -I/usr/local/include/ -lgmp -lgmpxx -o executable_cc
HS = ghc
HSFLAGS = -O2 -o executable_hs
COBBLE = cobc
COBBLEFLAGS = -O3 -o executable_cbl -x
