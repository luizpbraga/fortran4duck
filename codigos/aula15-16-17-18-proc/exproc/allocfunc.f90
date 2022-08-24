program main 
  implicit none (type, external)
  
  !! INTERFACE BLOCK:: SEMPRE USAR PRA SUBPROGRAMAS EXTERNOS
  !! e func/sub tem array com (:,...)
  interface 
    subroutine alloc_fn(arr, n)
      integer, allocatable, intent(out):: arr(:)
      integer, intent(in):: n 
    end  
    subroutine sub; end
    subroutine defarr(a); integer, dimension(:):: a; end 
  end interface 

  integer, allocatable:: arr(:)
  integer:: size = 10; 
  call alloc_fn(arr, size)
  arr = 1
  print *, arr 
  deallocate(arr)
  call alloc_fn(arr, size+10)
  arr = 3
  print *, arr 
  call sub

  call defarr(arr)
  call name 
contains 
  ! scopo

  subroutine name
    print *, "In", arr
  end subroutine name
      print *, "In", arr
  end program main 
  
subroutine alloc_fn(arr, n)
  integer, allocatable, intent(out):: arr(:)
  integer, intent(in):: n 
  allocate(arr(n))
  arr = 0
end 

subroutine sub
end 

subroutine defarr(a)
    integer, dimension(:):: a 
    a = 0
  end

