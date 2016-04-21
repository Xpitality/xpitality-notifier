[![Semaphore Build Status](https://semaphoreci.com/api/v1/marko_xpitality/xpitality-notifier/branches/master/badge.svg)](https://semaphoreci.com/marko_xpitality/xpitality-notifier)  ![Simplecov Coverage badge](/coverage/coverage-badge.png?raw=true "Coverage badge")

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

Third party clients also need to be added to the Gemfile, ie:

    gem 'slack-notify'

## Configuration 

### ChatNotifier

Available clients: *[:slack]*

Global options may be added in the initializer (any option may be set/overriden in runtime):

    Xpitality::Notifier::ChatNotifier.configure do |config|
      config.set_option :client, :slack
      config.set_option :webhook_url, 'https://hooks...'
      config.set_option :channel, '#dev'
      config.set_option :username, 'xpitality cms'
      config.set_option :icon_url, 'https://xpitalitycms.com/images/icons/xpitality.png'
    end

### SmsNotifier

Available clients: *[:nexmo]*

Global options may be added in the initializer (any option may be set/overriden in runtime):

    Xpitality::Notifier::SmsNotifier.configure do |config|
      config.set_option :client, :nexmo
      config.set_option :secret, ENV['nexmo_secret']
      config.set_option :key, ENV['nexmo_key']
      config.set_option :from, 'xpitality cms'
      config.set_option :to, '01234567'
    end

## Usage

### ChatNotifier

    # default options (set in the initializer) used to instantiate the client
    Xpitality::Notifier::ChatNotifier.notify('some message')
    
    # overriding default options
    Xpitality::Notifier::ChatNotifier.notify('some message', channel: '#staging')

### SmsNotifier

    # default options (set in the initializer) used to instantiate the client
    Xpitality::Notifier::SmsNotifier.notify('some message', to: '+381651234567')
    
    # overriding default options
    Xpitality::Notifier::ChatNotifier.notify('some message', client: :nexmo, from: 'Xpitality support', to: '+381651234567')
    