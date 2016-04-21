require 'simplecov'
SimpleCov.start do
  require 'simplecov-badge'

  # configure any options you want for SimpleCov::Formatter::BadgeFormatter
  SimpleCov::Formatter::BadgeFormatter.generate_groups = true
  SimpleCov::Formatter::BadgeFormatter.strength_foreground = true
  SimpleCov::Formatter::BadgeFormatter.timestamp = true
  # call SimpleCov::Formatter::BadgeFormatter after the normal HTMLFormatter
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter::new [
                                                                    SimpleCov::Formatter::HTMLFormatter,
                                                                    SimpleCov::Formatter::BadgeFormatter,
                                                                  ]
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'xpitality/notifier'
