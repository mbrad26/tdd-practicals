require 'check_birthday'

describe CheckBirthday do

  describe '#check_birthday' do
    context 'when today is birthday day' do
      it 'returns a happy birthday message' do
        subject = described_class.new(Time.now.day, Time.now.month)

        expect(subject.check_birthday).to eq 'Happy Birthday'
      end
    end

    context 'when today is not birthday day' do
      it 'returns count until next birthday' do
        day = Time.now.day + 3
        month = Time.now.month
        subject = described_class.new(day, month)

        expect(subject.check_birthday).to eq 'Your birthday will be in 3 days'
      end
    end
  end
end
