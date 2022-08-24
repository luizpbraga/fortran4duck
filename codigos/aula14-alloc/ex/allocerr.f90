program main 
  implicit none (type, external)
  
  integer, allocatable, dimension(:):: v, r, x, ex
  integer:: w(10), i, exsize 

  print *, "Entre a dim. de 'exsize': "
  read "(i3)", exsize 
  
  if (exsize > 0) then 
    allocate(ex(exsize)) 
    ex = [(i, i = 1, exsize)]
    print "(i0)", ex
  else 
    stop
  endif 

  allocate( v(10) )
  allocate(r, source = v)
 

  print*, size(v), size(r)
  v = [v, v]
  print*, size(v)

  print*, allocated(r), allocated(x)
  r = 1
  call move_alloc(r, x)
  print "(i0)", x

  if (allocated(v) .or. allocated(x)) deallocate(v, x)
  contains 
end program main 

