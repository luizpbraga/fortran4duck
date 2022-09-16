# f90 -> c -> zig 

zig="z.zig" 
f90="f.f90"

all: obj 
	zig run ${zig} -lc *.o

obj:
	gfortran ${f90} -c 

