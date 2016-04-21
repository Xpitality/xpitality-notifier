## 0.0.2 - 2016-04-21
  * changes how the options are specified in the initializer
  * adds SmsNotifier

### Breaking change:

Instead of this:

    Xpitality::Notifier::ChatNotifier.configure do |config|
      config.client = :slack
    end

Options should be specified like this in the initializer:

    Xpitality::Notifier::ChatNotifier.configure do |config|
      config.set_option :client, :slack
    end    

## 0.0.1 - 2016-04-21
  * initial commit
  * adds ChatNotifier
  * adds Simplecov and Semaphore