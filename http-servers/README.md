HTTP Servers
============

## Learn to

* Learn about HTTP servers by playing with a toy one

## Exercise 1

Get this server running:

```ruby
require 'socket'

server = TCPServer.new(2345)

loop do
  socket = server.accept
  while line = socket.gets
    puts line
  end
end
```

It just prints what is sent to it.

In your web browser, visit `http://localhost:2345`.

Look at what the server prints in the terminal. That's what your web browser is sending to the server.

Of course, the server isn't sending anything back, so the web browser sits and waits forever.

## Exercise 2

Consider this code:

```ruby
require 'socket'

def run_server
  server = TCPServer.new(2345)

  loop do
    socket = server.accept

    request = get_lines_until_blank_line(socket)
    puts "=== GOT REQUEST ==="
    puts request
    puts "=== END REQUEST ==="

    if request.start_with? "GET / HTTP/1.1"
      response = "Hello World!\n"
    elsif request.start_with? "GET /secret_page HTTP/1.1"
      response = "1. The gold is buried at harald creek\n"
      response += "2. OK I only have one secret"
    else
      response = "Nothing found :("
    end

    http_response = build_http_response(response)
    socket.print http_response

    puts "=== SENT RESPONSE ==="
    puts http_response
    puts "=== END RESPONSE ==="
    puts "\n"

    socket.close
  end
end

def get_lines_until_blank_line(socket)
  message = ""
  loop do
    line = socket.gets
    if line.chomp == ""
      break
    else
      message += line
    end
  end
  message
end

def build_http_response(response)
  "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/plain\r\n" +
    "Content-Length: #{response.bytesize}\r\n" +
    "Connection: close\r\n" +
    "\r\n" +
    response
end

run_server
```

This code is pretty ugly, but it's okay as very 'raw' example of a HTTP server.

Fire it up and visit `http://localhost:2345/` in your browser. Observe what the web browser shows you, and what the terminal displays.

## Exercise 3

So far we've provided some example exercises for you to explore with. Now it's time for you to take that responsibility yourself.

Play around with the example HTTP server above. Use it to clarify any areas of confusion or curiosity you might have about how they work.
