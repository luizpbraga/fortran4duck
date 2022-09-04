!>
program main 
  implicit none

  integer i, filesize, stat
  character(:), allocatable :: allfile
  
  write(10, '(3i3)', iostat = stat) (i, 2*i, 3*i, i=1, 10)
  if (stat /= 0 ) stop 0

  inquire(file = 'fort.10', size = filesize, iostat = stat)
  if (stat /= 0 ) stop 1
  
  allocate(character(filesize) :: allfile, stat = stat)
  if (stat /= 0 ) stop 2

  open(iostat = stat, newunit = i, file = 'fort.10', access = 'stream' )
  if (stat /= 0 ) stop 3
    
    read(i, iostat = stat) allfile
    if (stat /= 0 ) stop 4
  
  close(unit = i, iostat = stat)
  if (stat /= 0 ) stop 5

  print *, allfile
  contains 
end 

