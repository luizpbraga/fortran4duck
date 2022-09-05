!>
program main 
  implicit none

  character :: title(3)
  real      :: table(2,3)

  open(10, file = "./test.csv")
    read(10, *) title
    read(10, *) table(1,:)
    read(10, *) table(2,:)
  close(10)

  print *, title
  print *, transpose(table)

contains 
end 

