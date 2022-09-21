
module m_mod
  implicit none 

  type t_matrix2d(k, l1, l2)
    integer, kind:: k = 4
    integer, len  :: l1 = 2, l2 = 2

    integer(k):: m(l1, l2)
  end type
end module m_mod 

program main
  use m_mod
  use iso_fortran_env

  implicit none
  
  type(t_matrix2d):: matrix2d
  
  !type(t_matrix2d(4,10,10)):: matrix10x10

  integer:: z = 1, x

  print*, z
  
  a1: associate( m => matrix2d%m )
    m = 1.0
    print*, m
    a2: associate( z => 2*m, y => 3*m)
      print *, z+y
    endassociate a2
  endassociate a1
  
  print*, matrix2d%m, z

  b1: block
    integer:: z  = 10
    z = z+z
    print*, z
    x = z
  end block b1
  print*, z, x
  ! 
  ! allocate(m2d%m(5, 5)) 
  ! m2d%m = 0
  ! deallocate(m2d%m)

end program main

