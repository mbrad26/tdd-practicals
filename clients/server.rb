require 'socket'

server = TCPServer.new(2345)

socket = server.accept
while true do
  socket.puts 'HELLO CLIENT, WHAT IS YOUR NAME?'

  name = socket.gets.chomp

  break if name == 'quit'

  socket.puts "THAT'S A LOVELY NAME #{name}"
end

socket.close
