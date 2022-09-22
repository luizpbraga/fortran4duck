!         + ⇨ Nome Do Seu Program
!         ⇩
program main 
  ! Sem o `implcit none`, as variáveis de 'i' a 'n' são 
  ! declaradas inteiras automaticamente. As demais,  de 'a' a 'h' e 'o' a 'z', 
  ! são declaradas reais. 
  ! Evite declaração EXPLÍCITA, use IMPLICIT NONE! 
  implicit none
 
  ! Em fortran, variáveis podem ser declaradas 
  ! 'integer', 'real', 'character(len=*)', 'logical' e 'complex' 
  ! Veja os exemplos: 
  integer i
  integer :: i2 = 1
  ! Você pode declarar mais de uma variável por vez:
  integer :: i3 = 3, i4 = 4 
  ! Note que, ao declarar E inicializar uma variável, é necessário 
  ! usar os "::" (dois-pontos-dois-pontos?)

  ! Vamos declarar alguns números reais:
  real r1 
  real :: r2 = 3.0 
  real :: r3, r4 = 4. ! Note a precença do "." para 
  ! diferenciar de um número inteiro.
  
  ! `Character` são conhecidos como `Strings` em outras linguagens. 
  ! Em Fortran, os characters podem receber um ~COMPRIMENTO~
  ! chamado de `len`
  character s1             ! s1 tem comprimento 1   
  character(len=10) s2     ! s2 tem comprimento 10 
  character s3*10          ! s3 tem comprimento 10. Note: Essa é outra forma de declarar.
  ! Vamos incializar:
  character(len=10) :: s4 = "Ola Mundo", s5*3 = "ola" 
  
  ! Fortran tem suporte para números complexos 
  complex c1 
  complex :: c2 = cmplx(1.0, -1.0) ! c2 = 1-i 
  
  ! Os valores lógicos são .true. e .false. 
  logical l1 
  logical :: l2 = .false. .or. .true.

  ! Você pode declarar valores com diferentes 'kind', 
  ! que indica a quantidade de memória que a variável receberá. 
  ! Quando maior o `kind`, mais memória e maior será a precisão
  ! do seu Número. Veja a aula 27 para mais informações. 

  integer(kind=2) :: ik2 = 1
  real (kind=8)   :: rk8  = 1.0d0/3.0d0
  character (kind = 1, len = 2) :: sk1

  ! Operadores numéricos (integer, real, complex) 
  print *, 1 + 2,  3. - 3., 5 * 5, 1. / 3. , 5.0 ** 2
  print *, 1 == 1, 1 /= 1, .not. 0 == 0 
  print *, 3 < 5, 3 > 5
  print *, 3 <= 5, 3 >= 5
  ! Operadores lógicos
  print *, .true. .and. .false.,  .true. .or. .false.
  print *, .true. .eqv. .false.,  .true. .neqv. .false.
  print *, .not. .false.
  ! Operador de concatenação (Strings) 
  ! Mais infos sobre strings na aula 12
  print *, s4 // s5
  print *, s3 < s5, s3 > s5
  print *, s3 <= s5, s3 >= s5
  print *, "a" == "a" 

!!! Note que você prode terminar seu programa usando:
!end
!!! ou 
!end program 
!!! ou ainda 
end program main 
!            ⇧ 
!            + ⇨ nome do programa 

