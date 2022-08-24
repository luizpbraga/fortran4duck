
program main
  use iso_fortran_env  ! Xbits-inteeger/real

  implicit none 
  
  !implicit real (real64) (a-z)
  !implicit real (selected_real_kind(15, 307) (a-z)


  ! precisao e range: kind attr.

  ! funcoes intrinsecas:
  ! kind(x), x <: int, real, char
  ! kind:: compiler dependent number

  print *, kind(0)  ! 4
  print *, kind(0.0)  ! 4
  print *, kind(0.0d0)  ! 8, kind(0.0_2)
  !print *, kind(0.0q0)
  print *, kind(cmplx(0.0, 0.0))
  print *, kind(cmplx(0.0d0, 0.0d0, kind = kind(0.0d0)))

  print *, "***INTEGER***"
  integerb: block 
  ! -10**x < i < 10**x; 
  integer, parameter   :: x = 3; 
  integer, parameter   :: siz = selected_int_kind(x)  ! fail = -1
  integer( kind = siz):: i
  integer n
  ! overflow se i >= 99 ou i <= -99 ?
  !integer( kind = siz):: i = 100
  ! 1 byte (8 bits) -> -128 < i < 127 

  print '("x = ", i2)', x
  print '("Range pra i: ", i5, " < i <",i5)', -10**x, 10**x
  print '(a, i2)', 'selected_int_kind =', siz
  print '(a, i2, a, i2, a)', 'kind:', kind(i), ' byte(s) ou ', 8*kind(i), ' bit(s)'
  print '("i =", i6, " e i%kind =", i3)', i, i%kind

  do i = 1, 19
    n = selected_int_kind(i)
    print '(i2, 1x, i2, a, 1x, i2)', i, n, " bytes "
  end do 

  referencia: block 
  integer, parameter:: ki8  = selected_int_kind(1)  ! 1, 2
  integer, parameter:: ki16 = selected_int_kind(3)  ! 3, 4 
  integer, parameter:: ki32 = selected_int_kind(5)  ! 5, ..., 9
  integer, parameter:: ki64 = selected_int_kind(10)  ! 10, ..., 18

  integer (kind = ki8)::  vint8
  integer (kind = ki16):: vint16
  integer (kind = ki32):: vint32
  integer (kind = ki64):: vint64

  print *, huge(vint8)
  print *, huge(vint16)
  print *, huge(vint32)
  print *, huge(vint64)

  print *, 2_ki8, 2_1
  print *, 2_ki16, 2_2
  print *, 2_ki32
  print *, 2_ki64, 2_4
  end block referencia
  end block integerb

  print *, "***REAL***"
  realb: block
  integer, parameter:: p = 1; ! decimal precis.
  integer, parameter:: r = 1; 
  integer, parameter:: b = 2;  ! default, op

  ! -10**r < x < 10**r 
  integer, parameter:: kr32 = selected_real_kind(p, r, b)
  ! 

  real (kind = 4)  :: vreal32
  real (kind = 8)  :: vreal64
  real (kind = 16)::  vreal128

  print *, kr32, 'bytes e', 8*kr32, ' bits', -99.0_kr32
  print *, 1.0e0, 1.0d0
  print *, selected_real_kind(1, 2)

  print*,  huge( vreal32 )
  print*,  huge(vreal64 )
  print*,  huge( vreal128)

  end block realb


  iso_fortranb: block

  integer (kind = int8 )   :: vi8
  integer (kind = int16 )  :: vi16
  integer (kind = int32 )  :: vi32
  integer (kind = int64 )  :: vi64
  ! 128 ?   

  real(kind = real32):: vr32
  real(kind = real64):: vr64
  real(kind = real128):: vr126
  !real(kind = real256):: vr256
  
  print *, "***iso_fortran_env***"
  print *, integer_kinds 
  print *, real_kinds 
  print *, logical_kinds
  print *, character_kinds
  print *, character_storage_size
  print *, real64

    cmplxb: block
      !complex (kind = 4):: c32; 
      !complex (kind = 8):: c64; 
      ;complex  (kind = real32):: c32; 
      ;complex (kind = real64):: c64; 
      ;complex (kind = real128):: c128; 
      
      c32 =  (0.0, 0.0)
      !c32 =  (0.0e0, 0.0e0)
      c64 =  (0.0, 0.0)
      !c64 =  (0.0d0, 0.0d0)
      c128 = (0.0, 0.0)
      !c128 = (0.0q0, 0.0q0)

      print *, "***COMPLEX***"
      print *, c32, kind(c32)
      print *, (0.0, 0.0), kind( (0.0, 0.0) )
      print *, (0.0d0, 0.0d0), kind( (0.0d0, 0.0d0) )
      print *, c64, kind(c64)
      !print *, (0.0q0, 0.0q0), kind( (0.0q0, 0.0q0) )
      print *, real(c128)
    end block cmplxb

  end block iso_fortranb

end program main
