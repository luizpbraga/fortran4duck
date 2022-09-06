!>
program main 
  implicit none
  type myt(a,b)
    integer, len :: a = 2,b = 2 
    integer :: m(a,b)
  endtype
  
  type(myt) :: s
    s%m = 1
    call show(s, [1,2,3,4,5], "ola", [1.,2.,3.,4.])
contains 
  subroutine show(t, v,s,x)
    ! deferred: pointer, allocatable var 
    integer, intent(in) :: v(:)
    integer, allocatable, save :: a(:)
    type( myt(a = *, b = *) ), intent(inout) :: t
    ! Assumed Size (*)
    character(len=*), intent(in) :: s 
    ! Assumed Rank
    real, intent(in) :: x(..) ! dummy 
    
    a = [11,21,31]
    t%m = 1
    select rank(x)
      rank(1)
        print *, t%m, v, s, x, a 
      rank(*)
      rank default
    end select

  end
end 

