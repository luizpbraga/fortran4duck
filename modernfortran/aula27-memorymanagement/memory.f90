

program main 
  use mod
  implicit none (type, external)

  ! ===============================================

  part0: block
    integer, allocatable:: v(:), i
    ! alloc auto:
    i = 0
    ! bug gfortran, some se eu faco i = 1 kkk 
    v = [9, 9, 9]
    !v = [v, 0, (3, 3, i, i = 1, -10, -1), 0, 0]
    print *, v
  end block part0

  ! ================================================

  part1 : block
     ! size specified during exec.
     integer (kind = 4), allocatable, dimension(:):: v, w  ! nao pode ser inicializado
     integer:: n = 2, i, allocstat 
     character(60):: allocerrsmg
    
     ;allocate(v(1000))
     !allocate(v(0))
     ;deallocate(v)  
    
     ! Allocar mais de 1 arr:
     ;allocate(v(0:n+1), w(4))
     ;deallocate(v, w)
    
     !;allocate(w(100))
     ! stat is present ? y: job nao aborta
     ! stat is present ? n: job aborta

     ;allocate(v(1), w(101), stat = allocstat, errmsg = allocerrsmg)
     ;if (allocstat /= 0) error stop "Erro ao allocar: " // allocerrsmg 
     ;deallocate(v, w, stat = allocstat)
     ;if (allocstat /= 0) error stop "Erro ao desalocar: " // allocerrsmg

     allocate(v(10))
     allocate(v(100), stat = allocstat, errmsg = allocerrsmg)
     print '("status: ", i5, /, "err: ", a)', allocstat, allocerrsmg
     print '("size(v) = ", i2)', size(v) 
     
     ! alloc automatica (SAME RANK):
     v = [9, 9, 9, (0, 0, i, i = 1, 8)]
     print *, v, allocated(v)
    
     v = [99]
     print *, v, v(1)
    
     v = [integer ::]
     print *, v
    
    if (allocated(v)) deallocate(v)  ! Free the Fuckin' memory! 
    deallocate(v, stat = allocstat, errmsg = allocerrsmg)
    print '("status: ", i5, /, "err: ", a)', allocstat, allocerrsmg

  end block part1
  
  ! ==================================================

  part2 : block
     ! size specified during exec.
     integer (kind = 4), allocatable, dimension(:):: v1, v2  ! nao pode ser inicializado
     integer  :: w(5) = [1, 2, 3, 4, 5] 
    ! clone
     allocate(v1, source = w)
    print *, size(v1) == size(w), v1 == w
    ! tamanhos iguais, same bounds 
    allocate(v2, mold = w)
    print *, size(v2) == size(w), v2 == w
  end block part2

  ! =================================================

  part3: block 
  type:: mytype
    integer:: a 
    real   ::b 
    character(len = 3), allocatable:: e(:)
  endtype
  
  type t
    integer i
    real r 
  endtype

  type(t), allocatable:: xa, vxa(:,:)
  type(mytype), allocatable:: c(:)
  
  ;type(real), allocatable:: ra1
  ;real, allocatable:: ra2
  
  ;allocate(xa, ra1, ra2, vxa(1, 2))
  vxa(1, 1) = t(1, 1.0)
  vxa(1, 2) = t(2, 2.0)
  ;deallocate(xa, ra1, ra2, vxa)
  
  ! Eu preciso allocar explicitamente nessa caso
  ;allocate(c(2))
  ! pois tenho campos allocaveis 
  ;allocate(c(1)%e(3), c(2)%e(3))

  c = [ mytype(1, 1.0, [character(3) :: '1a', '1b', '1c']), &
        mytype(2, 2.0, [character(3) :: '2a', '2b', '2c']) ]
  !deallocate(c)
  end block part3

  ! ===========================================

  part4: block
  
  integer i
  do i = 1, 3
    call on_exit_auto_dealloc(i)  ! no save
    call saved_on_module(i)  ! save: mesmo array em cada chamada
  end do 
  end block part4
  ! vivo no programa principal
  print *, modulevec
  
;contains 
  subroutine on_exit_auto_dealloc(i)
    implicit none
    integer, intent(in):: i
    ! valor de a n fica salvo
    !integer, allocatable, save:: a(:)  ! so uma aloc, dai ele salva
    integer, allocatable:: a(:)
    if (i == 1) a = [5, i, 3, i, 1]
    if (allocated(a)) print "(i2, 1x, 5i2, :)", i, a
  end

  subroutine saved_on_module(i)
    ! se o vec é definido no modulo, ele recebe o save
    implicit none
    integer, intent(in):: i 
    if (i == 1) modulevec=[100, i, 300, i, 500]
    if (allocated(modulevec)) print "(i2, 1x, 5i3, :)", i, modulevec
  end 
end program main 


;module mod 
  implicit none 
    integer, allocatable:: modulevec(:)
end 
