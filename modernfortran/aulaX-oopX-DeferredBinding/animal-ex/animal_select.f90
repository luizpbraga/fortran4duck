!>
module mod
  implicit none 

  private 
  public :: animal, dog, cat

  type :: animal 
    character(50) :: name, sound 
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

      select type (this) 
        type is (dog) 
          print '(a,i2)', trim(this%name) // " is a dog. He/She is ", this%age    
        type is (cat) 
          print '(a,i2)', trim(this%name) // " is a cat. He/She is ", this%age    
      end select 
      print '(a)', trim(this%name) // " said " // trim(this%sound) // "!"
    end 
end 

program main 
  use mod 
  implicit none
  
  type(dog) :: dog1 = dog("Pipoca", "Au, au!", 1)
  type(cat) :: cat1 = cat("Lua", "MEOW MEOW BITC*S!!", 10)
  call dog1%info
  call cat1%info
contains 
end 
