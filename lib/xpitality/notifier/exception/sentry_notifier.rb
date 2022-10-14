module Xpitality
  module Notifier
    module Exception
      class SentryNotifier
        def self.notify(message, options)
          if message.is_a?(::Exception)
            Sentry.capture_exception(message)
          else
            Sentry.capture_message(message)
          end
        end
      end
    end
  end
end