!>
! Exemplo simples
module mod_abstract 
  ! Vamos criar uma 'base type', como o objetivo de 
  ! ser um pilar para algum objeto.
  ! Ela contem as propriedades/caracteristicas, mas nao 
  ! é o objeto 
  implicit none

  integer, parameter :: k = selected_real_kind(15)

  private 
  public :: myabstype, mytype

  ! abstract(type/interface) + deferred 
  type, abstract :: myabstype
    integer :: f1
    real :: f2
  contains 
    ! *Lembre-se do polimorfismo =======|
    !              *keyeord ==|         |
    ! *Interface ==|          |         |
    !              V          V         V
    procedure(proc_inter1), deferred, nopass :: proc_name1
    procedure(proc_inter2), deferred, pass   :: proc_name2
  end type
  ! A interface vai limitar o seu objeto
  abstract interface
    ! nao polimorfica 
    subroutine proc_inter1(x) 
      import :: k
      real(kind = k), intent(in) :: x
    end subroutine
    ! polimorfica 
    subroutine proc_inter2(x)
      ! REGRA: precisa do "import :: <abstract_type_name>
      import :: myabstype
      class(myabstype), intent(in) :: x
    end subroutine 
  end interface 

  ! REGRA: as instâncias da classe abstrata precisam 
  ! ser definidar dentro do modulo. PQ??? 
  ! pq "constains" detro de typos sao "modules precedures"
    type, extends(myabstype) :: mytype 
    contains 
      ! Os nomes das proc precisam ser os mesmos declarados na abstype
      procedure, nopass :: proc_name1 => p1
      procedure :: proc_name2 => p2
    end type 

  contains
    subroutine p1(x) 
      real(k), intent(in) :: x
      print *, x
    end subroutine 

    subroutine p2(x) 
      class(mytype), intent(in) :: x
      print *, x%f1
    end subroutine
  end module mod_abstract 


  program main 
    use mod_abstract
    implicit none

    type(mytype) :: t = mytype(1, 1.0)

    print *, t%f1, t%f2

    call t%proc_name1(1.0d0)
    call t%proc_name2()
end program main 

