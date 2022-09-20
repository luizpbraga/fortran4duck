module mod
  implicit none 
  type:: T
  integer:: i 
  contains 
    ! procedure, private:: add => addT
    ! generic:: operator(+) => add
    procedure, private:: addT
    generic:: operator(+) => addT
end type 

contains 
  type(T) function addT(t1, t2) result(t3)
  class(T), intent(in):: t1, t2
  t3%i = t1%i+t2%i
end function  
end module 

program main 
  use mod
  implicit none (type, external)

  type, extends(T):: S 
  endtype 
  
  type(T):: t1, t2, t3
  type(S):: s1, s2, s3
  
  t1%i = 1
  t2%i = 1
  s1%i = 1
  s2%i = 1
  t3 = t1+t2
  !s3 = s1+s2
  write(*,*) t3%i

  contains 
end program main 

! overload simples
! module mod
!   implicit none 
!   type:: T
!   integer:: i
! end type 
! interface operator(+)
!   procedure:: addT
! end interface
! contains 
! type(T) function addT(t1, t2) result(t3)
!   type(T), intent(in):: t1, t2
!   t3%i = t1%i+t2%i
! end function  
! end module 

! program main 
!   use mod
!   implicit none (type, external)
!   
!   type(T):: t1, t2, t3
!   
!   t1%i = 1
!   t2%i = 1
!   t3 = t1+t2
!   write(*,*) t3%i

!   contains 
! end program main 

