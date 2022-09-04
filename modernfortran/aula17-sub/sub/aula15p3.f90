program main 
  implicit none
  
  ! integer:: a = 1, b = 2; 

  integer:: argv, stat, i, thelen 
  !
  !integer, dimension(4):: x = 1, y = 2 
  ! 
  character(70):: argc, allargc, dirAtual
  ! 
  !character:: date*8, hora*10; 
  ! 
   ;character(*), parameter:: &
     PWD = "PWD",            &
     shellCommand = "for i in {A..Z}; do printf $i; done"

  !real t0, tf; 
  !

  ! print *, a, b
  ! call troca(a, b)
  ! print *, a, b
  ! 
  ! print '(4i3)', x, y
  ! call troca(x, y)
  ! print '(4i3)', x, y

  ! ! gotagofast
  ! call cpu_time(t0)

  ! ! outros exemplos 
  ! argv = command_argument_count()
  ! print *, "numero de argumentos:", argv
  ! ! 
  ! Todos os argumentos
  ! call get_command(allargc, length = thelen, status = stat)
  ! if (stat == 0) print *, "Tudo: ", trim(allargc), " e Tamanho:", thelen

  ! um argumento por vez
  ! do i = 1, argv
  !   call get_command_argument(i, argc, length = thelen, status = stat)
  !   !if (stat /= 0) print "('argc(',g0.1, ')=', a, 'size=', g0.1)", i, argc, thelen
  !   print "('argc(',g0.1, ') = ', a, ' e Size = ', g0.1)", i, trim(argc), thelen
  ! end do

  call get_environment_variable("PATH", dirAtual, status = stat)
  if (stat == 0) print *, dirAtual
  ! -1:: char mt curto
  ! 2:: nao exite

  ! call execute_command_line(shellCommand)
  ! !  
  ! call cpu_time(tf)
  ! print*, tf-t0, "seguntos."

  ! call date_and_time(date = date, time = hora)
  ! print "(a)", date, hora

contains 

!   subroutine troca(a, b)
!     integer, intent(inout):: a, b
!     integer:: c
!     c = a 
!     a = b 
!     b = c 
!   end
 end program main 
