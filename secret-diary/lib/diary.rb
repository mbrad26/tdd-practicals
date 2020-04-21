class Diary
 attr_reader :entries

 def initialize
   @lock = true
   @entries = []
 end

  def add_entry(entry)
    raise 'The secret diary is closed!' if @lock
    @entries << entry
  end

  def get_entries
    raise 'The secret diary is closed!' if @lock
    @entries.pop
  end

  def unlock
    @lock = false
  end
end
