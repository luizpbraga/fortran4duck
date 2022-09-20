
program main 
  implicit none
  integer, parameter    :: char_kind = selected_char_kind("ASCII")
  integer               :: i
  
  character(125)        :: poema
  character(len = 100)  :: a*4, b*2, c*10, duckpython 
  character(len = 5, kind = char_kind), dimension(3):: vec_char 
  
  ! STRING PROCS  
  
  duckpython = "  FORTRAN IS TOP   "
  
  vec_char = [character(5) :: "12" // "3" // "45", "pa", trim("LOL  ")]
  
  print *, adjustl(trim(duckpython)), len_trim(duckpython), vec_char
  
  ! READ A FILE 
  
  open(unit = 10, file = "poema.txt", access = "stream")
    read(10) poema
  close(10)

  ! SUBSTRINGS 
  
  print *, poema, poema(12:51), poema(10:)
  
  do i = 1, len_trim(poema); print *, poema(i:i), achar(i), char(i), &
    ichar(poema(i:i)); end do 
  do i = 1, 10; print *, repeat("*",i); end do
  
  ! SCAN, INDEX, VERIFY   
  
  print *, index(poema, "dor", back = .true.)
  
  print *, scan(poema, "abcO", .true.), scan("Fortran", "Fan", .not. .true.), scan("Fortran", "")
  
  print *, verify("Fo", "Fortran"), verify("Ftrna", "Fortran"), verify("Fxtrna", "Fortran"), &
  
  verify("Fxtrnax", "Fortran"), verify("Fxtrnax", "Fortran", back= .true.)
end program main 

