class SlackChannel
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Student
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Membership
  attr_reader :student, :slack_channel

  def initialize(student, slack_channel)
    @student = student
    @slack_channel = slack_channel
  end
end

marius = Student.new('Marius')
mox = Student.new('Mox')
ana = Studen.new('Ana')
april2020 = SlackChannel.new('Green April 2020')
welbeing = SlackChannel.new('Welbeing')
august2020 = SlackChannel.new('Pink August 2020')
events = SlackChannel('Events')

memberships = [
  Membership.new(marius, april2020),
  Membership.new(mox, april2020),
  Membership.new(ana, welbeing),
  Membership.new(marius, welbeing),
  Membership.new(mox, welbeing),
  Membership.new(ana, august2020),
  Membership.new(mox, events),
]
