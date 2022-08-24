program main 
  implicit none (type, external)
  integer size, f
  character(:), allocatable:: poema 
  
  inquire(file="poema.txt", size = size)
  
  allocate(character(size):: poema)
  
  print *, len(poema), allocated(poema)

  open(unit = 10, file = "poema.txt", access = "stream")
    read(10) poema
  close(10)

  print *, poema

  f = index(poema, "Fernando")
  
  print *, index(poema, "Fernando")  
  print *, poema(f:)


  print *, scan("dor", poema)



  contains 
end program main 

!{#program main implicit none (type, external) integer size, f character(:), allocatable:: poema inquire(file="poema.txt", size = size) allocate(character(size):: poema) print *, len(poema), allocated(poema) open(unit = 10, file = "poema.txt", access = "stream") read(10) poema close(10) print *, poema f = index(poema, "Fernando") print *, index(poema, "Fernando") print *, poema(f:) print *, scan("dor", poema) contains end program main }
