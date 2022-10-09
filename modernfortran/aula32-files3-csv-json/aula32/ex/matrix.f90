

program main 
  implicit none
      
  integer i, j, io
  real:: v(20,20) = reshape([1:400], [20,20], order = [2,1])
 
   write(10,'(20(f10.2,1x))') (v(i,:), i=1, 20)

  open(10, file = "./fort.10") 
      read(10, *) v 
  close(10)

end 

