!>
!> Como converter CHARACTER pra QUALQUERCOISA ?
program main 
  implicit none
  ! mao funciona com parameter 
  character(8)  :: buffer1 = "1 10 100" 
  character(15) :: buffer2 = "1.0 10.0 100.0" 
  character(29) :: buffer3 = "-99.0 666 3.149215 ola mundo"
  character(29) :: buffer4 = "-99.06663.149215ola mundo"
  character(20) :: buffer5 = " 0 1 2 3 4 5 6 7 8 9"
  character(:), allocatable :: buff 

  integer      :: i, size 
  integer      :: i1, i2, i3, i4, vi(10), mi(10,10)
  real         :: r1, r2, r3, r4, r5
  character(9) :: a1 
  
  inquire(file = "modernfortran/aulaX-format2/fort.10", size =size)
  allocate(character(size) :: buff)
  
  open(unit=10, file = "modernfortran/aulaX-format2/fort.10",&
       action = "read", access = "stream")
  read(10) buff
  close(10)

  !write(10, '(10i4)') (i, i=1, 100)

  read(buffer1, 10) i1, i2, i3
  10 format(i1, 1x, i2, 1x, i3)
  print 10, i1, i2, i3

  read(buffer2, 20) r1, r2, r3
  20 format(f3.1, 1x, f4.1, 1x, f5.1)
  print 20, r1, r2, r3

  !read(buffer3, 30) r4, i4, r5, a1 
  !30 format(f5.1, 1x, i3, 1x, f8.6, 1x, a9)
  !print 30, r4, i4, r5, a1 

  read(buffer4, 30) r4, i4, r5, a1 
  30 format(f5.1, i3,f8.6, a9)
  print '(g0)', r4, i4, r5, a1 

  read(buffer5, 40) vi 
  40 format(10i2) 
  print 40, vi 
  
  read(buff, 50) mi
  50 format(*(10i4,1x)) 
  print '(10i4)', transpose(mi) 
  !print *, mi(1,:)

end 

