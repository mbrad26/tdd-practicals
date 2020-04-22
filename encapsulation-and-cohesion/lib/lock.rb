class Lock
  attr_accessor :lock_it

  def initialize
    @lock_it = true
  end

  def unlock
    raise 'Diary already unlocked!' unless @lock_it
    @lock_it = false
  end

  def lock
    raise 'Diary already locked!' if @lock_it
    @lock_it = true
  end
end
