

program main 
  use iso_c_binding
  implicit none 
  interface 
    subroutine print_c(x) bind(c)
    use iso_c_binding
      implicit none 
      integer(c_int), value:: x
    end 
  end interface
  
  integer(c_int):: x = 1
  call princ_c(x)
  print *, x
  
  contains 
end program main 

