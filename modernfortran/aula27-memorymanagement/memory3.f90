!>
module mod 
  implicit none 
  integer, allocatable :: s(:)
  contains 
end 

program main 
  use mod
  implicit none
  integer :: i
  ! 
  do i=1, 4
    call sub(i)
  end do 

  do i=1, 4
    call sub_mod(i)
  end do 
contains
  subroutine sub(n)
    integer, intent(in) :: n
    integer, allocatable :: v(:)
    if (n == 1) then 
      v = [1,2,3,4] ! [1:5]
    endif 
    print *, n, ": ", v, allocated(v)
  end ! v é desalocado automaticamente, Jao!

  subroutine sub_mod(n)
    integer, intent(in) :: n
    if (n == 1) then 
      s = [1,2,3,4] ! [1:5]
    endif 
    print *, n, ": ", s, allocated(s)
  end
end 
