# Zoho

Ruby wrapper for Zoho API. For additional documentation visit: https://www.zoho.com/developer/rest-api.html

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zoho_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoho_ruby

## Configuration
Zoho API requires `organization_id` and `auth_token`. Visit https://www.zoho.com/developer/rest-api.html for instruction on how to get `organization_id` and `auth_token`.

If you have the `organization_id` and `auth_token` already, here's what you need to do, If you are using Rails setup `config/initializers/zoho.rb`.

```
Zoho.configure do |config|
  config.organization_id = 'your_organization_id'
  config.auth_token      = 'your_auth_token'
  config.per_page        = 20 # Default and maximum items per page is 200
end
```
## Usage

https://github.com/pcofilada/zoho/tree/master/docs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pcofilada/zoho. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Zoho project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/pcofilada/zoho/blob/master/CODE_OF_CONDUCT.md).
