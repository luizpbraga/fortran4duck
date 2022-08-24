module mod  
  implicit none (type, external)

  type, public:: p 
    integer i 
    contains 
  procedure, nopass:: show => show_info
  procedure, pass:: soma 
  endtype 
  contains 

  subroutine show_info(self, x)
    class(p), intent(in):: self
    integer, intent(in):: x
    print*, "Método  ! nopass:", self%i+x
  end

  subroutine soma(self1, self2, x)
    class(p):: self1, self2
    integer x
    print *, "pass:", self1%i+self2%i+x
  end 
end

program main 
  use mod 
  implicit none 
  integer x
  type(p):: pp = p(1)

  call pp%show(pp, 1)
  call pp%soma(pp, 1)
  x = 1
  print *, foo(1, x)
  print *, x 
contains 
  
  integer function foo(x, y)
  integer, value:: x, y
  x = x+1
  foo = x+y
  end 
end 

