module mod 
  implicit none 
  private 

  type, public:: foo
    integer:: x
    contains 
    procedure, private:: sumfoo, setr, seti 
    generic:: operator(+) => sumfoo
    generic:: set => setr, seti
  end type 

  contains 

  type(foo) function sumfoo(f1,  f2) result(f)
    class(foo), intent(in):: f1, f2
    f = foo(f1%x+f2%x)
  end 

  function setr(f, x) result(set)
    real set
    class(foo), intent(in):: f
    real, intent(in):: x 
    set = x+f%x
  end 

  function seti(f, x) result(set)
    integer set
    class(foo), intent(in):: f
    integer, intent(in):: x 
    set = x+int(f%x)
  end 

end module  

program main 

  use mod 

  implicit none (type, external)

  complex:: z = cmplx(1.0, 1.0)
  print*, real(z), aimag(z)


  l1: block
    integer i
    real:: v(5, 5) = reshape([(i, i = 0, 24)], [5, 5], order = [1, 2])
  
    associate(meuvetor => v)
      call ranksub(meuvetor, 4.0)
    endassociate
    
    print "(5f7.3)", v
  end block l1

  contains 
    
  subroutine ranksub(myarray, any)

    class(*), intent(in):: any 
    real, dimension(..), intent(inout):: myarray


    select type(any)
      type is(real)
        select rank(r => myarray)
          rank(1) 
            r = any
          rank(2)
            where (r < 5) r = -any
          rank(*)
            !!
          rank  default
        endselect
      endselect 
  end subroutine 
end program  

