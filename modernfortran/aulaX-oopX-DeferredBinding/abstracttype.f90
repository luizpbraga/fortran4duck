module mod 
    implicit none 
    ! Nunca eh instanciada
    type, abstract:: Super  !! nao precisa ser abstrata!
        integer:: name
    contains 
        procedure, pass    :: foo
        procedure, pass(x):: bar
        procedure, nopass  :: show
    end type
contains 
    subroutine foo(s)
    class(Super):: s
        print *, s%name
    end subroutine  
    
    subroutine show()
        print *, "OLA"
    end subroutine 
    
    subroutine bar(s, x)
    class(Super):: s, x
    print *, x%name, s%name
    end 
end module mod  


program main
    use mod
    implicit none 
    type, extends(Super):: A
    end type
    
    type, extends(Super):: A2
    end type

    type(A):: B, C
    type(A2):: B2, C2

    B%name = 1
    B2%name = 3
    C%name = 2
    C2%name = 2

    call B%foo
    call B%show
    call B%bar(B)
    call B2%bar(B2)
    call C2%bar(B2)
end program 

