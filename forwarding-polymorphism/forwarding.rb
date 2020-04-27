## Exercise 2

class User
  def initialize(name, bio, age, password)
    @name = method_name
    @bio = bio
    @age = age
    @password = password
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end

class Authenticate
  def initialize
    @password = User.new.password
  end

  def authenticate(candidate_password)
    return true if candidate_password == @password
    false
  end
end
