program main
  implicit none (type, external)
  integer i
  do i = 1, 10
  call sub(i)
  end do
  contains
  subroutine sub(x)
  save
  integer, intent(in):: x
  integer:: j
  integer:: k
  j = 1
  k = 1
  j = x+j
  k  = k+1
  print *, j, k
  end
end program main

