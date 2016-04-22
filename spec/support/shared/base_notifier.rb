RSpec.shared_examples 'base notifier' do

  describe 'configure' do
    it 'sets and gets an instance variable' do
      var = subject.passable_options.sample
      if subject.passable_options.empty?
        pending "#{subject.name} has no passable options, and thus getters and setters can not be tested"
        raise
      else
        expect(subject.get_option(var)).to eq nil
        expect(subject).to receive(:set_option).with(var, 'some_value').and_call_original

        subject.configure { |config| config.set_option var, 'some_value' }
        expect(subject.get_option(var)).to eq 'some_value'
      end
    end
  end

  describe 'default_options' do
    before(:each) { reset_options(subject) }

    context 'when no values configured' do
      it 'sets all values to nil' do
        if subject.passable_options.empty?
          expect(subject.default_options).to be_empty
        else
          options = subject.default_options
          expect(options.keys.sort).to eq subject.passable_options.sort
          expect(options.values.uniq).to eq [nil]
        end
      end
    end
  end

  describe 'sanity_check' do
    before(:each) { reset_options(subject) }

    it 'with nil client raises an exception' do
      expect(subject.get_option(:client)).to be_nil
      expect { subject.sanity_check }.to raise_error 'unknown client'
    end

    it 'with unknown client raises an exception' do
      subject.configure { |config| config.set_option :client, :wrong_client }
      expect(subject.get_option :client).to eq :wrong_client
      expect { subject.sanity_check }.to raise_error 'unknown client'
    end

    context 'with known client' do
      before :each do
        subject.configure do |config|
          config.set_option :client, subject.known_clients.sample
        end
      end

      let(:options) { Hash[*subject.passable_options.collect { |o| [o, 'some_value'] }.flatten] }
      let(:an_option) { subject.passable_options.sample }

      it 'raises an error when an option is missing' do
        if subject.passable_options.empty?
          pending "#{subject.name} has no passable options, and thus sanity_check for passable options always passes"
          raise
        else
          options.merge!({ an_option => nil })
          expect { subject.sanity_check(options) }.to raise_error "mandatory option #{an_option} is missing"
        end
      end

      it 'passes when all options are set' do
        expect { subject.sanity_check(options) }.not_to raise_error
      end
    end
  end

  describe 'notify' do
    before :each do
      subject.configure do |config|
        config.set_option :client, subject.known_clients.sample
      end
    end

    let(:options) { Hash[*subject.passable_options.collect { |o| [o, 'some_value'] }.flatten] }

    context 'with correct options' do
      it 'instantiates client and calls notify on it' do
        message = 'hello'

        expect(subject.client_class).to receive(:notify).with(message, options)

        subject.notify(message, options)
      end
    end
  end

  def reset_options(subject)
    subject.passable_options.each do |var|
      subject.set_option var, nil
    end
    subject.set_option :client, nil
  end
end