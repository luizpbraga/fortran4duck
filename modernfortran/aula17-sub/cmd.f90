program main 
  implicit none (type, external)


  contains 
  
  function exec(cmd)
  character(*):: cmd 
  character(:), allocatable:: exec
  character(*), parameter:: filename = "sdlkwdwd"
  integer size, unit 
  
  call execute_command("ls " // cmd // " > " // filename)
  inquire(unit = unit, name = filename, size = size) 
  allocate(character(size):: exec)
  open(newunit = unit, file = filename, status = "old", access = "stream")
  read(unit) exec
  close(unit, status = "delete")
  end function 

end program main 

