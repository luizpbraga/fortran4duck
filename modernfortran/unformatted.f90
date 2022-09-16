!>
program main 
  implicit none
  real :: data(4) 
  
  integer, parameter :: wp = kind(1.0d0), n = 10
  real(kind=wp)      :: x(n),xchk(n)
  
  call random_number(x)

  print "(sp,f0.16)", x

  write(9, '(f0.16)') x

  open(10, file = "./fort.9",  access = "stream", form = "unformatted") 
    read(10) xchk 
  close(10)

  print *, xchk 
end 

