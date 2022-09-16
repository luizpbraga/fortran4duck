!> 
program main 
  implicit none
  integer::s = 0 
  integer::v(3) = [1,2,3] 

  ! vetor 
  print *, spread(source = s, dim = 1, ncopies = 3)
  ! 0 0 0 
  print *, spread(source = s, dim = 1, ncopies = 10)
  ! 0 0 0 0 0 0 0 0 0 0
  
  ! matriz 
  print *, spread(source = v, dim = 1, ncopies = 3)  !  3 x 3 
  ! 1 2 3 
  ! 1 2 3
  ! 1 2 3 

  print *, spread(source = v, dim = 2, ncopies = 3)  !  5 x 3
  ! 1 1 1 
  ! 2 2 2 
  ! 3 3 3

contains 
end 

