!>
module mod 
  use iso_fortran_env, only: r64 => real64
  implicit none 
contains 
  elemental real(r64) function quadratica(x) result(res) 
    real(r64), intent(in) :: x 
    res = x * x 
  end function  
end module 

program main 
  use mod 
  use iso_fortran_env, only: r64 => real64
  implicit none

  integer i, newunit, stat
  character(*), parameter :: filename = "data.txt"
  real(r64), dimension(201) ::          &
    x = [( i/100.0_r64 , i=-100, 100)], &
    y  

  y = quadratica(x) 

  open(unit = newunit, file = filename, action = 'write')
    write(newunit, '(2f10.5)', iostat = stat) (x(i), y(i), i=1, size(x)) 
  close(newunit)

  if (stat == 0) &
    call execute_command_line("gnuplot -p -e ""plot '" // filename // "'"" ")
end program  
