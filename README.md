# Sinatra::NamedRoute

Supports named routes and makes it easy to access to URI path.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-named_route'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-named_route

## Usage

It's very simple.

```ruby
class App < Sinatra::Base
  register Sinatra::NamedRoute

  get '/', name: :index do
    redirect uri(:with_params, id: 1234, name: 'namusyaka') #=> Redirect to /params/1234/names/namusyaka
  end

  get '/params/:id/names/:name', name: :with_params do
    "index is #{url(:index)}" #=> index is /
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/namusyaka/sinatra-named_route.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

