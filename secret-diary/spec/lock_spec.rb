require 'lock'

describe Lock do
  it { is_expected.to respond_to(:unlock) }

  describe '#unlock' do
    it 'sets the lock to true' do
      expect(subject.unlock).to be true
    end
  end

  describe '#lock' do
    it 'sets the lock back to false' do
      subject.unlock
      
      expect(subject.lock).to be false
    end
  end
end
