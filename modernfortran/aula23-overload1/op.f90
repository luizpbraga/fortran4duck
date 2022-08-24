program main 
      implicit none 

      ! Números:: + - / * ** ==   /=   >    <    >=   <=
      !                      .eq. .nq. .gt. .lt. .ge. .le.
      print *, 1 == 1
      ! Char:: // > < == /= >= <=
      print *, "ab" > "aaa"
      ! Bool:: .eqv. .neqv. .not. 
      print *, (.not. 1 == 1) .eqv. .false.
contains 
end program main 

