![Simplecov Coverage badge](/coverage/coverage-badge.png?raw=true "Coverage badge")  [![Semaphore Build Status](https://semaphoreci.com/api/v1/marko_xpitality/xpitality-notifier/branches/master/badge.svg)](https://semaphoreci.com/marko_xpitality/xpitality-notifier)

[Changelog](/CHANGELOG.md)

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

```ruby
    gem 'slack-notify'
```

## Configuration 

### Common

Global options may be added in the initializer (any option may be set/overriden in runtime)

### ChatNotifier

Available clients: *[:slack]*

```ruby
    require 'slack-notify'
    Xpitality::Notifier::ChatNotifier.configure do |config|
      config.set_option :client, :slack
      config.set_option :webhook_url, 'https://hooks...'
      config.set_option :channel, '#dev'
      config.set_option :username, 'xpitality cms'
      config.set_option :icon_url, 'https://xpitalitycms.com/images/icons/xpitality.png'
    end
```    

### SmsNotifier

Available clients: *[:nexmo]*

```ruby
    require 'nexmo'
    Xpitality::Notifier::SmsNotifier.configure do |config|
      config.set_option :client, :nexmo
      config.set_option :secret, ENV['nexmo_secret']
      config.set_option :key, ENV['nexmo_key']
      config.set_option :from, 'xpitality cms'
      config.set_option :to, '01234567'
    end
```

### ExceptionNotifier

Available clients: *[:bugsnag]*

```ruby
    require 'bugsnag'
    Xpitality::Notifier::ExceptionNotifier.configure do |config|
      config.set_option :client, :bugsnag
    end
```

## Third party gems setup

### ChatNotifier

#### Slack

* does not require any special configuration, if the token is passed in the initializer (within webhook)

### SmsNotifier

#### Nexmo

* it needs to have *nexmo_key* and *nexmo_secret* in ENV

### ExceptionNotifier

#### Bugsnag

* bugsnag initializer needs to be present

```ruby
    Bugsnag.configure do |config|
      config.api_key = ENV['BUGSNAG_API_KEY']
      config.notify_release_stages = %w(production staging)
      config.timeout = 20
    end
```

## Usage

Usage for all notifiers is the same:

    NotifierClass.notify(message, options)
    
If mandatory options are specified in the initializer, then the second argument may be skipped.
All options from the initializer may be overriden.
    
Examples:    

```ruby
    Xpitality::Notifier::ChatNotifier.notify('some message')
    Xpitality::Notifier::ChatNotifier.notify('some message', channel: '#staging')
    
    Xpitality::Notifier::SmsNotifier.notify('some message', to: '+381651234567')
    Xpitality::Notifier::ChatNotifier.notify('some message', client: :nexmo, from: 'Xpitality support', to: '+381651234567')
    
    begin
      #some_code_that_raises_exception
    rescue Exception => e
      # do_something
      Xpitality::Notifier::ExceptionNotifier.notify e
    end
```    