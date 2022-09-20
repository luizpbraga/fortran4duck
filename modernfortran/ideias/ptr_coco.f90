!>
program main 
  implicit none

  procedure(real), pointer :: p0 => sin 
  
  ! procedure(), pointer :: p2 ! remover o implicit none 
  
  type T 
    procedure(real), nopass, pointer :: p1
  endtype 

  type(T) :: myt 
  myt%p1 => cos

  !p2 => exp

  print *, p0(0.), p0(1.)
  print *, myt%p1(0.), myt%p1(1.)
  
  call sub(sin,1.0)
  call sub2(sin,1.0)
  call sub3(sin,1.0)

contains 
  subroutine sub(f,v)
    real, intent(in) :: v 
    real  f 
    print *, f(v)
  end 

  subroutine sub2(f,v)
    real v 
    procedure(real) f 
    print *, f(v)
  end

  subroutine sub3(f,v)
    real v 
    real,external:: f 
    print *, f(v)
  end

  subroutine sub4(f,v)
    class(*), intent(inout):: v 
    procedure(class(*)), pointer :: f 
    select type(v)
      type is (real)
            print *, v
            select type (f)
              type is (real)
                print *, f(v)
            end select 
      end select
  end 

end


