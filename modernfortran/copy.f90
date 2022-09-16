program main
  character (len=20)    :: fmt = "(a,' =',*(1x,i0))"
  integer , target      :: a(2)
  integer , pointer     :: b(:)
  integer , allocatable :: c(:), f(:)
  a = [4,9]
  b => a ! shallow copy -- changing a changes b
  allocate (c, source=a) ! deep copy -- changing a won't change c
  associate (d => a)   ! d is a shallow copy
    associate (e => (a)) ! e is a deep copy since (a) is expression
      f = a ! deep copy
      d = d - 1 ! changes a, b, d
      print fmt, "a", a
      print fmt, "b", b
      print fmt, "c", c
      print fmt, "d", d
      print fmt, "e", e
      print fmt, "f", f
    end associate 
end associate
end program main
