

program main 
  implicit none (type, external)

  ! type array(k, l, m)
  !   integer, kind:: k = kind(0.0)
  !   integer, len:: l = 1, m = 1
  !   integer(k), dimension(l, m):: x
  ! endtype array

  type t_bday
    !sequence
     integer:: dd, mm, yy
  end type 

  type t_person(k, l)
    !sequence
    integer, kind:: k = kind(0.0) 
    integer, len:: l = 2
    character(30):: name
    integer(k):: age 
    type(t_bday):: bday
    integer, dimension(l):: phone    
  end type

  type(t_person):: lista(2)
 !  type(array(1, 2, 2)):: x
 !  type(array):: auto_klm
 !  integer, dimension(3, 1):: v

  ! x%x = 0
  ! auto_klm%x = 0
  ! v = 7

  lista = [ &
    t_person("Pedro", 62, t_bday(4, 12, 1959), [999972434, 999934567]), &
    t_person("Bino",  51, t_bday(1, 11, 1970), [999906789, 999956789])]

  ! print *, v, rank(v)
  ! print *, x%x 
  ! print *, auto_klm%x 
  print *, lista(1)%name
  print *, lista(1)%age
  print *, lista(2)%bday%dd
  print*,  lista(1)%phone(1), huge(1) 

  contains 
end program main 
