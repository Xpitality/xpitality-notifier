[![Semaphore Build Status](https://semaphoreci.com/api/v1/marko_xpitality/xpitality-notifier/branches/master/badge.svg)](https://semaphoreci.com/marko_xpitality/xpitality-notifier)

![Simplecov Coverage badge](/coverage/coverage-badge.png?raw=true "Coverage badge")

# Xpitality::Notifier


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xpitality-notifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xpitality-notifier


## Configuration 

### ChatNotifier

Available clients: *[:slack]*

Add this to the xpitality.rb initializer:

    Xpitality::Notifier::ChatNotifier.configure do |config|
      config.client = :slack
      config.webhook_url = 'https://hooks...'
      config.channel = '#dev'
      config.username = 'xpitality cms'
      config.icon_url = 'https://xpitalitycms.com/images/icons/xpitality.png'
    end

## Usage

### ChatNotifier

    # default options (set in the initializer) used to instantiate the client
    Xpitality::Notifier::ChatNotifier.notify('some message')
    
    # overriding default options
    Xpitality::Notifier::ChatNotifier.notify('some message', channel: '#staging')