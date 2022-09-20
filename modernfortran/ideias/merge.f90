!>
program main 
  implicit none
  ! precisa ter o mesmo tipo
  integer :: a = 1, b = 2
  
  integer, target :: ti 
  real, target :: tr
  class(*), pointer :: p

  print *, merge(a, b, .true.)
  print *, merge(a, b, .false.)

  p => ti 

  ! select type (p)
  !   type is (integer)
  !     print merge("(i0  )", "(f0.5)", .true.), p 
  !   type is (real) 
  !     print merge("(i0  )", "(f0.5)", .true.), p 
  ! end type 
contains 
end 

