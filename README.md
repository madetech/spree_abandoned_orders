# Abandoned Orders For Spree

An abandoned order extension for Spree, which looks for orders with line items that were created between X & Y days ago and sends an email notification to the customer to remind them to purchase.

Originally this gem was forked from [https://github.com/Hates/spree_abandoned_cart_email](https://github.com/Hates/spree_abandoned_cart_email) but we subsequently decided to rewrite the functionality to make it more modular and reusable across multiple applications.

##Installation

Add spree_abandoned_orders to your Gemfile:

```ruby
gem 'spree_abandoned_orders'
```

Bundle your dependencies and run the installation generator:

```ruby
bundle install
bundle exec rails g spree_abandoned_orders:install

bundle exec rake db:migrate
```

Use the config values below to change settings:

```ruby
Spree::AbandonedOrdersConfig.inactivity_for = 12.hours
Spree::AbandonedOrdersConfig.ignore_after = 5.days
```

Override the email view to customise:

```
app/views/spree/abandoned_order_mailer/abandoned_email.html.erb
```

Create a rake task to send the email:

```
desc "Abandoned order email"
task send_abandoned_order_notifications: :environment do
    abandoned_orders = Spree::AbandonedOrders::LookupQuery.new
    Spree::AbandonedOrders::FilterNotifiedQuery.new(abandoned_orders).find_each do |order|
      Spree::AbandonedOrders::Notifier.new(order)
    end
end
```


##Testing

To run the tests, create a dummy Rails application and run the suite.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

## Credits

![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)

Developed and maintained by [Made Tech Ltd](https://www.madetech.com/). Key contributions:

* [Nick Wood](https://github.com/SebAshton)
* [Rory MacDonald](https://github.com/rorymacdonald)
* [Andrew Scott](https://github.com/askl56)


## License
Copyright © 2016 [Made Tech Ltd](https://www.madetech.com/). It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.