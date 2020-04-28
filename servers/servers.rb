require 'socket'

server = TCPServer.new(2345)

while true do
  socket = server.accept

  socket.puts 'What do you say?'

  they_said = socket.gets.chomp

  break if they_said == 'quit'

  socket.puts "You said #{they_said}. Goodbye!"
end

socket.close
