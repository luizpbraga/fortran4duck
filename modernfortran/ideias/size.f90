!>
program main 
  implicit none
  integer(kind=8) :: name(100,100)
  integer :: v(4) = 0
  print *, storage_size(name), size(name)

  print *, 1.0
  
  print '(2f0.4)', 1.0, 2.0
  print '(es0.4)', 1.0
  print '(e0.4)', 1.0
  print '(es10.4)', 1.0
  print '(es10.4)', 1.0
  print '(i0)', 1
  print  '(a)', 'a' 
  print  '(l)', .true.
  print '(sp, 2d0.4, 1x, ss, e0.4, :)', 1.0, -1.0, 9.0, 2.0, -2.0, 8.0

  print '(sp, 5x ,2i0, 1x)', v

end 

