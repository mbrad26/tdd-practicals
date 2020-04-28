require 'socket'

socket = TCPSocket.new('localhost', 2345)

while true do
  puts socket.gets

  puts 'Wow what a rude server... I\'m going to say Sarah.'

  socket.puts 'Sarah'

  puts socket.gets
end

socket.close
