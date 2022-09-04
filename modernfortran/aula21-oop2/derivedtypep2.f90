module mod
  private
  public:: a

  type bx; 
  sequence
  endtype 

  type a
    sequence
    type(bx):: b
    integer, private:: paid
    integer, public  :: free
    !integer, protected  :: unknow
    ! defered shape
    integer, contiguous, pointer  :: unknow(:) => null()
  endtype

  contains

end module mod


program main
  use mod
  implicit none

  integer, target:: v(10) = 1
  type(a):: aa


  aa%unknow => v(1:10)
  aa%free = 1

  print *, aa%unknow

  contains
end program main

