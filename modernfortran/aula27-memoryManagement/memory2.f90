!>
program main 
  implicit none

  type mytype
    integer:: a 
    real   :: b 
    character(len = 3), allocatable:: e(:)
  endtype

  type t
    integer i
    real r 
  endtype

  type(t), allocatable:: xa, vxa(:,:)
  type(mytype), allocatable:: c(:)
  type(real), allocatable:: ra1
  real, allocatable:: ra2

  allocate(xa, ra1, ra2, vxa(1, 2))
  vxa(1, 1) = t(1, 1.0)
  vxa(1, 2) = t(2, 2.0)
  deallocate(xa, ra1, ra2, vxa)
  ! Eu preciso alocar explicitamente nesse caso
  !allocate(c(2))
  ! pois tenho campos alocaveis 
  !allocate(c(1)%e(3), c(2)%e(3))

  c = [ mytype(1, 1.0, [character(3) :: '1a', '1b', '1c']), &
        mytype(2, 2.0, [character(3) :: '2a', '2b', '2c']) ]
  !deallocate(c)
 
  print *, c(1)%e
contains 
end 

