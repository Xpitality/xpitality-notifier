module Xpitality
  module Notifier
    module Exception
      class SentryNotifier
        def self.notify(message, options)
          Sentry.capture_message(message)
        end
      end
    end
  end
end