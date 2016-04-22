require 'bugsnag'
describe Xpitality::Notifier::Exception::BugsnagNotifier do
  subject { Xpitality::Notifier::Exception::BugsnagNotifier }

  describe 'notify' do
    it 'instantiates SlackNotify client and calls notify on it' do
      expect(Bugsnag).to receive(:notify).with('message').and_call_original
      subject.notify('message', {})
    end
  end
end