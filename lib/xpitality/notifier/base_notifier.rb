module Xpitality
  module Notifier
    class BaseNotifier
      @client = nil
      @known_clients = []
      @passable_options = []

      @passable_options.each { |opt| self.instance_variable_set("@#{opt}".to_sym, nil) }

      class << self
        def configure
          yield self if block_given?
        end

        def get_option(option)
          self.instance_variable_get("@#{option}".to_sym)
        end

        def set_option(option, value)
          self.instance_variable_set("@#{option}".to_sym, value)
        end

        def default_options
          Hash[*passable_options.collect { |o| [o, get_option(o)] }.flatten]
        end

        def sanity_check(options={})
          raise 'unknown client' unless known_clients.include?(@client)
          default_options.keys.each do |opt|
            raise "mandatory option #{opt} is missing" unless options[opt]
          end
        end

        def notify(message, options={})
          options.symbolize_keys!
          options = default_options.merge(options)
          sanity_check(options)
          client_class.notify message, options
        end

        def client_class
          raise NotImplementedError
        end

        def known_clients
          @known_clients
        end

        def passable_options
          @passable_options
        end
      end
    end
  end
end