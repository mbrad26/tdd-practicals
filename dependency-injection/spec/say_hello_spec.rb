require 'say_hello'

describe SayHello do
  describe '#run' do
    subject(:say_hello) { SayHello.new(email_class_double) }
    let(:email_class_double) { double :email_class, new: message_double }
    let(:message_double) { double :message }

    it 'sends an email' do
      expect(message_double).to receive_message_chain(:message, :send)
      say_hello.run
    end
  end
end
