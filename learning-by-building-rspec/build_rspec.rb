class Expect

  def initialize(arg)
    @arg = arg
  end

  def to_equal(other_arg)
    return 'Test fails! D:' unless @arg == other_arg
    'Test passes! :)'
  end

end
