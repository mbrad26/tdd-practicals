class CheckBirthday

  def initialize(day, month)
    @day = day
    @month = month
  end

  def check_birthday
    return "Your birthday will be in #{days_until_birthday} days" if days_until_birthday != 0
    'Happy Birthday'
  end

  private

  def parse_birthday_date
    year = Time.now.year
    Time.parse("#{year}-#{@month}-#{@day}")
  end

  def days_until_birthday
    days = ((parse_birthday_date - Time.now) / 86400).ceil
    return 365 + days if @month.to_i < Time.now.month
    days
  end
end
