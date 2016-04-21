module Xpitality
  module Notifier
    class ChatNotifier

      KNOWN_CLIENTS = [:slack].freeze
      PASSABLE_OPTIONS = [:webhook_url, :channel, :username, :icon_url].freeze
      SETTABLE_OPTIONS = ([:client] + PASSABLE_OPTIONS).freeze

      SETTABLE_OPTIONS.each { |opt| self.class_variable_set("@@#{opt}".to_sym, nil) }

      class << self
        def configure
          yield self if block_given?
        end

        SETTABLE_OPTIONS.each do |method_name|
          define_method method_name do
            self.class_variable_get("@@#{method_name}".to_sym)
          end

          define_method "#{method_name}=".to_sym do |arg|
            self.class_variable_set("@@#{method_name}".to_sym, arg)
          end
        end

        def notify(message, options={})
          options.symbolize_keys!
          options = default_options.merge(options)
          sanity_check(options)
          client_class.new(options).notify message
        end

        def default_options
          { webhook_url: webhook_url,
            channel: channel,
            username: username,
            icon_url: icon_url }
        end

        def sanity_check(options={})
          raise 'unknown client' unless KNOWN_CLIENTS.include?(client)
          default_options.keys.each do |opt|
            raise "mandatory option #{opt} is missing" unless options[opt]
          end
        end

        def client_class
          case client
            when :slack
              ::SlackNotify::Client
            else
              raise 'unknown client'
          end
        end
      end
    end
  end
end