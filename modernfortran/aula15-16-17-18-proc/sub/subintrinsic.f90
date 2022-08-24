program main 
  implicit none
  integer:: a(3) = 1, b(3) = 2, argv, stat, i, thelen
  integer, allocatable:: x(:), y(:)
  character(50):: argc, env, date*8, time*10
  real:: m(10, 10), tempoinicial, tempofinal
  
  call cpu_time(tempoinicial)
  allocate(x(10)); x = 1 
  argv = command_argument_count()

  do i = 0, argv 
    call get_command_argument(i, argc, length = thelen, status = stat)
    if (stat == 0) print *, argc, thelen
  end do
  
  call get_command(argc)
  call get_environment_variable("PWD", env, status = stat)
  
  print *, argc, env, stat
  
  call execute_command_line("for i in {A..Z}; do echo $i; done")
  call random_number( m )
  
  print "(10(f6.4, 1x))", m
  call move_alloc(x, y)
  
  print *, y, allocated(x); deallocate(y)
  
  call date_and_time(date = date, time = time)
  
  print "(a)", date, time 
  ! subrotina Troca
  print "(3i2)", a, b  ! ANTES
  
  call troca(a, b)
  
  print "(3i2)", a, b  ! DEPOIS
  
  call sub
  call cpu_time(tempofinal)
  
  print *, tempofinal-tempoinicial, "segundos."

contains 
  pure elemental subroutine troca(a, b)
    integer, intent(inout):: a, b 
    integer temp 

    temp = a 
    a = b
    b = b+temp  
  end subroutine troca

  subroutine sub
    print *, "sub"
  end 
end program main 

