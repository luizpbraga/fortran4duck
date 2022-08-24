module aula26_kind
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, aula26-kind!"
  end subroutine say_hello
end module aula26_kind
