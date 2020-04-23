# def send_email_to(user)
#   email = user.email.strip
#   mail  = Mail.new(email)
#
#   mail.send_message
# end

def send_email_to(user)
  email = user.email.strip

  send_email(email)
end

def send_email(email)
  mail  = Mail.new(email)

  mail.send_message
end

# def tell_browser_type(browser)
#   browser_type_is_safari = browser.type == "Safari"
#   safari_message = "You are using the Safari browser."
#   not_safari_message = "You are using a non-Safari browser."
#
#   browser_type_is_safari ? puts safari_message : puts not_safari_message
# end

def tell_browser_type(browser)
  safari_message = "You are using the Safari browser."
  not_safari_message = "You are using a non-Safari browser."

  browser_type?(browser) ? puts safari_message : puts not_safari_message
end

def browser_type?(browser)
  browser.type == "Safari"
end

# def send_correct_page(browser, window)
#   browser_type_is_safari = browser.type == "Safari"
#   window_size_is_small = window.size < "768px"

#   safari_small_message = "You are using the Safari browser in a small window."
#   not_safari_or_big_message = "You are not using the Safari browser or have a big window."

#   browser_type_is_safari && window_size_is_small ? safari_small_message : not_safari_or_big_message
# end

def send_correct_page(browser, window)
  safari_small_message = "You are using the Safari browser in a small window."
  not_safari_or_big_message = "You are not using the Safari browser or have a big window."

  browser_type?(browser) && window_size?(window) ? safari_small_message : not_safari_or_big_message
end

def browser_type?(browser)
  browser.type == "Safari"
end

def window_size?(window)
  window.size < "768px"
end
