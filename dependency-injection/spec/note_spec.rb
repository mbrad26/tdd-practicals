require 'note'

describe Note do
  let(:format) { double :formatter, format: "Title: My note\nRemeber dependency injection" }

  describe '#display' do
    it 'formats a note' do
      note = Note.new('My note', 'Remeber dependency injection', format)

      expect(note.display).to eq "Title: My note\nRemeber dependency injection"
    end
  end
end
