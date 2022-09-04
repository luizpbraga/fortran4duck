program main 
  implicit none 

  type niver
    integer:: dia, mes, ano; end type 

  type pessoa
    character(10):: nome 
    integer:: idade
    type(niver):: aniver; end type

  type(pessoa):: eu, vc
  type(pessoa), allocatable:: gurizada(:) 
  
  vc = pessoa("Joao", 17, niver(4, 10, 2022-17) )
  eu%aniver = niver(4, 9, 1996)
  eu%nome = "Luiz"
  eu%idade = 25
 
  allocate(gurizada(2))
  gurizada = [eu, vc]
  print*, gurizada([1, 2])
  deallocate(gurizada)
end program main 

