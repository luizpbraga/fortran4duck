module mod
  implicit none
  type:: prod
    character(10):: name
    integer:: code   
    contains  
    procedure:: upcode
  endtype

  contains
  subroutine upcode(p, code)
    class(prod), intent(inout):: p
    integer, intent(in):: code
    p%code = code
  end subroutine
end module mod 

program main
  use mod
  implicit none (type, external)
  type(prod):: p = prod("Luiz",10000)

  print*, p%code, p%name
  call p%upcode(10002)
  print*, p%code, p%name

  contains 
  !   ! nao pode ser interna
  !   ! subroutine upcode(p, code)
  !   !   type(prod):: p
  !   !   integer code 
  !   !   p%code = code 
  !   ! end 
end program main 


! program main 
!   implicit none

!   type prod
!     sequence
!     character(10):: name 
!     integer:: code    
!   end type

!   interface
!   subroutine upcode(p, newcode)
!     import prod
!     type(prod), intent(inout):: p
!     integer, intent(in):: newcode
!   end subroutine
!   end interface

!   type(prod):: p = prod("Luiz",10000)
!   
!   p%name = "luiz"
!   p%code = 10001

!   print*, p%code, p%name
!   call upcode(p, 10002)
!   print*, p%code, p%name

! end program main 

! subroutine upcode(p, newcode)
!   type prod
!     sequence
!     character(10):: name 
!     integer:: code    
!   end type  
!   type(prod), intent(inout):: p
!   integer, intent(in):: newcode
!   p%code = newcode
! end subroutine

