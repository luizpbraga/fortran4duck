module mod
    implicit none
    public

    type, abstract:: abstype
        contains 
        ! campos abrigatorios na hr de 'extender'
        procedure(absproc), deferred:: p   ! comptime 
        procedure(absproc), deferred:: d   ! comptime
        procedure:: f
        procedure(foo_int), deferred:: foo
    endtype 
    
    abstract interface 
        subroutine absproc(x)
        import:: abstype  ! pra usar abstype 
        class(abstype), intent(in):: x 
        end subroutine 
    end interface

    interface
      function foo_int(s, x) result(foo)
        import:: abstype  ! pra usar abstype 
        class(abstype), intent(in):: s
        integer, intent(in):: x 
        integer foo
      end function foo_int
    end interface 

    
    type, extends(abstype):: newabstype
        integer, private  :: fild
        contains 
        procedure:: p => showp
        procedure:: d => showp2
        procedure:: newp
        procedure:: foo => foo_main
        final:: finalsub  ! quando as variaveis das proc sao destruidas
        !procedure ::  new
    end type

    contains
    function foo_main(s, x) result(foo)
        class(newabstype), intent(in):: s
        integer, intent(in):: x 
        integer foo 
        foo = x+s%fild
    end   

    subroutine f(s)
    class(abstype), intent(in):: s  ! obv q funciona
    call s%p
    end 
    
    subroutine new(s)
      !class(abstype), intent(out):: s obv q n funciona 
      class(newabstype), intent(out):: s  ! obv q funciona 
      print *, s%fild
    end subroutine new

    !abs interface ::
    subroutine newp(x, y)
        class(newabstype), intent(out):: x
        integer, intent(in):: y
        x%fild = y
    end subroutine newp

    subroutine showp(x)
        class(newabstype), intent(in):: x
        print *,"showp:", x%fild
    end subroutine showp 
    subroutine showp2(x)
        class(newabstype), intent(in):: x
        print *, "showp2", 2*x%fild
    end subroutine showp2 

    subroutine finalsub(a)
     type(newabstype), intent(in):: a
     print *, a%fild, "Inicializado"
    end subroutine finalsub

end module mod 

program main
    use mod
    implicit none 
    
    type E; endtype
    type, extends(E):: I; end type

    type(newabstype):: A
    type(newabstype):: B
    type(E):: T1
    type(I):: T2

    call A%newp(3)
    call A%p
    call A%f
    call A%d
    write(*,*) "Foo", A%foo(1)
    print*, "--------------" 
    call B%p
    call B%newp(7)
    call B%p
    call B%newp(7)

    print *, same_type_as(A, B)
    print *, extends_type_of(A, B)
    print *, same_type_as(T1, T2)
    print *, extends_type_of(T1, T2)
    print *, extends_type_of(T2, T1)
  
end program main  
