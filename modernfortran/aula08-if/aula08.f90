!>
program main 
  implicit none

  ! Seja o valor lógico 
  logical :: cond = 1<2 ! vá para a linha 14

  real :: r(3)
  integer, parameter :: vermelho = 1, azul = 2, preto = 3 
  integer :: cores(3) = [vermelho, azul, preto]              ! pseudo-enum
  integer :: cor 
  integer(2) :: senha, tentativa

  ! Queremos executar alguma tarefa dependendo 
  ! do valor associado à cond. 
  if (cond) print *, "cond é verdadeira"

  ! EXISTE A FORMA DE BLOCO:
  if (size(r) == 3) then 
    print *, "Size==3" 
  else 
    print *, "Size /= 3"
  end if
  
  ! multi-line string 
  print *, "Entre uma Cor: 1: &
      && vermelho, 2: azul, 3: preto"
  !read *, cor 
  cor = vermelho 

  ! LÓGICA TERRÍVEL: NÃO FAÇA ISSO
  if (cor == cores(3)) then 
    print *, "é preto!"
  else if (cor == cores(2)) then 
    print *, "é azul!"
  else 
    ! if's podem ter labels:
    inter: if (cor /= 1) then
      stop "Cor Inválida"
    else
      print *, "é vermelho!"
    end if inter 
  end if

  ! PROGRAMA TOSCO PRA ADVINHAR A SENHA:
  senha = 7 
  do 
  print *, "Advinhe a senha (1-10):"
  read *, tentativa 
  if (tentativa == senha) exit 
  end do 
  print *, "Cê acertou!"

contains 
end 

