require 'slack-notifier'

module Xpitality
  module Notifier
    module Chat
      class SlackNotifier

        def self.notify(message, options)
          notifier = Slack::Notifier.new options[:webhook_url], channel: options[:channel], username: options[:username]

          if options[:attachment]
            attachment = {
                fallback: options[:attachment],
                text: options[:attachment],
                color: 'good' }
            notifier.post text: message, attachments: [attachment], icon_url: options[:icon_url]
          else
            notifier.post text: message, icon_url: options[:icon_url]
          end

          # client = SlackNotify::Client.new(
          #   webhook_url: options[:webhook_url],
          #   channel: options[:channel],
          #   username: options[:username],
          #   unfurl_links: 0,
          #   link_names: 0,
          #   icon_url: options[:icon_url]
          # )
          #
          # client.notify message
        end
      end
    end
  end
end