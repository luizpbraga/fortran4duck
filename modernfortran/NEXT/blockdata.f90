

program main 
  implicit none (type, external)
  
  integer:: i = 0

  l1: block
  integer:: i 
  i = 10
  print *, i
  end block l1 
  print *, i 

  contains 
end program main 

