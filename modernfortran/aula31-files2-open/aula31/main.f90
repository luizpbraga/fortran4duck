program main 
      implicit none 
      real :: v(5)
      integer :: io, nunit, buffersize
      character(120) :: msg
      character(*), parameter :: filename = "f1.txt"
      character(:), allocatable :: buffer
      logical :: existfile 
      call random_number(v)

      inquire(file = filename, exist = existfile, size = buffersize)
      if (existfile) then 
            allocate(character(buffersize) :: buffer)
            open(newunit = nunit, iostat = io, iomsg = msg, &
                  file = filename, status = "old",          &
                  action = "read", access = "stream",       &
                  form = "unformatted")
            call check(io, msg)
            !write(nunit, fmt = *, iostat = io, iomsg = msg) v
            !call random_number(v)
            !write(nunit, fmt = *, iostat = io, iomsg = msg) v
            !call random_number(v)
            !write(nunit, fmt = *, iostat = io, iomsg = msg) v
            !call random_number(v)
            !write(nunit, fmt = *, iostat = io, iomsg = msg) v


            read(nunit) buffer
            close(nunit, status = "keep")
            print *, buffer
      else 
            print *, "arquivo nao existe"
      end if 
      contains 
      subroutine check(io1, msg1)
            integer, intent(in) :: io1 
            character(*), intent(in) :: msg1
            if (io1/=0) error stop msg1
      end 
end 
