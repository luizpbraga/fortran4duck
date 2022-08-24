program main 
  implicit none (type, external)

  integer i
  integer, allocatable, dimension(:):: v, w 

  allocate(v(1), w(2))
  deallocate(v, w)
  allocate(v(10), w(20))


  do i = 1, 5
    call sub2(i)
  end do 
  contains 

  subroutine sub(i)
    integer, intent(in):: i
    integer, allocatable, save:: v(:)

    if (i == 1) then 
      allocate(v(5))
      v = [1, 2, 3, 4, 5]
    end if 
    print *, v
  end  ! array v existe em sub 1 

  subroutine sub2(i)
    integer, intent(in):: i
    integer, allocatable:: v(:)
    allocate(v(i))
    v = i
    print *, v
  end  ! array v existe em sub 1 
end program main 

