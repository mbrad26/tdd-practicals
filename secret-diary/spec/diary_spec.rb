require 'diary'

describe Diary do
  subject(:diary) { described_class.new }

  describe '#add_entry' do
    it { is_expected.to respond_to(:add_entry).with(1).argument }

    it 'returns an error when diary is closed' do
      error = 'The secret diary is closed!'
      expect { diary.add_entry('entry') }.to raise_error error
    end
  end

  describe '#get_entries' do
    it { is_expected.to respond_to(:get_entries) }

    it 'returns an error when diary is closed' do
      error = 'The secret diary is closed!'
      expect { diary.get_entries }.to raise_error error
    end
  end

  describe '#unlock' do
    it { is_expected.to respond_to(:unlock) }
  end

  context 'when diary is unlocked' do
    before do
      diary.unlock
    end

    describe '#add_entry' do
      it 'adds an entry to the diary' do
        expect { diary.add_entry('my entry') }.to change{ subject.entries }.to include 'my entry'
      end
    end

    describe '#get_entries' do
      it 'gets all the entries in the diary' do
        diary.add_entry('my entry')

        expect(diary.get_entries).to eq 'my entry'
      end
    end
  end
end
