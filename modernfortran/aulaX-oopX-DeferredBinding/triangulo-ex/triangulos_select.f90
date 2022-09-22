! Após estudar esse código, compare com as versões em Go (2007), Rust (2010) e Zig (2016). 
! Fortran (1857+100) pode aprender algo com esses bebes? 
module m_triangulo 
  implicit none

  private
  public ::triangulo, triangulo_retangulo, triangulo_equilatero 
  
  type :: triangulo 
  contains 
    procedure, non_overridable :: area ! 'area' é a mesma pros herdeiros da classe
  endtype 

  type, extends(triangulo) :: triangulo_retangulo
    real :: c1, c2, h
  end type 

  type, extends(triangulo) :: triangulo_equilatero
    real :: l
  end type 

  ! class(obj) == ( type(obj) ou type(algum_herdeiro_de_obj) )
contains 
  real function area(self)
    class(triangulo), intent(in) :: self 
    
    select type (self)
      class is (triangulo_retangulo)  ! pro tri_re e pros seus herdeiros
          area = self%c1 * self%c2 / 2.0
      class is (triangulo_equilatero) ! pro tri_eq e pros seus herdeiros
          area = sqrt(3.0) * (self%l ** 2) / 4.0
    end select 
  end 
end module 

program main 
  use m_triangulo, only: trieq => triangulo_equilatero, trire => triangulo_retangulo
  implicit none
  type(trieq) :: te = trieq(12.0)
  type(trire) :: tr = trire(8.0, 15., 17.)
  print *, te%area(), tr%area()
end
