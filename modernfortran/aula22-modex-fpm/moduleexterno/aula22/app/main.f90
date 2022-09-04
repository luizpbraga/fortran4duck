program main
  use aula22, only: say_hello
  use stdlib_strings
  use stdlib_array
  implicit none
  
  print *, [1:100]
  call say_hello()
end program main
