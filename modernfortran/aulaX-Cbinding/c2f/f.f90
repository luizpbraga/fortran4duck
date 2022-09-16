!>
program main 
  use iso_c_binding
  implicit none
  interface 
    function c_add(a,b) bind(c, name = "add") 
      use iso_c_binding
      integer(c_int), value :: a , b
      integer(c_int) :: c_add
    end 

    subroutine c_swap(a,b) bind(c, name = "swap")
      use iso_c_binding
      !integer(c_int), intent(inout) :: a, b ! pointers in C 
      integer(c_int) :: a, b ! pointers in C; int * a, int * b
    end

    subroutine c_init(v, s) bind(c, name = "init")
      ! tem q saber o tamanho ...
      use iso_c_binding
      integer(c_int), dimension(10) :: v ! int[] a
      integer(c_int), value :: s 
    end
 
    subroutine c_initp(v, s) bind(c, name = "initp")
      ! tem q saber o tamanho ...
      use iso_c_binding
      integer(c_int), dimension(10) :: v ! int[] a
      integer(c_int), value :: s 
    end
 
    subroutine c_initp2(v, s) bind(c, name = "initp2")
      ! tem q saber o tamanho ...
      use iso_c_binding
      type(c_ptr), value :: v !
      integer(c_int), value :: s 
    end

    subroutine c_arr_234(arr,d1,d2,d3) bind(c, name = "arr_432") 
      use iso_c_binding
      integer(c_int), dimension(2,3,4) :: arr ! int[] a
      integer(c_int), value :: d1,d2,d3 
    end subroutine 

    ! subroutine c_arr(d1,d2, arr) bind(c, name = "arr_nxm") 
    !   use iso_c_binding
    !   type(c_ptr) :: arr ! int[] a
    !   integer(c_int), value :: d1,d2 
    ! end subroutine 

    ! subroutine c_arr2(d1,d2, arr) bind(c, name = "arr_nxm2") 
    !   use iso_c_binding
    !   type(c_ptr) :: arr ! int[] a
    !   integer(c_int), value :: d1,d2 
    ! end subroutine 


  end interface 

  integer(c_int) :: a = 1, b = 3, v(10)
  integer(c_int), target :: vt(10)
  
  integer(c_int), target :: arrnm(2,2)
  integer(c_int) :: arr234(2,3,4)
   

  print *, a, b, c_add(a,b)
  
  call c_swap(a,b) 
  print *, a, b, c_add(a, b)

  call c_init(v, size(v))
  print "(*(i0,1x),:)", v

  call c_initp(v, size(v))
  print "(*(i0,1x),:)", v

  call c_initp2(c_loc(vt(1)), size(vt))
  print "(*(i0,1x),:)", vt

  ! JESUS AMADO 
  call c_arr_234(arr234, 4, 3, 2)
  print "(*(i0,1x),:)", arr234



contains 
end 

