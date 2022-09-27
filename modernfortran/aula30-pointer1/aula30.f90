!> Exemplos simples 

program main 
  implicit none
  ! pointers (alias): uma variável 
  ! que aponta dinamicamente [!] 
  ! pra outra variável
  ! container: type, kind, rank, extends, &...

    100 format(2i3)
    200 format(3i3)

  intro: block
    ! DECLARAÇÃO:
    integer, pointer :: p1
    integer, pointer :: p2 => null()
    integer, target  :: t1 = 0, t2

    !! Um ponteiro tem 3 estados:
    !!! 1. undefined,
    !!! 2. null,
    !!! 3. associated,

    ! POINTER ASSIGNMENT: '=' != '=>'
    print *, "p1 é alias de t1"
    !p1 = 1 ! segfault ! 

    p1 => t1 !  p1 é alias de t1  
    p1 = 1

    print 100, p1, t1 

    t1 = -1 
    print 100, p1, t1 

    print *, "p1 é alias t2"
    p1 => t2
    ! 1 ponteiro só pode ter 1 único alvo
    ! p1 foi desassociado de t1 
    ! p1 é 1 álias de t2
    ! i.e, o valor de t1 não é perturbado 
    p1 = 10 
    print 200, p1, t2, t1

    t2 = -10 
    print 200, p1, t2, t1  

    print *, "Exemplos:"
    
    !call exemplo1
    call exemplo2

    ! associated && nullify
    if ( associated(p1) ) &
      nullify(p1)

    if ( associated(p2, target = t1) ) &
      nullify(p1)

  end block intro 

  tips: block
    integer, parameter :: r64 = kind(0.d0)

    integer, pointer :: pi
    real, pointer :: pr
    real(r64), pointer :: pr8

    character(6), pointer :: pc 
    character(10), target :: tc = "Neymar Jr"

    ! pointer + DT
    type :: Foo
      integer :: i = 1
      real :: r = 0.0
    endtype

    type(foo), pointer :: pf 
    type(foo), target  :: tf 

    !pc => tc 
    pc => tc(1:6) 
    !pr => pr8

    pf => tf 

    pi => tf%i
    pr => tf%r

  end block tips

  print*, "bloco b1: array"
  b1: block
    ! UM ALVO PODE TER MAIS DE 1 PONTEIRO ASSOCIADO 
    ! OU
    ! ponteiros diferentes podem apontar pro mesmo alvo 
    integer, target :: t(3)
    integer, pointer, dimension(:) :: p1, p2

    t = 0
    p1 => t 
    p1(1) = 1
    print 200, t

    p2 => t 
    p2(1) = -1
    print 200, t

    p1 = 10  
    print 200, t

    p2 = -10
    print 200, t

    t = 9
    print 200, p1
    print 200, p2

    if (associated(p1) .and. associated(p1)) &
      nullify(p1, p2)

  end block b1

  print*, "bloco b2: ponteiro=bagunça"
  b2: block
    ! UM PONTEIRO PODE APONTAR PRA 1 PONTEIROS ou 1 ALVO
    ! OBS: Shallow COPY
    
    integer, target, dimension(3) :: t
    integer, pointer, dimension(:) :: p1, p2

    t = 0 
    p1 => t 
    !!! CÓPIA DE DADOS
    p2 => p1 
    p2 = -1 ! p1 e t são modificados
    print 200, t, p1, p2
    ! HOLY COW 
    p1 = 1 
    print 200, t, p1, p2
    ! NINGUÉM SOLTA A MÃO DE NINGUÉM
    t = 99
    print 200, t, p1, p2

    if (associated(p1) .and. associated(p1)) &
      nullify(p1,p2)

  end block b2

contains 

  subroutine exemplo1
    !!! obj: fazer a = b sem fazer a = b 
    integer, pointer :: p1, p2 
    integer, target :: a=1, b=2 

    p1 => a ! p1 = a 
    p2 => b ! p2 = b

    p1 = p2 ! a = b ie, p1 = b

    p2 => p1 ! p2 = p1 ie, p2 = b 

    print *, "exemplo1:"
    print 100, a, b 
    print 100, p1, p2

    100 format(2i3)
    end 

    subroutine exemplo2
      integer, pointer :: p1, p2, p3
      integer, target  :: a=2, b=3, c

      print *, "exemplo2:"
      p1 => a 
      p2 => b 
      p3 => c 

      c = a*b 
      print 100, c, p3 

      p2 => p1  
      print 100, b, p2

      a = c 
      print 200, a, p1, p2, c

      a = 99
      print 200, a, p1, p2, c 

      p2 = -1
      print 200, a, p1, p2, c 

      p1 = 0 
      print 200, a, p1, p2, c
      
      100 format (2i3) 
      200 format (4i3) 
      end

    end program main  

