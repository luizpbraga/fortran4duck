program main
  use aula22, only: say_hello
  implicit none
  integer:: i = 1

  print *, i
  call say_hello()
  print *, foo(1.0)
  
  contains 
  real function foo(input) result(output)
    real, value:: input
    output = input 
  end function foo
end program main
