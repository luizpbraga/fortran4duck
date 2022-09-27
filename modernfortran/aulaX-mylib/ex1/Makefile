
#makefile bobo: 
FC=gfortran

all: 
	@echo "> Criando os aquivos *.mod e *.o em share/ usando os modulos em src/"
	# O -J joga os *mod na pasta share
	$(FC) -fpic -c -Wall -J ./share/. ./src/mod1.f90 && mv *.o ./share
	@echo "> Criando o binário na pasta bin/"
	# o -I produca os *.mod na pasta share/
	$(FC) -I ./share/ -o ./bin/main ./app/main.f90 

run:
	./bin/main

staticlib: 
	@echo "Criar os aquivos .o usando os modulos"
	$(FC) -c -J ./share/. ./src/*.f90
	mv *.o ./share/
	@echo "criando o arquivo .a"
	ar r libmod1.a ./share/*.o 
	@echo "-L: achar o .a; -I: achar o .mod; -l: linkar o libmod.a"
	mv libmod1.a ./share/lib/
	$(FC) ./app/main.f90 -I ./share/ -L ./share/lib/ -lmod1  -o ./bin/main 

