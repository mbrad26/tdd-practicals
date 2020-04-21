class Lock
  attr_reader :lock

  def initialize
    @lock = true
  end

  def unlock
    @lock = false
  end

  def lock
    @lock = true
  end
end
