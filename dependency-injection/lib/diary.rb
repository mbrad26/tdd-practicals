require_relative 'entry'

class Diary
  attr_reader :entries

  def initialize(entry = Entry)
    @entries = []
    @entry = entry
  end

  def add(title, body)
    @entries << @entry.new(title, body)
  end

  def index
    titles = @entries.map do |entry|
      entry.title
    end
    titles.join("\n")
  end
end
