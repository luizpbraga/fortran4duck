!>
program main 

  implicit none
  
  integer i
  ! A declaraçao é identica a uma variável 
  ! escalar, mas com um pequeno detalhe ...
  integer :: v(10)
  integer :: vi(3) = 1
!               |
!               +--> Pequeno detalhe
  ! Aqui foi declarado um vetor inteiro de 3 dimensões: vi = [1,1,1]
  ! e outro de 10: v = [?,?,?,?,?,?,?,?,?,?]
  ! Note que Fortran vetoriza as expresões pra você
  print *, vi 
  
  ! Usando a função `size` podemos determinar o tamanho de um vetor:
  print *, "size:", size(vi) 
  ! Vamos mudar o valor do último elemento pra 99 
  vi = [1, 1, 99] 
  ! Essa é a notação para declarar elemento por elemento; 

  ! Podemos usar a sequinte notação para mudar o valor 
  ! da primeira componete pra -69
  vi(1) = -69 
  ! E que tal mudarmos os a segunda componete para 666?
  vi(2) = 666 
  ! Munto simples!
  ! Vamos printá-las usando a notação de index:
  print *, vi(1), vi(3) 
  ! E agora usando a notação de subarrays:
  print *, vi(1:3) 
  print *, vi(3:1:-1)
  
  ! Vamos inicialiar o vetor 'v' usando a notação de range:
  v = [(i,i=1,10)] ! nao esqueça de declarar 'i'
  print *, "Vetor v:",v
  ! Vamos ver seus elementos pares: 
  print *, "Elementos pares:",v(2:size(v):2)
  ! Incrivel!
  ! v = [1,2,3,4,5,6,7,8,9,10] 
  
  ! Vamos mudar os elementos 8,9 e 10 de uma única vez para 
  ! -1, -2, -3, respectivamente:
  v([8,9,10]) = [-1,-2,-3]
  ! |
  ! +--> ATENçÃO!!! v([...])
  print *, v
  ! vamos usar 'vi' para modificar 'v'
  v = [vi, v(4:)]
  ! Sim! Podemos concatenar vetores!! Os primeiros 3 (size(vi)) elementos 
  ! são justamente os elementos de 'vi'. Os últimos são de 'v(4)' até 'v(size(v))' 
  print*, v
  ! Um exemplo aleatório: 
  print *, "Concat:", [1,1,[2,2], [3,3,3], [4,[1,1]]]

  ! Vamos mudar v completamente:
  v = [0, 0, vi, (i,i=0,9,2)]
  ! Os 2 primeiros elementos são nulos, os próximos 3 são idênticos 
  ! aos elementos do vetor 'vi' e os últimos 5 são [(i,i=0,9,2)] == [0, 2, 4, 6, 8] 
  print *, v
  print *, v == [0,0,vi,0,2,4,6,8]
  ! Vamos tornar dos os elementos ímpares de v iguais a -1:
  v([(i,i=1,size(v), 2)]) = -1
  print *, v 
  ! Tudo isso vale para os outros data-types discutidos na aula 02;
  ! Acha que acabou? NAO! HEHE NUNCA!
end program main 
