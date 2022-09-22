!>
program main 
  implicit none

  ! Inicialização Top
  b1: block
    integer k 
    integer :: i(4), j(4), w(10,10)
    real    :: a(4), m(2,2), x(10)
    complex :: c(2)
    logical :: l(3)
    character(4) :: s(2)

    data a / 1., 2., 3., 4. /
    data c / (1., 2.), (3., 4.) /
    data m / 1., 2., 3., 4. /
    data l / .true., .true., .false. / 
    data s / "1234", "56" /
    data i(1), i(2), i(3), i(4) / 0, -1, -1, -1 /
    data j(1), j(2:4) / 0, 3 * -1 /
    data x / 0., 0., 8 * -69. /
    data (w(k,k),k=1,10) / 10 * -1 / 

    !print *, ?
    print '(10i3)', w

  end block b1
contains 
end program  

