

program main 
  implicit none 
  ! vetores 
  real:: r(3) = [10, -2, 0]
  integer:: i, vi(10)
  
  integer, parameter:: x(*) = &
  [ [(2*i**2, i = 1, 100)],   & 
  [( -2*i**2, i = 1, 100)] ]
  
  logical:: l(size(x)) = x /= 6

  vi = 10; vi(1:3) = 1; vi(7)= -1 
  
  print *,                    &
    vi,                       &
    sum(vi, mask = vi <= -3), &
    product(vi),              &
    maxval(vi),               &
    minval(vi),               &
    maxloc(vi)

  print *,                     & 
    dot_product(r, r),         & 
    norm2(r),                  &
    sqrt(sum(r*r)) == norm2(r)
  print "(*(g0.3, 1x))", x 
  print "(*(g0.3, 1x))", l 
  print *, count(l)
 
end program main 

