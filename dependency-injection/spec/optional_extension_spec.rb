require 'optional_extension'

describe Greeter do
  describe '#greet' do
    it "prints greeting with the user's name" do
      expect(Kernel).to receive_message_chain(:gets, :chomp).and_return('Marius')

      subject.greet
    end
  end
end
