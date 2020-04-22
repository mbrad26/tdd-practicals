require 'lock'

describe Lock do
  it { is_expected.to respond_to(:unlock) }

  describe '#unlock' do
    it 'sets the lock to false' do
      expect(subject.unlock).to eq false
    end

    context 'when try to unlock again' do
      it 'raises an error' do
        subject.unlock

        expect { subject.unlock }.to raise_error 'Diary already unlocked!'
      end
    end
  end

  describe '#lock' do
    it 'sets the lock back to true' do
      subject.unlock

      expect(subject.lock).to eq true
    end

    context 'when try to lock again' do
      it 'raises an error' do
        expect { subject.lock }.to raise_error 'Diary already locked!'
      end
    end
  end
end
