require 'nexmo'
describe Xpitality::Notifier::Sms::NexmoNotifier do
  subject { Xpitality::Notifier::Sms::NexmoNotifier }


  describe 'notify' do
    it 'instantiates Nexmo::Client and calls notify on it' do
      expect_any_instance_of(Nexmo::Client).to receive(:initialize).and_call_original
      expect_any_instance_of(Nexmo::Client).to receive(:send_message).and_call_original
      subject.notify('message', {})
    end
  end
end