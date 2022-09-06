!>
program main 
  implicit none
  
  character(:), allocatable :: s 
  ! * valores específico 6
  write (unit = *, fmt = *)
 
  ! tamanho de S é preservado  
  ! s&len = 0
  !call chama(s) ! isso da erro

  s = "1"
  ! s%len = 1
  call chama(s)
  ! isso printa "o"
  s = "xxxxxxxxxxxxxxxxxxx"
  call chama(s)
  print*, s%len

  ! funcao que recebe um char allocavel 
  s = "1"
  ! s%len = 1
  call chama2(s)
  ! isso printa "o"
  s = "xxxxxxxxxxxxxxxxxxx"
  call chama2(s)
  print*, s%len

contains 
  
  subroutine chama(input)
   character(len=*), intent(inout) :: input 
   input = "ola mundo"
   print *, input, input%kind, input%len
  end subroutine chama

  subroutine chama2(input)
   character(len=:), allocatable, intent(inout) :: input 
   input = "ola mundo"
   print *, input, input%kind, input%len
  end subroutine chama2

end 

