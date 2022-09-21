!>
!> Após estudar esse código, compare com as versões em Go (2007), Rust (2010) e Zig (2016). 
!> fortran pode aprender algo com esses bebes? 
module trilegal 
  implicit none
 
  private
  public ::triangulo, triangulo_retangulo, triangulo_equilatero 

  type, abstract :: triangulo 
    contains 
      procedure(tri_area), deferred :: area
  end type 

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

    real function area_generica(tri) result(area)
      class(*), intent(in) :: tri 
      select type (tri)
        class is (triangulo_retangulo)
          area = tri%c1 * tri%c2 / 2.0
        class is (triangulo_equilatero)
          area = sqrt(3.0) * (tri%l ** 2) / 4.0
      end select 
    end 

    real function tri_equi_area(tri) result(area)
      class(triangulo_equilatero), intent(in) :: tri 
      area = sqrt(3.0) * (tri%l ** 2) / 4.0
    end
    
    real function tri_ret_area(tri) result(area)
      class(triangulo_retangulo), intent(in) :: tri 
      area = tri%c1 * tri%c2 / 2.0
    end

    real function hipo(tri) 
      class(triangulo_retangulo), intent(inout) :: tri
      tri%h = sqrt(tri%c1 **2 + tri%c2 ** 2)
      hipo = tri%h
    end 
end

module mymod
  use trilegal
  implicit none 
  private 
  ! isso é possivel:
  type, extends(triangulo), abstract :: tritop
    procedure(real), pointer, nopass :: p
  end type 
end 

program main 
  use trilegal, tri_equi => triangulo_equilatero, tri_ret => triangulo_retangulo
  implicit none
  
  type(tri_ret) :: tr = tri_ret(8.0, 15.0)
  type(tri_equi) :: te = tri_equi(12.0)

  print *, tr%area(); print *, te%area();  
  print *, tr%hipo(); print *, tr

  call printArea(tr)
  call printArea(te)
contains 
  ! Isso é muito doido: 'tri' pode ser qqr obj que 'herda' o 'triangulo' 
  ! obs: nao se aplica apenas a tipos abstratos
  subroutine printArea(tri) 
     ! poly: class(<type_name>) == type(<algem_que_herda_type_name>)
     class(triangulo), intent(in) :: tri
     print *, tri%area()
  end
end 

