!>
program main 
  implicit none
  integer i, j 
  real x 
  character a, b, c
  
!   read 100, i  
!   read 200, j, x, a
!       
! 100 format(i3)
! 200 format(i3,1x,f4.1,1x,3a)

  open(10, file = "./test.txt")

  !flush 10
  read(10, *) a, b, c
  
  print *, a, b, c
  
  ! lendo novamente a 1a linha!
  rewind(10)  
  read(10, *) a, b, c

  print *, a, b, c 

  close(10) 

contains 
end
