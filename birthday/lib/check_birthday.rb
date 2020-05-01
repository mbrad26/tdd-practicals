class CheckBirthday

  def initialize(day, month)
    @day = day
    @month = month
  end

  def check_birthday
    return 'Happy Birthday' if birthday?
    "Your birthday will be in #{days_until_birthday} days"
  end

  private

  def birthday?
    now = Time.now
    return true if @day == now.day && @month == now.month
    false
  end

  def parse_birthday_date
    year = Time.now.year
    Time.parse("#{year}-#{@month}-#{@day}")
  end

  def days_until_birthday
    days = ((parse_birthday_date - Time.now) / 86400).to_i
    return 365 + days if @month.to_i < Time.now.month
    days
  end
end
