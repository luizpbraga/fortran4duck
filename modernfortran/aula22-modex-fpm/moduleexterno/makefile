## Compilando um modulo externo 
#							|-> modulo e depois programa 
# 						|--- ------|	 
# 						^          ^
all:
	@echo "Use 'make 0', 'make 1' ou 'make clear'" 

0:
	gfortran -o main.out m_main.f90 main.f90
	./main.out

# link seguido de execução
1:
	gfortran -c m_main.f90 main.f90
	gfortran -o main.out *.o
	./main.out

clear:
	rm -i *.o *.mod *.out
