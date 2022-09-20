!>
module trilegal 
  implicit none
 
  private
  public ::triangulo, triangulo_retangulo, triangulo_equilatero 

  type, abstract :: triangulo 
    contains 
      procedure(tri_area), deferred :: area
  endtype 
  
  abstract interface 
    real function tri_area(tri) result (area)
      import :: triangulo 
      class(triangulo), intent(in) :: tri 
    end function 
  end interface

  type, extends(triangulo) :: triangulo_retangulo
    real :: c1, c2, h = 0.0
    contains 
      procedure ::  area => tri_ret_area
      procedure :: hipo 
  end type 
  
  type, extends(triangulo) :: triangulo_equilatero
    real :: l
    contains 
      procedure ::  area => tri_equi_area
  end type 

  contains 

    real function tri_equi_area(tri) result(area)
      class(triangulo_equilatero), intent(in) :: tri 
      area = sqrt(3.0) * (tri%l ** 2) / 4.0
    end function 
    
    real function tri_ret_area(tri) result(area)
      class(triangulo_retangulo), intent(in) :: tri 
      area = tri%c1 * tri%c2 / 2.0
    end function 

    real function hipo(tri) 
      class(triangulo_retangulo), intent(inout) :: tri
      tri%h = sqrt(tri%c1 **2 + tri%c2 ** 2)
      hipo = tri%h
    end 
end module 

module mymod
  use trilegal
  implicit none 

  private 
  ! isso é possivel:
  type, extends(triangulo), abstract :: tritop
    procedure(real), pointer, nopass :: p
  end type 

end module 

program main 
  use trilegal, tri_equi => triangulo_equilatero, tri_ret => triangulo_retangulo
  implicit none
  
  type(tri_ret) :: tr = tri_ret(8.0, 15.0)
  type(tri_equi) :: te = tri_equi(12.0)

  print *, tr%area()
  print *, te%area()

  print *, tr%hipo()
  print *, tr

contains 
end 

