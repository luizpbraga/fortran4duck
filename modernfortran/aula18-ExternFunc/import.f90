program main 
  implicit none (type, external)
  
  type number
    sequence
    integer:: i 
    real:: r 
  endtype 


  interface 
    function foo(x)
      import number 
      type(number):: x, foo 
    end function foo 
  end interface 
   
end program main; 

function foo(x)
 type number
    sequence
    integer:: i 
    real:: r 
  endtype 

  type(number):: x, foo 
  foo = x 
end function foo 
  
