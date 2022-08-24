

program main 
  use iso_c_binding
  implicit none 
  
  interface
    function add(i, j) bind (c)
    use iso_c_binding
    integer(c_int), value:: i, j 
    integer(c_int) add 
    end function add
  end interface ! 
 
  integer(c_int):: a = 1, b = 2
  print *, add(a, b)
  contains 
end program main 

