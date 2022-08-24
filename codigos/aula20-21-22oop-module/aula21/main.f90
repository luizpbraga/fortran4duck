 
 module mod 
   implicit none   
   private
   public:: quadrado, pi
   
   real, parameter:: pi = 4*atan(1.0)
   type:: quadrado  ! ERRO: RETANGULO
     real:: l1, l2 
     contains 
     procedure:: area
     procedure, pass(self):: getarea 
     procedure, nopass:: show
   end type
 
 contains
   function area(self) 
     real:: area 
     class(quadrado), intent(in):: self
     area = self%l1*self%l2  
   end 
 
   subroutine show()
     print*, "Eu nao gosto de python"
   end
 
   subroutine getarea(area, self)
     real, intent(out):: area 
     class(quadrado), intent(in):: self
     area = self%l1*self%l2  
     print*, "Area calculada:", area
   end 
 end module 
 
 
 program main     
   use mod, only: quadrado, mod_pi => pi 
   implicit none 
 
   type, extends(quadrado):: retangulo
      integer:: outrocampo
   end type 
 
 type(quadrado)  :: q = quadrado (2.0, 2.0)
 type(retangulo):: r = retangulo(2.0, 4.0, 2)
 real:: area 
 
 print *, q, mod_pi
 print *, q%area()
 print *, r
 print *, r%area()
 call r%show
 call q%show
 call q%getarea(area)  ! r%getarea(area)
 print *, area 
 end program 
