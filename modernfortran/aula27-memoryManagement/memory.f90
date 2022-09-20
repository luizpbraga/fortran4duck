!>
program main 
  implicit none

  integer, allocatable :: z(:) ,x(:), i

  allocate(z(10), x(3), i)
  ! allocate(z(4))
  ! z = [1,2,3,4] 
  ! allocate(x, source = z)
  ! print *, x
  ! allocate(y, mold = z)
  ! print *, y
  deallocate(z, x, i)
contains 
end 

