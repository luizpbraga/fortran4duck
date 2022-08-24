module aula27
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, aula27!"
  end subroutine say_hello
end module aula27
