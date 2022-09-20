!>
module mod
  implicit none 

  private 
  public :: animal, dog

  type :: animal 
    character(10) :: name, sound 
    integer(4) :: age
    contains !> module procedure 
      procedure, pass :: info
  endtype 

  type,extends(animal):: dog; endtype 
  type,extends(animal):: cat; endtype 

  contains 
    subroutine info(this)
      ! polymorphic
      class(animal), intent(in) :: this 
      print '(i3,1x,a)', this%age, this%name
      print *, this%sound
    end 

end 

program main 
  use mod 
  implicit none
  
  type(dog) :: dog1; 

  dog1%name = "pipoca"
  dog1%sound = "Au, au!"
  dog1%age = 1

  call dog1%info
contains 
end 
