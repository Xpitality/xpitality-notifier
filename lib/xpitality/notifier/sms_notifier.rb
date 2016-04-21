module Xpitality
  module Notifier
    class SmsNotifier < Xpitality::Notifier::BaseNotifier

      @known_clients = [:nexmo]
      @passable_options = [:key, :secret, :from, :to]

      class << self
        def client_class
          case get_option :client
            when :nexmo
              ::Nexmo::Client
            else
              raise 'unknown client'
          end
        end
      end
    end
  end
end