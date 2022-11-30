# Taiga API client

This gem provides an API client for [Taiga](https://www.taiga.io/), an agile project manager.

This API client is built using [Flexirest](https://github.com/flexirest/flexirest), so it can easily been integrated into _Rails_.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taiga'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install taiga

## Usage

```ruby
require 'taiga'

Taiga.api_url = 'https://api.taiga.io'

Taiga.authenticate(username: 'demo', password: 'secret')

projects = Taiga::Project.all
project = projects.first
pp projects.milestones.to_hash
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version:
  1. update the version number in `version.rb`
  1. generate CHANGELOG.md with `bundle exec rake changelog`
  1. commit changes
  1. run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/opus-codium/taiga.
