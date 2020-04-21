class Greeter
  def initialize(name = Kernel)
    @name = name
  end

  def greet
    puts "What is your name?"
    # name = Kernel.gets.chomp
    puts "Hello, #{@name.gets.chomp}"
  end
end
