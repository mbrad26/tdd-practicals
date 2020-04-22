require 'note_formatter'

describe NoteFormatter do
  describe '#note' do
    it 'formats a note' do
      note = double :note, title: 'My note', body: 'Dependency Injection'

      expect(subject.format(note)).to eq "Title: My note\nDependency Injection"
    end
  end
end
