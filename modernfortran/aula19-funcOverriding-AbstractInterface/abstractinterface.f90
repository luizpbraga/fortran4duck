program main 
  
  implicit none 
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! interfaces implicitas 
  ! interface
  ! pure elemental function foo(x)
  !   implicit none
  !   integer foo
  !   integer, intent(in):: x
  ! end
  ! pure elemental function bar(x)
  !   implicit none
  !   integer bar
  !   integer, intent(in):: x
  ! end
  ! end interface 
  !procedure(integer):: foo, bar   ! quando nao precisa de interface 
  !integer, external:: foo, bar   
  !integer:: foo, bar   
  !print *, foo(1), bar(1)
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !abstract interface
  !   pure elemental function func(x)
  !     implicit none
  !     integer func
  !     integer, intent(in):: x
  !   end function func 
  ! end interface
  ! procedure(func):: foo, bar, foobar
  ! print *, foo(1), bar(1)
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! function Overl: Generics
  ! interface fun 
  !   procedure:: fun_r, fun_i
  ! end interface  
  ! print *, fun(1), fun(1.0)
  ! func OverLoading
  interface sin 
    procedure:: sin_char
  end interface 
  print *, sin(1.0), sin("Ola mundo!")
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  !interfece Overload: Compartilhando interfaces 
  ! interface
  !   pure elemental function bar(x)
  !     implicit none
  !     integer bar
  !     integer, intent(in):: x 
  ! end 
  ! end interface  
  ! procedure(bar):: foo 
  ! print *, foo(1), bar(1)
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ! interface operator(+)
  !   procedure:: cat
  !   ! function cat(w1, w2)
  !   !   character(*), intent(in):: w1, w2
  !   !   character(len = len(w1)+len(w2)):: cat 
  !   ! end 
  ! end interface 
  ! character(*), parameter:: ola = "Ola", mundo= " mundo!"
  ! character(*), parameter:: s1 = ola // mundo 
  ! character(10):: s2  
  ! s2 = ola+mundo 
  ! print "(2(a, 1x), l1)", s1, s2, s1 == s2

contains
  
  function sin_char(x)
    character(*):: x 
    character(11):: sin_char
    sin_char = "fuck python" 
  end function sin_char

  function fun_r(x) result(fun)
    implicit none
    real fun 
    real, intent(in):: x 
    fun = x
  end   
  
  function fun_i(x) result(fun)
    implicit none
    integer fun 
    integer, intent(in):: x
    fun = x 
  end 
 
  function cat(w1, w2)
      character(*), intent(in):: w1, w2
      character(len = len(w1)+len(w2)):: cat
      cat = trim(w1) // trim(w2)
  end  
  end program main 
 
  pure elemental function foo(x)
    implicit none
    integer foo 
    integer, intent(in):: x 
    foo = x
  end 
  
  pure elemental function bar(x)
    implicit none
    integer bar
    integer, intent(in):: x 
    bar = x 
  end 
