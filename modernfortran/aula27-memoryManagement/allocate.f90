!>
program main 
  implicit none

  integer, allocatable :: z(:)
  integer stat 
  character(80) :: errmsg
  
  allocate(z(3))
  allocate(z(4), stat = stat, errmsg = errmsg)
  if (stat /= 0) error stop errmsg
  !z = [1,2,3,4]
  print *, z
  deallocate(z, stat = stat, errmsg = errmsg) 
  if (stat /= 0) error stop errmsg
  
  print *, z
contains 
end 

