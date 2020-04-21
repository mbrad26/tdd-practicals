class Diary

 def initialize
   @lock = true
 end

  def add_entry(entry)
    raise 'The secret diary is closed!' if @lock
  end

  def get_entries
    raise 'The secret diary is closed!' if @lock
  end

  def unlock
  end
end
