class EmailClient
  def message
    Message.new
  end
end

class Message
  def send(to, body)
    # Imagine I'm sending an email
  end
end
