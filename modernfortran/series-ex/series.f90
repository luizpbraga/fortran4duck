  !n: 0, 1, 2, 3, 4, 5, ..., n ... 
  !f: 1, 1, 2, 3, 5, 8, ..., fn = f_n-2 + f_n-1, ...
  
  !n: 0, 1, 2   , 3    , 4      ,  n                        , ...
  !f: 0, 1, 2*1,  3*2*1, 4*3*2*1,  fn = n! = n * n-1 * n-2* ... 1, ...
!>
program main 
  use:: iso_fortran_env, only: i64 => int64 
  implicit none
  integer(i64) i
  character(10) :: fmt = '(8i5)'
  
   write(*,fmt) (i, i=0, 7)
   write(*,fmt) (fib(i), i=0, 7) ! Fibonacci 
   write(*,fmt) (fac(i), i=0, 7) ! Factorial 
contains    
  recursive integer(i64) function fib(n) result(f) 
    integer(i64), intent(in) :: n 
    f = merge(n, fib(n-1) + fib(n-2), n <= 1)   
  end

  recursive integer(i64) function fac(n) result(f)
    integer(i64), intent(in) :: n 
    f = merge(n, n * fac(n-1), n <= 1)
  end
end
