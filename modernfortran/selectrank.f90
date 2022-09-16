!>
module mod 
  implicit none 
  contains 
  subroutine check(x,y,b)
    class(*), intent(in) :: x(..), y(..)
    logical, intent(inout) :: b 

    if (rank(x) /= rank(y)) then 
      b = .false.
    else 
      b = all(shape(x) == shape(y)) 
    end if 
  end subroutine 
end module  

program main
  use mod
  implicit none
  logical b
  integer :: i,  x(1,1,1) 
  real :: y(1,1,1)

  call check(x, y, b )
  print *, b

contains 
end 

