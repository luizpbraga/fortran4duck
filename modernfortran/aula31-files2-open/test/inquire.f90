!>
program main 
  implicit none

  character(10) :: s(10)
  integer :: i(4) 
  logical :: l(4) !exist, pending, named, opened

  inquire( &
  file = './allfile.f90',  &
  exist = l(1),            &
  opened = l(2),  &
  pending = l(3),  &
  named = l(4),  &
  size = i(1),  &
  iostat = i(2),  &
  id = i(3),  &
  number = i(4),  &
  iomsg = s(1),  &
  form = s(2),  &
  name = s(3),  &
  blank = s(4),  &
  decimal = s(5),  &
  delim = s(6),  &
  direct = s(7), &
  formatted = s(8),  &
  unformatted = s(9),  &
  position = s(10))

  print "(4l)", l 
  print "(1a)", s 
  print "(i0)", i

contains 
end 

