
F="f.f90" 
C="c.c"

all: obj 
	gcc -o main *.o 
	./main 

obj:
	gfortran -c ${F}
	gcc -c ${C}
