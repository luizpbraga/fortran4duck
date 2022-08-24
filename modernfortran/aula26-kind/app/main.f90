program main 
  use:: iso_fortran_env, r64 => real64
  
  ;!gfortran-fdefault-real-main.f90
  implicit none ! (type, external)

  integer, parameter:: k = selected_real_kind(33)
  integer, parameter:: k8 = selected_real_kind(1)
  
  integer (kind = k8  ):: i = 127_k8 
  real    (kind = k   ):: r, d = 10._k, t = 3.0_k 
  complex (kind = r64 ):: c = &
    cmplx(1.d0, 1.d0, kind = r64)

  r = d/t
  print *, real(c), aimag(c), r%kind, r64
  print *,huge(r), digits(r), tiny(r), maxexponent(r)
  print *, minexponent(r), bit_size(i), precision(r), range(r)
  print *, 'Real     : ', real_kinds
  print *, 'Integer  : ', integer_kinds
  print *, 'Logical  : ', logical_kinds
  print *, 'Character: ', character_kinds
end program main 

