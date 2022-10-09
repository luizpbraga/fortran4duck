
!#define String character(:),allocatable

program main 

  use iso_fortran_env, only: stderr => error_unit

  implicit none

  character(15) :: f_file, f_status, f_action, f_access, f_form, f_statusclose, f_iomsg*50

  integer :: f_unit, f_iostat !, f_newunit

  logical :: f_exist
  integer :: f_size

  f_unit   = 10;
  f_file   = 'test.txt'


  f_status = &
    'replace'
  !'new'     ! O arquivo nao deve existir
  !'old'     ! O arquivo já existe 
  !'scratch'  ! deleta => open(status=elete') + nao precisa do `FILE`
  !'unknown' ! ?  

  f_action = &
    'readwrite' ! dá pra usar read/write
  !'read'     ! dá pra usar o read 
  !'write'    ! dá pra usar o write 

  f_access = &
    'sequential' 
  !"direct"
  !"stream" ! 

  f_form = &
    'formatted'    ! pro sequential 
  ! "unformatted"  ! pro direct, stream

  f_statusclose = & 
    'keep' 
  !"delete"

  
  ! Dá pra usar antes ou depois de abrir!
  inquire(           &
    !unit = f_unit, & !ou
    file  = f_file,  &
    size  = f_size,  &
    exist = f_exist  & 
  )

  print *, f_file, f_exist, f_size

  if (f_exist) then 

    open(                 &
      unit   = f_unit,    & 
      !newunit = fnewunit,&
      file   = f_file,    &
      iostat = f_iostat,  &
      iomsg  = f_iomsg,   &
      status = f_status,  &
      action = f_action,  & 
      access = f_access,  &
      form   = f_form     &
    )                     

    if (f_iostat /= 0) write(stderr, *) "error: " // f_iomsg
    
    write(f_unit, *) "ola"

    close(                   &
      unit   = f_unit,       &
      status = f_statusclose &
    )

  call execute_command_line("cat " // f_file)
  else 
    print *, "Arquivo não encontrado."
  end if 

end program  
