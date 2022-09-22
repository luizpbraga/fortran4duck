!>
! Loop,   
! Loop,   
! Loop,   
! Loop 
program main 
  implicit none
  integer i,j, m(5,5)

  ! Loop simples: i=1 até 10 de 1 em 1..
  do i=1, 10
    print *, i  
  end do 

  ! Range com passado 2. i=1 até 10 de 2 e 2...
  do i=1,10, 2
    print *, i
  end do 

  ! Loop Infinito
  j = 0
  do
    print *, j 
    if (j==10) exit
    ! `exit` é usado para terminar o loop.
    j = j + 1
  end do 

  ! Loop com passo negativo.
  do j=20,10, -1 
    if (mod(j,2) == 0) cycle 
    ! `cycle` é usado pra ir para a proxima interação e 
    ! e ignorar o resto do bloco 
    print *, j 
  end do
  
  do j=20,10, -1 
    if (mod(j,2) /= 0) then 
      ! o `continue` continua kkk
      continue 
    else 
      print *, j
    end if  
  end do

  ! Label 
  l1: do i=1, 10 
    l2: do j=1, 10
      print *, i, j
      m(i,j) = i+j ! Vish!
      ! saindo do loop l1 
      if (i==5) exit l1
    end do l2
  end do l1

  ! Atencão: EU não gosto desse daqui:
  i = 10
  do while (i>5) 
    ! Descomente a linha 61 e vejá a diferença
    print *, i
    i=i-1
    !print *, i
  end do 
  
  ! Implied loops: Só os TOP usando isso 
  !read *, (a(i), i=1,5) 
  print *, ("Ola!",i=1,10,2)
  write(*,*) ((m(i,j),i=1,5),j=1,5)
  
  ! ninjas não usam loops, usam formatação explícita (vídeo 12) 

  ! Loop pra palalelalilazação
  do, concurrent(i=1:10)
    !<CODE>
  end do 
end 

