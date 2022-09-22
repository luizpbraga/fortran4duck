!>
module mod 
  implicit none
  type t 
    contains 
    !procedure, nopass :: foo => foo_main 
    procedure, nopass, non_overridable :: foo => foo_main 
  endtype

  type, extends(t) :: b 
  contains 
  procedure, nopass :: foo_ext  
  !procedure, nopass :: foo => foo_ext  
  endtype 

  contains 
  subroutine foo_main 
    print *, "main"
  end 
  subroutine foo_ext
    print *, "ext"
  end 
end 
program main
  use mod 
  implicit none
  type(b) :: bar 
  type(t) :: tar

  call tar%foo 
  call bar%foo
  contains
end

