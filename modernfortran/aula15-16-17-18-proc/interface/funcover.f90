
program main 
    implicit none (type, external)

    character(:), allocatable:: c

    !interface operator(.NAN.)
    !end interface 

    interface sin 
        procedure:: sin_char
    end interface 

    interface add
        !procedure add_i, add_t 
        function add_i(x, y) result(res)
            integer, intent(in):: x, y
            integer:: res
        end function 
        function add_r(x, y) result(res)
            real, intent(in):: x, y
            real:: res
        end function 
    end interface 

    c = "OI MAE!!!"
    print *, add_i(1, 1), add_r(1.0, 1.0)
    print *, add(1, 1), add(1.0, 1.0), sin(1.0), sin(c)
contains 
    function sin_char(c)
        character(:), allocatable, intent(in):: c
        character(len = len(c)):: sin_char
        sin_char = c
    end function
end program main 

function add_i(x, y) result(res)
    integer, intent(in):: x, y
    integer:: res
    res = x+y
end function 

function add_r(x, y) result(res)
    real, intent(in):: x, y
    real:: res
    res = x+y
end function 

