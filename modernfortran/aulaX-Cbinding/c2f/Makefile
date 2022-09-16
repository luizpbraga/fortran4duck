
fc=gfortran
#fc="ifx"

all: obj 
	${fc} -o main *.o
	./main 
obj:
	gcc -c ./lib.c
	${fc} -c ./f.f90

# OR
# all: obj 
# 	gfortran -o main f.f90 mylib.o
# 	./main 
# obj:
# 	gcc -c ./lib.c
