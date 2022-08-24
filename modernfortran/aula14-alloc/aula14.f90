program main 
  implicit none
  integer err 
  integer, allocatable, dimension(:):: x, y 
  character(:), allocatable:: str 

  allocate(character(10):: str)
  
  allocate(x(0:10))
  
  str = "0"
  
  print *, len(str), str  
  
  str = "skseolfnwekfnwefwefg"
  
  print *, len(str), str  
  
  x = [1, 2, 3]
  
  call move_alloc(x, y)
  
  print *, y
  
  if (allocated(y)) deallocate(y, stat = err)
  
  if (err /= 0) stop error 
  
  contains 
end program main 
