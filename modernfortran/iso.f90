!>
program main 
  use iso_fortran_env, only: iostat_eor, iostat_end  
  implicit none
  ! sucks 
  print *, "end record:", iostat_end, "end file:", iostat_eor
  contains 
end 

