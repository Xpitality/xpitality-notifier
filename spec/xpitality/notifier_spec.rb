require 'spec_helper'

describe Xpitality::Notifier do
  it 'has a version number' do
    expect(Xpitality::Notifier::VERSION).not_to be nil
  end


  context 'when multiple clients used' do

    before :each do
      Xpitality::Notifier::ChatNotifier.configure do |config|
        config.set_option :client, :slack
        config.set_option :channel, '#dev'
        config.set_option :username, 'tester'
      end

      Xpitality::Notifier::SmsNotifier.configure do |config|
        config.set_option :client, :nexmo
        config.set_option :from, 'Support dpt'
      end

      Xpitality::Notifier::ExceptionNotifier.configure do |config|
        config.set_option :client, :bugsnag
      end
    end

    it 'configures them correctly' do
      expect(Xpitality::Notifier::ChatNotifier.get_option(:client)).to eq :slack
      expect(Xpitality::Notifier::ChatNotifier.get_option(:channel)).to eq '#dev'
      expect(Xpitality::Notifier::ChatNotifier.get_option(:username)).to eq 'tester'
      expect(Xpitality::Notifier::ChatNotifier.get_option(:from)).to be_nil

      expect(Xpitality::Notifier::SmsNotifier.get_option(:client)).to eq :nexmo
      expect(Xpitality::Notifier::SmsNotifier.get_option(:from)).to eq 'Support dpt'
      expect(Xpitality::Notifier::SmsNotifier.get_option(:channel)).to be_nil
      expect(Xpitality::Notifier::SmsNotifier.get_option(:username)).to be_nil

      expect(Xpitality::Notifier::ExceptionNotifier.get_option(:client)).to eq :bugsnag
      expect(Xpitality::Notifier::ExceptionNotifier.get_option(:from)).to be_nil
      expect(Xpitality::Notifier::ExceptionNotifier.get_option(:channel)).to be_nil
      expect(Xpitality::Notifier::ExceptionNotifier.get_option(:username)).to be_nil
    end

  end
end