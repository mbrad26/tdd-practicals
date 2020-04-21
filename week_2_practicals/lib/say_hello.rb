require_relative 'dependencies'

class SayHello
  def initialize(email = EmailClient)
    @email = email
  end

  def run
    email = @email.new
    email.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end
