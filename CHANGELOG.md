## 0.0.4 - 2017-06-02
  * allows BugsnagNotifier to pass data to custom tabs 

## 0.0.3 - 2016-04-27
  * builds in a possibility to skip the client initialization and notify method if client is specified as :specs (useful when gem is used as a dependency in a gem)

## 0.0.2 - 2016-04-21
  * changes how the options are specified in the initializer
  * adds SmsNotifier
  * adds NexmoNotifier
  * adds ExceptionNotifier
  * adds BugsnagNotifier

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