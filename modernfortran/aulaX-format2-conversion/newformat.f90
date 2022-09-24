!>
program main 
  implicit none

  print 100,     1, -10, 100,        1.54,      1.54,     1.54,     1.54,      1.03,     " ""Oi vc"" "

  100 format(sp, 3(i0, 1x) , 2/, ss, f0.5, 1x, es0.5, 1x, e0.5, 1x, d0.5, // , f0.2, //, "Uma frase:", a)

  print 200, 3.14, 3.14

  200 format(dc, g0.5, 1x, dp, g0.5)

  print '(i0/i0/i0)', 1,2,3
contains 
end 

