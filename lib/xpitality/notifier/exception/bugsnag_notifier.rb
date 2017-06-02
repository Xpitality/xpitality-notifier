module Xpitality
  module Notifier
    module Exception
      class BugsnagNotifier

        def self.notify(message, options)
          Bugsnag.notify(message) do |notification|
            if options[:tabs]
              options[:tabs].each do |key, value|
                notification.add_tab(key.to_sym, value)
              end
            end
          end
        end
      end
    end
  end
end