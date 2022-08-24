program main 
  implicit none 
  integer i 
  character(*), parameter:: fmt = "(10i4)"
  ! format: i, f, e, d, es, a, l, g 
  print 200, 1, 1.0, "aaaaaaaaaa", .true.
  print 100, 1, 1.0, "aaaaaaaaaa"
  print fmt, [(i, i = 1, 10)]
  
  200 format(i10, 1x, f3.1, 1x, a5, l3 )
  100 format( 3(g0.4, 1x) )
  
  write(*, fmt = "(i3, f5.2)") 1, 1.0  
  do i = 1, 100
    write(20, "(i3, i5)") i, 10*i
  end do 
end 
