require 'optional_extension'

describe Greeter do
  describe '#greet' do
    it "prints greeting with the user's name" do
      # kernel_class_double = double :kernel_class
      # allow_any_instance_of(Kernel).to receive(:gets).and_return('Marius')
      expect(Kernel).to receive_message_chain(:gets, :chomp).and_return('Marius')

      subject.greet
    end
  end
end
