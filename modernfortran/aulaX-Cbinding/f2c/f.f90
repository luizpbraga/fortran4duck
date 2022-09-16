! VALUE => TYPE 
! INTENT(INOUT) => *TYPE 

! n use array(:)

function add(a,b) result (res) bind(c)
  use iso_c_binding
  integer(c_int), value :: a, b 
  integer(c_int) :: res
  res = a+b  
end function 

subroutine swap(a,b) bind(c)
  use iso_c_binding
  integer(c_int), intent(inout) :: a, b  ! a,b sao ponteiros em C
  integer :: t 
  t = a 
  a = b
  b = t 
end subroutine swap


function soma3(a) result(res) bind(c)
  use iso_c_binding
  integer(c_int), intent(in) :: a(3)
  integer(c_int) :: res 
  res = sum(a) 
end function 

subroutine show(a,b,c, p) bind(c)
  use iso_c_binding
  integer(c_int), intent(inout) :: a, b, c(3)
  integer(c_int)  :: p

  p = -99 
  ! NOT : print *, a, b, c
  c = [0, a, b]
end 

subroutine hm(a,f) bind(c)
  use iso_c_binding
  integer(c_int), intent(inout) :: a(2,3)
  integer(c_int) :: f(:)
  ! como retornar um array alocado? 
  a(1,:) = -1
  a(2,:) = 1
  ! seg f = 1
end 
