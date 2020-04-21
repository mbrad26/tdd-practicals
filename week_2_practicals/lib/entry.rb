class Entry
  def initialize(title, body)
    @title = title
    @body = body
  end

  attr_reader :title, :body
end
