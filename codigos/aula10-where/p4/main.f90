program main 
  implicit none (type, external)
  integer i 
  integer, dimension(10)    :: x, y, z
  real,    dimension(10, 10):: a, b, c 

  c = 0.0; b = 1.0
  call random_number(a)
  
  L1: where (a < 0.5 .and. b < 0.0)
    c = b+a/2
  end where L1

  x = [(i, i = 1, 10)]; y = x(10:1:-1); z = 0 

  where ( x > 5 ) 
    z = sum(x)
  else where ( x == 3)
    z = 99
  else where 
    z = -y
  end where
end program main 
