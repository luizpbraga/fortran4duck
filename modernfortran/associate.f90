!>
program main 
  implicit none
  
  integer i 
  real, allocatable :: v(:)
  real :: w(5) = 1
  real, target :: a(2)

  !a = [99, 99]

  associate( data => [real::], x => w )

    ! data nao pode ser modificado 
    ! data = 0 nao vale 
    ! data = data + 1 nao vale
    v = [data, 0., 0., (real(i), i=3,5)]
    v([1,2]) = [-1,-2]
    
    ! Associate pode modificar o valor original 
    ! das variáveis (w) 
    x = 0
    x = x + v
    
    ! Mais um ex :
    associate ( y => a ) ! copia "shallow" 
      y = [11,11]
      y = y - 1
    end associate
    
    ! Olha a arapuca  
    associate ( e => (a) ) ! 'deep' copy 
      ! não posso modificar 'e' aqui 
      ! e = e + 1
    end associate 

    print *, "a:",  a
  
  end associate

  print *, v
  print *, w

contains 
end 

