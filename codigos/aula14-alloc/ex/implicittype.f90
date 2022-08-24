module mod 
  type pp 
    integer i 
  endtype

  type, public:: vec
    real:: x, y, z 
  contains
    procedure foo
  ;endtype
  contains 
    function foo(self) 
      class(vec), intent(in):: self 
      real:: foo
      foo = self%x+self%y+self%z
    endfunction 
end module mod 

program main
  use mod 
  implicit type(pp) (p), complex (kind = 16) (x, c)
  !implicit integer (i-k)

  type(vec):: self = vec(1.0, 2.0, 3.0)
  
  r = 0.9
  x = 1
  i = 1
  p = pp(111)
  r = self%foo() 
  print "(es15.5, l, 5x, a)", r, .true., "aaaaaaaaaaaaaaaaa" 
  
  contains
end program main 

