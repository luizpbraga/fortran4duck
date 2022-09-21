!>
! - Assumed Type:
!   * 1) Apenas Dummy Arg
!   * 2) Nao pode ser: VALUE, INTENT(OUT), POINTER, ALLOCATABLE
program main 
  implicit none
  ! type(*), pointer :: p !ERROR
  ! type(*) :: p !ERROR

  class(*), pointer :: univp 
  class(*), pointer :: univvp(:) 
  
  real, pointer    :: rp 
  integer, pointer :: ip 
  
  real, target    :: rt 
  integer, target :: it 

  rt = 10.0
  it = 1

  ! podem apontar p qqr pointer/target 
  univp => ip 
  univp => rp 
  univp => rt 
  univp => it 

  ! podem ser alocados 
  allocate(character(10) :: univp)
  allocate(real :: univvp(10))

contains

  subroutine sub(t) ! ,p)
    ! pra que essa merda? 
    ! Declarar interfaces com bind C: *void / *struct + assumed shape(:)/rank(..) arrays, 
    type(*), intent(inout) :: t
    !type(*), pointer :: p ! ERROR: nao pode ser alloc, pointer, value, intent(out) ...
  end 
end 
