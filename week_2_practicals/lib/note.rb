require_relative 'note_formatter'

class Note
  attr_reader :title, :body

  def initialize(title, body, formatter = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = formatter
  end

  def display
    @formatter.format(self)
  end
end
