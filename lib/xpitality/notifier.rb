require 'xpitality/notifier/version'

require 'xpitality/notifier/base_notifier'

require 'xpitality/notifier/chat_notifier'
require 'xpitality/notifier/chat/slack_notifier'

require 'xpitality/notifier/sms_notifier'
require 'xpitality/notifier/sms/nexmo_notifier'

require 'xpitality/notifier/exception_notifier'
require 'xpitality/notifier/exception/bugsnag_notifier'
require 'xpitality/notifier/exception/sentry_notifier'

require 'active_support/core_ext/hash'