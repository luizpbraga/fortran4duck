
program main
  implicit none
  interface
    function fn(k)
      integer fn(size(k))
      integer, intent(in):: k(3)
    end function fn 
    subroutine sub(k)
      save
      integer, intent(in):: k
      integer:: t = 1
    end subroutine sub 
    elemental function foo(k)
      integer foo
      integer, intent(in):: k
      integer j
    end function foo 
  end interface


  integer:: i  = 1
  integer:: vec(3) = 1
  integer:: vec2(3, 3) = 1
  !integer, external:: fn
  !procedure(type(integer)):: fn

  call sub(i)
  call sub(i)
  print *, fn(vec)
  print *, foo(vec2)
  print *, i
  call subpure(i)
  print *, i

contains
  pure subroutine subpure(k)
    integer, intent(inout):: k
    k = k+1
  end
end program main

subroutine sub(k)
  save
  integer, intent(in):: k
  integer:: t = 1
  t  = t+1
  print *, k, t
end

function fn(k)
  integer fn(size(k))
  integer, intent(in):: k(3)
  fn = k
end

pure elemental function foo(k)
  integer foo
  integer, intent(in):: k
  integer:: j
  j = 0
  foo = k+j
end
! function fn(k)
!   integer fn
!   integer, intent(in):: k
!   fn = k
! end
