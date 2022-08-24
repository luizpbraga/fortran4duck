program main 
  implicit none (type, external)
   
  interface 
  function sin(x)
    implicit none 
    real:: x
    character(14):: frase = "Fortran eh top"
    character(len = len( frase) * int(x) ):: sin
  end function sin  

  subroutine sub2(r, i)
    implicit none 
    integer, intent(inout):: r 
    integer i 
  end
  end interface 
  !intrinsic sin 
  integer i  
  real:: x(10), t(2, 2), s(2, 2, 2, 2, 10)

  print *, foo(x), foo(t), foo(s), sin(10.0)

  !! save 
  do i = 1, 10 
    call sub(i) 
  end do

  blk: block
  integer:: i = 1, r = 2
  call sub2(r, i)  ! 3
  call sub2(r, i)  ! 5, i: save 
  print *, "retorno",  r
  end block blk 

  contains 
  function foo(x)
    ! assumed shape:: so com dummy arguments
    real, dimension(..), intent(in):: x
    integer foo 
    select rank(x)
    rank(1)
    foo = 1
    rank(2)
    foo = 2
    rank(*)
    ! assumed rank
    foo = 0
    rank default
    foo = rank(x)
  end select  
  end function foo

  subroutine sub(i)
  integer:: i
  integer:: j = 0  ! save  
  i = i+1
  j = j+1
  print *, i, j
  end subroutine sub 
end program main 

function sin(x)
  implicit none 
  real:: x
  character(14):: frase = "Fortran eh top"
  character(len = len( frase) * int(x) ):: sin
  sin = repeat("Fortran eh top!", int(x))
end

subroutine sub2(r, i)
  save
  integer, intent(inout):: r 
  integer i 
  r = r+i 
  i = i+1
  return 
end 
