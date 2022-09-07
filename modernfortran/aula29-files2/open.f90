!>
program main 
  implicit none

  integer       :: i, u, num, idade, jogos, io
  character(20) :: nome, posi, clube, cidade
  
  type player
    sequence
    character(20) ::  nome, posi
    integer       ::  idade, jogos
    character(20) ::  clube, cidade
  endtype

  type(player), allocatable :: players(:)


  allocate(player :: players(27))
  
  ! print *, size(players)
  ! read *, players(1)
  ! print *, players(1)

  open(newunit = u, file = './selecao.csv')
    read(u,*, iostat = io) ! pular o título
    do 
      !read(u,*, iostat = io) num, nome, posi, idade, jogos, cidade, clube
      read(u,*, iostat = io) num, players(num)
      if (io /= 0 ) exit
      !print *, num, nome, posi, idade, jogos, cidade, clube 
      print *, num, players(num) 
    end do 
  close(u)
  
  ! players name 
  !print '(*(a,1x))', (players(i)%nome, i=1, size(players)) 
  !print *, players(1:)%nome
  print *, players%nome

  contains 
end 

