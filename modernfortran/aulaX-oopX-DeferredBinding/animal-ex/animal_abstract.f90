!>
module mod
  implicit none 
  private 
  public :: dog, cat

  type, abstract  :: animal 
    character(11) :: name, sound 
    integer(4)    :: age
    contains !> module procedure 
      procedure(info_inter), deferred:: info
  endtype 

  interface 
    ! os nomes dos argumentos precisam ser 
    ! os mesmo em info_inter e info
    subroutine info_inter(this, n)
      import  :: animal
      integer, intent(in) :: n
      class(animal), intent(in) :: this
    end 
  end interface 

  type, extends(animal):: dog
    contains 
      procedure :: info => dog_info 
  endtype 
  
  type, extends(animal):: cat
    contains 
      procedure :: info => cat_info
  endtype 

  contains 
    subroutine dog_info(this, n)
      ! polymorphic
      integer, intent(in) :: n 
      class(dog), intent(in) :: this
        print '(i3,1x,a)', this%age, this%name 
        print *, this%sound, n
    end 
   
    subroutine cat_info(this, n)
      ! polymorphic
      integer, intent(in) :: n 
      class(cat), intent(in) :: this
        print '(i3,1x,a)', this%age, this%name 
        print *, this%sound, n
    end 
end 

program main 
  use mod 
  implicit none
  
  type(dog) :: dog1 = & 
    dog("Pipoca", "Au, au!", 1)
  
  type(cat) :: cat1 = & 
    cat("Lua", "Meow, Meow!", 1)

  call dog1%info(5)
  call cat1%info(5)
end 
