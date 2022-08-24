

program main 
  implicit none (type, external)
  
  integer, pointer:: m(:,:)
  integer, target:: s(10, 10) = 1
  procedure(real), pointer:: p
  integer:: x = 1 
  m => s
  p => sin
  print *, p(0.0), bar(x), x
  s = 3*foo(m) 
  contains 
  
  integer function bar(x)
    integer, value:: x
    x = x+1
    bar = x
  end 

  pure function foo(m)
    implicit none
    integer, intent(in), pointer:: m(:,:) 
    integer, allocatable:: foo(:,:) 
    foo = 3*m
  end 
end program main 

