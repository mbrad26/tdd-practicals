class SlackChannel
  attr_reader :name, :students

  def initialize(name)
    @name = name
    @students = []
  end

  def add_student(student)
    @students << student
  end
end

class Student
  attr_reader :name, :slack_channel

  def initialize(name)
    @name = name
    @slack_channels = []
  end

  def add_slack_channel(slack_channel)
    @slack_channels << slack_channel
  end
end

marius = Student.new('Marius')
mox = Student.new('Mox')
april2020 = SlackChannel.new('Green April 2020')
wellbeing = SlackChannel.new('wellbeing')

april2020 .add_student(marius)
marius.add_slack_channel(april2020)
wellbeing.add_student(mox)
mox.add_slack_channel(wellbeing)
wellbeing.add_student(marius)
marius.add_slack_channel(wellbeing)
mox.add_slack_channel(april2020)
april2020.add_student(mox)
