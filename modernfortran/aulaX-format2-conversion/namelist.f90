!>
program main 
  implicit none 
  ! Tipo imput formatado, mas ... 
  ! regras:
  ! Nao pode ser array-alloc, pointer, ou qqr obj 
  ! sem tamanho fixo

  integer i, j, k
  namelist /nml1/ i, j, k
  
  real :: r = 1.0, x = 3.0, y = 5.0 
  namelist /rval/ r, x, y  
  
  real :: a, b
  namelist /innml/ a, b

  character(4) :: s
  logical :: l 
  complex :: c 
  real(8) :: d
  namelist /All/ i, r, d, c, l, s 

  integer vi(3), vr(3)
  namelist /vecs/ vi, vr
  
  ! funciona pra herança tb 
  type point 
    integer :: x,y
  endtype 
  type vector
    type(point) :: r
  endtype 
    
  type(point) :: poi 
  type(vector) :: vec
  namelist /pnml/ poi 
  namelist /vnml/ vec

  ! Começando pelo básico:
  ! ======================

  i = 1; j = i; k = j
  
  ! OUTPUT 
  write(*, nml = nml1)
  write(*, rval)

  ! NAMELIST DE INTEIROS/REAIS 
  ! TERMINAL
  ! +=============================+
  ! |&innml a=1.0, b=2.0 /        |
  ! +=============================+
  print *, "Entre &innml: a, b:"
  !read(*, innml)
  write(*, innml)

  ! NAMELIST DE LOGICAL/CHARACTER/COMPLEX/DOUBLE
  ! TERMINAL
  ! +==============================+
  ! |&all i=1 r=10.7 d=3.141593d0  | 
  ! |c=(2.0,3.0) l=.t s="ola" /    |
  ! +==============================+
  ! OBS: não rola notação científica (es, en)
  ! OBS: Use '.t' pra '.true.' e '.f' pra '.false.'
  ! OBS: Você pode pular linhas. A virgula é facultativa.
  print *, "Entre &all: i, r, d, c, l, s"
  !read(*, nml = all) 
  write(*, all)

  ! NAMELIST E VETORES: 
  vi = 1 
  vr = 2.0 
  ! Existem diferentes formas de preenchê-los
  ! TERMINAL
  ! +=================================+
  ! | &vecs vi=1,2,3 vr=1.0,2.0,3.0 / |
  ! +=================================+
  ! TERMINAL
  ! +==========================================+
  ! | &vecs vi(1:3)=1, vr(1)=1.0, vr(2:3)=-1.0 |
  ! +==========================================+
  ! TERMINAL
  ! +==========================================+
  ! | &vecs vi=-1*3, vr=1.0*2, 99.0            |
  ! +==========================================+
  ! 
  !read(*, vecs)
  !
  write(*, vecs)

  ! NAMELIST E USER-DEF-TYPES 
  poi = point(1,2)
  vec = vector(poi)
  ! TERMINAL
  ! +=================================+
  ! |&pnml poi%x=1 poi%y=2            |
  ! +=================================+
  ! TERMINAL
  ! +=================================+
  ! |&pnml poi=1,2                    |
  ! +=================================+
  
  ! TERMINAL
  ! +=================================+
  ! | &vecnml vec&r&x=1, vec&r&y=2    |
  ! +=================================+
  !
  !print*, "Entre &pnml: poi"
  !read(*, pnml)
  !print*, "Entre &vnml: vec"
  !read(*, vecnml)
  write(*, pnml)
  write(*, vnml) 
contains 
end 

