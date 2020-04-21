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

    context 'when diary is unlocked' do
      describe '#add_entry' do
        it 'adds an entry to the diary' do

        end
      end
    end
  end
end
  # context 'when locked' do
  #   it 'raises an error' do
  #
  #   end
  # end
