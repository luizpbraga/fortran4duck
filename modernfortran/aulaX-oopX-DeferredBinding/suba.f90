module mymod
  implicit none

  type, abstract:: abstype
  contains
  procedure(absint), deferred:: p1
  procedure(absint), deferred:: p2
  end type abstype

  abstract interface
  subroutine absint(a)
    import:: abstype
    class (abstype), intent(inout):: a
  end subroutine absint
  end interface  

  type, extends(abstype):: newabstype
  real, private:: i, j
  contains   
  procedure:: p1=>newp1
  procedure:: p2=>newp2
  procedure:: setvalue
  procedure:: getvalue
  endtype newabstype 

  contains 

  subroutine newp1(a)
    class(newabstype), intent(inout):: a
    a%i = a%i+a%j
  end subroutine newp1 

  subroutine newp2(a)
    class(newabstype), intent(inout):: a
    a%i = a%i-a%j
  end subroutine newp2

  subroutine setvalue(a, l, m)
    class(newabstype), intent(out):: a
    real, intent(in):: l, m
    a%i = l; a%j = m 
  end subroutine setvalue

  subroutine getvalue(a)
    class(newabstype), intent(in):: a
    print *, a%i, a%j
  end subroutine getvalue
end module mymod

program main
  use mymod
  implicit none 

  type(newabstype):: a, b 

  call a%setvalue(4.0, 5.0)
  call b%setvalue(6.0, 7.0)
  call a%getvalue()
  call b%getvalue()
end
