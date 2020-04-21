require 'diary.rb'

describe Diary do
  subject(:diary) { described_class.new(entry_class_double) }

  let(:entry_class_double) { double :entry_class, new: entry }
  let(:entry) { double :entry, title: 'Title', body: 'Body' }

  describe 'add' do
    it { is_expected.to respond_to(:add).with(2).arguments }

    it 'logs all the entries' do
      expect{ diary.add('Title', 'Body') }.to change{ diary.entries }.to include entry
    end
  end

  describe 'index' do
    it { is_expected.to respond_to(:index) }

    it 'returns joined entry titles' do
      diary.add('Title', 'Body')

      expect(entry).to receive(:title)

      diary.index
    end
  end
end
