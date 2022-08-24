program main 
  implicit none
 
  integer i 
  
  character(10):: s = "abc", g = 'def' 
  
  character(*), parameter:: &
      string = "!@#$%^&*()_+{}|\:;'"",<.>/?", &
      frase = "   Eu amo COMER salada!   "

  print "(4(a, 1x))", s, s(1:1), s(1:3), string(6:)
  
  do i = 1, len(string)
    !print *, string(i:i)
  end do

  if ( "a"//"b" == "ab") print *, .true. 
  
  print "(5(l, 1x))", "a" < "z", "A" < "Z", ""<"A", "0" < "9", "9" < "a"
  
  print *, "ALGUMAS FUNCOES::" 
  
  ! comparar os tamanhos
  print *, "Comparacao lexica de tamanho"
  print *, lle("a","aa")
  print *, llt("a","aa")
  print *, lge("a","aa")
  print *, lgt("a","aa")

  print *, "tamanho"

  print *, s
  print "(3(i3))", len(s), len(trim(s)), len_trim(s) 
  
  print *, s, g
  print 100, trim(s) // trim(g)
  
  print *, frase
  print "(a)", trim(adjustl(frase))
  print "(a)", trim(s) // adjustr(g)

  
  print *, "repeat"
  print *, repeat(string, 10)

  do i = 1, 10
    print *, repeat("*",i)
  end do 

  print *, "scan"
  print *, scan("abacaxi", "cay")  ! 1
  print *, scan("abacaxi", "bcx")  ! 2
  print *, scan("abacaxi", "zyv")  ! 0

  print *, scan("abacaxi", "cay", back = .true. )  ! 5  
  print *, scan("arara", "brx", .true.)          ! 4

  ! verifica se os elemento de s1 pertencem ao conjunto 
  print *, "verify" ! qual letra ta faltando
  print *, verify("fortran", "anortf")                ! 0
  print *, verify("fortran", "anort")                 ! 1 : f
  print *, verify("fortran", "notfa")                 ! 3 : r (1o)
  print *, verify("fortran", "notfa", back = .true.)  ! 5 : r (2o)
  
  print *, verify("fortran", "fxyz",  back = .true.)   ! 7 : r (2o)
  print *, verify("fortran", "fxyz",  back = .false.)  ! 2 : r (2o)  
  print *, verify("brasil", "xyzl", back = .true.)     ! 5 : r (2o)
  print *, verify("arara", "xyzar", back = .true.)     ! 0 : r (2o)

  print *, "index"
  print *, index("cabc", "c", back = .true.)  ! 4 1 5
  print *, index("cabc", "", back = .false.)
  print *, index("cabc", "", back = .true.)

end program main 

