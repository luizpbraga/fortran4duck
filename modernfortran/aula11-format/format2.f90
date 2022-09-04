program format
  implicit none 
  ! formatacao de Escalares
  ! i, a, f, d, e, es, g, l, x, /, 
  integer     :: i = 1, j = 100, k = -1
  real        :: x = 1.0, y = 3.14, z = -666.666
  character(5):: s1 = "Luiz", s2 = "12", s3 = "123456"
  complex:: c = (1.0, 1.0) 
  include "file.f90"

  print *, file_x
  
  print "( '(', f6.4, ',', f7.4, ')' )", c
  print "(i0)", i, i, 10, 10000, huge(1), -1 
  print "(4f0.4)", 10.0, 100.0, huge(1.0), 0.057
  print "(d10.3)", z 
  print "(e10.3)", z 
  print "(es10.3)", z
  print "(a)", s1, s2

  print "(a, i2)", "OLA:", 1
  print '("OLA:", i2)', 1
  

end 
