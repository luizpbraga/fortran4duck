
program main 
  implicit none
  integer:: a = 5, b = 5 

  print *, foo(a, b)
  print *, a, b 

  contains

  integer function foo(a, b) result (xx)
    integer, value:: a 
    integer, intent(inout):: b  
    b = 1
    a = 1 
    xx = a 
  end function foo 
end program main 

