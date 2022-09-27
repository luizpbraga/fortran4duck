!>
program main 
  implicit none
  
  ! sao usados para fazer referência a algum objeto
  integer, pointer :: pi 
  integer, pointer :: vpi(:)
  ! ponteiros sao iniciados apontando para 
  ! dados indefinidos
  ! sempre use null()
  integer, pointer, dimension(:,:) :: mpi => null()

  ! alvos:
  integer, target :: ti 
  integer, target :: vti1(3), vti2(5)
  integer, target, dimension(4,4) :: mti
  
  print *, "part 1"
  ti = 1 
  pi => ti
  ! modificar 'pi' é moficar 'ti' 
  pi = 3
  if (ti==3) print *, "No Alvo!", ti
 
  print *, "parte 2"
  ! o pointeiro é associada ao alvo 
  ! o alvo n é associado ao ponteiro
  vpi = 5
  vti1 = 1 
  vpi => vti1
  print *, "vti1:", vti1
  vpi = 4 
  print *, "vti1:", vti1, size(vpi)
  ! a memória é alocada automaticamente
  vpi => vti2
  vpi = -1
  print *, "vti2:", vti2, size(vpi)
  ! e vti1? 
  print *, "vti1:", vti1


  ! vão apontar pro nada
  nullify(pi, vpi, mpi)

contains 
end 

