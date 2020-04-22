class Diary
 attr_reader :entries, :locker

 def initialize(locker = Lock.new)
   @locker = locker
   @entries = []
 end

  def add_entry(entry)
    raise 'The secret diary is closed!' if @locker.lock_it
    raise 'Diary already locked!' if @locker.lock_it == true
    @entries << entry
  end

  def get_entries
    raise 'The secret diary is closed!' if @locker.lock_it
    @entries.pop
  end

end
