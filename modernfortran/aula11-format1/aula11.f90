!>
program main 
  implicit none

  integer :: i = 1, v(4) = 0, j = -100
  real :: f1 = 5.8, f2 = -10.1111, m(5,5)
  character(10) :: ola = "ola mundo"
  logical :: l = .true., lm(5,5) = 1 < 2 
  character(*), parameter :: fmt = '(i4)'

  call random_number(m)

  ! Formataçao de números inteiros:
  print *, "1 ======================="
  print *, i  
  
  print *, "2 ======================="
  ! 2 espaços cada. 
  print '(i2)', i
  ! 12 esp cada 
  print '(i12)', i
  ! 4 esp cada 
  print '(i4)', j 
  ! vc ainda pode definir parâmetros, como fmt,
  ! que é uma string 
  print fmt, j 

  print *, "3 ======================="
  ! Dois espaços cada. 4 por linha 
  print '(4i2)', i, i, i, i 
  print '(4i4)', j, j, j, j 
  
  print *, "4 ======================="
  ! Doias espaços cada. Dois por linha 
  print '(2i2)', v
  
  print *, "5 ======================="
  ! Formatacao automática de inteiros 
  ! 3 por linha. 
  print '(3i0)', i, i, i, i  
  print '(3i0)', j, j, j, j, j 
  ! um por linha 
  print '(i0)', i, i, i, i , j, j, i 
  
  print *, "6 ======================="
  ! ESPACO, TAB e PULAR LINHA
  ! '1x' = 1 espaço  
  print '(i0,1x,i0)', i,i
  ! 't1' = 1 tab
  print '(i1,t1,i1)', i,i

  ! '/' = 1 quebra de linha   
  print '(i0,/,i0)', i,i
  
  ! // = 2 quebras de linha; 3/ = 3 quebras de linha
  print '(i0, //, i0, 3/, i0)', i, i, i
  
  print *, "7 ======================="
  print *, f1, f2 
  print '(f3.1)', f1
  print '(f10.1)', f1
  print '(f7.5)', f1
  print '(2f0.4)', f1, f2

  print *, "8 ======================="
  ! Um por linha 
  print '(f0.4)', f1, f2
  ! Duas por linha 
  print '(2f10.4)', f1, f2

  print '(f6.4,1x,f0.5)', f1, f2
  
  print *, "9 ======================="
  ! Notação científica: e, d, es: 
  print '(e0.4,1x,d0.5)', f1, f1
  
  print '(e13.5,1x,d13.5)', f1, f1
  
  print '(es13.5,1x,es0.5)', f1, f1
  
  print '(2es13.5)', f1, f1

  ! E vc pode misturar tudo
  print '(i2,1x,f4.2)', i, f1

  print *, "10 ======================="
  ! Fator de repetição
  !       |  
  !       V
  print '(1(i3,1x))', i, i, i, i
  print '(2(i3,1x))', i, i, i, i
  print '(3(i3,1x))', i, i, i, i
  print '(4(i3,1x))', i, i, i, i
  print '(*(i3,1x))', i, i, i, i 

  print *, "11 ======================="
  
  ! Vamos printar uma matriz: 
  print *, m 
  print *, "" 
  
  ! Isoo printa 5 elementos, pula linha e printa mais 5.
  ! repete isso ate acabar:
  print '(5f8.5)', m 
  print *, "" 
  print '(5(f0.5,1x))', m 
  print *, ""
  ! vai parecer um vetor assim:
  print '(*(f0.5,1x))', m 

  print *, "11 ======================="
  ! Stringss 
  print *, ola 
  print '(a)', ola
  ! Uma por linha 
  print '(a)', ola, ola 
  ! Duas por linha 
  print '(2a)', ola, ola 
  print '(2a, i)', ola, ola, 1 
  ! Uma string tamanho 4 por linha  
  print '(1a4)', ola 
  ! Duas string de tamanho 4 por linha  
  print '(2a4)', ola, ola

  print *, "12 ======================="
  ! Logical 
  print *, l 
  print '(l)', l 
  print '(5l)', l,l,l,l,l 
  print '(5l1)', l,l,l,l,l 
  print '(*(l,1x))', l,l,l,l,l 
  print *, ""
  print '(5l)', lm
  
  print *, "12 ======================="
  ! label format e função white
  write(*,*) i, j, f1, f2, ola 
  
  !    Label  
  !      |
  !      V
  print 100, i, j, f1, f2, ola 
  
  !    fmt Label  
  !        |
  !        V
  write(*,100) i, j, f1, f2, ola 
  ! Ou usando o nome do argumento 
  write(*, fmt = 100) i, j, f1, f2, ola 
  write(*, fmt = 200) i, j, f1, f2, ola 

  ! vc pode printar dentro do arquivo fort.77
  !  'Unidade': não por ser o número 5 
  !     |
  !     V 
  write(77,*) i, j, f1, f2, ola 
  write(77,100) i, j, f1, f2, ola 
  write(77,200) i, j, f1, f2, ola 
  ! que deve estar dentro seu diretório

  ! OBS: se vc trocar 77 por 24, isso printa 
  ! o resultado da funcao Write dentro do 
  ! arquivo fort.24;

!           +Nao precisa usar string
! label:   '------------------------' 
100 format(i1, 2/, i4, 2f10.4, 1x, a)
200 format(2(i0,1x), 2f0.4, /, a)

end 

