class Lock
  attr_accessor :lock_it

  def initialize
    @lock_it = true
  end

  def unlock
    @lock_it = false
  end

  def lock
    @lock_it = true
  end
end
