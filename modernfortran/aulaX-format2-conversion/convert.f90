program main 
  implicit character(10) (c)

  pi   = acos(-1.0)
  e    =  exp(1.0)
  hbar = 6.62606896e-11
  umano = 365.5 
  i = 1
  j = 666
  k = -69

  ! num -> character 
  write(ci, "(i1)") i
  write(cj, "(i3)") j
  write(ck, "(i3)") k
  print *, ci, cj, ck, len(ci)
  
  write(cpi,   "(f5.3)") pi
  write(chbar, "(es7.1)") hbar
  write(ce,    "(f6.4)") e 
  write(cumano, "(f5.1)") umano
  print "(*(g0.7, /))", cpi, ce, chbar, cumano, len(cpi)

  ! char -> num 
  c1 = "1"
  read(c1, *) i1 
  print *, i1 

  c2 = "100"
  read(c2, *) i2 
  print *, i2 

  c3 = "100.0"
  read(c3, *) r3 
  print *, r3 

  c4 = "-3.0E10" ! D ou E
  read(c4, *) r4 
  print *, r4 

  c5 = "-3.14159265"
  read(c5, "(f11.8)") r5 !*
  print *, r5

  c6 = "1 2"
  read(c6, *) i61, i62
  print *, i61, i62

  c6 = "3 4"
  read(c6, "(2(i1, 1x))") i61, i62
  print *, i61, i62


  open(newunit = iunit, file = "test.txt")
  read(iunit, "(i1, 1x, i1)") i1, i2 
  close(iunit)
  print *, i1, i2


  cv = "123455"
  print *, ichar(cv(1:1))
  print *, (char(i) // " ", i = 48, 57)
  print *, str2i("-123")
 !  123! .! 2 => 123+2 / 10
contains 

function str2i(str) result (j)
  character(*), intent(in):: str
  character(len = len_trim(adjustl(cv))):: cv
  integer i, j, k 
  j = 0
  k = 1 
  cv = trim(adjustl(str))
  if (cv(1:1) == "-") k = 2
  do i = k, len_trim(adjustl(cv))
      j = j +  (ichar(cv(i:i)) - 48) * 10**(len_trim(cv(i:))-1)
  end do
  if (cv(1:1) == "-") j = - j
end function str2i
end program main 

