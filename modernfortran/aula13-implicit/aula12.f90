program main 
  !implcit none (type)
  implicit character(10) (z),      &
           integer       (i-n),    &
           real(8)       (a-e, h), &
           type(Foo)     (f, g)

  type:: Foo
    integer      :: numero  
    character(10):: nome 
  endtype 

  f = Foo(10, "Fortran")
  g = Foo(30, "Gortran")
  ! CUIDADO
  print *, i, n, a, e, h, o, z 
  print *, f%numero, f%nome, &
           g%numero, g%nome 
end program main 

