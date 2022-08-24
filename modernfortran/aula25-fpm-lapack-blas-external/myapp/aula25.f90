program main
    use aula25, only: say_hello
    use math_kind
    use math_const 
    use stdlib_array

  implicit none (type, external)
  
    external:: sgesv  ! LAPACK/BLAS
    real     :: a(2, 2), &  ! Matrix A.
                b(2),    &  ! Vetor b/x.
                pivot(2)    ! Pivot indices.
    integer  :: rc          ! .

    a = reshape( &
      [ 2., 1.,  &
        3., 1. ], [2, 2], order = [2, 1])    
    
    b = [ 5., 6. ]

    call sgesv(2, 1, a, 2, pivot, b, 2, rc)
    if (rc /= 0) error stop 'Error'
    print "(2(f0.1, 1x))", b
    print *, pi, i32
    call say_hello()

end program main
