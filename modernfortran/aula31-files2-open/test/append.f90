!>
module mod 
  implicit none
contains 
end 

program main 
  implicit none

  open(10, file = "exappend.txt") !status = "replace")
    write(10,*) "ola 1"
  close (10)

  open(11, file = "exappend.txt", access = "append")
      write(11,*) "ola 2"
  close(11)

end 

