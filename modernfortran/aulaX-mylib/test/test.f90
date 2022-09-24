!>
program test 
  use mod1, only: m_x => x
  implicit none

  if (m_x == 1.0) then 
    print *, "test 1: Passed" 
  else 
    print *, "test 1: Fail"
  end if

  contains 
end 

