

program main 
  implicit none 
  
  type:: Animal
    character(10):: nome, som
  endtype 

  type, extends(Animal):: Mamifero
    logical:: gostadeleite
  endtype

  contains 
end program main 

