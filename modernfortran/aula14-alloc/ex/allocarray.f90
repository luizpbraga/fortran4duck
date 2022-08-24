
! Arrays Dina^micos  
module mod 
  integer, allocatable:: arr_mod(:)
end 
program main 
  use mod 
  implicit none
  integer i, stat 
  integer, dimension(10):: v
  integer, allocatable, dimension(:):: x, y, z, w 
  
  v = [(i, i = 1, 20, 2)]
  print "(10i3)", v, size(v)
  ! allocacacao implicita 
  x = [1]
  y = v
  print *, x, y
  allocate(z(10), w(10), stat = stat)
  if (stat /= 0 ) stop "Erro na alocacao"
  z = 1
  w = 0
  print *, z, w
  z = [99]
  print *, z  
  deallocate(x, y, z, w)
  
  call name
  arr_mod = [1]
  print *, arr_mod
  call name
  print *, arr_mod

contains 
  subroutine name()
    use mod
    print *, arr_mod, "."
  end subroutine name
end program main 

