module Xpitality
  module Notifier
    class ChatNotifier < Xpitality::Notifier::BaseNotifier

      @known_clients = [:slack]
      @passable_options = [:webhook_url, :channel, :username, :icon_url]

      class << self
        def client_class
          case get_option :client
            when :slack
              Xpitality::Notifier::Chat::SlackNotifier
            else
              raise 'unknown client'
          end
        end
      end
    end
  end
end