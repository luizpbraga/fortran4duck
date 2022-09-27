module json_ex
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, json-ex!"
  end subroutine say_hello
end module json_ex
