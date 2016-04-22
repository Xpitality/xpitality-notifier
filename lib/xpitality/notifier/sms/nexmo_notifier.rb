# require 'nexmo'

module Xpitality
  module Notifier
    module Sms
      class NexmoNotifier

        def self.notify(message, options)
          client = Nexmo::Client.new(key: options[:key], secret: options[:secret])
          client.send_message(from: options[:from], to: options[:to], text: message)
        end
      end
    end
  end
end