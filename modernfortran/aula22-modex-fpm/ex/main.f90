module mod 
  implicit none 
  private 
  public particle, elec

  type, abstract:: particle 
    real:: charge 
    real:: r(3)
    contains 
    procedure(fild), deferred:: E
    !procedure(fild):: B
  endtype 

  type, extends(particle):: elec
    contains 
    procedure:: E => E_field
  endtype 

  abstract interface 
    pure function fild(q, r0)  result(F)
    import particle 
    class(particle), intent(in):: q
    real, intent(in):: r0(3)
    real F(3)
    end 
  end interface 

contains 
  pure function E_field(q, r0) result(E)
    class(elec), intent(in):: q
    real, intent(in):: r0(3)
    real E(3)
    E = q%charge * (q%r-r0) / sqrt(norm2(q%r-r0)) ** 3
  end 
end module 


program main 
  use mod 
  implicit none
  integer i 
  type(elec):: q = elec(-1.0, 0.0 )
  do i = 1, 100
    print "(sp, 3es11.3 :)", q%E([0.0, 0.0, 0.2*i])
  end do 
  contains 
end program main
