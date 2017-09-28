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

- Participants
```ruby
  client.advancements.participants(:advancement_id)
  client.advancements.leave_participant(:advancement_id)

  client.reimbursements.participants(:reimbursement_id)
  client.reimbursements.leave_participant(:reimbursement_id)

  client.expenses.participants(:expense_id)
  client.expenses.leave_participant(:expense_id)
```

- Comments
```ruby
  client.advancements.comments(:advancement_id)
  client.advancements.find_comment(:advancement_id, :comment_id)
  client.advancements.create_comment(:advancement_id, params)
  client.advancements.update_comment(:advancement_id, :comment_id, params)
  client.advancements.destroy_comment(:advancement_id, :comment_id)

  client.reimbursement.comments(:advancement_id)
  client.reimbursement.find_comment(:advancement_id, :comment_id)
  client.reimbursement.create_comment(:advancement_id, params)
  client.reimbursement.update_comment(:advancement_id, :comment_id, params)
  client.reimbursement.destroy_comment(:advancement_id, :comment_id)

  client.expenses.comments(:advancement_id)
  client.expenses.find_comment(:advancement_id, :comment_id)
  client.expenses.create_comment(:advancement_id, params)
  client.expenses.update_comment(:advancement_id, :comment_id, params)
  client.expenses.destroy_comment(:advancement_id, :comment_id)
```

- Activities
```ruby
  client.activitites.find_all
```

- Advancements
```ruby
  client.advancements.find_all
  client.advancements.find
  client.advancements.create
  client.advancements.update
  client.advancements.destroy
```

- Advancement Devolutions
```ruby
  client.advancement_devolutions.create
```

- Expenses
```ruby
  client.expenses.find_all
  client.expenses.find(:expense_id)
  client.expenses.create(params)
  client.expenses.update(:expense_id, params)
  client.expenses.destroy(:expense_id)
```

- Organizations
```ruby
  client.organizations.find_all
  client.organizations.find(:organization_id)
  client.organizations.update(:organization_id, params)
  client.organizations.destroy(:organization_id)
```

- Memberships
```ruby
  client.organizations.memberships(:organization_id)
  client.organizations.find_memberships(:organization_id, :membership_id)
  client.organizations.create_memberships(:organization_id, params)
  client.organizations.update_memberships(:organization_id, :membership_id, params)
  client.organizations.destroy_memberships(:organization_id, :membership_id)
```

- PreExpenses
```ruby
  client.pre_expenses.find_all
  client.pre_expenses.find(:pre_expense_id)
  client.pre_expenses.ignore(:pre_expense_id)
  client.pre_expenses.restore(:pre_expense_id)
  client.pre_expenses.convert(:pre_expense_id, params)
```

- Tags
```ruby
  client.tags.find_all(:organization_id)
  client.tags.find(:organization_id, :tag_id)
  client.tags.create(:organization_id, params)
  client.tags.update(:organization_id, :tag_id, params)
  client.tags.destroy(:organization_id, :tag_id)
```

- Webhooks
```ruby
  client.webhooks.find_all(:organization_id)
  client.webhooks.find(:organization_id, :webhook_id)
  client.webhooks.create(:organization_id, params)
  client.webhooks.update(:organization_id, :webhook_id, params)
  client.webhooks.destroy(:organization_id, :webhook_id)
```

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
