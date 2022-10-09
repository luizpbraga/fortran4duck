!>
module polimonio
  implicit none
  
  private
  public :: operator(+), operator(*)


  interface operator (+)
    module procedure :: add_poli2
  end interface 

  interface operator (*)
    module procedure :: scalar_poli2 
  end interface 

  type, public :: poli2 
    real :: coef(3)
    contains 
      procedure, public :: roots => solv_poli2
  end type 
contains 

  ! ax^2 + bx + c = 0 
  function solv_poli2(self) result(y)
    class(poli2), intent(in) :: self 
    complex :: y(2), delta
    real :: pm(2) = [1.0, -1.0]
    
    associate( a => self%coef(1), b => self%coef(2), c => self%coef(3) )
      delta = b*b - 4*a*c 
      y = (-b + pm * sqrt(delta)) / (2*a)
    end associate
  end function 
  
  function add_poli2(p1, p2) result (p3) 
    type(poli2), intent(in) :: p1, p2 
    type(poli2) :: p3 
    p3%coef = p1%coef + p2%coef
  end function 

  function scalar_poli2(n, p1) result (p2) 
    real, intent(in) :: n 
    type(poli2), intent(in) :: p1 
    type(poli2) :: p2
    p2%coef = n*p1%coef
  end function 

end 

program main 
  use polimonio
  implicit none

  type(poli2) :: p1  = poli2([2.0, 0.0, 2.0])
  type(poli2) :: p2  = poli2([-1.0, 0.0, -1.0])
  type(poli2) :: p3 

  p3 = p1 + p2 

  ! y = x2 + 1
  print *, roots(1.0, 0.0, 1.0)
  print *, p1%roots()
  print *, p3%roots()
  p3 = (- 1.0) * p2  
  print *, p3%roots() 

contains
  ! ax^2 + bx + c = 0 
  function roots(a,b,c) result(y)
    real, intent(in) :: a, b, c 
    real :: pm(2) = [1.0, -1.0]
    complex :: y(2), delta
    
    delta = b*b - 4*a*c 
    y = (-b + pm * sqrt(delta)) / (2*a)
  end function 
end 

