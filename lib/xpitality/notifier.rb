require 'xpitality/notifier/version'

require 'xpitality/notifier/base_notifier'

require 'xpitality/notifier/chat_notifier'
require 'xpitality/notifier/chat/slack_notifier'

require 'xpitality/notifier/sms_notifier'
require 'xpitality/notifier/sms/nexmo_notifier'

require 'xpitality/notifier/exception_notifier'
require 'xpitality/notifier/exception/bugsnag_notifier'

require 'active_support/core_ext/hash'

# module Xpitality
#   module Notifier
#     # Your code goes here...
#   end
# end
