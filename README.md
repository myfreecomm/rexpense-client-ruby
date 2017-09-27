# rexpense-client-ruby

A Ruby client for the [Rexpense](http://www.rexpense.com) REST API

[![Gem version](https://badge.fury.io/rb/rexpense.png)](https://rubygems.org/gems/rexpense)
[![Build status](https://travis-ci.org/myfreecomm/rexpense-client-ruby.png?branch=master)](https://travis-ci.org/myfreecomm/rexpense-client-ruby)
[![Test coverage](https://codeclimate.com/github/myfreecomm/rexpense-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/v-client-ruby)
[![Code Climate grade](https://codeclimate.com/github/myfreecomm/rexpense-client-ruby.png)](https://codeclimate.com/github/myfreecomm/rexpense-client-ruby)

Rexpense API docs: http://developers.rexpense.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rexpense'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rexpense

## Configuration

Use `Rexpense.configure` to setup your environment:

```ruby
require 'rexpense'

Rexpense.configure do |config|
  config.api_mode = 'production' # To set the rexpense application that will use
  config.version = 'v1' # Current API version
  config.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```

## Usage

##### Given your token, create an instance of Rexpense::Client, as below:

```ruby
client = Rexpense.client("YOUR_TOKEN_HERE")
```

##### Now you have access to these API endpoints:


### Available Endpoints

- Advancements
- Advancement Devolutions
- Expenses
- Organizations
- PreExpenses
- Tags
- Webhooks

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Release

To release a new version, update the version number in `lib/rexpense/version.rb`, run `bundle install` and commit & push the changes to the repository.

If this is your first time publishing a RubyGem in your local device, you will have to download your credentials. To do this, follow the instructions in your [profile page in RubyGems](https://rubygems.org/profile/edit) or just type the following in your command line, replacing `$username` with your RubyGems username.

```bash
$ curl -u $username https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
```

Then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org). Make sure you have publishing rights for the gem on RubyGems beforehand, though.

After publishing the new version, add a comment to each pull request that was included in this release like this:

```
:shipit: released on [version x.y.z](https://rubygems.org/gems/rexpense/versions/x.y.z)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/myfreecomm/rexpense-client-ruby. This project is intended to be a safe and welcoming space for collaboration.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
