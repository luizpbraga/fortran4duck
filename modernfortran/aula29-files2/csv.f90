!>
program main 
  implicit none
  integer i 
  real :: data(10)

  do i=1, 20 
    call random_number(data) 
    !write (10, '(9(f7.4, ","), f7.4)') data
    write (10, '(*(f7.4))') data
  end do 
contains 
end 

