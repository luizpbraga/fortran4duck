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

  
 
  

    subroutine c_ppint(p) bind(c, name = "ppint") 
      use iso_c_binding
      type(c_ptr), intent(inout) :: p ! sem intent(inout) né
      !type(c_ptr) :: p ! 
    end 

 subroutine c_arrtest(d1, d2, arr) bind(c, name = "arrtest") 
      use iso_c_binding
      integer(c_int), value :: d1,d2
      type(c_ptr), intent(inout) :: arr ! int[] a
    end subroutine 

  subroutine c_arrtest2(d1, d2, arr) bind(c, name = "arrtest2") 
      use iso_c_binding
      integer(c_int), value :: d1,d2
      type(c_ptr), intent(inout) :: arr ! int[] a
    end subroutine 

 end interface 

  integer(c_int) :: a = 1, b = 3, v(10)
  integer(c_int), target :: vt(10)
  
  
  integer(c_int), target :: arrnm(2,2)
  integer(c_int) :: arr234(2,3,4)
  

  ! ** int 
  integer(c_int), target :: t = 10, tv(2,2) ! precisa do target 
  type(c_ptr) :: t_loc, tv_loc;

  ! int 
  print *, a, b, c_add(a,b)
 
  ! int *
  call c_swap(a,b) 
  print *, a, b, c_add(a, b)

  ! *int ou int[]
  call c_init(v, size(v))
  print "(*(i0,1x),:)", v

  call c_initp(v, size(v))
  print "(*(i0,1x),:)", v

  call c_initp2(c_loc(vt(1)), size(vt))
  print "(*(i0,1x),:)", vt

  ! JESUS AMADO 
  ! int [][][]
  call c_arr_234(arr234, 4, 3, 2)
  print "(*(i0,1x),:)", arr234

  ! **int  
  ! call c_ppint(c_loc(t))
  ! print *, t
  t_loc = c_loc(t)
  call c_ppint(t_loc) ! da pre redefinir com intent(inout)
  print *, t

  tv_loc = c_loc(tv(1,1))
  call c_arrtest(2, 2, tv_loc) ! da pre redefinir com intent(inout)
  print *, tv
  tv_loc = c_loc(tv(1,1))
  call c_arrtest2(2, 2, tv_loc) ! da pre redefinir com intent(inout)
  print *, tv

contains 
end 

