

program main 
  use iso_fortran_env
  ! pq nao usar ?
  implicit none (type, external)

  ! Notice there's no mention of bits or bytes:
  ! kind = 1, 2, 3, 4, 5, 6, 7, 8 ... Esses numeros dependem do seu compilador
  integer ( kind = selected_int_kind(5) ):: i  ! 5 decimal digitis
  real ( kind = selected_real_kind(10, 200) ):: r  ! 10 decimal digetis, 10**200 range 
  ! integer (kind = 3):: j  ! NAO SUPORTADO

  real:: s0 = 10.0/3.0
  real:: s0e = 10.0e0/3.0e0
  
  ! real 32
  real (kind = real32)  :: s32 = 10.0/3.0
  real (kind = real32)  :: s32e = 10.0e0/3.0e0
  real (kind = real32)  :: s32d = 10.0d0/3.0d0
  real (kind = real32)  :: s32real32 = 10.0_real32/3.0_real32
  
  integer, parameter:: k6 = selected_real_kind(6, 37)
  real (kind = k6):: ssp   = 10.0/3.0
  real (kind = k6):: sspe  = 10.0e0/3.0e0
  real (kind = k6):: sspd  = 10.0d0/3.0d0
  real (kind = k6):: sspk6 = 10.0_k6/3.0_k6
  
  ! real 64
  real (kind = real64)  :: s64 = 10.0/3.0
  real (kind = real64)  :: s64e = 10.0e0/3.0e0
  real (kind = real64)  :: s64d = 10.0d0/3.0d0
  real (kind = real64)  :: s64real64 = 10.0_real64/3.0_real64
  
  integer, parameter:: k15 = selected_real_kind(15, 307)
  real (kind = k15):: sdp = 10.0/3.0
  real (kind = k15):: sdpd = 10.0d0/3.0d0
  real (kind = k15):: sdpe = 10.0e0/3.0e0
  real (kind = k15):: sdpk15 = 10.0_k15/3.0_k15
  
 ! real 128
  real (kind = real128):: s128 = 10.0/3.0
  real (kind = real128):: s128d = 10.0d0/3.0d0
  real (kind = real128):: s128e = 10.0e0/3.0e0
  real (kind = real128):: s128real128 = 10.0_real128/3.0_real128
  
  integer, parameter:: k33 = selected_real_kind(33, 4931)
  real (kind = k33 ):: sqp = 10.0/3.0
  real (kind = k33 ):: sqpd = 10.0d0/3.0d0
  real (kind = k33 ):: sqpe = 10.0e0/3.0e0
  real (kind = k33 ):: sqpk33 = 10.0_k33/3.0_k33

  integer, parameter:: qp = 16
  !integer, parameter:: k34 = selected_real_kind(34) == -1
  real (qp):: f = 10.0_qp/3.0_qp
  double precision:: d 
  !real (k34):: g = 10_k34/3_k34
  
  print *, 6, 15, 33
  print *, r, i
  print *, r%kind, i%kind, real64
  print *, huge(r)
  print *, digits(r)
  print *, tiny(r)
  print *, maxexponent(r)
  print *, minexponent(r)
  
  print *, bit_size(i)

  print *, precision(r)
  print *, range(r)

  print *, s0
  print *, s0e

  print *, s32
  print *, s32e
  print *, s32d

  print *, ssp, ssp%kind
  print *, sdp
  print *, s64, s64%kind

  print *, sqp, sqp%kind
  print *, s128, s128%kind
  
  print *, sqp


  print *, "r32:: use E0 (nao converte)"
  print *, s32, s32e, s32d, s32real32
  print *, ssp, sspe, sspd, sspk6
  
  print *, "r64:: use D0 (caga se não usar)"
  print *, s64, s64e, s64d, s64real64
  print *, sdp, sdpe, sdpd, sdpk15

  print *, "r128"
  print *, s128, s128e, s128d, s128real128
  print *, sqp, sqpe, sqpd, sqpk33
  print *, f

  f = 10.0d0/3.0d0
  d = 10.0d0/3.0d0
  print *, f, d

  contains 
end program main 

