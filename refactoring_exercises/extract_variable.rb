# def send_email_to(user)
#   Mail.new(user.email.strip).send_message
# end

def send_email_to(user)
  email = user.email.strip
  mail = Mail.new(email)

  mail.send_message
end

# def tell_browser_type(browser)
#   if(browser.type == "Safari")
#     puts "You are using the Safari browser."
#   else
#     puts "You are using a non-Safari browser."
#   end
# end

def tell_browser_type(browser)
  message_safari = "You are using the Safari browser."
  message_non_safari = "You are using a non-Safari browser."

  browser.type == "Safari" ? puts message_safari : puts message_non_safari
end

# def send_correct_page(browser, window)
#   if(browser.type == "Safari" && window.size < "768px")
#     return "You are using the Safari browser in a small window."
#   else
#     return "You are not using the Safari browser or have a big window."
#   end
# end

def send_correct_page(browser, window)
  message_safari = "You are using the Safari browser in a small window."
  message_non_safari = "You are not using the Safari browser or have a big window."
  browser_type = browser.type == "Safari"
  window_size = window.size < "768px"

  browser_type && window_size ? message_safari : message_non_safari

# class Mail
#   def initialize(email, fancy = false)
#     @email = email
#     @fancy = fancy
#   end
#
#   def send_message
#     if fancy
#       MailServer.connect("http://mixmax.com", api_key: "f20506xx808c").send_message({ to: @email, body: "Welcome to MyProduct, fancy person!" })
#     else
#       MailServer.connect("http://mixmax.com", api_key: "f20506xx808c").send_message({ to: @email, body: "Welcome to MyProduct" })
#     end
#   end
# end

class Mail
  def initialize(email, fancy = false)
    @email = email
    @fancy = fancy
  end

  def send_message
    body = @fancy ? "#{ message }, fancy person!" : message
    message = "Welcome to MyProduct"
    
    server = MailServer.connect("http://mixmax.com", api_key: "f20506xx808c")

    server.send_message({ to: @email, body: message })
  end
end
