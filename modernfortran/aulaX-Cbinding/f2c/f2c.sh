#!/bin/bash

gfortran -c $1
gcc -c $2  # nao precisa, mas... gfortran -c filef.f90 && gcc -o file.out filec.c filef.o && ./file.out

if [[ $3 == "-o" ]]; then 
  gcc -o $4 ${1::-4}.o ${2::-2}.o  
else 
  gcc -o exef2c.out ${1::-4}.o ${2::-2}.o  
fi

##zig run addz.zig  addf.o -lc
