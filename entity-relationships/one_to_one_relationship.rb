class Cohort
  attr_reader :name, :slack_channel

  def initialize(name, slack_channel)
    @name = name
    @slack_channel = slack_channel
  end
end

class SlackChannel
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

slack_channel = SlackChannel.new('green-april2020')
cohort = Cohort.new('Green April 2020', slack_channel)
