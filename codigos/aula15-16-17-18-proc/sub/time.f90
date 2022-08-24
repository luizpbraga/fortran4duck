program main 
  implicit none (type, external)
  integer:: i 
  real   :: time, t1, t2
  
  type calendar
    character(30):: data, tempo, zona
    integer      :: valores(8)
  endtype

  type(calendar):: time_info

  call cpu_time(time)
  t1 = time 
  call cpu_time(time)
  t2 = time 
  print*, t2-t1

  call date_and_time(time_info%data, time_info%tempo, time_info%zona, time_info%valores )
  print "(g0.1)", "infos:", time_info%data, time_info%tempo
  contains 
end program main 

