!>
program main 
  
  use iso_fortran_env, only: stderr => error_unit
  
  implicit none
  
  integer :: iostat

  !b1: block 
    !real :: r(10, 10) 
    !call random_number(r) 
    !write(10, '(10f7.4)')  transpose(r) 
  !end block b1 

  b2: block 
    real :: m(10, 10)
    open(11, file = "./fort.10")
      read(11, '(10f7.4)') m 
    close(11) 
    
    write(*, '(10f7.4)', iostat = iostat)  transpose(m)
    if (iostat /= 0) write(stderr, *) "Error!"
  end block b2
  contains 
end 

