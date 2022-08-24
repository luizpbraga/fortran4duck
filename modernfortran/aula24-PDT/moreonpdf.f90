
module m_mod
  implicit none
  
  type matrix(k, l, m)
    integer, kind:: k
    integer, len:: l, m 
    real(k):: mat(l, m)
    contains 
      procedure, private:: add => add_matrix
      generic:: operator(+) => add
  endtype

contains 
  function add_matrix(m1, m2) result(m3)
    class(matrix(4, l=* , m=* )), intent(in):: m1
    class(matrix(4, m1%l, m1%m)), intent(in):: m2
    type (matrix(4, m1%l, m1%m))            :: m3
    m3%mat = m2%mat+m1%mat
  end
function foo(thematrix)
  real foo
  !> kind nao pode ser ""assumed"" i.e. ter o ""*""
  !> funciona com deferred args i.e "":"" (pq?)
  class(matrix(k = 4, l = *,m = *)), intent(in):: thematrix
  !class(matrix(k = 4, l = :,m = :)), intent(in):: thematrix ! , pointer => target 
  !class(matrix(k = 4)), intent(in):: thematrix
  foo = sum(thematrix%mat)
end function 

end module 

program main 
  use m_mod
  use iso_fortran_env, only: r32 => real32 
  
  implicit none (type, external)

  type( matrix(r32, 2, 2) ):: m, n, o

  m%mat = 1
  n%mat = 2
  o = n+m
  print *, foo(m), o 

  contains 
end program main 

