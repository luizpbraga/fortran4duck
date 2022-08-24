module aula25
  implicit none
  private

  public:: say_hello
contains
  subroutine say_hello
    print *, "Hello, aula25!"
  end subroutine say_hello
end module aula25
