program check
  use iso_fortran_env
  implicit none
  integer i
  sp: block
    integer, parameter:: sp = selected_real_kind(1)  ! 1 to 6
    real (sp):: z, x, y 
    x = 10.0
    y = 3.0
    print *, x, y
    z = x/y
    print *, z, sp, z%kind
  end block sp
 
  dp: block
    integer, parameter:: dp = selected_real_kind(7)  ! 7 to 15
    real (dp):: z, x, y 
    x = 10.0
    y = 3.0
    print *, x, y
    z = x/y
    print *, z, dp, z%kind
  end block dp
 
  dp10: block
    integer, parameter:: dp10 = selected_real_kind(18)  ! 16 to 18
    real (dp10):: z, x, y 
    x = 10.0
    y = 3.0
    print *, x, y
    z = x/y
    print *, z, dp10, z%kind
  end block dp10
  
qp: block
    integer, parameter:: qp = selected_real_kind(19)  ! 16 to 33
    real (qp):: z, x, y 
    x = 10.0
    y = 3.0
    print *, x, y
    z = x/y
    print *, z, qp, z%kind
  end block qp
  
  do i = 1, 38
     print *, i, real(i, kind = 4),  selected_int_kind(i), selected_real_kind(i), kind(i)
   end do 

  print *, foo(real(2.0, kind = 8))
  print *, foo(2.0d0)*1.0e0
  print *, 2.0e0*1.0d0

  contains 

  real (8) function foo(x)
    real (8), intent(in):: x
    foo = 2*x
  end

end program check
