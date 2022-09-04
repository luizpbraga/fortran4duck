module aula23
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, aula23!"
  end subroutine say_hello
end module aula23
