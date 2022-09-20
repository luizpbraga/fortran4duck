
program main 
  implicit none (type, external)
  ! allocatable dummy args
  !> Se o subprograma é externo: Interfaces
  !> intent : Determina onde o array pode ser allocado
  integer, allocatable:: a(:)
  character(*), parameter:: fmt = '(a, 5i3)'
  integer, allocatable:: i 
  !allocate(i)
  i = 1
  deallocate(i)

  ! =======================
  char: block
    character(:), allocatable:: ch 
    ch = "Ola";         print *, ch
    ch = "Ola mundo";   print *, ch
    deallocate(ch)
    
    allocate(character(len = 20):: ch)
    ch = "1"
    print *, len(ch) == 20, len_trim(ch) == 1
    
    charvec: block
      ;character(len = 5), allocatable:: ch5(:)
      ! deferred len
      ;character(len = :), allocatable:: ch(:)

    !allocate(ch5(3))
    ch5 = ["12345", "12345"]
    print *, ch5
    ch5 = ["1", "2", "3"]
    print *, ch5, len(ch5(1))

    ch = ["a"]
    print *, ch
    ch = [ch, ch]
    print *, ch
    ch = [ch, 'bcde']
    print *, ch, len(ch(1))  ! OPS!!! bug gfortran
    
    deallocate(ch)
    ! ch = ["a"]
    ! print *, ch
    ! ch = [ch, ch]
    ! print *, ch
    ! ch = [character(4):: ch, 'bcde']
    ! print *, ch, len(ch(1)) ! [a, a, b], 1  !> OPS!!! bug gfortran
    
    allocate(character(10):: ch(10))
    ch = ["1"]
    print *, ch, len(ch), len(ch(1))
    end block charvec  
  end block char
  ! =====================
  ! ======================
  !alloc no sub
  call sub_out(a)
  print fmt, "out:", a; deallocate(a)
  
  ! =====================
  ! alloc no program 
  allocate(a(5))
  a = 1
  call sub_in(a)
  print fmt, "In:", a; deallocate(a)

  ! =====================
  ! alloc no sub/program 

  allocate(a(5))
  a = 1
  call sub_inout(a)
  print fmt, "Inout:", a; deallocate(a)

  ! ====================
  allocf: block
     real, allocatable, dimension(:):: y, z
      integer:: i
      y = [(i/100.0d0, i = -100, 100, 2 )]
      z = foo(y)
      print *, z
  endblock allocf

  contains 

  subroutine sub_out(a)
    integer, intent(out), allocatable:: a(:)
    allocate(a(5))
    a = 1
  end 
 
  subroutine sub_in(a)
    integer, intent(in), allocatable:: a(:)
    print *, a
  end 
  
  subroutine sub_inout(a)
    integer, intent(inout), allocatable:: a(:)
    print '(5i3)', a
    a = [1, 2, 3, 4, 5]
  end 

  function foo(x) result(res)
    real, allocatable:: res(:)
    real, intent(in)  :: x(:)
    allocate(res, mold = x)
    res = sin(x)**2+cos(x)**2 
  end function foo

end program main 

