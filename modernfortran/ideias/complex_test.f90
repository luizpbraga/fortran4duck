!>
program main 
  use iso_fortran_env, only: r64 => real64
  implicit none
  complex :: c0 = (1,2)
  complex :: c1 = (1.0, 2.0)
  complex(kind=8) :: c2 = (1.0d0, 2.0d0)
  
  ! funcao cmplx pra declarar 
  complex(kind=4) :: c3 = cmplx(1.0e0, 2.0e0) ! , kind = 4)
  complex(kind=r64) :: c4 = cmplx(1.0_r64, 2.0_r64, kind = r64)
  ! sempre use kind = ... ao inicializar um número complexo  
  
  print *, c2, c3, c0
  ! componentes: 
  print *, c2%re, c2%im
  print *, real(c2), imag(c2)
  
  print *, c2 + c3, c2 * c2
contains 
end 
