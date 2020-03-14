# Covid

JSON wrapper around [Johns Hopkins dataset](https://github.com/CSSEGISandData/COVID-19) for COVID-19.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "covid"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install covid

## Usage

```
$ Covid::Nineteen.confirmed
$ Covid::Nineteen.deaths
$ Covid::Nineteen.recovered
```

The data is structured as such:
```
$ pp Covid::Nineteen.confirmed
[
  {
    "Province/State"=>nil,
    "Country/Region"=>"Thailand",
    "Lat"=>"15",
    "Long"=>"101",
    "1/22/20"=>"2",
    "1/23/20"=>"3",
    "1/24/20"=>"5"
  },
  { ... }
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JonathanWThom/covid.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
