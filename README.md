# ShiprocketAPI

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/shiprocket_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shiprocket_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shiprocket_api

## Usage

```ruby
ShiprocketAPI::ForwardShipment.new(
        request_pickup: false,
        print_label: true,
        generate_manifest: true,
        courier_id: 10,
        order_id: "1235",
        order_date: Date.today.strftime("%Y-%m-%d"),
        pickup_location: "testing2",
        billing_customer_name: "Andy Chong",
        billing_last_name: "",
        billing_address: "Salarpuria Symbiosis, Arekere Village, Begur, Bannerghatta Main Rd, Uttarahalli Hobli",
        billing_address_2: "",
        billing_city: "Bengaluru",
        billing_pincode: "560076",
        billing_state: "Karnataka",
        billing_country: "India",
        billing_email: "andy@postco.co",
        billing_phone: 9223361686,
        billing_alternate_phone: "",
        shipping_is_billing: true,
        shipping_customer_name: "",
        shipping_last_name: "",
        shipping_address: "",
        shipping_address_2: "",
        shipping_city: "",
        shipping_pincode: "",
        shipping_country: "",
        shipping_state: "",
        shipping_email: "",
        shipping_phone: "",
        order_items: [ShiprocketAPI::OrderItem.new(
          name: "a book",
          sku: "23232",
          units: 1,
          selling_price: 1234
        )],
        payment_method: "Prepaid",
        sub_total: 1000,
        length: 0.5,
        breadth: 0.5,
        height: 0.5,
        weight: 0.5,
        vendor_details: {
          email: "andy@postco.co",
          phone: "8888999888",
          name: "Andy",
          address: "C - 20, G Block Rd, G Block BKC, Bandra Kurla Complex, Bandra East",
          address_2: "",
          city: "Mumbai",
          state: "Maharashtra",
          country: "India",
          pin_code: "400051",
          pickup_location: "testing2"
       })
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PostCo/shiprocket_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/PostCo/shiprocket_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ShiprocketAPI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/PostCo/shiprocket_api/blob/master/CODE_OF_CONDUCT.md).
