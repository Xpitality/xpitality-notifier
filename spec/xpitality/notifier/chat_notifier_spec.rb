describe Xpitality::Notifier::ChatNotifier do

  subject { Xpitality::Notifier::ChatNotifier }

  describe 'configure' do
    Xpitality::Notifier::ChatNotifier::SETTABLE_OPTIONS.each do |var|
      it "sets an instance variable #{var}" do
        expect(subject.send(var)).to eq nil
        expect(subject).to receive("#{var}=".to_sym).with('some_value').and_call_original

        subject.configure { |config| config.send("#{var}=".to_sym, 'some_value') }
        expect(subject.send(var)).to eq 'some_value'
      end
    end
  end

  describe 'default_options' do
    before(:each) { reset_options(subject) }

    context 'when no values configured' do
      it 'sets all values to nil' do
        options = subject.default_options
        expect(options.keys.sort).to eq Xpitality::Notifier::ChatNotifier::PASSABLE_OPTIONS.sort
        expect(options.values.uniq).to eq [nil]
      end
    end
  end

  describe 'sanity_check' do
    before(:each) { reset_options(subject) }

    it 'with nil client raises an exception' do
      expect(subject.client).to be_nil
      expect { subject.sanity_check }.to raise_error 'unknown client'
    end

    it 'with unknown client raises an exception' do
      subject.configure { |config| config.client = :wrong_client }
      expect(subject.client).to eq :wrong_client
      expect { subject.sanity_check }.to raise_error 'unknown client'
    end

    context 'with known client' do
      before :each do
        subject.configure do |config|
          config.client = Xpitality::Notifier::ChatNotifier::KNOWN_CLIENTS.sample
        end
      end

      let(:options) { Hash[*Xpitality::Notifier::ChatNotifier::PASSABLE_OPTIONS.collect { |o| [o, 'some_value'] }.flatten] }
      let(:an_option) { Xpitality::Notifier::ChatNotifier::PASSABLE_OPTIONS.sample }

      it 'raises an error when an option is missing' do
        options.merge!({ an_option => nil })
        expect { subject.sanity_check(options) }.to raise_error "mandatory option #{an_option} is missing"
      end

      it 'passes when all options are set' do
        expect { subject.sanity_check(options) }.not_to raise_error
      end
    end
  end

  describe 'notify' do
    before :each do
      subject.configure do |config|
        config.client = Xpitality::Notifier::ChatNotifier::KNOWN_CLIENTS.sample
      end
    end

    let(:options) { Hash[*Xpitality::Notifier::ChatNotifier::PASSABLE_OPTIONS.collect { |o| [o, 'some_value'] }.flatten] }

    context 'with correct options' do
      it 'instantiates client and calls notify on it' do
        message = 'hello'
        expect_any_instance_of(subject.client_class).to receive(:initialize).with(options)
        expect_any_instance_of(subject.client_class).to receive(:notify).with(message)

        subject.notify(message, options)
      end
    end
  end

  def reset_options(subject)
    Xpitality::Notifier::ChatNotifier::SETTABLE_OPTIONS.each do |var|
      subject.configure { |config| config.send("#{var}=".to_sym, nil) }
    end
  end
end