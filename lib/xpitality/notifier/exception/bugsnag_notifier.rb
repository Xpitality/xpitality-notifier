module Xpitality
  module Notifier
    module Exception
      class BugsnagNotifier

        def self.notify(message, options)
          Bugsnag.notify message
        end
      end
    end
  end
end