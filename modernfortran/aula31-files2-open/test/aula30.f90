!> FILE #2 

module mod_table

  use iso_fortran_env, only: stderr => error_unit , file_storage_size

  implicit none 

contains 
  subroutine write_table(io)

    integer i 
    integer, intent(inout) :: io
    character msg*50
    real :: m(100, 10)

    ! > Montando a matriz M
    m = reshape([(real(i), i=1, size(m))], shape = [100, 10], order = [2,1])

    ! lembra delas ?
    print *, size(m), storage_size(m), rank(m), shape(m), ubound(m, dim=1)

    ! SEM USAR A FUNCAO OPEN 
    !#1
    do i=1, ubound(m, dim=1)
    write (10, fmt = *, iostat = io) m(i,:)
    end do

    !#2
    !print *, m(1, :)
    !write(10, "(10f12.6)", iostat = io)  transpose(m)

    !#3
    !write(10, "(10f12.6)", iostat = io, iomsg = msg ) (m(i,:), i=1, ubound(m, dim=1))
    ! obs: dá pra fazer leitura dos dados com o loop implicito 

    if (io /= 0) then
      write(stderr, '(a)', advance = 'no')              &
        "Deu ruim no fort.10. &
        & Erro na rotina 'write_table': " // trim(msg) // &
        & "O controle da execução será passado &
        &  para o programa principal. "

    else 

      call execute_command_line("mv fort.10 data1.txt")
      write (*, '(a)', advance = 'no') "Deu boa! hehe 😈😈😈😈😈"
    end if 

  end subroutine 

end module  


module mod_io 

  implicit none (type, external)

  ! - CONTEUDO: 
  !   + Func INQUIRE
  !       * O arquivo existe ? 
  !       * Qual o tamanho do arquivo ?

  !   + Func OPEN:
  !       * Argumentos possíveis 
  !       * buffer
  !       * REWIND()
  !       * Ler um arquivo CSV 
  !         - input normal 
  !         - input usando DERIVED TYPES (STRUCT) 
  !   + Func CLOSE: 
  !     * Deletar um arquivo após a leitura

  end 

  program main 
    use mod_io
    use mod_table 
    implicit none

    integer io 

    call write_table(io)

    if (io /= 0) stop "1: Deu ruim dmsssss"

    info: block
      !ALGUMAS INFORMACOES 
      character(10) :: file_name = "data1.txt"
      integer :: file_unit, file_size
      logical :: file_exist
      real, allocatable :: data1(:,:)

      ! O arquivo existe ? Qual o tamanho? 
      inquire(file = file_name,exist = file_exist, size = file_size)

      if (file_exist) then
        print *, file_name, file_size
                
       !open(newunit = file_unit, file = file_name, action = "read") 
       !  !#1    
       !  read(file_unit, '(10f12.6)') (data1(i), i=1, file_size)
       !close(unit)
      end if 
    end block info 


  contains 
    end 

