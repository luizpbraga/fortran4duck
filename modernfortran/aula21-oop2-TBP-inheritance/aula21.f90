! > No vídeo eu troco retangulo por quadrado ... 
! > Nesses arquivo, isso já foi corrigido.
 module mod 
   implicit none   
   private
   public:: retangulo, pi
   
   real, parameter:: pi = 4*atan(1.0)
   type:: retangulo 
     real:: l1, l2 
     contains 
     procedure:: area
     procedure, pass(self):: getarea 
     procedure, nopass:: show
   end type
 
 contains
   function area(self) 
     real:: area 
     class(retangulo), intent(in):: self
     area = self%l1*self%l2  
   end 
 
   subroutine show()
     print*, "Eu nao gosto de python"
   end
 
   subroutine getarea(area, self)
     real, intent(out):: area 
     class(retangulo), intent(in):: self
     area = self%l1*self%l2  
     print*, "Area calculada:", area
   end 
 end module 
 
 
 program main     
   use mod, only: retangulo, mod_pi => pi 
   implicit none 
 
   type, extends(retangulo):: quadrado 
      integer:: outrocampo
   end type 
 
 type(retangulo)  :: r = retangulo(2.0, 2.0)
 type(quadrado)   ::  q = quadrado(2.0, 4.0, 2)
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
