class Diary

  attr_accessor :lock
  attr_reader :entries

 def initialize
   @lock = Lock.new
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

end
