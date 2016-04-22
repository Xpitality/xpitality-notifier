# require 'slack-notify'
module Xpitality
  module Notifier
    module Chat
      class SlackNotifier

        def self.notify(message, options)
          client = SlackNotify::Client.new(
            webhook_url: options[:webhook_url],
            channel: options[:channel],
            username: options[:username],
            unfurl_links: 0,
            link_names: 0,
            icon_url: options[:icon_url]
          )

          client.notify message
        end
      end
    end
  end
end