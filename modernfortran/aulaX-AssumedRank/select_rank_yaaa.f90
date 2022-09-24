module mod 
  ! commpilado com ifx/ifort 
  generic :: su => sub1, sub2
contains 
  subroutine sub2(x)
    !class(*) :: x(..)
    integer, intent(in) :: x(..)
    select rank(x) 
    rank(1)
    print *, 0*x 
    rank(2) 
    print *, x 
    rank(*)
    rank default 
      print *, "Ai não mano! Pra que isso?"
  end select 
end 

  subroutine sub1(x) 
    real, intent(in) :: x(..)
  end 
end 

!>
program main 
  use mod 
  implicit none
  integer v(2,2)
  integer, allocatable :: s(:)
  v = 1
  s = [1,2,3]

  call su(v)
  call su(s)
  call su([1,2,3,4])
  contains 
end 
