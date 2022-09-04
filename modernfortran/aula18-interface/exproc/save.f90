program main 
  implicit none (type, external)

  call sub 
  call sub
  call sub

contains 
 
subroutine sub 
  integer:: i(3) = 1
  i = i+1
  print *, i 
 end subroutine sub 
end program main 

