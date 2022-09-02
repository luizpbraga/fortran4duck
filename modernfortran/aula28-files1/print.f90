!>
program main 
  implicit none
  integer i
  
  print *, (i,i=1,5)

  write(*,*) (i, i=1,5)

  write(*,*) 1 , 2 , 3, 4, 5
  
  ! sempre formatado
  !write(*, '(4i2)', advance = 'no') 1 , 2 , 3, 4
  !print *, 5

contains 
end 

