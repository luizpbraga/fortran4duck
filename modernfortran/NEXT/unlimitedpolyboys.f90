!>
program main 
  implicit none
  
  type T1
    integer i
    real r 
  end type

  type, extends(T1) :: T2
  end type 
  
  class(*), pointer :: x
  
  real,     target :: r = 2.
  integer,  target :: i = 1
  complex,  target :: z = cmplx(1.,-1.)
  character, target :: c
  type(T2), target :: t  
  
  type(T2), pointer :: pt2(:)
  type(T2), allocatable, target :: tt2(:)

  class(*), pointer :: anyp(:)

  !x => r 
  !x => i 
  !x => z
  !x => t
  x => c
  
  select type (x)
    type is (real)
      ! allocate(x) !Pq isso dá erro, Seu Guinu?
      x = 3.
      print *, "real", x
    type is (integer)
      x = 1
      print *, "int", x
    type is (complex)
      x = cmplx(-1.,-1.)
      print *, "cmplx", x
    type is (t2)
    !type is (t1)
    !class is (t1)
      print *, "t2"
      ! print *, x%r, x$i
    class default 
      print *, "NADA"
  end select 

 
  ! Allocate 
  allocate(T2:: pt2(5))
  allocate(T2:: tt2(5))
  allocate(T2:: anyp(2))

  allocate(real:: x)
  allocate(integer:: x)
  allocate(character(10):: x)
  allocate(real:: x)
  
contains 
end 

