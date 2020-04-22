class Expect

  def to_be_equal(arg1, arg2)
    return 'Test fails! D:' unless arg1 == arg2
    'Test passes! :)'
  end

end
