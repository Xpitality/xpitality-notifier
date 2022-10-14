module Xpitality
  module Notifier
    class ExceptionNotifier < Xpitality::Notifier::BaseNotifier

      @known_clients = [:bugsnag, :sentry]
      @passable_options = []

      class << self
        def client_class
          case get_option :client
            when :bugsnag
              Xpitality::Notifier::Exception::BugsnagNotifier
            when :sentry
              Xpitality::Notifier::Exception::SentryNotifier
            else
              raise 'unknown client'
          end
        end
      end
    end
  end
end