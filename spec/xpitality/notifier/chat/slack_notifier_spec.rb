require 'slack-notify'
describe Xpitality::Notifier::Chat::SlackNotifier do
  subject { Xpitality::Notifier::Chat::SlackNotifier }

  describe 'notify' do
    it 'instantiates SlackNotify client and calls notify on it' do
      expect_any_instance_of(SlackNotify::Client).to receive(:initialize).and_call_original
      expect{subject.notify('message', {})}.to raise_error(ArgumentError, 'Webhook URL required')
    end
  end
end