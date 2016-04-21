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