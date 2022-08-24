program main 
  implicit none (type, external)
  
  character(len = *), parameter:: word = "julia maria"
  character(:), allocatable:: senha, alpha, fortran 
  integer j, i

  alpha = ""
  senha = ""
  fortran = ""
  
  do i = 97, 122
    alpha = alpha//char(i)
  end do
    alpha = alpha // char(32)
    
  do i = 1, len(alpha)
    if ( index(word, alpha(i:i)) /=0 ) senha = senha // alpha(i:i) 
  end do

  do j = 1, len(word)
    do i = 1, len(word) 
      if ( word(j:j) == senha(i:i) ) fortran = fortran // senha(i:i)
    end do 
  end do 

  print "('senha: ', a, 'e fortran: ', a)", senha, fortran 

  contains 
end program main 

