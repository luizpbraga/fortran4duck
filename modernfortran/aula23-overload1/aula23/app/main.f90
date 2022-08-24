program main
  implicit none
  ! Opradores:
  ! + - * ** / == /= > < >= <= 
  ! .eqv. .neqv. .not. .or. .and. 

  type point
    integer:: x, y
  end type 
  interface operator (.in.)
    procedure isin, isinpoint
  end interface 

  interface operator (+)
    procedure somapoint
  end interface 

  interface operator (-)
    procedure subpoint
  end interface 

  interface operator (*)
    procedure prodpoint
  end interface 

  integer:: el = 6, vec(4) = [1, 2, 3, 4]
  type(point):: &
    p1 = point(2, 0), p2 = point(1, 5), p3 

  p3 = p1+p2 
  print *, el .in. vec, p3%x, p3%y
  print *, p3-p1
  print *, 5 * (p3-p1), 5 .in. (5* (p3-p1))


  contains 

  logical function isin(el, vec)
    integer, intent(in):: el, vec(:)
    logical l(1)
    l = .not. (0 == findloc(vec, el))
    isin = l(1)
  end

  type(point) function somapoint(p1, p2) result(p3)
    type(point), intent(in):: p1, p2 
    p3 = point( p1%x+p2%x,  p1%y+p2%y)
  end

  type(point) function subpoint(p1, p2) result(p3)
    type(point), intent(in):: p1, p2 
    p3 = point( p1%x-p2%x,  p1%y-p2%y)
  end 

  type(point) function prodpoint(n, p1) result(p3)
    type(point), intent(in):: p1
    integer, intent(in):: n
    p3 = point( n*p1%x,  n*p1%y)
  end 

  logical function isinpoint(n, p)
    integer, intent(in):: n
    type(point), intent(in):: p
    isinpoint = n==p%x .or. n == p%y
  end 
end

