!>

#define foreach(i,j,v) do i=1,size(v);j=v(i)

program main 
  implicit none
  
  integer :: v(10) = 1
  integer i,j
  
  foreach(i,j,v)
    print *, i, j, v(i)
  end do

contains 
end 

