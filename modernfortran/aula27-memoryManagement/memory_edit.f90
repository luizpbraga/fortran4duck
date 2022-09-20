

program main 

  implicit none
  
  type shupaki
    integer :: i 
    integer, allocatable :: a(:)
  end type 

  type foo
    real r
    type(shupaki) :: shu
  end type 
  
  type(foo), allocatable :: f(:) 

  f = [foo(1, shupaki(1, [1,2,3]))]

  print *, f(1)%shu%a

end program 
