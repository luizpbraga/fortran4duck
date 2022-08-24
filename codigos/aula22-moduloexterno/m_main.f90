

module mod 
  implicit none
  private 
  public:: name, pi 

  real, parameter:: pi = 4.0*atan(1.0)

  contains
    subroutine name(x) 
      integer, intent(in):: x 
      print *, x   
    end subroutine name
end module mod 

