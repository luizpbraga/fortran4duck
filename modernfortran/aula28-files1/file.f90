!> ARQUIVOS! FILE I/O

program main 

  use iso_fortran_env, only: &
    stdin => input_unit, &
    stdout => output_unit, &
    stderr => error_unit

  implicit none

  integer      :: i, opt = 1
  character(*), parameter:: fmt = '(a)'
  real :: x 
  character(10) :: c

  select case (opt)
  case(1)
    write(*,fmt, advance = 'no')  "   write disse olá"
    print *,    "1: print disse olá"

  case(2)
    print fmt,   "2: print disse olá"
    write(*,fmt) "  write disse olá"

  case(3)
    print 100,   "3: Vc já entendeu"
    write(*,100) "   Desculpa ser repetitivo"

  case default
    ! read(5,'(i2)')  i
    ! write(6,'(i2)', advance = 'no') i
    !   #mesmamerda
      read(stdin,*)  i
      write(stdout,*) i, stdin, stdout
  end select

  !>
  
  !write(50, '(i2, 1x, i3, 1x, a, /)') (i, 2*i, "alguma coisa", i=1, 77)

  !>  Caso simples
  !   func open, close
  



  !print *, i, j, k  
  !! OPEN   
  open(13, file = './test.dat')
    read(13, *) i, x, c
  close(13)
  
  open(17, file = './output.dat')
    write(17, *) i, x, c 
  close(17)
  !print *, i, x, c
  !!   format sempre de castigo
  100 format(a)
  !! formataćão não previne macaquice:
  200 format(/,i1,1x,f3.1,1x,a3)

end program  
