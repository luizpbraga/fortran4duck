program main 
  implicit none
  integer(kind = 16) i 
  print *, foo(5), foo(5, 1) & 
  poly(x = 1.0, b = 1.0, c = 1.0, a = 1.0), some(2, 2, 1)
  do i = 0, 34
    print *, i, fat(i)
  end do 

contains     
  recursive function fat(n) result (f)
    integer (kind = 16) ::  f, n 
    if ( n <= 1) then 
      f = 1
    else 
      f = n*fat(n-1)
    end if 
  end function fat 
  elemental function some(x, y, op)
    integer some 
    integer, intent(in):: x, y
    integer, intent(in), optional:: op 
    if (present(op)) then 
      some = x+y
      return 
    end if
    some = x**2 + y**2
  end function some 
  function poly(x, a, b, c) result (y)
    real:: x, y, a, b, c 
    y = a*x**2+b*x+c  
  end 
  function foo(x, op) result(res)
    integer res
    integer x 
    integer, optional:: op 
    if ( present(op) ) then 
      res = x+op 
    else 
      res = -x 
    end if
  end function foo
end program main 
