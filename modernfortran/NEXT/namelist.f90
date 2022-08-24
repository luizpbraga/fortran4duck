program main 
implicit none
  real x, y, z 
  namelist/list/x, y, z 

  x = 1; y = 2; z = 3 

  write(*, nml = list)
end 
