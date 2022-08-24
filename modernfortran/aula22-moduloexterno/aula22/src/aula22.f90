module aula22
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, aula22!"
  end subroutine say_hello
end module aula22
