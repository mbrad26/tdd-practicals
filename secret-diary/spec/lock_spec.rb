require 'lock'

describe Lock do
  it { is_expected.to respond_to(:unlock) }

  describe '#unlock' do
    it 'sets the lock to false' do
      expect(subject.unlock).to eq false
    end
  end

  describe '#lock' do
    it 'sets the lock back to true' do
      subject.unlock

      expect(subject.lock).to eq true
    end
  end
end
