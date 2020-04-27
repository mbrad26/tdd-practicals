## Exercise 2

class User
  attr_reader :password

  def initialize(name, bio, age, password)
    @name = name
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
  def initialize(name, bio, age, password)
    @user = User.new(name, bio, age, password)
  end

  def authenticate(candidate_password)
    return true if candidate_password == @user.password
    false
  end
end
