
program main 
  implicit none (type, external)

  !integer, external:: add, sub 
  !procedure(integer):: add, sub

  abstract interface 
  elemental function some(v1, v2) result (res)
    implicit none 
    integer, intent(in):: v1, v2
    integer res 
  end 

  elemental function outra(v1) result (res)
    implicit none 
    integer, intent(in):: v1
    integer res 
  end 
  end interface 

  procedure(some):: add, sub, mul
  procedure(outra):: ex2
  print *, add(1, 1), sub(1, 1), mul(1, 1)

end program main 


elemental function add(x, y) result (res)
  implicit none 
  integer, intent(in):: x, y
  integer res 
  res = x+y
end 

elemental function sub(x, y) result (res)
  implicit none 
  integer, intent(in):: x, y
  integer res 
  res = x-y
end 

elemental function mul(x, y) result (res)
  implicit none 
  integer, intent(in):: x, y
  integer res 
  res = x*y
end 

elemental function ex2(v1) result (res)
  implicit none 
  integer, intent(in):: v1
  integer res
  res = v1
end 
