
program main
  use mod
  implicit none
  
  print*, .not. .true.
end program
























































! module mod
!   implicit none
!     type point2D
!       real:: x, y
!       contains
!       procedure, private:: sub
!       generic:: operator(-) => sub  ! can not bee NOPASS
!     end type
!   
!   ! rules ::  the module procedure must be a function, 
!   ! the argument list must bee intent(in)


!   interface operator(+)
!     module procedure:: add
!   end interface 

!   interface operator(.ic.)
!     module procedure:: ic 
!   end interface

!   interface operator(.dot.)
!     module procedure:: dot
!   end interface

!   contains
!     function add(p1, p2) result(p)
!     type(point2D), intent(in):: p1
!     type(point2D), intent(in):: p2
!     type(point2D):: p
!     p = point2D(p1%x+p2%x, p1%y+p2%y)
!     end
!    
!    function sub(p1, p2) result(p)
!     class(point2D), intent(in):: p1, p2
!     type(point2D):: p
!     p = point2D(p1%x-p2%x, p1%y-p2%y)
!     end
!    function new(vec) result(p)
!     real:: vec(:)
!     type(point2D):: p
!     p = point2D(vec(1), vec(2))
!     end
!   
!     function dot(p1, p2) result(p)
!     class(point2D), intent(in):: p1, p2
!     real:: p
!     p = p1%x*p2%x+p1%y*p2%y
!     end

!     function ic(i)
!     integer ic
!     integer, intent(in):: i 
!     ic = i+1
!     end

! end module mod

! program main
!   use mod
!   implicit none (type, external)
!   type(point2D):: x, y, z
!   x = point2D(1.0, 2.0)
!   y = point2D(1.0, 2.0)
!   z = x+y
!   print*, z
!   z = x-y
!   print *, z
!   print *, x .dot. y
!   print *, dot_product([1.0, 2.0], [1.0, 2.0])
!   print *, ic(1)
!   print *, .ic. 1

!   contains
! end program main
