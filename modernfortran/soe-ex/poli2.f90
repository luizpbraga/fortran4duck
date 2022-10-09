module polimonio 
  implicit none
  private 
  type, public:: poli2 
    real::coef(3)
    contains
      procedure, pass(p1), private :: prodl, prodr, add, sub
      generic :: operator(+) => add
      generic :: operator(-) => sub
      generic :: operator(*) => prodl, prodr
  end type 
contains 
  real function roots(p) result (x)
  type(poli2) function add(p1,p2) result(p)
    class(poli2), intent(in) :: p1, p2 
      p%coef = p1%coef + p2%coef 
  end 
  type(poli2) function prodl(n,p1) result(p)
    real, intent(in) :: n 
    class(poli2), intent(in) :: p1 
    p%coef = n * p1%coef 
  end 
  type(poli2) function prodr(p1, n) result(p)
    real, intent(in) :: n 
    class(poli2), intent(in) :: p1 
    p%coef = n * p1%coef 
  end 
  type(poli2) function sub(p1, p2) result(p)
    class(poli2), intent(in) :: p1, p2
    p%coef = p1%coef - p2%coef 
  end 
end 

program main 
  use polimonio 
  implicit none
  type(poli2) :: p = poli2(1)
  p = p + p 
  p = 2.0 * p 
  p = p * 2.0 
  p = p + 10.0 * p - p 
  print *, p%coef ! 3*80.0
end 
