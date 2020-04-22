class Expect

  def initialize(arg)
    @arg = arg
  end

  def to(arg)
    return 'Test fails! D:' unless arg.compare(@arg)
    'Test passes! :)'
  end
end

class Equal

  def initialize(arg)
    @arg = arg
  end

  def compare(arg)
    return 'Test passes! :)' if @arg == arg
    'Test fails! D:'
    false
  end
end
