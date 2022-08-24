! se n pointers ::
! pure sub so intent(out)/(inout) pode ser modificado
! pure fn so intent(in)
! so pode usar proc tb puras
! ! elemental are pure
! ! • The statements open, close, inquire, print, endfile, backspace, 
! rewind, flush, wait, read, print, write, pause, error stop and 

program main 
  implicit none 
  integer:: i = 1
  integer:: j = 1, k(10)
  double precision:: dp
  !double complex:: dc
  k = 0
  print*, foo(i)
  print *, notpure(j)
  print *, notpure(k)
  print *, k
  print *, .true. .neqv. .true.


contains 
  
  pure function foo(x)
    integer foo 
    integer, intent(in):: x 
    foo = x 
  end

  impure elemental function notpure(x)
  integer, intent(inout):: x
  integer:: notpure 
  x = 99
  notpure = x
end 
end program main 

